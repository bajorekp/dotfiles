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

def make_booklet(pdf_path):
  # build output PDF filename
  base_path, ext = os.path.splitext(pdf_path)
  output_pdf_path = base_path + '_booklet' + ext
  output_pdf = PDFDocument.alloc().init()

  pdf_pages = get_pdf_pages(pdf_path)
  pdf_page_count = len(pdf_pages)

  # Booklets can only be created when the number of pages is divisible by 4
  # Add blank pages if any are missing
  missing_page_count = 0 if pdf_page_count % 4 == 0 else 4 - pdf_page_count % 4
  missing_pages = [PDFPage.new() for _i in range(0, missing_page_count)]

  booklet_pages = pdf_pages + missing_pages
  page_count = len(booklet_pages)

  groups = [(page_count - i*2 - 1, i*2, i*2 + 1, page_count - i*2 - 2) for i in range(0, page_count/4)]
  order = flatten(groups)

  print order

  for i, page_numer in enumerate(order):
    output_pdf.insertPage_atIndex_(booklet_pages[page_numer], i)

  output_pdf.writeToFile_(output_pdf_path)
  return output_pdf_path

def booklet(pdf_paths):
  for short_pdf_path in pdf_paths:
    pdf_path = os.path.expanduser(short_pdf_path)
    if not pdf_path.endswith('.pdf'):
      raise Exception('PDF file type required')

    output_pdf_path = make_booklet(pdf_path)
    print(output_pdf_path)

if __name__ == '__main__':
  pdf_paths = sys.argv[1:]
  booklet(pdf_paths)