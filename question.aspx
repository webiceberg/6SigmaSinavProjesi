<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.master" AutoEventWireup="true" CodeFile="question.aspx.cs" Inherits="exam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="heardcontentplaceholder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontentplaceholder" runat="Server">
    <h2 class="m-4">Soru</h2>
    <hr />
    <asp:TextBox ID="getstringuser" runat="server" Visible="false"></asp:TextBox>
    <asp:GridView ID="gridview_examquestion" runat="server" AutoGenerateColumns="False" GridLines="None">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("question_id") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lbl_question" runat="server" Text='<%# Eval("question_name") %>'></asp:Label>
                    <br />
                    <asp:Image GroupName="a" ID="Image2" runat="server" src='<%# "assets/image/" + Eval("imageyolu") +".jpeg" %>' onerror="this.style.display='none'" Width="350px" />
                    <br />
                    <asp:RadioButton GroupName="a" Text='<%# Eval("option_one") %>' ID="option_one" runat="server" />
                    <asp:Image GroupName="a" ID="Image1" runat="server" src='<%# "assets/image/" + Eval("imageyolu") + ".1.jpeg"%> ' onerror="this.style.display='none'" Width="150px" />
                    <br />
                    <asp:RadioButton GroupName="a" Text='<%# Eval("option_two") %>' ID="option_two" runat="server" />
                    <asp:Image GroupName="a" ID="Image6" runat="server" src='<%# "assets/image/" + Eval("imageyolu")+ ".2.jpeg" %> ' onerror="this.style.display='none'" Width="150px" />
                    <br />
                    <asp:RadioButton GroupName="a" Text='<%# Eval("option_three") %>' ID="option_three" runat="server" />
                    <asp:Image GroupName="a" ID="Image3" runat="server" src='<%# "assets/image/" + Eval("imageyolu")+ ".3.jpeg" %> ' onerror="this.style.display='none'" Width="150px" />
                    <br />
                    <asp:RadioButton GroupName="a" Text='<%# Eval("option_four") %>' ID="option_four" runat="server" />
                    <asp:Image GroupName="a" ID="Image4" runat="server" src='<%# "assets/image/" + Eval("imageyolu")+ ".4.jpeg" %> ' onerror="this.style.display='none'" Width="150px" />
                    <hr />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button ID="btn_submit" runat="server" Text="Gönder" CssClass="btn btn-success" OnClick="btn_submit_Click" />
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <asp:Panel ID="panel_questshow_warning" runat="server" Visible="false">
                    <br />
                    <div class="alert alert-danger text-center">
                        <asp:Label ID="lbl_questshowwarning" runat="server" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>

