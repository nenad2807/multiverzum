fetch('https://api.ipregistry.co/?key=s6700zs5tbtk8c11')
    .then(function (response) {
        return response.json();
    })
    .then(function (payload) {
        document.getElementById('userCountry').innerHTML = "<img class='rounded' src='https://backstrap.net/vendors/flag-icon-css/flags/4x3/" + payload.location.country.code.toLowerCase() + ".svg' style='width: 25px;'>";
    });



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



function toggleWishlistItem(item_id) {

    const csrftoken = getCookie('csrftoken');

    $.ajax({
        type: "POST",
        headers: {
            'X-CSRFToken': csrftoken
        },
        url: "/user/toggle-wishlist-item",
        data: {
            'id': item_id,
        },
        success: function (response) {
            if (response == 'Added') {
                $('#added-to-wishlist-alert').show().delay(2500).fadeOut();
                $('#' + item_id).css('color', 'rgb(246, 78, 96)')
                $('#' + item_id).removeClass('fa-regular')
                $('#' + item_id).addClass('fa-solid')
            } else if (response == 'Removed') {
                if (window.location.pathname == "/user/wishlist") {
                    location.reload();
                } else {
                    $('#removed-from-wishlist-alert').show().delay(2500).fadeOut();
                    $('#' + item_id).css('color', 'black')
                    $('#' + item_id).addClass('fa-regular')
                    $('#' + item_id).removeClass('fa-solid')
                }
            }
        }
    })

}

const switchButton = document.getElementById('customSwitches');

function enableDarkMode() {
    document.body.classList.add('dark-mode');
    $('#logo').attr('src', '/static/main/img/icons/logo-white.png');

    localStorage.setItem('modePreference', 'dark');
}

function disableDarkMode() {
    document.body.classList.remove('dark-mode');
    $('#logo').attr('src', '/static/main/img/icons/logo.png');

    localStorage.removeItem('modePreference');
}

function toggleDarkMode() {
    if (switchButton.checked) {
        enableDarkMode();
    } else {
        disableDarkMode();
    }
}

switchButton.addEventListener('change', toggleDarkMode);

const savedPreference = localStorage.getItem('modePreference');
if (savedPreference === 'dark') {
    $('#logo').attr('src', '/static/main/img/icons/logo-white.png');
    switchButton.checked = true;
    enableDarkMode();
}

function playNotificationSound() {
    var audio = new Audio("/static/main/sounds/notification-sound.wav");
    audio.play();
}
