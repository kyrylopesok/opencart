<?php 
if($this->registry->has('theme_options') == true) { 
	$theme_options = $this->registry->get('theme_options');
	$config = $this->registry->get('config');
	$language_id = $config->get( 'config_language_id' );
	$customfooter = $theme_options->get( 'customfooter' );
	if(!isset($customfooter[$language_id])) {
		$customfooter[$language_id] = array(
			'facebook_status' => 0,
			'contact_status' => 0
		);
	}
$class = 3; 
$id = rand(0, 5000)*rand(0, 5000); 
$all = 4; 
$row = 4; 

if($theme_options->get( 'gallery_per_pow' ) == 6) { $class = 2; }
if($theme_options->get( 'gallery_per_pow' ) == 5) { $class = 25; }
if($theme_options->get( 'gallery_per_pow' ) == 3) { $class = 4; }

if($theme_options->get( 'gallery_per_pow' ) > 1) { $row = $theme_options->get( 'gallery_per_pow' ); $all = $theme_options->get( 'gallery_per_pow' ); } 
?>
<?php } ?>

<?php echo $header;
$theme_options = $this->registry->get('theme_options');
$config = $this->registry->get('config'); ?>
<?php 
$grid_center = 12; 
if($column_left != '') { 
	$grid_center = $grid_center-3; 
}

if($column_right != '') { 
	$grid_center = $grid_center-3; 
} 

require_once( DIR_TEMPLATE.$config->get('config_template')."/lib/module.php" );
$modules = new Modules($this->registry);
?>

<?php
 $col=50;
$file=file("base.log"); ?>
<?php
if ($col>sizeof($file)) { $col=sizeof($file); } ?>



<!-- MAIN CONTENT
	================================================== -->
