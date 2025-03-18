export default function Image(props) {
  return (
    <div className="image">
      <img src={props.image_url} alt="post image" />
    </div>
  );
}
