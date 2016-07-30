﻿<%@ Page Title="Permintaan Barang" Language="C#" MasterPageFile="~/Lab.master" AutoEventWireup="true" CodeFile="GudangPermintaanBarang.aspx.cs" Inherits="GudangPermintaanBarang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="Server">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Daftar Permintaan</h2>
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
                <div class="table-responsive">
                    <asp:Repeater ID="userList" runat="server">
                        <HeaderTemplate>
                            <table class="table table-striped jambo_table bulk_action">
                                <thead>
                                    <tr class="headings">
                                        <th class="column-title">ID</th>
                                        <th class="column-title">Tanggal</th>
                                        <th class="column-title">Laboratorium</th>
                                        <th class="column-title">Nama Barang</th>
                                        <th class="column-title">Jumlah Permintaan</th>
                                        <th class="column-title">Satuan (unit)</th>
                                        <th class="column-title">Entry</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="even pointer">
                                <td class=" "><%# DataBinder.Eval(Container.DataItem, "ID") %></td>
                                <td class=" "><%# DataBinder.Eval(Container.DataItem, "TANGGAL") %></td>
                                <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA_LAB") %></td>
                                <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA_BARANG") %></td>
                                <td class=" "><%# DataBinder.Eval(Container.DataItem, "JUMLAH") %></td>
                                <td class=" "><%# DataBinder.Eval(Container.DataItem, "SIMBOL_SATUAN") %></td>
                                <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA") %></td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr class="odd pointer">
                                <td class=" "><%# DataBinder.Eval(Container.DataItem, "ID") %></td>
                                <td class=" "><%# DataBinder.Eval(Container.DataItem, "TANGGAL") %></td>
                                <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA_LAB") %></td>
                                <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA_BARANG") %></td>
                                <td class=" "><%# DataBinder.Eval(Container.DataItem, "JUMLAH") %></td>
                                <td class=" "><%# DataBinder.Eval(Container.DataItem, "SIMBOL_SATUAN") %></td>
                                <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA") %></td>
                            </tr>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            </tbody>
                                    </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyFooterContainer" runat="Server">
</asp:Content>

