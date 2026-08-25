local var0 = nil

if game:GetEngineFeature("ReportAnythingScreenshot") then
	game:GetService("SafetyService").ScreenshotContentReady:Connect(function(_, p0)
		-- upvalues: var0 (write)
		var0 = p0
	end)
end
local t = {}
t.__index = t

function t.GetScreenshotContentId(_)
	-- upvalues: var0 (write)
	return var0
end

function t.SetScreenshotContentId(_, p1)
	-- upvalues: var0 (write)
	var0 = p1
end

return t