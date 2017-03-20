<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="map.aspx.cs" Inherits="VirusBusters.map" MasterPageFile="~/public.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Map
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageLevelPluginsLink" runat="server">
    <!-- PAGE LEVEL PLUGINS-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <!-- CONTENT BODY-->
    <!-- Google Map API-->
    <div id="map" style=" height: 600px;"></div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageLevelPluginsScript" runat="server">
    <!-- PAGE LEVEL PLUGINS-->
    <!-- FireBase API-->
    <script src="https://www.gstatic.com/firebasejs/3.4.1/firebase.js"></script>
    <script src="https://www.gstatic.com/firebasejs/3.4.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/3.4.0/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/3.4.0/firebase-database.js"></script>
    <script src="../public/assets/global/js/firebase.js" type="text/javascript"></script>
    <!-- GOOGLE API SCRIPTS-->
    <script src="../public/assets/pages/js/gmaps.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCVvjS9VaVAhibjtKTzvsduBdqCCS7aOGg"></script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageLevelScripts" runat="server">
    <!-- PAGE LEVEL SCRIPTS-->
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Others" runat="server">
    <form id="form1" runat="server">
        <script type="text/javascript" >
            $('#Name').hide();

            var userLocationIcon = 'images/bluecircle.png'

            var map;
            $(document).ready(function () {
                   
                map = new GMaps({
                    div: '#map',
                    lat: <%=lat%>,
                    lng: <%=lng%>,
                    zoom: 12,
                      
                });

                GMaps.geolocate({
                    success: function (position) {
                        map.setCenter(position.coords.latitude, position.coords.longitude);
                        map.addMarker({
                            lat: position.coords.latitude,
                            lng: position.coords.longitude,
                            icon: userLocationIcon,
                            zoom: 16,
                            title: "Current Location",
                            infoWindow: {
                                content: "You are here."
                            }
                        });
                    },
                    error: function (error) {
                        alert('Geolocation failed: ' + error.message);
                    },
                    not_supported: function () {
                        alert("Your browser does not support geolocation");
                    },
                     
                });

                map.addControl({
                    position: 'top_right',
                    content: 'Show current location',
                    style: {
                        margin: '5px',
                        padding: '1px 6px',
                        border: 'solid 1px #717B87',
                        background: '#fff'
                    },
                    events: {
                        click: function() {
                            GMaps.geolocate({
                                success: function(position) {
                                    map.setCenter(position.coords.latitude, position.coords.longitude);
                                },
                                error: function(error) {
                                    alert('Geolocation failed: ' + error.message);
                                },
                                not_supported: function() {
                                    alert("Your browser does not support geolocation");
                                }
                            });
                        }
                    }
                });

                var i;
                  
                var temp = "haha";
                 
                for(i=0 ; i<<%=count%> ; i++)
                    {
                    map.addMarker({                   
                    lat: latArray[i],
                    lng: lngArray[i],
                    title: nameAr[i],
                    infoWindow: {
                        content: '<p>' + nameAr[i] + '</p>'+ '<p>Operatime hours : 8AM–1PM, 2–4:30PM</p>' + '<form method="POST" action="appointment_new.aspx"> <input type="hidden" id="name" name="Name" value = "'+  nameAr[i] + '"> <input type="submit" value="Book Appointment" /></form>'
                    }
                });
                    }

            });

              
            function post(name)
            {
                alert(name);
                // PageMethods.test(name);

                  
            }
      
            function locate()
            {
                GMaps.geolocate({
                    success: function (position) {
                        map.setCenter(position.coords.latitude, position.coords.longitude);
                        map.addMarker({
                            lat: position.coords.latitude,
                            lng: position.coords.longitude,
                            icon: userLocationIcon,
                            title: "Current Location",
                            infoWindow: {
                                content: "You are here."
                            }
                        });
                    },
                    error: function (error) {
                        alert('Geolocation failed: ' + error.message);
                    },
                    not_supported: function () {
                        alert("Your browser does not support geolocation");
                    }
                });
            }
        </script>
    </form>
</asp:Content>