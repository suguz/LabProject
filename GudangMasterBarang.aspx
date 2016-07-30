<%@ Page Title="Data Barang" Language="C#" MasterPageFile="~/Lab.master" AutoEventWireup="true" CodeFile="GudangMasterBarang.aspx.cs" Inherits="GudangMasterBarang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">
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
                <div class="table-responsive">
                        <asp:Repeater ID="userList" runat="server">
                            <HeaderTemplate>
                                <table class="table table-striped jambo_table bulk_action">
                                    <thead>
                                        <tr class="headings">
                                            <th class="column-title">ID</th>
                                            <th class="column-title">Kode Barang</th>
                                            <th class="column-title">Nama Barang</th>
                                            <th class="column-title">Nama Lain</th>
                                            <th class="column-title">Jenis Barang</th>
                                            <th class="column-title">Grup Satuan</th>
                                            <th class="column-title">Simbol Satuan</th>
                                            <th class="column-title">Keterangan</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                        <tr class="even pointer">
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "ID") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "KODE_BARANG") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA_BARANG") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA_LAIN") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "JENIS_BARANG") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "GRUP_SATUAN") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "SIMBOL_SATUAN") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "KETERANGAN") %></td>
                                        </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                        <tr class="odd pointer">
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "ID") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "KODE_BARANG") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA_BARANG") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA_LAIN") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "JENIS_BARANG") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "GRUP_SATUAN") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "SIMBOL_SATUAN") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "KETERANGAN") %></td>
                                        </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                        </tbody>
                                    </table>
                            </FooterTemplate>
                        </asp:Repeater>
                </div>
                <a class="btn btn-success submit" href="GudangTambahBarang.aspx">Tambah Data Barang</a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyFooterContainer" Runat="Server">
</asp:Content>

