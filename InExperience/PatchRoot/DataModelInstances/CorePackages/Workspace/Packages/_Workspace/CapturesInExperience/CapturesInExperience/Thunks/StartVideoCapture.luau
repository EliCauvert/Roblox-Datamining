local captureService = game:GetService("CaptureService")
local enableVideoCaptureApiLuaEngineFeature = game:GetEngineFeature("EnableVideoCaptureApiLua")

return function()
	-- upvalues: enableVideoCaptureApiLuaEngineFeature (ref), captureService (ref)
	return function(_)
		-- upvalues: enableVideoCaptureApiLuaEngineFeature (copy), captureService (copy)
		if enableVideoCaptureApiLuaEngineFeature then
			captureService:StartVideoCaptureInternalAsync()
		end
	end
end