﻿<%@ Page Title="Data Barang" Language="C#" MasterPageFile="~/Lab.master" AutoEventWireup="true" CodeFile="GudangMasterBarang.aspx.cs" Inherits="GudangMasterBarang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="Server">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Daftar Barang</h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Settings 1</a>
                            </li>
                            <li><a href="#">Settings 2</a>
                            </li>
                        </ul>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>

            <div class="x_content">
                <asp:Repeater ID="userList" runat="server">
                    <HeaderTemplate>
                        <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                            <thead>
                                <tr class="headings">
                                    <th class="column-title">ID</th>
                                    <th class="column-title">Kode Barang</th>
                                    <th class="column-title">Nama Barang</th>
                                    <th class="column-title">Spesifikasi</th>
                                    <th class="column-title">Satuan</th>
                                    <th class="column-title">Keterangan</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# DataBinder.Eval(Container.DataItem, "ID") %></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "KODE_BARANG") %></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "NAMA_BARANG") %></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "SPESIFIKASI") %></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "SATUAN") %></td>
                            <td><%# DataBinder.Eval(Container.DataItem, "KETERANGAN") %></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <a class="btn btn-success submit" href="GudangTambahBarang.aspx">Tambah Data Barang</a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyFooterContainer" runat="Server">
</asp:Content>