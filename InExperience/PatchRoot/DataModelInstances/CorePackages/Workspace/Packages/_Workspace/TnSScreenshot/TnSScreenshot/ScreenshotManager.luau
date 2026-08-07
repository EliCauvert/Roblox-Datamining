local getFFlagEnableInAppBugReporting = require(script:FindFirstAncestor("TnSScreenshot").Parent.SharedFlags).GetFFlagEnableInAppBugReporting

local _ = function() --[[ line: 6 ]]
	return game:GetEngineFeature("ReportAnythingScreenshot") and game:GetEngineFeature("ReportAnythingScreenshotUploadedSignal")
end

local t = {}
t.__index = t
local t_1 = {}
local t_2 = {}
local var3 = false
local t_3 = { RAABTestReason = "RAABTest" }

local var5 = function(p0) --[[ line: 27 ]]
	-- upvalues: t_1 (ref), t_2 (ref), var3 (write)
	p0.ScreenshotUploaded:Connect(function(p1, p2) --[[ line: 28 ]]
		-- upvalues: t_1 (copy)
		local var6 = t_1[p1]
		
		if var6 then
			var6(p2)
			table.remove(t_1, p1)
			
			return
		end
	end)
	p0.ScreenshotContentReady:Connect(function(p3, p4) --[[ line: 37 ]]
		-- upvalues: t_2 (copy)
		local var7 = t_2[p3]
		
		if var7 then
			var7(p4)
			table.remove(t_2, p3)
			
			return
		end
	end)
	var3 = true
end

function t.TakeScreenshotWithCallback(_, p5, p6, p7) --[[ line: 59 ]]
	-- upvalues: getFFlagEnableInAppBugReporting (ref), t_3 (ref), t_1 (ref), t_2 (ref), var3 (write), var5 (ref)
	if not game:GetEngineFeature("ReportAnythingScreenshot") or not game:GetEngineFeature("ReportAnythingScreenshotUploadedSignal") then
		return false
	end
	local safetyService = game:GetService("SafetyService")
	local var9 = safetyService:TakeScreenshot({
		registerContent = if p6 ~= nil then 0 else 1,
		reason = if getFFlagEnableInAppBugReporting() then p7 or t_3.RAABTestReason else t_3.RAABTestReason
	})
	t_1[var9] = p5
	t_2[var9] = p6
	
	if not var3 then
		var5(safetyService)
	end
	return true
end

return t