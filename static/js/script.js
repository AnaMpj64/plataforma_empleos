document.addEventListener('DOMContentLoaded', function () {
    const fileInputContainer = document.querySelector('.profile-pic-container input[type="file"]');
    const profilePicPreviewContainer = document.getElementById('profile-pic-preview');
    const cameraIcon = document.getElementById('camera-icon');
    const publicarOfertaPanel = document.getElementById("publicar-oferta");
    const requisitosContainer = document.getElementById("requisitos-container");
    const requisitosJsonInput = document.getElementById("requisitos-json");
    const addRequisitoButton = document.querySelector(".btn-add-requisito");

    if (fileInputContainer && profilePicPreviewContainer && cameraIcon) {
        fileInputContainer.addEventListener('change', function (event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    profilePicPreviewContainer.src = e.target.result;
                    profilePicPreviewContainer.style.display = 'block';
                    cameraIcon.style.display = 'none';
                };
                reader.readAsDataURL(file);
            }
        });
    }

    const fileInputEmpresa = document.getElementById('foto-input');
    const previewImageEmpresa = document.getElementById('preview');

    if (fileInputEmpresa && previewImageEmpresa) {
        fileInputEmpresa.addEventListener('change', function (event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    previewImageEmpresa.src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        });
    }

    if (publicarOfertaPanel) {
        publicarOfertaPanel.addEventListener("click", function() {
            window.location.href = publicarOfertaPanel.dataset.url;
        });
    }

    function agregarRequisito() {
        const requisitoItem = document.createElement("div");
        requisitoItem.classList.add("d-flex", "align-items-center", "mb-2", "requisito-item");
        requisitoItem.innerHTML = `
            <input type="text" class="form-control me-2 requisito-input" placeholder="Ingrese un requisito">
            <button type="button" class="btn btn-danger btn-remove-requisito">
                <i class="fas fa-minus"></i>
            </button>
        `;
        requisitosContainer.appendChild(requisitoItem);
    }

    if (addRequisitoButton) {
        addRequisitoButton.addEventListener("click", function () {
            agregarRequisito();
        });
    }

    requisitosContainer.addEventListener("click", function (e) {
        if (e.target.closest(".btn-remove-requisito")) {
            e.target.closest(".requisito-item").remove();
        }
    });

    const ofertaForm = document.getElementById("oferta-form");
    if (ofertaForm) {
        ofertaForm.addEventListener("submit", function () {
            const requisitos = [];
            document.querySelectorAll(".requisito-input").forEach(input => {
                if (input.value.trim() !== "") {
                    requisitos.push(input.value.trim());
                }
            });
            requisitosJsonInput.value = JSON.stringify(requisitos);
        });
    }
});
