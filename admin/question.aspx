<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="question.aspx.cs" Inherits="admin_question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" Runat="Server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select edit--%>
            <div class="btn-group bg-danger">
                <asp:Button ID="btn_panelallquestion" runat="server" Text="Tüm Sorular" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
        </div>
        <div class="card text-center mb-3">
            <div class="card-body">
                <%-- Examquestion list --%>
                <div class="table-responsive">
                    <asp:GridView ID="gridview_examquestion" runat="server" GridLines="None" CssClass="table table-bordered" AutoGenerateColumns="False" OnRowCommand="gridview_examquestion_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Sınav Adı">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("exam_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Soru">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("question_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Seçenekler">
                                <ItemTemplate>
                                    <asp:HyperLink ID="btn_detailsexam" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/admin/detailsexamquestion.aspx?qid=" + Eval("question_id") %>'>
                                            <i class="fa fa-info-circle" aria-hidden="true"></i> Detaylar
                                    </asp:HyperLink>
                                    <asp:HyperLink ID="btn_editexam" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/admin/editquestion.aspx?qid=" + Eval("question_id") %>'>
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Düzenle
                                    </asp:HyperLink>
                                    <asp:LinkButton ID="btn_deleteexam" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" CommandArgument='<%# Eval("exam_id") %>' CommandName="deletequestion">
                                            <i class="fa fa-trash" aria-hidden="true"></i> Sil
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            Henüz herhangi bir soru eklenmemiş
                        </EmptyDataTemplate>
                        <PagerStyle CssClass="card-footer" HorizontalAlign="Right" />
                    </asp:GridView>
                </div>
                <asp:Panel ID="panel_examquestion_warning" runat="server" Visible="false">
                    <div class="card-footer">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_examquestionwarning" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>

