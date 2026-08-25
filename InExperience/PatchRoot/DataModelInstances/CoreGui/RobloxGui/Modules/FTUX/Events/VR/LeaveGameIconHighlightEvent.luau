local _ = require(script.Parent.Parent.EventType)
local VRHub = require(game:GetService("CorePackages").Workspace.Packages.VrCommon).VRHub

return {
	Name = "LeaveGameIconHighlightEvent",
	StartEvent = function()
		-- upvalues: VRHub (ref)
		VRHub:SetShowHighlightedLeaveGameIconToggled(true)
	end,
	StopEvent = function()
		-- upvalues: VRHub (ref)
		VRHub:SetShowHighlightedLeaveGameIconToggled(false)
	end
}