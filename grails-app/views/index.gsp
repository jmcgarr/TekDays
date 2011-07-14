<html>
    <head>
        <title>TekDays - The Community is the Conference!</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;

        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.1em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(images/leftnav_midstretch.png) repeat-y top;
            margin:0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(images/leftnav_btm.png) no-repeat top;
            height:20px;
            margin:0px;
        }

        .homePagePanel .panelTop {
            background: url(images/leftnav_top.png) no-repeat top;
            height:11px;
            margin:0px;
        }
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        #pageBody {
            margin-left:280px;
            margin-right:20px;
        }
        </style>
    </head>
    <body>
  	
    	
    	<div id="welcome">
    		<h3>Welcome to TekDays.com</h3>
    		<p>
	    		TekDays.com is a site dedicated to assisting individuals and communities
				to organize technology conferences. To bring great minds with common
				interests and passions together for the good of greater geekdom!
    		</p>
    	</div>
    	
    	
    	<div id="homeSearch">
    		<g:form controller="tekEvent" action="search">
    			<label>Search:</label>
    			<input id="query" type="text" name="query" />
    			<input type="submit" name="Go" />
    		</g:form>
    	</div>
    	
    	
		<g:organizerEvents />
		<g:volunteerEvents />  
    	
    	
    	<div class="homeCell">
    		<h3>Find a Tek Event</h3>
    		<p>
    			See if there's a technical event in the works that strikes your fancy. 
    			If there is, you can volunteer to help or just let the organizers know 
    			that you'd be interested in attending. Everybody has a role to play.
    		</p>
    		<span class="buttons">
    			<g:link controller="tekEvent" action="list">Find a Tek Event</g:link>
    		</span>
    	</div>
    	
    	
    	<div class="homeCell">
    		<h3>Organize a TekEvent</h3>
    		<p>
    			If you don't see anything that suits your interest and location, then 
    			why not get the ball rolling. It's easy to get started and there may 
    			be others out there ready to get behind you to make it happen.
    		</p>
    		<span class="buttons">
    			<g:link controller="tekEvent" action="create">Organize a Tek Event</g:link>
    		</span>
    	</div>
    	
    	
    	<div class="homeCell">
    		<p>
    			If you are part of a business or organization that is involved in 
    			technology then sponsoring a tek event would be a great way to let 
    			the community know that you're there and you're involved.
    		</p>
    		<span class="buttons">
    			<g:link controller="sponsor" action="create">Sponsor a Tek Event</g:link>
    		</span>
    	</div>
    	
    </body>
</html>
