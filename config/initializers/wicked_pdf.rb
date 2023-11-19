pdf_config = {}
pdf_config[:exe_path] = '/usr/local/bin/wkhtmltopdf' if Rails.env.development?
WickedPdf.config = pdf_config
