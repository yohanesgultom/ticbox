<%@ page import="org.apache.shiro.SecurityUtils; ticbox.ProfileItem; ticbox.Survey" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="TicBOX"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">

    <link rel="stylesheet" href="${resource(dir: 'frameworks/jquery-ui-1.10.2/css/smoothness', file: 'jquery-ui-1.10.2.custom.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'frameworks/bootstrap/css', file: 'bootstrap.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'frameworks/prettyCheckable', file: 'prettyCheckable.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'app.css')}" type="text/css">

    <style type="text/css">

        /*
        body {
            padding-top: 65px;
            font-family: helveticaneue-light,tahoma,sans-serif;
            letter-spacing: 0.1em;
            color: #5a5a5a;
            background-color: #f3f3f3;

        }*/

        textarea, input[type=text] {
            background-color: #f5f5f5;
        }

        textarea:focus, input[type=text]:focus {
            background-color: #ffffff;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
        /*
        .navbar-inverse .navbar-text, .navbar-inverse .navbar-link {
            color: #ffffff;
            padding-top: 10px;
        }

        .navbar-inverse .navbar-inner {
            background-color: #BAD33C;
            background-image: -moz-linear-gradient(top, #BAD33C, #7F9B09);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#BAD33C), to(#7F9B09));
            background-image: -webkit-linear-gradient(top, #BAD33C, #7F9B09);
            background-image: -o-linear-gradient(top, #BAD33C, #7F9B09);
            background-image: linear-gradient(to bottom, #BAD33C, #7F9B09);
            border: 0;
            -webkit-box-shadow: 0px 0px 10px #000000;
            box-shadow: 0px 0px 10px #000000;
            -moz-box-shadow: 0px 0px 10px #000000;
            color: #ffffff;
        }

        .navbar-inverse .nav > li > a  {
            color: #ffffff;
            height: 30px;
            padding-top: 20px;
            padding-bottom: 0;
        }

        .navbar .nav > .active > a,
        .navbar .nav > .active > a:hover,
        .navbar .nav > .active > a:focus,
        .navbar .nav > li > a:hover {
            background: transparent;
            -webkit-box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
            -moz-box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
            box-shadow: inset 0 3px 8px rgba(0, 0, 0, 0.125);
        }

        #main-container {
            width: 1024px !important;
            min-width: 1024px !important;
            margin: 0 auto!important;
            padding: 0 10px !important;
            background-color: #ffffff;
        }*/

        #menuNavPanel {
            /*width: 300px;
            margin-left: 0;
            border-right: 1px solid #7F9B09;*/
        }

        #menuNavPanel .module .side-panel {
            width: 100%;
            margin: 15px 0 10px 0;
        }
        /*
        #menuNavPanel .module .side-panel .line {
            padding-left: 5px;
        }
        */
        #menuNavPanel .module .side-panel .header {
            color: #7F9B09; /*#bad33c;*/
            font-size: x-large;
            /*margin-bottom: 10px;*/
        }

        #menuNavPanel .module hr{
        /*
            height: 5px;
            border: 0;
            margin: 0;
            -webkit-box-shadow: inset 0 6px 5px -5px #a0a0a0;
            -moz-box-shadow: inset 0 6px 5px -5px #a0a0a0;
            box-shadow: inset 0 6px 5px -5px #a0a0a0;
        */
            margin: 0;
        }
        /*
        #mainContentPanel {
            width: 700px;
            margin: 15px 0 0 10px;
        }
        */

        .preview-item-even {
            background-color: #ececec;
        }

        table.table th {
            color: #5a5a5a;
            font-family: calibri, helveticaneue-light,sans-serif;
            font-weight: normal;
        }

    </style>

    <link rel="stylesheet" href="${resource(dir: 'frameworks/bootstrap/css', file: 'bootstrap-responsive.css')}" type="text/css">

    <script type="text/javascript" src="${resource(dir: 'frameworks/jquery-ui-1.10.2/js', file: 'jquery-1.9.1.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'frameworks/jquery-ui-1.10.2/js', file: 'jquery-ui-1.10.2.custom.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'frameworks/bootstrap/js', file: 'bootstrap.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'frameworks/prettyCheckable', file: 'prettyCheckable.js')}"></script>

    <g:layoutHead/>
    <r:layoutResources />

</head>
<body>

