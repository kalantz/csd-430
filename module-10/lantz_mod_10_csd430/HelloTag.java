/* Kypton Lantz
 * September 29, 2025
 * CSD430-O307 Server Side Development (2261-DD)
 * Module 10 Assignment: Creating Custom Tags
 */

import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.jsp.JspWriter;

public class HelloTag extends TagSupport {
    private String name;
    public void setName(String name) { this.name = name; }

    @Override
    public int doStartTag() {
        try {
            JspWriter out = pageContext.getOut();
            out.print(name != null && !name.isEmpty() ? "Hello, " + name + "!" : "Hello, Guest!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SKIP_BODY;
    }
}
