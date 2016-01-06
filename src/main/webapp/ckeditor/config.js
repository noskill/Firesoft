/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	   config.language = 'en';
	// config.uiColor = '#AADC6E';
	   config.toolbar =
		   [
		       { name: 'document',    items : [ 'Source','-','Preview','Print','-','Templates' ] },
		       { name: 'clipboard',   items : [ 'Copy','Paste','PasteFromWord','-','Undo','Redo' ] },
		       { name: 'editing',     items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
		       { name: 'forms',       items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', ] },
		       '/',
		       { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript', ] },
		       { name: 'paragraph',   items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
		       { name: 'links',       items : [ 'Link','Unlink','Anchor' ] },
		       { name: 'insert',      items : [ 'Image','Table','HorizontalRule','Smiley','SpecialChar'] },
		       '/',
		       { name: 'styles',      items : [ 'Styles','Format','Font','FontSize' ] },
		       { name: 'colors',      items : [ 'TextColor','BGColor' ] },
		       { name: 'tools',       items : [ 'Maximize', 'ShowBlocks','-','About' ] }
		   ];
	   
	   config.enterMode = 2;
	   config.shiftEnterMode = 1;
	   
	   config.startupFocus = false;
	    if(isIE()){
	        config.filebrowserBrowseUrl = '/Firesoftblog/uploadClassic.html';
	    }else{
	        config.filebrowserBrowseUrl = '/Firesoftblog/upload.html';
	    }
	    config.filebrowserWindowWidth = '10';
	    config.filebrowserWindowHeight = '10';
	    config.selectMultiple = true;
};

function isIE() {
    var ua = window.navigator.userAgent;
    var msie = ua.indexOf("MSIE ");
    return !!(msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./));
}