<div id="doc">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container-fluid">
                %{--
                    <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                --}%
                <a class="brand" href="${request.contextPath}/">
                    <img src="${g.resource(dir: 'images/ticbox', file: 'TicBoxLogo.png')}" width="200" height="100">
                </a>
                <div class="nav-collapse collapse">

                    <ul class="nav">
                        <li class="surveyor"><a href="javascript:void(0);">Profile</a></li>
                        <li class="survey"><a href="${request.contextPath}/survey/index">Survey</a></li>
                        <li class="details"><a href="javascript:void(0);">Pricing Details</a></li>
                    </ul>

                    <ul class="nav nav-pills pull-right">
                        %{--TODO should be providing different state when there is notification available--}%
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Logged in as ${SecurityUtils.getSubject().getPrincipals().oneByType(String.class)}</a>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                                <li role="presentation"><g:link controller="auth" action="signOut">Logout</g:link></li>
                                <li role="presentation" class="divider"></li>
                                <g:each in="${ticbox.UserNotification.findAllByUsernameAndIsNoticed(SecurityUtils.getSubject().getPrincipals().oneByType(String.class), false)}" var="notification">
                                    <li role="presentation">
                                        <g:link controller="userNotification" title="${notification.title}" params="[code: notification.code]">${notification.title}</g:link>
                                    </li>
                                </g:each>
                            </ul>
                        </li>
                    </ul>

                </div>
            </div>
        </div>
    </div>

    <div id="page-outer">
        <div id="main-container" class="wrapper grey">
        %{--<div id="main-container" class="shadowed-container">--}%
            %{--<div class="line">--}%
                <div id="menuNavPanel" class="leftPanel">
                %{--menu navigation panel--}%

                    %{-- ########### PROFILE ACCORDION ########### --}%
                    <div id="surveyorProfileAccordion" class="module accordion" style="padding: 0">
                        <div class="profileSummary accordion-heading">
                            <div class="accountGroup accordion-toggle" data-toggle="collapse" data-parent="#surveyorProfileAccordion" href="#surveyorProfileContent" style="padding: 12px">

                                <div class="artwork">
                                    <g:if test="${false}">
                                        <img id="sidebarRespondentPic" class="" src=""/>
                                    </g:if>
                                    <g:else>
                                        <img id="sidebarRespondentPic" class="" src="${g.resource(dir: 'images/ticbox', file: 'anonymous.png')}"/>
                                    </g:else>
                                </div>

                                <div class="desc line20">
                                    <b class="fullName">${surveyor?.username}</b>
                                    <div style="color: grey; font-size: 12px; text-transform: uppercase">${surveyorProfile?.companyName}</div>
                                </div>
                            </div>
                        </div>

                        <div id="surveyorProfileContent" class="accordion-body collapse" style="background: #f5f5f5">
                            <div class="accordion-inner" style="padding: 0 5px !important;">
                                <div class="row-fluid">
                                    <div class="span12 stats">
                                        <div><strong style="color: #7F9B09">Dashboard</strong></div>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span12 stats" style="padding-bottom: 0; padding-top: 0;">
                                        <li style="margin-left: 15px;">
                                            <div style="float: left; margin-right: 10px;"><strong>XX</strong></div>
                                            <div class="">Drafts</div>
                                        </li>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span12 stats" style="padding-bottom: 0; padding-top: 0;">
                                        <li style="margin-left: 15px;">
                                            <div style="float: left; margin-right: 10px;"><strong>XX</strong></div>
                                            <div style="color: #7F9B09;">In Progress</div>
                                        </li>
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span12 stats" style="padding-bottom: 0; padding-top: 0;">
                                        <li style="margin-left: 15px;">
                                            <div style="float: left; margin-right: 10px;"><strong>XX</strong></div>
                                            <div class="trust">Completed</div>
                                        </li>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row-fluid" style="border-top: 1px solid #E5E5E5; padding-left: 5px;">
                            <div class="span12 stats" style="">
                                <li style="margin-left: 15px;">
                                    <div style="float: left; margin-right: 10px;"><strong>XX</strong></div>
                                    <div class="gold">Credits Available</div>
                                </li>
                            </div>
                        </div>
                    </div>

                    %{-- ################# SURVEY INFO ACCORDION ################# --}%
                    <div id="surveyInfoAccordion" class="accordion module" style="padding: 0">

                        <div class="accordion-heading">
                            <div class="row-fluid accordion-toggle" data-toggle="collapse" data-parent="#surveyInfoAccordion"
                                 href="#surveyInfoContainer" style="padding: 0">
                                <div class="span12 stats">
                                    <strong style="color: #7F9B09">Survey Info</strong>
                                </div>
                            </div>
                        </div>

                        <div id="surveyInfoContainer" class="accordion-body collapse" style="background: #f5f5f5">
                            <div class="accordion-inner" style="padding: 0 12px 0 0">
                                <ul style="padding: 12px 0 0 12px; color: #808080; font-size: 12px; margin: 0 0 10px 20px;">
                                    <li style="line-height: 24px !important;">
                                        <div>
                                            Name :
                                            <b style="font-size: 14px; color: black;">${survey?.name}</b>
                                        </div>
                                    </li>
                                    <li style="line-height: 24px !important;">
                                        <div>
                                            Num of Respondents :
                                            <b style="font-size: 14px; color: black;">XX</b>
                                        </div>
                                    </li>
                                    <li style="line-height: 24px !important;">
                                        <div>
                                            Itinerary Details :
                                            <ul style="font-size: 12px">
                                                <li><b style="font-size: 12px; color: black;">XX x $n = $y</b></li>
                                                <li><b style="font-size: 12px; color: black;">XX x $n = $y</b></li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="row-fluid" style="border-top: 1px solid #E5E5E5;">
                            <div class="span12 stats" style="">
                                <div style="float: left; margin-right: 10px; line-height: 30px"><strong>Total</strong></div>
                                <div class=""><input type="text" value="$ z" size="15" class="uneditable-input" disabled="true" style="width: auto; background-color: #d4dcb4; margin: 0; border-radius: 20px; font-weight: bold; color: darkgoldenrod"></div>
                            </div>
                        </div>

                        %{--<div class="line side-panel">--}%
                        %{--<div class="line header">--}%
                        %{--Charge Summary--}%
                        %{--</div>--}%
                        %{--<div class="line">--}%
                        %{--Total : $<span class="total-charge"></span>--}%
                        %{--</div>--}%
                        %{--<div class="line">--}%
                        %{--$<span class="charge-per-respondent"></span> x <span class="total-respondents"></span> Respondents--}%
                        %{--</div>--}%
                        %{--<hr>--}%
                        %{--</div>--}%

                        %{--<div class="line side-panel">--}%
                        %{--<div class="line header">--}%
                        %{--Filter Details--}%
                        %{--</div>--}%
                        %{--<div class="filter-details-container line">--}%

                        %{--</div>--}%
                        %{--<hr>--}%
                        %{--</div>--}%
                    </div>
                </div>

                <div id="mainContentPanel" class="rightPanel">
                    <g:layoutBody/>
                </div>
            %{--</div>--}%

            %{--<footer>
                &copy; TicBOX 2013
            </footer>--}%
        </div>
    </div>
</div>

<r:layoutResources />

<script type="text/javascript">

    var surveySummary;

    jQuery(function(){

        jQuery('input.prettyChk').prettyCheckable();

        jQuery(".nav > li.${controllerName}").addClass('active');

        jQuery('button.link').click(function(){
            var href = jQuery(this).attr('href');
            if(href){
                window.location.href = href;
            }
        });

        jQuery('button.submit-redirect').click(function(){

            var form = jQuery('<form method="post"></form>').attr('action', jQuery(this).attr('href')).hide();

            jQuery("[param-of='"+jQuery(this).attr('id')+"']").each(function(){
                form.append(jQuery('<input type="hidden">').attr('name', jQuery(this).attr('name')).val(jQuery(this).val()));
            });

            form.appendTo('body').submit();

        });

        //jQuery('#menuNavPanel .survey-summary').before(jQuery('#menuNavPanelContent'));
        jQuery('#menuNavPanel').append(jQuery('#menuNavPanelContent').contents());

        jQuery('.datePicker').datepicker({
            showAnim : 'slideDown',
            format : '<g:message code="app.date.format.js" default="dd/mm/yy"/>'
        });

        jQuery('.enableTooltip').tooltip({
            selector: "button[data-toggle=tooltip]"
        });

    });



</script>

</body>
</html>
