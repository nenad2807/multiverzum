function getCookie(name) {
  let cookieValue = null;
  if (document.cookie && document.cookie !== '') {
    const cookies = document.cookie.split(';');
    for (let i = 0; i < cookies.length; i++) {
      const cookie = cookies[i].trim();
      if (cookie.substring(0, name.length + 1) === (name + '=')) {
        cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
        break;
      }
    }
  }
  return cookieValue;
}



function sendPurchaseRequest(item_id, quantity) {

  let first_name, last_name, address, address_2, country, state_or_region, zip_code;

  first_name = $('#first_name').val();
  last_name = $('#last_name').val();
  address = $('#address').val();
  address_2 = $('#address_2').val();
  country = $('#country').val();
  state_or_region = $('#state_or_region').val();
  zip_code = $('#zip_code').val();
  quantity = [quantity];

  const csrftoken = getCookie('csrftoken');

  $.ajax({
    type: "POST",
    headers: {
      'X-CSRFToken': csrftoken
    },
    url: "/send-purchase-request",
    data: {
      'order_items': [3],
      'quantities': [quantity],
      'first_name': first_name,
      'last_name': last_name,
      'address': address,
      'address_2': address_2,
      'country': country,
      'state_or_region': state_or_region,
      'zip_code': zip_code,

    },
    success: function (response) {
    }
  })

}