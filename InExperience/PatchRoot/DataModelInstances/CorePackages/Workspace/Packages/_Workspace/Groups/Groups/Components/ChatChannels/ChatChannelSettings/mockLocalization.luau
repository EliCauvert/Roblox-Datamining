local config = {
	["Feature.ChatChannels.Heading.Members"] = "Members",
	["Feature.ChatChannels.Heading.Settings"] = "Settings",
	["Feature.ChatChannels.Label.ChannelName"] = "Channel name",
	["Feature.ChatChannels.Label.CreatedBy"] = "Created by",
	["Feature.ChatChannels.Label.CreatedAt"] = "Created at",
	["Feature.ChatChannels.Label.Notifications"] = "Notifications",
	["Feature.ChatChannels.Description.Notifications"] = "Get notified when someone mentions you",
	["Feature.ChatChannels.Heading.LeaveChannel"] = "Leaving this channel?",
	["Feature.ChatChannels.Description.LeaveChannel"] = "You'll lose access to its messages.",
	["Feature.ChatChannels.Action.LeaveChannel"] = "Leave",
	["Feature.ChatChannels.Heading.DeleteChannel"] = "Delete channel",
	["Feature.ChatChannels.Description.DeleteChannel"] = "Remove this channel for everyone.",
	["Feature.ChatChannels.Action.DeleteChannel"] = "Delete",
	["Feature.ChatChannels.Description.ConfirmLeaveChannel"] = "Are you sure you want to leave this channel?",
	["Feature.ChatChannels.Description.ConfirmDeleteChannel"] = "Are you sure you want to delete this channel?",
	["CommonUI.Controls.Action.Confirm"] = "Confirm",
	["CommonUI.Controls.Action.Cancel"] = "Cancel"
}

return {
	Format = function(_, p1)
		-- upvalues: config (copy)
		return config[p1] or p1
	end,
	GetLocale = function(): string
		return "en-us"
	end,
	changed = require(script:FindFirstAncestor("Groups").Parent.AppCommonLib).Signal.new()
}