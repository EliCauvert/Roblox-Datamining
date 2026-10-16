local _ = require(script.Parent.Parent.EventType)
local VRHub = require(game:GetService("CorePackages").Workspace.Packages.VrCommon).VRHub

return {
	Name = "LeaveGameIconHighlightEvent",
	StartEvent = function() --[[ Line: 16 ]]
		-- upvalues: VRHub (copy)
		VRHub:SetShowHighlightedLeaveGameIconToggled(true)
	end,
	StopEvent = function() --[[ Line: 20 ]]
		-- upvalues: VRHub (copy)
		VRHub:SetShowHighlightedLeaveGameIconToggled(false)
	end
}