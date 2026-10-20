local _ = require(script:FindFirstAncestor("Groups").Parent.SocialLuaAnalytics)
local EventNamesModule = require(script.Parent.EventNames)

return {
	[EventNamesModule.GroupsListCreateGroupClicked] = {
		context = "myGroups",
		eventType = "groupPageClickEvent",
		additionalInfo = { clickTargetType = "createGroup" }
	},
	[EventNamesModule.GroupsListPageExposure] = {
		context = "myGroups",
		eventType = "groupPageExposureEvent",
		additionalInfo = { exposureType = "myGroups" }
	}
}