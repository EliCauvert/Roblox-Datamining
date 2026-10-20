local Groups = script:FindFirstAncestor("Groups")
local ReactModule = require(Groups.Parent.React)
local GroupsAnalyticsContextModule = require(Groups.Analytics.GroupsAnalyticsContext)

return function()
	-- upvalues: ReactModule (copy), GroupsAnalyticsContextModule (copy)
	return ReactModule.useContext(GroupsAnalyticsContextModule)
end