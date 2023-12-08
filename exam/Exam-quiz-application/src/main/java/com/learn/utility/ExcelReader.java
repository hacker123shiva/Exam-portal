package com.learn.utility;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.learn.db.model.QuestionSet;

public class ExcelReader {
	public List<QuestionSet> getQuestion(InputStream inputStream) {
		List<QuestionSet> questionSets = new ArrayList<QuestionSet>();
		XSSFWorkbook wb;
		try {
			wb = new XSSFWorkbook(inputStream);
			XSSFSheet sheet = wb.getSheetAt(0);
			Iterator<Row> itr = sheet.iterator();
			if (itr.hasNext()) {
				itr.next();
			}
			while (itr.hasNext()) {
				Row row = itr.next();
				String question = null;
				String optionA = null;
				String optionB = null;
				String optionC = null;
				String optionD = null;
				String correctOption = null;
				int i = 0;
				Iterator<Cell> cellIterator = row.cellIterator();
				while (cellIterator.hasNext()) {
					Cell cell = cellIterator.next();
					cell.setCellType(Cell.CELL_TYPE_STRING);
					switch (i) {
					case 0:
						question = cell.getStringCellValue();
						break;
					case 1:
						optionA = cell.getStringCellValue();
						break;
					case 2:
						optionB = cell.getStringCellValue();
						break;
					case 3:
						optionC = cell.getStringCellValue();
						break;
					case 4:
						optionD = cell.getStringCellValue();
						break;
					case 5:
						correctOption = cell.getStringCellValue();
						break;
					default:
					}
					i++;
				}
				if(question == null || question.trim().isEmpty()) {
					return questionSets;
				}
				questionSets.add(new QuestionSet(question, optionA, optionB, optionC, optionD, correctOption));
			}
			return questionSets;
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
}
