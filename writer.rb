# frozen_string_literal: true

require 'thinreports'
require 'rqrcode'

report = Thinreports::Report.new layout: 'sample.tlf'

report.start_new_page do |page|
  url = 'https://github.com/whomwah/rqrcode/blob/v1.1.1/lib/rqrcode/export/png.rb'

  qrcode_png = RQRCode::QRCode.new(url).as_png(size: 300)
  page.item(:qrcode_image).value(StringIO.new(qrcode_png.to_s))

  page.item(:url_text).value(url)
  page.item(:id_text).value('1234-5678')
end

report.generate(filename: 'sample.pdf')
