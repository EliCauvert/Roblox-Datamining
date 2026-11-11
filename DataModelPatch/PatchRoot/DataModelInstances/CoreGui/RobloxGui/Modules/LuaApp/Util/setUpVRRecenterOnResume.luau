local VRService = game:GetService("VRService")
local Connection = nil
local VRSessionState = VRService.VRSessionState

return function()
	-- upvalues: Connection (ref), VRService (copy), VRSessionState (ref)
	if not Connection then
		Connection = VRService:GetPropertyChangedSignal("VRSessionState"):Connect(function()
			-- upvalues: VRSessionState (upval), VRService (upval)
			if VRSessionState == VRService.VRSessionState then return end
			if VRSessionState == Enum.VRSessionState.Undefined and VRService.VRSessionState == Enum.VRSessionState.Focused then
				VRService:RecenterUserHeadCFrame()
			end
			VRSessionState = VRService.VRSessionState
		end)
	end
end