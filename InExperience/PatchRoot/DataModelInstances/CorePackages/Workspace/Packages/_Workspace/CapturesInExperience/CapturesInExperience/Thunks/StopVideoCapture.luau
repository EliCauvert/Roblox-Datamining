local captureService = game:GetService("CaptureService")
local enableVideoCaptureApiLuaEngineFeature = game:GetEngineFeature("EnableVideoCaptureApiLua")

return function() --[[ line: 5 ]]
	-- upvalues: enableVideoCaptureApiLuaEngineFeature (ref), captureService (ref)
	return function(_) --[[ line: 6 ]]
		-- upvalues: enableVideoCaptureApiLuaEngineFeature (copy), captureService (copy)
		if enableVideoCaptureApiLuaEngineFeature then
			captureService:StopVideoCaptureInternal()
		end
	end
end