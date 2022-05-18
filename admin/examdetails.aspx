﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="examdetails.aspx.cs" Inherits="admin_examdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For edit--%>
            <div class="btn-group bg-danger">
                <asp:Button ID="btn_detailsexam" runat="server" Text="Ünite Detayları" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <div class="card mb-3">
                <div class="card-body">
                    <%-- For showing the details --%>
                    <div class="table table-responsive">
                        <asp:DetailsView ID="exam_details" runat="server" Height="50px" GridLines="None" CssClass="table table-bordered" AutoGenerateRows="False">
                            <Fields>
                                <asp:BoundField DataField="category_name" HeaderText="Ders" NullDisplayText="Bu sınav herhangi bir derse ait değil">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="subject_name" HeaderText="Ünite" NullDisplayText="Bu sınav herhangi bir üniteye ait değil">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="exam_name" HeaderText="Sınav Ismi">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="exam_description" HeaderText="Sınav Açıklaması" NullDisplayText="Bir açıklama yok">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="exam_date" HeaderText="Sınav Tarihi" DataFormatString="{0:d}">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="exam_duration" HeaderText="Sınav Süresi">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="exampass_marks" HeaderText="Geçme Notu">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="exam_marks" HeaderText="Sınavın Toplam Puanı" NullDisplayText="Toplam puan belirlenmemiş">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                            </Fields>
                            <FooterTemplate>
                            <asp:Button ID="btn_backexam" runat="server" Text="Sınava Dön" CssClass="btn btn-info" BackColor="#343A40" BorderStyle="None" ForeColor="White" PostBackUrl="~/admin/exam.aspx"/>
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

