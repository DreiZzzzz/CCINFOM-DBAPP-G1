import ImageContainer from "./ImageContainer.jsx";
import CaptionContainer from "./CaptionContainer.jsx";

export default function CaptionImage({ body, file }) {
  return (
    <>
      <CaptionContainer body={body} />
      {file && <ImageContainer file={file} />}
    </>
  );
}
