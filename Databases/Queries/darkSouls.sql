-- Purpose: To calculate the total cost of the Dark Souls series of games including the GST tax.
SELECT g.gametitle, g.price, d.gst,
g.price * (d.gst / 100.0) AS gstTax,
g.price + (g.price * (d.gst / 100.0)) AS totalCost
FROM games g
JOIN defaults d ON 1=1
WHERE gametitle = 'Dark Souls' 
OR gametitle = 'Dark Souls II' 
OR gametitle = 'Dark Souls III';