<div class="main-content full-width home">
			<div class="container">
				
					<div class="row" style="margin-bottom: 20px;">				
						<?php 
						$headerleft = $modules->getModules('header_left');
						if( count($headerleft) ) { ?>
						<div class="col-sm-3" id="header_left">
							<?php
							foreach ($headerleft as $module) {
								echo $module;
							}
							?>
						</div>
						<?php } ?>
					
						<?php $grid_center = 12; if( count($headerleft) ) { $grid_center = 9; } ?>
						<div class="col-sm-<?php echo $grid_center; ?>">
							
							<div class="row">
								<?php 
								$grid_header_top = 12; 
								$grid_content_right = 3;
								$header_right = $modules->getModules('header_right'); 
								if( count($header_right) ) {
									if($grid_center == 9) {
										$grid_header_top = 8;
										$grid_content_right = 4;
									} else {
										$grid_header_top = 9;
										$grid_content_right = 3;
									}
								}
								?>
								<div class="col-sm-<?php echo $grid_header_top; ?> tg-padding">
									<?php 
									$header_top = $modules->getModules('header_top');
									if( count($header_top) ) { 
										foreach ($header_top as $module) {
											echo $module;
										}
									} ?>
								</div>
								
								<?php if( count($header_right) ) { ?> 
								<div class="col-sm-<?php echo $grid_content_right; ?>" id="header_right">
									<?php foreach ($header_right as $module) {
										echo $module;
									} ?>
								</div>
								<?php } ?>
							</div>
						</div>
					</div>
				
				<div class="row" style="margin-bottom: 10px;">						
								<div class="col-sm-12">
									<?php 
									$top_content = $modules->getModules('top_content');
									if( count($top_content) ) { 
										foreach ($top_content as $module) {
											echo $module;
										}
									} ?>
								</div>				
				</div>
				
				<div class="row">				
						<?php 
						$columnleft = $modules->getModules('column_left');
						if( count($columnleft) ) { ?>
						<div class="col-sm-3" id="column_left">
							<?php
							foreach ($columnleft as $module) {
								echo $module;
							}
							?>
						</div>
						<?php $grid_center = 12; if( count($columnleft) ) { $grid_center = 9; } ?>
						<div class="col-sm-<?php echo $grid_center; ?>">
							
							<div class="row">
								<?php 
								$grid_content_top = 12; 
								$grid_content_right = 3;
								$column_right = $modules->getModules('column_right'); 
								if( count($column_right) ) {
									if($grid_center == 9) {
										$grid_content_top = 8;
										$grid_content_right = 4;
									} else {
										$grid_content_top = 9;
										$grid_content_right = 3;
									}
								}
								?>
								<div class="col-sm-<?php echo $grid_content_top; ?>">
									<?php 
									$content_top = $modules->getModules('content_top');
									if( count($content_top) ) { 
										foreach ($content_top as $module) {
											echo $module;
										}
									} ?>
								</div>
								
								<?php if( count($column_right) ) { ?> 
								<div class="col-sm-<?php echo $grid_content_right; ?>" id="column_right">
									<?php foreach ($column_right as $module) {
										echo $module;
									} ?>
								</div>
								<?php } ?>
							</div>
						</div>
						<?php } ?>
					
						
				</div>
					
					
				
					
					
					
				
			</div>
		
					<!-- Middle Left Slider ->
					<?php $tg_middle_left = $modules->getModules('tg_middle_left'); ?>
						<?php  if(count($tg_middle_left)) { ?>
						<!-- Slider -->
						<div class="col-sm-6 slider-middle-bottom" style="padding-left: 0px; padding-right: 0px;">
									<?php foreach($tg_middle_left as $module) { ?>
									<?php echo $module; ?>
									<?php } ?>
						</div>
					<?php } ?>
					
					<!-- Middle Right Slider ->
					<?php $tg_middle_right = $modules->getModules('tg_middle_right'); ?>
						<?php  if(count($tg_middle_right)) { ?>
						<!-- Slider -->
						<div class="col-sm-6 slider-middle-bottom" style="padding-left: 0px; padding-right: 0px;">
									<?php foreach($tg_middle_right as $module) { ?>
									<?php echo $module; ?>
									<?php } ?>
						</div>
					<?php } ?>
		
		<!--Social -->
									
									<?php if($customfooter[$language_id]['facebook_status'] == '1') { ?>
									<div class="container social-holder" style="clear:both;">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 aboutus-holder" style="text-align: center;">
											
												<?php if($customfooter[$language_id]['aboutus_title'] != '') { ?>
												<span class="aboutus-title"><?php echo $customfooter[$language_id]['aboutus_title']; ?></span>
												<?php } ?>
												<p class="aboutus-text"><?php echo html_entity_decode($customfooter[$language_id]['aboutus_text']); ?></p>
						
											</div>
											
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 social-holder">
											
													<?php if($customfooter[$language_id]['social_title'] != '') { ?>
														<span class="aboutus-title"><?php echo $customfooter[$language_id]['social_title']; ?></span>
													<?php } ?>
												
													<!-- Facebook -->
																<?php if($customfooter[$language_id]['facebook_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['facebook_link']; ?>" class="fa fa-facebook facebook" target="_blank" style="font-size: 18px; "></a>
																	
																<?php } ?>
																
																<?php if($customfooter[$language_id]['twitter_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['twitter_link']; ?>" class="fa fa-twitter twitter" target="_blank" style="font-size: 18px; "></a>
																	
																<?php } ?>	
																
																<?php if($customfooter[$language_id]['instagram_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['instagram_link']; ?>" class="fa fa-instagram instagram" target="_blank" style="font-size: 18px; "></a>
																	
																<?php } ?>	
																	
																<?php if($customfooter[$language_id]['googleplus_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['googleplus_link']; ?>" class="fa fa-google-plus googleplus" target="_blank" style="font-size: 18px; "></a>
																	
																<?php } ?>	
																
																<?php if($customfooter[$language_id]['pinterest_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['pinterest_link']; ?>" class="fa fa- fa-pinterest pinterest" target="_blank" style="font-size: 18px; "></a>
																	
																<?php } ?>	
																
																<?php if($customfooter[$language_id]['youtube_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['youtube_link']; ?>" class="fa fa- fa-youtube youtube" target="_blank" style="font-size: 18px; "></a>
																	
																<?php } ?>	
																
																<?php if($customfooter[$language_id]['flickr_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['flickr_link']; ?>" class="fa fa- fa-flickr flickr" target="_blank" style="font-size: 18px; "></a>
																	
																<?php } ?>	
																
																<?php if($customfooter[$language_id]['vimeo_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['vimeo_link']; ?>" class="fa fa-  fa-vimeo-square vimeo" target="_blank" style="font-size: 18px; "></a>
																
																<?php } ?>	
																
																<?php if($customfooter[$language_id]['tumblr_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['tumblr_link']; ?>" class="fa fa- fa-tumblr tumblr" target="_blank" style="font-size: 18px; "></a>
																	
																<?php } ?>	

											</div>
											
										</div>	
									</div>		
									<?php } ?>
		
					<!-- Content Bottom -->
					<?php 
						$contentbottom = $modules->getModules('content_bottom');
						if( count($contentbottom) ) { ?>
							<div class="bottom-holder" style="clear: both;">	
								<div class="container">
									<div class="row">	
										<div class="col-sm-12">	
											
												<?php
												foreach ($contentbottom as $module) {
													echo $module;
												}
												?>
											
										</div>
									</div>
								</div>
							</div>
					<?php } ?>
					
					<!-- Bottom Slider Position -->

						<?php $slideshow_bottom = $modules->getModules('slideshow_bottom'); ?>
						<?php  if(count($slideshow_bottom)) { ?>
						<!-- Slider -->
						<div id="slider" class="full-width" style="margin-bottom: 0px!important;">
									<?php foreach($slideshow_bottom as $module) { ?>
									<?php echo $module; ?>
									<?php } ?>
						</div>
						<?php } ?>



		

<script type="text/javascript">

window.onload= function() {
	document.getElementById('toggler').onclick = function() {
		openbox('box', this);
		return false;
	};
};
function openbox(id, toggler) {
	var div = document.getElementById(id);
	if(div.style.display == 'block') {
		div.style.display = 'none';
		toggler.innerHTML = 'Для графика';
	}
	else {
		div.style.display = 'block';
		toggler.innerHTML = 'Закрыть';
	}
}
</script>
<button id="toggler" style="margin:10px">Для графика</a></button>
<div id="box" style="display: none;"><div id="placeholder" style="width:600px;height:300px;"></div>
<table width="680" cellspacing="1" cellpadding="1" border="0" style="margin:20px"
    style="table-layout:fixed">
<tr bgcolor="white" >
 <td class="zz" width="100" font-size="6pt"><b>Время, дата</b></td>
 <td class="zz" width="150" font-size="6pt"><b>Кто посещал</b></td>
 <td class="zz" width="100" font-size="6pt"><b>IP, прокси</b></td>
 <td class="zz" width="150" font-size="6pt"><b>Посещенный URL</b></td>
</tr>

<?php
   for ($si=sizeof($file)-1; $si+1>sizeof($file)-$col; $si--) {
   $string=explode("|",$file[$si]);
   $q1[$si]=$string[0]; // дата и время
   $q2[$si]=$string[1]; // имя бота
   $q3[$si]=$string[2]; // ip бота
   $q4[$si]=$string[3]; // адрес посещения
if($q4[$si]=="localhost:8002/index.php?route=common/home"){
echo '<tr bgcolor="white"><td class="zz">'.$q1[$si].'</td>';
echo '<td class="zz">'.$q2[$si].'</td>';
echo '<td class="zz">'.$q3[$si].'</td>';
echo '<td class="zz">'.$q4[$si].'</td></tr>';
}
}
echo '</table>';

?>	
</div>
<script language="javascript" type="text/javascript" src="catalog/view/javascript/jquery/jquery-2.1.1.min.js"></script>
<!--[if IE]><script language="javascript" type="text/javascript" src="flot/excanvas.min.js"></script><![endif]-->
  <script language="javascript" type="text/javascript" src="catalog/view/javascript/jquery/flot/jquery.js"></script>
  <script language="javascript" type="text/javascript" src="catalog/view/javascript/jquery/flot/jquery.flot.js"></script>
  <script language="javascript" type="text/javascript" src="catalog/view/javascript/jquery/flot/jquery.flot.time.js"></script>
<!-- <div id="placeholder" style="width:600px;height:300px;"></div> -->

<script language="javascript" type="text/javascript">

var all_data = [
  { data: [
           ["2016/11/25", 0], ["2016/11/26", 0],
           ["2016/11/27", 0], ["2016/11/28", 8],
           ["2016/11/29", 20], ["2016/11/30", 0]]}
];
// преобразуем даты в UTC
for(var j = 0; j < all_data.length; ++j) {
 for(var i = 0; i < all_data[j].data.length; ++i){
   all_data[j].data[i][0] = Date.parse(all_data[j].data[i][0]);
 }
}
// свойства графика
var plot_conf = {
 series: {
   lines: { 
     show: true,
     lineWidth: 2 
   }
 },
 xaxis: {
   mode: "time",
   timeformat: "%y/%m/%d",
 }
};
// выводим график
$.plot($("#placeholder"), all_data, plot_conf);
</script>
<?php echo $footer; ?>