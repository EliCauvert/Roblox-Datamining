local SetGlobalContextMenuInsetModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetGlobalContextMenuInset)

return function(p1, p2)
	-- upvalues: SetGlobalContextMenuInsetModule (copy)
	local P0 = p1 or { left = 0, top = 0, right = 0, bottom = 0 }
	assert(P0, "")
	
	return if p2.type == SetGlobalContextMenuInsetModule.name then {
		left = p2.left,
		top = p2.top,
		right = p2.right,
		bottom = p2.bottom
	} else P0
end