local v1 = script

return {
	GroupsInExperienceApp = require(v1.GroupsInExperienceApp),
	GroupsList = require(v1.Components.GroupsList),
	GroupsPage = require(v1.Components.GroupsPage),
	Common = require(v1.Common),
	Networking = require(v1.Networking),
	Contexts = require(v1.Contexts),
	Hooks = require(v1.Hooks),
	Navigation = require(v1.Navigation),
	CommunityListRouting = require(v1.CommunityListRouting),
	getGroupSidebar = function()
		-- upvalues: v1 (copy)
		return require(v1.Common.GroupSidebar)
	end,
	["jest.config"] = script["jest.config"]
}