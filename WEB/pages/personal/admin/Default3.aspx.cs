using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_personal_admin_Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AddCharacterLimitEventHandler(TextBox1, Label1, 10);
    }
     public static void AddCharacterLimitEventHandler(
            TextBox pTextBox, Label pLabel, int pCharacterLimit)
        {
            string eventHandler = "limitTextLength(" + pTextBox.ClientID + ", " + pLabel.ClientID + ", " + pCharacterLimit + ")";
            pTextBox.Attributes.Add("onKeyDown", eventHandler);
            pTextBox.Attributes.Add("onKeyUp", eventHandler);
        }
}