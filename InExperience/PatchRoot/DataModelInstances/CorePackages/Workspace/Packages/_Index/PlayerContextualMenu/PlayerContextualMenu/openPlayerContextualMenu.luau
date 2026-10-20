local Parent = script:FindFirstAncestor("PlayerContextualMenu").Parent
local CentralOverlayModule = require(Parent.CentralOverlay)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local _ = require(script.Parent.Components)

return function(p1)
	-- upvalues: CentralOverlayModule (copy), RobloxAppEnumsModule (copy)
	return function(p2)
		-- upvalues: CentralOverlayModule (upval), RobloxAppEnumsModule (upval), p1 (copy)
		p2:dispatch(CentralOverlayModule.Actions.SetCentralOverlay(RobloxAppEnumsModule.CentralOverlayType.PlayerContextualMenu, p1))
	end
end