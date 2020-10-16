DELETE
FROM invoiceline
WHERE InvoiceId IN
(
SELECT inv.InvoiceId
FROM invoice AS inv
WHERE (YEAR(inv.InvoiceDate) < 2010)
);

DELETE
FROM invoice
WHERE (YEAR(InvoiceDate) < 2010);