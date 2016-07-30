<%@ Page Title="Laporan Transaksi Barang" Language="C#" MasterPageFile="~/Lab.master" AutoEventWireup="true" CodeFile="TransaksiBarang.aspx.cs" Inherits="TransaksiBarang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="Server">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Parameter Laporan</h2>
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
                <br />
                <form id="demo-form" class="form-horizontal form-label-left" method="post" >
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Mulai Tanggal<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <fieldset>
                                <div class="control-group">
                                    <div class="controls">
                                        <div class="col-md-11 xdisplay_inputx form-group has-feedback">
                                            <input type="text" class="form-control has-feedback-left" id="single_cal1" name="single_cal1" placeholder="Pilih Tanggal" aria-describedby="tanggalMulai" required>
                                            <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                            <span id="tanggalMulai" class="sr-only">(success)</span>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Sampai Tanggal<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <fieldset>
                                <div class="control-group">
                                    <div class="controls">
                                        <div class="col-md-11 xdisplay_inputx form-group has-feedback">
                                            <input type="text" class="form-control has-feedback-left" id="single_cal2" name="single_cal2" placeholder="Pilih Tanggal" aria-describedby="tanggalSelesai" required>
                                            <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                            <span id="tanggalSelesai" class="sr-only">(success)</span>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <button type="submit" class="btn btn-success">Buat Laporan</button>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <asp:Repeater ID="trxBarang" runat="server">
                            <HeaderTemplate>
                                <div class="ln_solid"></div>
                                <table class="table table-striped jambo_table bulk_action">
                                    <thead>
                                        <tr class="headings">
                                            <th class="column-title">Tanggal</th>
                                            <th class="column-title">Jenis Transaksi</th>
                                            <th class="column-title">Nama Barang</th>
                                            <th class="column-title">Jumlah</th>
                                            <th class="column-title">Satuan (unit)</th>
                                            <th class="column-title">Nama Vendor</th>
                                            <th class="column-title">Nama Lab</th>
                                            <th class="column-title">User</th>
                                            <th class="column-title">Keterangan</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr class="even pointer">
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "TANGGAL") %></td>
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "JENIS_TRANSAKSI") %></td>
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA_BARANG") %></td>
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "JUMLAH") %></td>
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "SIMBOL_SATUAN") %></td>
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA_VENDOR") %></td>
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA_LAB") %></td>
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA") %></td>
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "KETERANGAN") %></td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr class="odd pointer">
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "TANGGAL") %></td>
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "JENIS_TRANSAKSI") %></td>
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA_BARANG") %></td>
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "JUMLAH") %></td>
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "SIMBOL_SATUAN") %></td>
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA_VENDOR") %></td>
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA_LAB") %></td>
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "NAMA") %></td>
                                    <td class=" "><%# DataBinder.Eval(Container.DataItem, "KETERANGAN") %></td>
                                </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                    </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyFooterContainer" runat="Server">
    <!-- bootstrap-daterangepicker -->
    <script src="js/moment/moment.min.js"></script>
    <script src="js/datepicker/daterangepicker.js"></script>

    <!-- bootstrap-daterangepicker -->
    <script>
        $(document).ready(function () {
            $('#single_cal1').daterangepicker({
                singleDatePicker: true,
                calender_style: "picker_4",
                format: 'YYYY-MM-DD'
            }, function (start, end, label) {
                console.log(start.toISOString(), end.toISOString(), label);
            });
            $('#single_cal2').daterangepicker({
                singleDatePicker: true,
                calender_style: "picker_4",
                format: 'YYYY-MM-DD'
            }, function (start, end, label) {
                console.log(start.toISOString(), end.toISOString(), label);
            });
        });
    </script>

    <script>
        $(document).ready(function () {
            $('#reservation').daterangepicker(null, function (start, end, label) {
                console.log(start.toISOString(), end.toISOString(), label);
            });
        });
    </script>
    <!-- /bootstrap-daterangepicker -->

</asp:Content>
