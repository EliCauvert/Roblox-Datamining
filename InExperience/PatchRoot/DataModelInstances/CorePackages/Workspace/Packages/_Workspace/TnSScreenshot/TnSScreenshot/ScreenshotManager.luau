local getFFlagEnableInAppBugReporting = require(script:FindFirstAncestor("TnSScreenshot").Parent.SharedFlags).GetFFlagEnableInAppBugReporting

local _ = function()
	return game:GetEngineFeature("ReportAnythingScreenshot") and game:GetEngineFeature("ReportAnythingScreenshotUploadedSignal")
end

local t = {}
t.__index = t
local t_1 = {}
local t_2 = {}
local var1 = false
local _ = { RAABTestReason = "RAABTest" }

local var2 = function(p1)
	-- upvalues: t_1 (ref), t_2 (ref), var1 (write)
	p1.ScreenshotUploaded:Connect(function(p2, p3)
		-- upvalues: t_1 (copy)
		local var3 = t_1[p2]
		
		if var3 then
			var3(p3)
			table.remove(t_1, p2)
			
			return
		end
	end)
	p1.ScreenshotContentReady:Connect(function(p2, p3)
		-- upvalues: t_2 (copy)
		local var3 = t_2[p2]
		
		if var3 then
			var3(p3)
			table.remove(t_2, p2)
			
			return
		end
	end)
	var1 = true
end

function t.TakeScreenshotWithCallback(_, p1, p2, p3)
	-- upvalues: getFFlagEnableInAppBugReporting (ref), t_1 (ref), t_2 (ref), var1 (write), var2 (ref)
	if not game:GetEngineFeature("ReportAnythingScreenshot") or not game:GetEngineFeature("ReportAnythingScreenshotUploadedSignal") then
		return false
	end
	local safetyService = game:GetService("SafetyService")
	local var3 = safetyService:TakeScreenshot({
		registerContent = if p2 ~= nil then 0 else 1,
		reason = if getFFlagEnableInAppBugReporting() then p3 or "RAABTest" else "RAABTest"
	})
	t_1[var3] = p1
	t_2[var3] = p2
	
	if not var1 then
		var2(safetyService)
	end
	return true
end

return t