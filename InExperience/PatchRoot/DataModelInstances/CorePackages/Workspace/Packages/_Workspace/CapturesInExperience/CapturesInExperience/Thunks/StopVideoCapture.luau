local CaptureService = game:GetService("CaptureService")
local EnableVideoCaptureApiLuaEngineFeature = game:GetEngineFeature("EnableVideoCaptureApiLua")

return function()
	-- upvalues: EnableVideoCaptureApiLuaEngineFeature (copy), CaptureService (copy)
	return function(_)
		-- upvalues: EnableVideoCaptureApiLuaEngineFeature (upval), CaptureService (upval)
		if EnableVideoCaptureApiLuaEngineFeature then
			CaptureService:StopVideoCaptureInternal()
		end
	end
end