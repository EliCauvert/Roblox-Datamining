local SetUserAccessRestrictionDetailModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.UserAccess.SetUserAccessRestrictionDetail)

return function(p1, p2)
	-- upvalues: SetUserAccessRestrictionDetailModule (copy)
	local P0 = p1 or {}
	
	return if p2.type == SetUserAccessRestrictionDetailModule.name then { restrictionDetail = p2.restrictionDetail } else P0
end