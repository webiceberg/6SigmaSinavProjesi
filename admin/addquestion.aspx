<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="addquestion.aspx.cs" Inherits="admin_addquestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select add question for exam--%>
            <div class="btn-group bg-danger">
                <asp:Button ID="btn_panelquestion" runat="server" Text="Soru Ekle" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <div class="card-body">
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Soru</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_questionname" runat="server" TextMode="MultiLine" CssClass="form-control" Height="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_questionname" runat="server" ErrorMessage="Sınav Adı Giriniz" ControlToValidate="txt_questionname" ForeColor="red"></asp:RequiredFieldValidator>
                        <asp:FileUpload ID="soru_pic" runat="server" />
                    </div>
                </div>
                <div class="card-body">
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">A şıkkı</label>
                        <div class="col-md-9">
                            <asp:TextBox ID="txt_optionone" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_op1" runat="server" ErrorMessage="Cevap 1'i giriniz" ControlToValidate="txt_optionone" ForeColor="red"></asp:RequiredFieldValidator>
                            <asp:FileUpload ID="a_pic" runat="server" />
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">B şıkkı</label>
                        <div class="col-md-9">
                            <asp:TextBox ID="txt_optiontwo" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_op2" runat="server" ErrorMessage="Cevap 2'yi giriniz" ControlToValidate="txt_optiontwo" ForeColor="red"></asp:RequiredFieldValidator>
                            <asp:FileUpload ID="b_pic" runat="server" />
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">C şıkkı</label>
                        <div class="col-md-9">
                            <asp:TextBox ID="txt_optionthree" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_op3" runat="server" ErrorMessage="Cevap 3'ü giriniz" ControlToValidate="txt_optionthree" ForeColor="red"></asp:RequiredFieldValidator>
                            <asp:FileUpload ID="c_pic" runat="server" />
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">D şıkkı</label>
                        <div class="col-md-9">
                            <asp:TextBox ID="txt_optionfour" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_op4" runat="server" ErrorMessage="Cevap 4'ü giriniz" ControlToValidate="txt_optionfour" ForeColor="red"></asp:RequiredFieldValidator>
                            <asp:FileUpload ID="d_pic" runat="server" />
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label text-center">Doğru Cevap</label>
                        <div class="col-md-4">
                            <asp:RadioButtonList ID="rdo_correctanswer" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="10">
                                <asp:ListItem Text="A" Value="1"></asp:ListItem>
                                <asp:ListItem Text="B" Value="2"></asp:ListItem>
                                <asp:ListItem Text="C" Value="3"></asp:ListItem>
                                <asp:ListItem Text="D" Value="4"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="req_rdo_correctanswer" runat="server" ErrorMessage="Doğru cevabı seçiniz" ControlToValidate="rdo_correctanswer" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btn_addquestion" runat="server" Text="Soru Ekle" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btn_addquestion_Click" />
                        </div>
                        <asp:Panel ID="panel_addquestion_warning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lbl_addquestionwarning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

