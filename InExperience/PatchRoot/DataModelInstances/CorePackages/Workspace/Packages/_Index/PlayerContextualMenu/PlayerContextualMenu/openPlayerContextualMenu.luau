local parent = script:FindFirstAncestor("PlayerContextualMenu").Parent
local centralOverlayModule = require(parent.CentralOverlay)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local _ = require(script.Parent.Components)

return function(p0) --[[ line: 9 ]]
	-- upvalues: centralOverlayModule (ref), robloxAppEnumsModule (ref)
	return function(p1) --[[ line: 10 ]]
		-- upvalues: centralOverlayModule (copy), robloxAppEnumsModule (copy), p0 (ref)
		p1:dispatch(centralOverlayModule.Actions.SetCentralOverlay(robloxAppEnumsModule.CentralOverlayType.PlayerContextualMenu, p0))
	end
end