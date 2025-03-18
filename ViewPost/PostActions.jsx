import "./PostActions.css";
import {
  faArrowUp,
  faArrowDown,
  faComments,
  faShare,
} from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { useState, useEffect } from "react";
import API from "../../url.js";

export default function PostAction(props) {
  const [comment, setComment] = useState("");

  const user = JSON.parse(localStorage.getItem("user"));
  const userId = user?.userId;

  const [commentNum, setCommentNum] = useState(0);

  const getCommentNum = async function () {
    try {
      const response = await fetch(`${API}/comment-num/${props.projectId}`, {
        method: "GET",
        headers: { "Content-Type": "application/json" },
      });

      if (!response.ok) {
        throw new Error("Error getting comments.");
      }

      const result = await response.json();

      setCommentNum(result);
    } catch (err) {
      console.error("Error getting data: " + err.message);
    }
  };

  useEffect(function () {
    getCommentNum();
  });

  const handleAddComment = async (e) => {
    e.preventDefault();

    if (!comment.trim()) return; // Avoid empty comments

    try {
      const response = await fetch(`${API}/comments/add`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          user_id: userId,
          post_id: props.projectId,
          content: comment,
        }),
      });

      const data = await response.json();

      if (response.ok) {
        console.log("Comment added:", data);
        setComment("");
      } else {
        console.error("Failed to add comment:", data.message);
      }
    } catch (error) {
      console.error("Error adding comment:", error);
    }
  };

  return (
    <>
      <div className="post-actions-buttons">
        <button className="post-upvote-button">
          <FontAwesomeIcon icon={faArrowUp} />
          &nbsp;2.5k
        </button>
        <button className="post-downvote-button">
          <FontAwesomeIcon icon={faArrowDown} />
        </button>
        <button className="post-comment-button">
          <FontAwesomeIcon icon={faComments} />
          &nbsp;{commentNum}
        </button>
        <button className="post-share-button">
          <FontAwesomeIcon icon={faShare} />
        </button>
      </div>
      <form onSubmit={handleAddComment}>
        <input
          className="post-add-comment"
          type="text"
          placeholder="Add a comment..."
          value={comment}
          onChange={(e) => setComment(e.target.value)}
        />
      </form>
    </>
  );
}
