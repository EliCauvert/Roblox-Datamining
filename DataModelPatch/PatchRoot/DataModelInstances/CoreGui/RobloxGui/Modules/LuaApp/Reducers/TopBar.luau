local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ImmutableModule = require(Modules.Common.Immutable)
local SetTopBarHeightModule = require(Modules.LuaApp.Actions.SetTopBarHeight)
local SetStatusBarHeightModule = require(Modules.LuaApp.Actions.SetStatusBarHeight)
local ConstantsModule = require(Modules.LuaApp.Constants)

return function(p1, p2)
	-- upvalues: ConstantsModule (copy), SetTopBarHeightModule (copy), ImmutableModule (copy), SetStatusBarHeightModule (copy)
	local P0 = p1 or {
		statusBarHeight = 0,
		topBarHeight = ConstantsModule.TOP_BAR_SIZE
	}
	assert(P0, "")
	
	if p2.type ~= SetTopBarHeightModule.name then
		if p2.type == SetStatusBarHeightModule.name then
			P0 = ImmutableModule.JoinDictionaries(P0, { statusBarHeight = p2.statusBarHeight })
		end
	elseif P0.topBarHeight ~= p2.topBarHeight then
		P0 = ImmutableModule.JoinDictionaries(P0, { topBarHeight = p2.topBarHeight })
		
		return P0
	end
	return P0
end