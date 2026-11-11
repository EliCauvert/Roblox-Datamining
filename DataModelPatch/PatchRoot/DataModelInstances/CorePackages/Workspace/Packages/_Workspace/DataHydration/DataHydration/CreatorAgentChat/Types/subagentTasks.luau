return {
	SubagentTaskStatus = table.freeze({
		Pending = "Pending",
		InProgress = "InProgress",
		Done = "Done",
		Error = "Error",
		Deleted = "Deleted"
	}),
	SubagentTaskCategory = table.freeze({
		Gameplay = "Gameplay",
		Art = "Art",
		Audio = "Audio",
		Marketing = "Marketing"
	})
}