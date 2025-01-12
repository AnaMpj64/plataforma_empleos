function addIdioma() {
    const container = document.getElementById('idiomas-container');
    const newField = document.createElement('div');
    newField.classList.add('d-flex', 'align-items-center', 'mt-2');
    newField.innerHTML = `
        <input type="text" class="form-control form-control-lg me-2" placeholder="Idioma">
        <input type="text" class="form-control form-control-lg" placeholder="Nivel">
        <button type="button" class="btn btn-danger ms-2" onclick="removeField(this)">-</button>
    `;
    container.appendChild(newField);
}

function addExperiencia() {
    const container = document.getElementById('experiencia-container');
    const newField = document.createElement('div');
    newField.classList.add('d-flex', 'align-items-center', 'mt-2');
    newField.innerHTML = `
        <input type="text" class="form-control form-control-lg me-2" placeholder="Empresa">
        <input type="text" class="form-control form-control-lg" placeholder="Tiempo laborado">
        <button type="button" class="btn btn-danger ms-2" onclick="removeField(this)">-</button>
    `;
    container.appendChild(newField);
}

function addEducacion() {
    const container = document.getElementById('educacion-container');
    const newField = document.createElement('div');
    newField.classList.add('d-flex', 'align-items-center', 'mt-2');
    newField.innerHTML = `
        <input type="text" class="form-control form-control-lg me-2" placeholder="Institución">
        <input type="text" class="form-control form-control-lg" placeholder="Título obtenido">
        <button type="button" class="btn btn-danger ms-2" onclick="removeField(this)">-</button>
    `;
    container.appendChild(newField);
}

function addCurso() {
    const container = document.getElementById('cursos-container');
    const newField = document.createElement('div');
    newField.classList.add('d-flex', 'align-items-center', 'mt-2');
    newField.innerHTML = `
        <input type="text" class="form-control form-control-lg" placeholder="Curso o Certificado">
        <button type="button" class="btn btn-danger ms-2" onclick="removeField(this)">-</button>
    `;
    container.appendChild(newField);
}

function addDiscapacidad() {
    const container = document.getElementById('discapacidad-container');
    const newField = document.createElement('div');
    newField.classList.add('d-flex', 'align-items-center', 'mt-2');
    newField.innerHTML = `
        <input type="text" class="form-control form-control-lg" placeholder="Discapacidad">
        <button type="button" class="btn btn-danger ms-2" onclick="removeField(this)">-</button>
    `;
    container.appendChild(newField);
}

function removeField(button) {
    button.parentElement.remove();
}

function serializeDynamicFields() {
    // Idiomas
    const idiomas = {};
    const idiomasKeys = document.getElementsByName('idiomas_key[]');
    const idiomasValues = document.getElementsByName('idiomas_value[]');
    idiomasKeys.forEach((key, index) => {
        if (key.value.trim() && idiomasValues[index].value.trim()) {
            idiomas[key.value] = idiomasValues[index].value;
        }
    });
    document.querySelector('input[name="idiomas"]').value = JSON.stringify(idiomas);

    // Experiencia Laboral
    const experiencia = [];
    const empresas = document.getElementsByName('experiencia_empresa[]');
    const tiempos = document.getElementsByName('experiencia_tiempo[]');
    empresas.forEach((empresa, index) => {
        if (empresa.value.trim() && tiempos[index].value.trim()) {
            experiencia.push({ empresa: empresa.value, tiempo: tiempos[index].value });
        }
    });
    document.querySelector('input[name="experiencia_laboral"]').value = JSON.stringify(experiencia);

    // Instituciones Educativas
    const instituciones = [];
    const nombres = document.getElementsByName('instituciones_nombre[]');
    const titulos = document.getElementsByName('instituciones_titulo[]');
    nombres.forEach((nombre, index) => {
        if (nombre.value.trim() && titulos[index].value.trim()) {
            instituciones.push({ nombre: nombre.value, titulo: titulos[index].value });
        }
    });
    document.querySelector('input[name="instituciones_educativas"]').value = JSON.stringify(instituciones);

    // Cursos Certificados
    const cursos = [];
    document.getElementsByName('cursos_certificados[]').forEach(curso => {
        if (curso.value.trim()) cursos.push(curso.value);
    });
    document.querySelector('input[name="cursos_certificados"]').value = JSON.stringify(cursos);
}

document.querySelector('form').addEventListener('submit', serializeDynamicFields);