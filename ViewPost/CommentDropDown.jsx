import { Menu, MenuButton, MenuItems, MenuItem } from "@headlessui/react";
import { faEllipsis, faTrash, faPen } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import API from "../../url.js";

export default function CommentDropdown(props) {
  const handleEdit = () => {
    console.log("Edit button clicked");
    props.onEdit(); // Trigger the edit state in the parent component
  };

  const handleDelete = async () => {
    // remove after testing
    console.log("comment id: " + props.commentId);
    console.log("user id: " + props.userId._id);

    if (!props.commentId) {
      console.error("Comment ID is missing");
      return;
    }

    try {
      const response = await fetch(`${API}/comment/delete/${props.commentId}`, {
        method: "DELETE",
      });

      if (!response.ok) {
        throw new Error("Failed to delete comment");
      }

      console.log("Comment deleted successfully");
    } catch (error) {
      console.error("Error deleting comment:", error);
    }
  };

  return (
    <Menu as="div" className="relative">
      <div>
        <MenuButton className="relative outline-none">
          <FontAwesomeIcon icon={faEllipsis} aria-hidden="false" />
        </MenuButton>
      </div>
      <MenuItems
        className="w-[22%] bg-[var(--brighter-bg-color)] rounded-md transition
          data-[closed]:scale-95 data-[closed]:transform data-[closed]:opacity-0
          data-[enter]:duration-100 data-[enter]:ease-out data-[leave]:duration-75
          data-[leave]:ease-in shadow-md absolute top-[22px] left-[-6.5rem] z-[30] min-w-[120px]"
      >
        <MenuItem>
          <button
            className="px-2 py-1 w-[100%] hover:bg-[var(--primary-color)] transition-colors
                font-semibold text-sm text-left mt-1"
            onClick={handleEdit}
          >
            <FontAwesomeIcon icon={faPen} className="ml-1 mr-2" /> Edit
          </button>
        </MenuItem>
        <MenuItem>
          <button
            className="px-2 py-1 w-[100%] hover:bg-[var(--primary-color)] transition-colors
                font-semibold text-sm text-left mt-1"
            onClick={handleDelete}
          >
            <FontAwesomeIcon icon={faTrash} className="ml-1 mr-2" /> Delete
          </button>
        </MenuItem>
        <div className="mx-2 my-1 bg-[var(--secondary-color)] h-px" />
      </MenuItems>
    </Menu>
  );
}
