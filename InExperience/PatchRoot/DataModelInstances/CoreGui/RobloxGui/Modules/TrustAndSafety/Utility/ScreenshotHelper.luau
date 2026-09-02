local var1 = nil

if game:GetEngineFeature("ReportAnythingScreenshot") then
	game:GetService("SafetyService").ScreenshotContentReady:Connect(function(_, p1)
		-- upvalues: var1 (write)
		var1 = p1
	end)
end
local t = {}
t.__index = t

function t.GetScreenshotContentId(_)
	-- upvalues: var1 (write)
	return var1
end

function t.SetScreenshotContentId(_, p1)
	-- upvalues: var1 (write)
	var1 = p1
end

return t