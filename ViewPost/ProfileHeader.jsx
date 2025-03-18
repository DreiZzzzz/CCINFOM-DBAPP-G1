import "./ProfileHeader.css";
export default function ProfileHeader() {
  return (
    <>
      <div className="post-profile-container">
        <img
          id="post-container-image"
          src="https://i.pinimg.com/736x/63/d4/2b/63d42bcfc3ce97414d78f14ae76f61c8.jpg"
          alt="Profile Picture"
        />
        <span id="post-user-hours">celeste_stars - 18 hn.ago</span>
        <span id="post-follow-message">
          <button>✛ follow</button>
          <button id="message-button">💬</button>
        </span>
        <span id="user-online-hours">Last Online: 2hr. ago</span>
      </div>
    </>
  );
}
