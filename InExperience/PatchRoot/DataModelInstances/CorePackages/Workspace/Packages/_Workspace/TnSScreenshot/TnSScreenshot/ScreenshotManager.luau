local GetFFlagEnableInAppBugReportingFunction = require(script:FindFirstAncestor("TnSScreenshot").Parent.SharedFlags).GetFFlagEnableInAppBugReporting

local function _() --[[ Line: 6 ]]
	return game:GetEngineFeature("ReportAnythingScreenshot") and game:GetEngineFeature("ReportAnythingScreenshotUploadedSignal")
end

local ScreenshotManager = {}
ScreenshotManager.__index = ScreenshotManager
local List = {}
local List1 = {}
local Flag = false

local function v4(SafetyService) --[[ Line: 27 ]]
	-- upvalues: List (copy), List1 (copy), Flag (ref)
	SafetyService.ScreenshotUploaded:Connect(function(Index, ScreenshotId) --[[ Line: 28 ]]
		-- upvalues: List (upval)
		local Entry: (any) -> () = List[Index]
		
		if Entry then
			Entry(ScreenshotId)
			table.remove(List, Index)
			
			return
		end
	end)
	SafetyService.ScreenshotContentReady:Connect(function(Index, ContentId) --[[ Line: 37 ]]
		-- upvalues: List1 (upval)
		local Entry: (any) -> () = List1[Index]
		
		if Entry then
			Entry(ContentId)
			table.remove(List1, Index)
			
			return
		end
	end)
	Flag = true
end

function ScreenshotManager:TakeScreenshotWithCallback(p1, p2, p3): boolean --[[ Line: 59 ]]
	-- upvalues: GetFFlagEnableInAppBugReportingFunction (copy), List (copy), List1 (copy), Flag (ref), v4 (copy)
	if not game:GetEngineFeature("ReportAnythingScreenshot") or not game:GetEngineFeature("ReportAnythingScreenshotUploadedSignal") then
		return false
	end
	local SafetyService = game:GetService("SafetyService")
	local TakeScreenshotResult = SafetyService:TakeScreenshot({
		registerContent = if p2 == nil then 0 else 1,
		reason = GetFFlagEnableInAppBugReportingFunction() and p3 or "RAABTest"
	})
	List[TakeScreenshotResult] = p1
	List1[TakeScreenshotResult] = p2
	
	if not Flag then
		v4(SafetyService)
	end
	return true
end

return ScreenshotManager