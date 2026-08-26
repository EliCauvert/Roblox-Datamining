local parent = script:FindFirstAncestor("PlayerContextualMenu").Parent
local centralOverlayModule = require(parent.CentralOverlay)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local _ = require(script.Parent.Components)

return function(p1)
	-- upvalues: centralOverlayModule (ref), robloxAppEnumsModule (ref)
	return function(p2)
		-- upvalues: centralOverlayModule (copy), robloxAppEnumsModule (copy), p1 (ref)
		p2:dispatch(centralOverlayModule.Actions.SetCentralOverlay(robloxAppEnumsModule.CentralOverlayType.PlayerContextualMenu, p1))
	end
end