from fpdf import FPDF
import pandas as pd

class ComplianceCert:
    def __init__(self, csv_path):
        self.df = pd.read_csv(csv_path)
    
    def _format_risk(self, trend):
        return {
            "↑": ("HIGH", (255,0,0)),
            "→": ("MEDIUM", (255,165,0)),
            "↓": ("LOW", (0,128,0))
        }.get(trend, ("UNKNOWN", (0,0,0)))

    def generate_pdf(self, output_path="compliance_cert.pdf"):
        pdf = FPDF()
        pdf.add_page()
        pdf.set_font("Arial", 'B', 16)
        pdf.cell(0, 10, "Agentic AI Deployment Compliance Certificate", ln=1, align='C')
        pdf.set_font("Arial", size=10)
        col_widths = [40, 30, 30, 30, 40]
        headers = ["Component", "Risk Trend", "Last Audit", "Automation", "Compliance"]
        for i, header in enumerate(headers):
            pdf.cell(col_widths[i], 10, header, border=1)
        pdf.ln()
        for _, row in self.df.iterrows():
            risk_text, risk_color = self._format_risk(row['Predicted_Risk_Trend'])
            pdf.cell(col_widths[0], 10, row['Component'], border=1)
            pdf.set_text_color(*risk_color)
            pdf.cell(col_widths[1], 10, risk_text, border=1)
            pdf.set_text_color(0,0,0)
            pdf.cell(col_widths[2], 10, str(row['Last_Audit_Date']), border=1)
            pdf.cell(col_widths[3], 10, f"Level {row['Automation_Level']}", border=1)
            pdf.cell(col_widths[4], 10, row['Compliance_Frameworks'].split(',')[0], border=1)
            pdf.ln()
        pdf.output(output_path)

if __name__ == "__main__":
    cert = ComplianceCert("master_plan_v3.2.csv")
    cert.generate_pdf()
