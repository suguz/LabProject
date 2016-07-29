<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentContainer.ascx.cs" %>
<div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
        <div class="x_title">
            <h2><asp:Label runat="server" ID="lblTitle" /></h2>
            <ul class="nav navbar-right panel_toolbox">
                <li class="dropdown" runat="server" id="settingsDropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Settings 1</a>
                        </li>
                        <li><a href="#">Settings 2</a>
                        </li>
                    </ul>
                </li>
                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                </li>
                <li><a class="close-link"><i class="fa fa-close"></i></a>
                </li>
            </ul>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <asp:Literal ID="literalContent" runat="server"/>
        </div>
    </div>
</div>