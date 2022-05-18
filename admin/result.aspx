<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="result.aspx.cs" Inherits="admin_result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="Server">

    <div class="col-md-12">
        <div class="card">
            <%--Button For select panel--%>
            <div class="btn-group bg-danger">
                <asp:Button ID="btn_panelresult" runat="server" Text="Tüm Sonuçlar" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <div class="card text-center mb-3">
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="gridviewspecific" runat="server" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered" PageSize="8" Visible="false" OnPageIndexChanging="gridviewspecific_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="user_email" HeaderText="Kullanıcı Email" />
                                <asp:BoundField DataField="exam_name" HeaderText="Sınav Adı" NullDisplayText="Sınav ismi yok" />
                                <asp:BoundField DataField="exam_date" DataFormatString="{0:dd/mm/yyyy}" HeaderText="Sınav Tarihi" NullDisplayText="Tarih Yok" />
                                <asp:BoundField DataField="totalquestion" HeaderText="Toplam Soru" />
                                <asp:BoundField DataField="result_status" HeaderText="Sonuç" />
                                <asp:BoundField DataField="exam_marks" HeaderText="Toplam Notlar" />
                                <asp:BoundField DataField="result_score" HeaderText="Sizin Sonucunuz" />
                            </Columns>
                        </asp:GridView>
                        <asp:GridView ID="gridresult" runat="server" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered" PageSize="8" OnPageIndexChanging="gridresult_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="user_email" HeaderText="Kullanıcı Email" />
                                <asp:BoundField DataField="exam_name" HeaderText="Sınav Adı" NullDisplayText="Sınav ismi yok" />
                                <asp:BoundField DataField="exam_date" DataFormatString="{0:dd/mm/yyyy}" HeaderText="Sınav Tarihi" NullDisplayText="Tarih Yok" />
                                <asp:BoundField DataField="totalquestion" HeaderText="Toplam Soru" />
                                <asp:BoundField DataField="result_status" HeaderText="Sonuç" />
                                <asp:BoundField DataField="exam_marks" HeaderText="Toplam Notlar" />
                                <asp:BoundField DataField="result_score" HeaderText="Sizin Sonucunuz" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <asp:Panel ID="panel_resultshow_warning" runat="server" Visible="false">
                    <div class="card-footer">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_resultshowwarning" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>

