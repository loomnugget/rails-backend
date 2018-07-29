prawn_document do |pdf|
  pdf.font_size 10

  pdf.text "#{@user.first_name }"
  pdf.text "#{@user.last_name }"
end
