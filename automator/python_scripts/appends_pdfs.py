from Foundation import NSURL
from Quartz import PDFDocument, PDFPage
import os
import sys


def get_pdf_pages(pdf_path):
  pdf_nsurl = NSURL.fileURLWithPath_(pdf_path)
  pdf = PDFDocument.alloc().initWithURL_(pdf_nsurl)
  page_count = pdf.pageCount()
  return [pdf.pageAtIndex_(index) for index in range(0, page_count)]

def flatten(top_list):
  return [element for sub_list in top_list for element in sub_list]

def merge_pdfs(first_pdf_path, second_pdf_path):
  # build output PDF filename
  merged_pdf_path = os.path.dirname(first_pdf_path) + '/merged.pdf'
  merged_pdf = PDFDocument.alloc().init()

  first_pdf_pages = get_pdf_pages(first_pdf_path)
  second_pdf_pages = get_pdf_pages(second_pdf_path)

  for index, page in enumerate(first_pdf_pages + second_pdf_pages):
    merged_pdf.insertPage_atIndex_(page, index)

  merged_pdf.writeToFile_(merged_pdf_path)

  return merged_pdf_path

def merge(first_pdf, second_pdf):
    if not first_pdf.endswith('.pdf') or not second_pdf.endswith('.pdf'):
      raise Exception('PDF file type required')

    print(merge_pdfs(first_pdf, second_pdf))

if __name__ == '__main__':
  first_pdf = os.path.expanduser(sys.argv[1])
  second_pdf = os.path.expanduser(sys.argv[2])
  merge(first_pdf, second_pdf)