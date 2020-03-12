import mapboxgl from 'mapbox-gl';

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infowindow); // add this

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '40px';
    element.style.height = '40px';

    new mapboxgl.Marker(element)
    .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
    });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 30, duration: 0 });
};

const initMapbox = () => {
  const cards = document.querySelectorAll(".card-category")
  const mapElement = document.getElementById('map');
  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    cards.forEach((card) => {
      card.addEventListener("click", (event) => {

         mapElement.classList.add("visible");
        const lng = parseFloat(card.dataset.lng, 10);
        const lat = parseFloat(card.dataset.lat, 10);
        map.flyTo({
          center: [lng, lat],
          zoom: 9,
          speed: 1,
        });
      });
    });
  };
};

export { initMapbox };
