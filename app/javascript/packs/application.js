import "bootstrap";

import { initMapbox } from '../plugins/init_mapbox';
import { toggleDateInputs } from '../plugins/init_datepicker';
import { toggleDogSelect } from '../plugins/dog_booking';
// import { hoverReview } from '../plugins/profile_booking_page'

initMapbox();
toggleDateInputs();
toggleDogSelect();
// hoverReview();
