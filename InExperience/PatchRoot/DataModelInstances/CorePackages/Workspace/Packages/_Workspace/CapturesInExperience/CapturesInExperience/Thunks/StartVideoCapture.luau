local CaptureService = game:GetService("CaptureService")
local EnableVideoCaptureApiLuaEngineFeature = game:GetEngineFeature("EnableVideoCaptureApiLua")

return function() --[[ Line: 5 ]]
	-- upvalues: EnableVideoCaptureApiLuaEngineFeature (copy), CaptureService (copy)
	return function(_) --[[ Line: 6 ]]
		-- upvalues: EnableVideoCaptureApiLuaEngineFeature (upval), CaptureService (upval)
		if EnableVideoCaptureApiLuaEngineFeature then
			CaptureService:StartVideoCaptureInternalAsync()
		end
	end
end