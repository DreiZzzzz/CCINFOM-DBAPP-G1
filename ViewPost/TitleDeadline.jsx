import "./TitleDeadline.css";
import "../../App.css";
import  ActionDropdownMenu from "../Home/ActionDropdownMenu.jsx"

export default function TitleDeadline({ title, progress, deadlength, id, onDelete }) {
  return (
    <>
      <div className="post-title-deadline">
        <span id="title">{title}</span>
        <span>
          <div className="deadline-bar-container">
            <div
              className="deadline-text"
              dangerouslySetInnerHTML={{
                __html: `Progress: ${deadlength}%`,
              }}
            />
            <div className="deadline-bar">
              <div
                className="progress"
                style={{ width: `${deadlength}` }}
              ></div>
            </div>
          </div>
        </span>
        <span>
          <div className="ml-auto">
            <ActionDropdownMenu key={id} id={id} onDelete={onDelete}/>
          </div>
        </span>
      </div>

      <div className="project-status">
        <p id="status">{progress}</p>
      </div>
    </>
  );
}