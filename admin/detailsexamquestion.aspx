<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="detailsexamquestion.aspx.cs" Inherits="admin_detailsexamquestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For edit--%>
            <div class="btn-group bg-danger">
                <asp:Button ID="btn_detailsexamquestion" runat="server" Text="Detaylı Sınav Sorusu" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <div class="card mb-3">
                <div class="card-body">
                    <%-- For showing the details --%>
                    <div class="table table-responsive">
                        <asp:DetailsView ID="gridview_examdetails" runat="server" GridLines="None" CssClass="table table-bordered" AutoGenerateRows="False">
                            <Fields>
                                <asp:BoundField DataField="question_name" HeaderText="Soru">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="option_one" HeaderText="Seçenek Bir">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="option_two" HeaderText="Seçenek İki">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="option_three" HeaderText="Seçenek Üç">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="option_four" HeaderText="Seçenek Dört">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="question_answer" HeaderText="Doğru Cevap">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                            </Fields>
                            <FooterTemplate>
                                <asp:Button ID="btn_backquestion" runat="server" Text="Sorulara Geri Git" CssClass="btn btn-info" BackColor="#343A40" BorderStyle="None" ForeColor="White" PostBackUrl="~/admin/question.aspx" />
                            </FooterTemplate>
                            <HeaderStyle CssClass="text-center" />
                        </asp:DetailsView>
                        <asp:Panel ID="panel_examdetails_warning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lbl_examdetailswarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

