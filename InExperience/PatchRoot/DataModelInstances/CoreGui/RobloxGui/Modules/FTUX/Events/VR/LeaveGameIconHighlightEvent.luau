local _ = require(script.Parent.Parent.EventType)
local VRHub = require(game:GetService("CorePackages").Workspace.Packages.VrCommon).VRHub

return {
	Name = "LeaveGameIconHighlightEvent",
	StartEvent = function() --[[ line: 16 ]]
		-- upvalues: VRHub (ref)
		VRHub:SetShowHighlightedLeaveGameIconToggled(true)
	end,
	StopEvent = function() --[[ line: 20 ]]
		-- upvalues: VRHub (ref)
		VRHub:SetShowHighlightedLeaveGameIconToggled(false)
	end
}