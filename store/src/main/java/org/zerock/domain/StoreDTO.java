package org.zerock.domain;
import lombok.Data;
import java.util.Date;
@Data
public class StoreDTO {

	private int sno;
	private String category;
	private String title;
	private String content;
	private String rating;
	private String password;
	private Date regdate;
	
	
}
