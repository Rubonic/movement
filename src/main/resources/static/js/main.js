onregister = (event) => {
    // event.preventDefault();
    console.log(event.target[0].files[0]);
    let formData = new FormData()
    formData.append("file", event.target[0].files[0]);
    fetch("http:localhost:8080/upload",{
        method:"POST",
        body:formData
    })
        .then(res => res.json(res))
        .then(res => console.log(res))
        .catch(e => console.log(e))
}

