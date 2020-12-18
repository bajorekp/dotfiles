from Foundation import NSURL
from Quartz import PDFDocument, PDFPage
import os
import sys

def reverse_pdf(pdf_path):
  # build output PDF filename
  base_path, ext = os.path.splitext(pdf_path)
  resersed_pdf_path = base_path + '_reversed' + ext

  pdf_nsurl = NSURL.fileURLWithPath_(pdf_path)
  pdf = PDFDocument.alloc().initWithURL_(pdf_nsurl)
  reversed_pdf = PDFDocument.alloc().init()
  page_count = pdf.pageCount()
  pdf_page = PDFPage

  # n is sequential page increase, r is the reversed page number
  for n, r in enumerate(reversed(range(0, page_count))):
    pdf_page = pdf.pageAtIndex_(r)
    reversed_pdf.insertPage_atIndex_(pdf_page, n)

  reversed_pdf.writeToFile_(resersed_pdf_path)
  return resersed_pdf_path

def reverse(pdf_paths):
  for short_pdf_path in pdf_paths:
    pdf_path = os.path.expanduser(short_pdf_path)
    if not pdf_path.endswith('.pdf'):
      raise Exception('PDF file type required')

    resersed_pdf_path = reverse_pdf(pdf_path)
    print(resersed_pdf_path)

if __name__ == '__main__':
  pdf_paths = sys.argv[1:]
  reverse(pdf_paths)