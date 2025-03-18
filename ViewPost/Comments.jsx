import "./Comments.css";
import CommentActions from "./CommentActions.jsx"; // contains upvote and downvote
import CommentDropDown from "./CommentDropDown"; // contains edit and delete
import { useState } from "react";
import API from "../../url.js";

export default function Comments(props) {
  const [isEditing, setIsEditing] = useState(false);
  const [newContent, setNewContent] = useState("");

  const handleEdit = () => {
    setNewContent(props.comment);
    setIsEditing(true);
  };

  const handleKeyDown = async (e) => {
    if (e.key === "Enter") {
      if (!newContent.trim()) return; // Prevent empty input

      try {
        console.log("props.commentId: " + props.commentId);
        const response = await fetch(`${API}/comment/edit/${props.commentId}`, {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            user_id: props.userId._id,
            content: newContent,
          }),
        });

        if (!response.ok) throw new Error("Failed to update comment");

        console.log("Comment updated successfully");

        props.onUpdate(props.commentId, newContent);

        setIsEditing(false);
      } catch (error) {
        console.error("Error updating comment:", error);
      }
    }
  };

  return (
    <>
      <div className="post-commenter-profile">
        <img
          id="commenter-image-container"
          src={props.profile_url}
          alt="profile picture"
        />
        <div style={{ flexGrow: 1, marginLeft: "10px" }}>
          <span id="post-user-hours">{props.userName_time}</span>
        </div>
        <CommentDropDown
          commentId={props.commentId}
          style={{ position: "static" }}
          userId={props.userId}
          onEdit={handleEdit}
        />
      </div>
      <div>
        {isEditing ? (
          <input
            type="text"
            value={newContent}
            onChange={(e) => setNewContent(e.target.value)}
            onKeyDown={handleKeyDown}
            className="mt-2 w-full border border-gray-300 rounded-md p-2 text-sm"
            placeholder={props.comment}
            autoFocus
            aria-label="Edit comment"
            id="edit-comment-input"
          />
        ) : (
          <span id="commenter-comment-container">
            {props.comment + " [comment_id: " + props.commentId + "]"}
          </span>
        )}
      </div>
      <CommentActions
        upvotes={props.upvotes}
        downvotes={props.downvotes}
        commentId={props.commentId}
      />
    </>
  );
}
