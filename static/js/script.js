document.addEventListener('DOMContentLoaded', function () {
    const fileInputContainer = document.querySelector('.profile-pic-container input[type="file"]');
    const profilePicPreviewContainer = document.getElementById('profile-pic-preview');
    const cameraIcon = document.getElementById('camera-icon');
    const publicarOfertaPanel = document.getElementById("publicar-oferta");
    const requisitosContainer = document.getElementById("requisitos-container");
    const requisitosJsonInput = document.getElementById("requisitos-json");
    const addRequisitoButton = document.querySelector(".btn-add-requisito");
    const fileInputEmpresa = document.getElementById('foto-input');
    const previewImageEmpresa = document.getElementById('preview');

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

    function agregarCampo(containerId, inputClass, placeholder) {
        const container = document.getElementById(containerId);
        const item = document.createElement("div");
        item.classList.add("d-flex", "align-items-center", "mb-2");
        item.innerHTML = `
            <input type="text" class="form-control me-2 ${inputClass}" placeholder="${placeholder}">
            <button type="button" class="btn btn-danger btn-remove">
                <i class="fas fa-minus"></i>
            </button>
        `;
        container.appendChild(item);
    }

    if (addRequisitoButton) {
        addRequisitoButton.addEventListener("click", function () {
            agregarCampo("requisitos-container", "requisito-input", "Ingrese un requisito");
        });
    }

    document.querySelector(".btn-add-pregunta").addEventListener("click", function () {
        agregarCampo("preguntas-container", "pregunta-input", "Ingrese una pregunta");
    });

    document.addEventListener("click", function (e) {
        if (e.target.closest(".btn-remove")) {
            e.target.closest(".d-flex").remove();
        }
    });

    const ofertaForm = document.getElementById("oferta-form");
    if (ofertaForm) {
        ofertaForm.addEventListener("submit", function () {
            // Serializar requisitos
            const requisitos = [];
            document.querySelectorAll(".requisito-input").forEach(input => {
                if (input.value.trim() !== "") {
                    requisitos.push(input.value.trim());
                }
            });
            requisitosJsonInput.value = JSON.stringify(requisitos);
    
            // Serializar preguntas
            const preguntas = [];
            document.querySelectorAll(".pregunta-input").forEach(input => {
                if (input.value.trim() !== "") {
                    preguntas.push(input.value.trim());
                }
            });
            document.getElementById("preguntas-json").value = JSON.stringify(preguntas);
        });
    }
});
