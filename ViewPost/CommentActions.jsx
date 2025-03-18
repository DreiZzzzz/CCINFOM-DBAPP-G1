import "./CommentActions.css";
import { useState } from "react";
import {
  faArrowUp,
  faArrowDown,
  faComments,
  faShare,
} from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import API from "../../url.js";

export default function CommentActions(props) {
  const [upvotes, setUpvotes] = useState(props.upvotes || 0);
  const [downvotes, setDownvotes] = useState(props.downvotes || 0);

  const handleUpvote = async () => {
    try {
      const response = await fetch(
        `${API}/upvote/${props.commentId}`,
        {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json",
          },
        }
      );

      if (response.ok) {
        setUpvotes((prev) => prev + 1);
      } else {
        console.error("Failed to upvote");
        console.log(props.commentId);
      }
    } catch (error) {
      console.error("Error upvoting comment:", error);
    }
  };

  const handleDownvote = async () => {
    try {
      const response = await fetch(
        `${API}/downvote/${props.commentId}`,
        {
          method: "PATCH", // Use PATCH instead of POST
          headers: {
            "Content-Type": "application/json",
          },
        }
      );

      if (response.ok) {
        setDownvotes((prev) => prev + 1);
      } else {
        console.error("Failed to downvote");
      }
    } catch (error) {
      console.error("Error downvoting comment:", error);
    }
  };

  return (
    <>
      <div id="commenter-action-buttons" className="actions-buttons">
        <button
          onClick={handleUpvote}
          className="comment-upvote-button font-garet-book"
          aria-label="Upvote"
        >
          <FontAwesomeIcon icon={faArrowUp} /> {upvotes}
        </button>
        <button
          onClick={handleDownvote}
          className="comment-downvote-button"
          aria-label="Downvote"
        >
          <FontAwesomeIcon icon={faArrowDown} /> {downvotes}
        </button>
        <button className="comment-comment-button" aria-label="Comment">
          <FontAwesomeIcon icon={faComments} />
          &nbsp;0
        </button>
        <button className="comment-share-button" aria-label="Share">
          <FontAwesomeIcon icon={faShare} />
        </button>
      </div>
    </>
  );
}
