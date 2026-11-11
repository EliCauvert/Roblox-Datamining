local LuaApp = game:GetService("CoreGui").RobloxGui.Modules.LuaApp
local SetModerationStatusModule = require(LuaApp.Actions.Moderation.SetModerationStatus)
local SetModerationDetailModule = require(LuaApp.Actions.Moderation.SetModerationDetail)
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)

return function(p1, p2)
	-- upvalues: SetModerationStatusModule (copy), SetModerationDetailModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	assert(P0, "")
	
	if p2.type == SetModerationStatusModule.name then
		P0 = { userModerated = p2.userModerated }
	end
	if p2.type == SetModerationDetailModule.name then
		P0 = CryoModule.Dictionary.join(P0, (CryoModule.Dictionary.join(P0 or {}, { moderationDetail = p2.moderationDetail })))
	end
	return P0
end