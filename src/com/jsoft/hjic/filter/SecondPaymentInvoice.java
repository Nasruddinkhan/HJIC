package com.jsoft.hjic.filter;

import java.util.Arrays;

import org.apache.xmlbeans.StringEnumAbstractBase.Table;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfDocument;

public class SecondPaymentInvoice {/*
	public static void main(String[] args) throws FileNotFoundException {

	    PdfDocument pdfDocument = new PdfDocument(new PdfWriter("MyFirstInvoice.pdf"));
	    Document layoutDocument = new Document(pdfDocument);

	    // title
	    addTitle(layoutDocument);

	    // customer reference information
	    addCustomerReference(layoutDocument);
	    addTable(layoutDocument, Arrays.asList(
	            new Article(1, "Envelopes",2000, 1.70),
	            new Article(2, "Voucher Book", 50, 41)));

	    // articles
	    layoutDocument.close();
	}
	public void addTable(Document layoutDocument, List<Article> articleList)
	{
	    Table table = new Table(UnitValue.createPointArray(new float[]{60f, 180f, 50f, 80f, 110f}));

	    // headers
	    table.addCell(new Paragraph("S.N.O.").setBold());
	    table.addCell(new Paragraph("PARTICULARS").setBold());
	    table.addCell(new Paragraph("QTY").setBold());
	    table.addCell(new Paragraph("RATE").setBold());
	    table.addCell(new Paragraph("AMOUNT IN RS.").setBold());

	    // items
	    for(Article a : articleList)
	    {
	        table.addCell(new Paragraph(a.SNO+""));
	        table.addCell(new Paragraph(a.description));
	        table.addCell(new Paragraph(a.quantity+""));
	        table.addCell(new Paragraph(a.unitPrice+""));
	        table.addCell(new Paragraph((a.quantity * a.unitPrice)+""));
	    }

	    layoutDocument.add(table);
	}
	public static void addCustomerReference(Document layoutDocument)
	{
	    layoutDocument.add(new Paragraph("M/s Indian Convent School").setTextAlignment(TextAlignment.LEFT).setMultipliedLeading(0.2f));
	    layoutDocument.add(new Paragraph("y Pocket-3, Sector-24, Rohini Delhi-110085").setMultipliedLeading(.2f));
	    layoutDocument.add(new Paragraph("b 011-64660271").setMultipliedLeading(.2f));
	}public static void addTitle(Document layoutDocument)
	{
	    layoutDocument.add(new Paragraph("RETAIL INVOICE").setBold().setUnderline().setTextAlignment(TextAlignment.CENTER));
	}
	static class Article{
	    int SNO;
	    String description;
	    int quantity;
	    double unitPrice;
	    public Article(int SNO, String description, int quantity, double unitPrice)
	    {
	        this.SNO = SNO;
	        this.description = description;
	        this.quantity = quantity;
	        this.unitPrice = unitPrice;
	    }
	}
*/}
