function handleFileSelect(event) {
    const files = event.target.files;

    document.getElementById("imagePreview").innerHTML = "";

    for (let i = 0; i < files.length; i++) {
        const file = files[i];
        const reader = new FileReader();

        reader.onload = (function (file) {
            return function (event) {

                const divElement = document.createElement("div");
                divElement.className = "col-md-3";

                const imgElement = document.createElement("img");
                imgElement.className = "w-100 h-100 rounded-lg";
                imgElement.src = event.target.result;

                divElement.appendChild(imgElement);

                document.getElementById("imagePreview").appendChild(divElement);
            };
        })(file);

        reader.readAsDataURL(file);
    }
}

document.getElementById("imagesInput").addEventListener("change", handleFileSelect, false);
