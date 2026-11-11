local Parent = script:FindFirstAncestor("NotApprovedPageShared").Parent
local ArgCheckModule = require(Parent.ArgCheck)

return require(Parent.Rodux).makeActionCreator(script.Name, function(UserModerated)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(UserModerated, "boolean", "SetModerationStatus action expects `moderationStatus` to be a boolean")
	
	return { userModerated = UserModerated }
end)