const toggleDogSelect = () => {
  const dogList = document.getElementById('dog-list');
  if (dogList) {
    let selectedDogs = [];
    const dogs = document.querySelectorAll('.add-dog');
    dogs.forEach(dog => {
      dog.addEventListener("click", (event) => {
        if (event.currentTarget.classList.contains("selected-dog")) {
          event.currentTarget.classList.remove("selected-dog");
          selectedDogs = selectedDogs.filter(function(value, index, arr) {
            return (value != event.currentTarget.id);
          })
        } else {
          event.currentTarget.classList.add("selected-dog");
          selectedDogs.push(event.currentTarget.id);
        }
        addDogIdData(selectedDogs);
      });
    })
  }
}

const addDogIdData = (selectedDogs) => {
  const hiddenDogList = document.getElementById('hidden_dog_list');
  hiddenDogList.value = selectedDogs.join(",");
}

export { toggleDogSelect };

