// Create a pdf document with results
// Note that the putpdf could be replaced with putdocx to create Word instead

// call our data
sysuse auto, replace

putpdf begin

//create a paragraph
putpdf paragraph
putpdf text ("putpdf "), bold
putpdf text ("can add formatted text to a paragraph. You can ")
putpdf text ("italicize, "), italic
putpdf text ("strikeout, "), strikeout
putpdf text ("underline"), underline
putpdf text (", sub/super script")
putpdf text ("2 "), script(sub)
putpdf text (", and ")
putpdf text ("bgcolor"), bgcolor("blue")
qui sum mpg
local sum: display %4.2f `r(sum)'
putpdf text (". Also, you can easily add Stata results to your paragraph (mpg total = `sum')")

//Embed a graph
histogram rep
graph export hist.png, replace
putpdf paragraph, halign(center)
putpdf image hist.png

//Embed output
putpdf paragraph
putpdf text ("Embed the output from a regression command in your pdf file.")
regress mpg price
putpdf table mytable = etable

putpdf save myreport.pdf, replace
