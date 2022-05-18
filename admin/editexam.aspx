<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="editexam.aspx.cs" Inherits="editexam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="Server">
    <div class=" col-md-12">
        <div class="card">
            <%--Button For select edit--%>
            <div class="btn-group bg-danger">
                <asp:Button ID="btn_paneleditexam" runat="server" Text="Sınavı Düzenle" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <%-- Edit exam --%>
            <div class="card-body">
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Ders Seçiniz</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="drp_editcategoryexam" runat="server" CssClass="form-control" DataTextField="category_name" DataValueField="category_id">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="require_drpeditcategory" runat="server" ErrorMessage="Bir ders seçmelisiniz" ControlToValidate="drp_editcategoryexam" ForeColor="red" InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Ünite Seçiniz</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="drp_editsubjectexam" runat="server" CssClass="form-control" DataTextField="subject_name" DataValueField="subject_id">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="require_editsubjecexam" runat="server" ErrorMessage="Bir ünite seçmelisiniz" ControlToValidate="drp_editsubjectexam" ForeColor="red" InitialValue="-1" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Sınav Adı</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_editexamname" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_editexamname" runat="server" ErrorMessage="Bir Sınav adı girmelisiniz" ControlToValidate="txt_editexamname" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Sınav Açıklaması</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_editexamdis" runat="server" TextMode="MultiLine" CssClass="form-control" Height="150px"></asp:TextBox>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Sınav Tarihi</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_editexamdate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_editexamdate" runat="server" ErrorMessage="Sınav tarihi giriniz" ControlToValidate="txt_editexamdate" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Sınav Süresi (Dakika)</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_editexamduration" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_editexamduration" runat="server" ErrorMessage="Sınav Süesi Giriniz" ControlToValidate="txt_editexamduration" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="requireregular_editexamduration" runat="server" ErrorMessage="Geçerli Bir Zaman Giriniz" ControlToValidate="txt_editexamduration" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Geçme Notu</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_editpassexammarks" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_editpassexammark" runat="server" ErrorMessage="Geçme Notunu Giriniz" ControlToValidate="txt_editpassexammarks" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="requireregular_editpassexammark" runat="server" ErrorMessage="Geçerli Bir Not Giriniz" ControlToValidate="txt_editpassexammarks" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Toplam Sınav Puanı</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_editexamtotalmarks" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                                              <asp:RequiredFieldValidator ID="require_editexammatotalmarks" runat="server" ErrorMessage="Sınav Puanını Giriniz" ControlToValidate="txt_editpassexammarks" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="reg_editexammatotalmarks" runat="server" ErrorMessage="Geçerli bir paun giriniz" ControlToValidate="txt_editexamtotalmarks" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="offset-2">
                        <asp:Button ID="btn_editexam" runat="server" Text="Düzenlemeyi Bitir" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btn_editexam_Click"/>
                    </div>
                    <asp:Panel ID="panel_editexam_warning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_exameditwarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

