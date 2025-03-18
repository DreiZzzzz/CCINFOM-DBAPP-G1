//import { useState } from "react";
import "./ImageContainer.css";
import Image from "./Image";

export default function ImageContainer({ file }) {
  const image_src = file;
  //future use for multibple images
  //const [index, setIndex] = useState(0);

  /*const image_link = [
    "https://images.pexels.com/photos/20787/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=350",
    "https://images.pexels.com/photos/460985/pexels-photo-460985.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/41178/africa-animal-big-carnivore-41178.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ];

  function handlePreviousButton() {
    if (index > 0) {
      setIndex((i) => i - 1);
    }
  }

  function handleNextButton() {
    if (index < image_link.length - 1) {
      setIndex((i) => i + 1);
    }
  }*/

  return (
    <div className="image-slider">
      {/*<div className="previous-button">
        <span className="image-button" onClick={handlePreviousButton}>
          &lt;
        </span>
      </div>*/}

      <div className="image-container">
        <img className="image" src={image_src} alt="project-image" />
      </div>
      {/*<div className="next-button">
        <span className="image-button" onClick={handleNextButton}>
          &gt;
        </span>
      </div>*/}
    </div>
  );
}
