local _ = require(script:FindFirstAncestor("Groups").Parent.SocialLuaAnalytics)
local eventNamesModule = require(script.Parent.EventNames)

return {
	[eventNamesModule.GroupsListCreateGroupClicked] = {
		context = "myGroups",
		eventType = "groupPageClickEvent",
		additionalInfo = { clickTargetType = "createGroup" }
	},
	[eventNamesModule.GroupsListPageExposure] = {
		context = "myGroups",
		eventType = "groupPageExposureEvent",
		additionalInfo = { exposureType = "myGroups" }
	}
}