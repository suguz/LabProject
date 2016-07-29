<%@ Page Title="Tambah Barang" Language="C#" MasterPageFile="~/Lab.master" AutoEventWireup="true" CodeFile="GudangTambahBarang.aspx.cs" Inherits="GudangTambahBarang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="Server">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Input Data Barang</h2>
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
                <form id="demo-form" data-parsley-validate="" class="form-horizontal form-label-left" method="post" >
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="kode-barang">
                            Kode Barang<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="kode-barang" name="kode-barang" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nama-barang">
                            Nama Barang<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" id="nama-barang" name="nama-barang" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nama-lain" class="control-label col-md-3 col-sm-3 col-xs-12">Nama Lain</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="nama-lain" class="form-control col-md-7 col-xs-12" type="text" name="nama-lain">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="jenis-barang" class="control-label col-md-3 col-sm-3 col-xs-12">Jenis Barang<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select id="jenis-barang" name="jenis-barang" class="form-control" required>
                                <option value="">Pilih salah satu...</option>
                                <option value="1">Solid</option>
                                <option value="2">Gas</option>
                                <option value="3">Liquid</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="satuan-barang" class="control-label col-md-3 col-sm-3 col-xs-12">Satuan Barang<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select id="satuan-barang" name="satuan-barang" class="form-control" required>
                                <option value="">Pilih salah satu...</option>
                                <option value="1">Buah</option>
                                <option value="2">Berat (mg)</option>
                                <option value="3">Volume (ml)</option>
                                <option value="4">Panjang (cm)</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="keterangan" class="control-label col-md-3 col-sm-3 col-xs-12">Keterangan</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="keterangan" class="form-control col-md-7 col-xs-12" type="text" name="keterangan">
                        </div>
                    </div>
                    
                    <div class="ln_solid"></div>
                    <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            <a href="GudangMasterBarang.aspx" class="btn btn-danger">Batal</a>
                            <button type="submit" class="btn btn-success">Tambahkan Data Barang</button>
                        </div>
                    </div>
                </form>
                <form id="demo-form2" data-parsley-validate></form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyFooterContainer" runat="Server">
</asp:Content>

