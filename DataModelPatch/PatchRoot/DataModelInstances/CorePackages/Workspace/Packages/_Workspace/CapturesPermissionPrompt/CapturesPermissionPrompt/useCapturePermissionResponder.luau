local CaptureService = game:GetService("CaptureService")
local ReactModule = require(script.Parent.Parent.React)

return function()
	-- upvalues: ReactModule (copy), CaptureService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: CaptureService (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
		if not game:GetEngineFeature("CaptureServiceGalleryPermissionPrompt") then return end
		local OpenCapturePermissionsPromptConnection = CaptureService.OpenCapturePermissionsPrompt:Connect(function(PromptId, CaptureGalleryPermission)
			-- upvalues: UseStateResult2 (upval), UseStateResult2_1 (upval)
			UseStateResult2(PromptId)
			UseStateResult2_1(CaptureGalleryPermission)
		end)
		
		return function()
			-- upvalues: OpenCapturePermissionsPromptConnection (copy)
			OpenCapturePermissionsPromptConnection:Disconnect()
		end
	end, {})
	
	return {
		promptId = UseStateResult,
		permission = UseStateResult1,
		respond = ReactModule.useCallback(function(WasAccepted)
			-- upvalues: UseStateResult (copy), CaptureService (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
			if UseStateResult ~= nil then
				CaptureService:OnCapturePermissionsPromptFinished(UseStateResult, WasAccepted)
				UseStateResult2(nil)
				UseStateResult2_1(nil)
				
				return
			end
		end, { UseStateResult })
	}
end