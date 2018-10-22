/**
 * 
 */
function ajaxindicatorstart() {
    		var endicator = '<div id="resultLoading" style="display:none;"><div><img  style="position: absolute;margin-left:50%;" name="spinner" src="images/loader.gif" ><div class="hdgMsf" >Please wait .......................</div></div><div class="bg"></div></div>'
    		console.log("endicator [" + endicator + "]");
    		if ($('body').find('#resultLoading').attr('id') != 'resultLoading') {
    			$('body').append(endicator);
    		}
    		$('#resultLoading').css({
    			'position' : 'fixed',
    			'z-index' : '10000000',
    			'top' : '0',
    			'left' : '0',
    			'right' : '0',
    			'bottom' : '0',
    			'margin' : 'auto'
    		});
    		$('#resultLoading .bg')
    				.css(
    						{
    							'background' : 'gray',
    							'ms-filter' : 'progid:DXImageTransform.Microsoft.Alpha(Opacity=50)', /* IE 8 */
    							'filter' : 'alpha(opacity=50)', /* IE 5-7 */
    							'-moz-opacity' : '0.5', /* Netscape */
    							'-khtml-opacity' : ' 0.5', /* Safari 1.x */
    							'opacity' : ' 0.5', /* Good browsers */

    							'width' : '100%',
    							'height' : '100%',
    							'position' : 'absolute',
    							'top' : '0'
    						});

    		$('#resultLoading>div:first').css({
    			'text-align' : 'center',
    			'position' : 'fixed',
    			'top' : '26%',
    			'left' : '0',
    			'right' : '0',
    			'bottom' : '0',
    			'margin' : 'auto',
    			'font-size' : '16px',
    			'z-index' : '10',
    			'color' : '#ffffff'

    		});
    		$('#resultLoading .bg').height('100%');
    		$('#resultLoading').fadeIn(500);
    		$('body').css('cursor', 'wait');
    	}
