<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Lab.master" AutoEventWireup="true" CodeFile="UserManagement.aspx.cs" Inherits="UserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="Server">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Users</h2>
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
                                            <th>
                                                <input type="checkbox" id="check-all" class="flat">
                                            </th>
                                            <th class="column-title">NIP</th>
                                            <th class="column-title">Nama</th>
                                            <th class="column-title">Username</th>
                                            <th class="column-title">Password</th>
                                            <th class="column-title">Jenis User</th>
                                            <th class="column-title">Aktif </th>
                                            <th class="column-title no-link last"><span class="nobr">Action</span>
                                            </th>
                                            <th class="bulk-actions" colspan="7">
                                                <a class="antoo" style="color: #fff; font-weight: 500;">Bulk Actions ( <span class="action-cnt"></span>) <i class="fa fa-chevron-down"></i></a>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                        <tr class="even pointer">
                                            <td class="a-center ">
                                                <input type="checkbox" class="flat" name="table_records">
                                            </td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "NIP") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "USERNAME") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "PASSWORD") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "JENIS_USER") %></td>
                                            <td class="a-right a-right "><%# DataBinder.Eval(Container.DataItem, "ACTIVE") %></td>
                                            <td class=" last"><a href="#">View</a>
                                            </td>
                                        </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                        <tr class="odd pointer">
                                            <td class="a-center ">
                                                <input type="checkbox" class="flat" name="table_records">
                                            </td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "NIP") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "USERNAME") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "PASSWORD") %></td>
                                            <td class=" "><%# DataBinder.Eval(Container.DataItem, "JENIS_USER") %></td>
                                            <td class="a-right a-right "><%# DataBinder.Eval(Container.DataItem, "ACTIVE") %></td>
                                            <td class=" last"><a href="#">View</a>
                                            </td>
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

