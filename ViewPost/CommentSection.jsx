import "./CommentSection.css";
import Comments from "./Comments";
import { useState, useEffect } from "react";
import API from "../../url.js";

export default function CommentSection({ projectId }) {
  const [comments, setComments] = useState([]);

  useEffect(() => {
    const fetchComments = async () => {
      if (!projectId) return;

      try {
        const response = await fetch(`${API}/comments/post/${projectId}`);
        if (!response.ok) throw new Error("Failed to fetch comments");
        const data = await response.json();
        setComments(data);

        console.log(data); // remove this after debugging
      } catch (error) {
        console.error("Error fetching comments:", error);
      }
    };

    fetchComments();
    // refresh comment section
    const interval = setInterval(() => {
      fetchComments();
    }, 3000);

    return () => clearInterval(interval);
  }, [projectId]);

  const handleCommentUpdate = (commentId, newContent) => {
    setComments((prevComments) =>
      prevComments.map((comment) =>
        comment._id === commentId
          ? { ...comment, content: newContent }
          : comment
      )
    );
  };

  return (
    <div className="post-comment-section">
      {comments
        .filter((comment) => comment.user_id)
        .map((comment) => (
          <Comments
            key={comment._id}
            profile_url="https://i.pinimg.com/736x/c6/8c/e6/c68ce664ae649625c13190e68aa954ac.jpg"
            userName_time={`${
              comment.user_id?.user_name || "Unknown User"
            } • ${new Date(comment.createdAt).toLocaleString()}`}
            comment={comment.content}
            upvotes={comment.upvotes}
            downvotes={comment.downvotes}
            commentId={comment._id}
            userId={comment.user_id}
            onUpdate={handleCommentUpdate}
          />
        ))}
    </div>
  );
}
