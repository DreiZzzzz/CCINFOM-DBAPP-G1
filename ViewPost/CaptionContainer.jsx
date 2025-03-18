import "./CaptionContainer.css";

export default function CaptionContainer({body}) {
  return (
    <>
      <div className="post-caption-paragraph">
        <p id="post-caption"> {body} </p>
      </div>
    </>
  );
}
