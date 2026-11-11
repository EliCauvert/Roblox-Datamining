local ScreenshotContentId = nil

if game:GetEngineFeature("ReportAnythingScreenshot") then
	game:GetService("SafetyService").ScreenshotContentReady:Connect(function(_, ContentId)
		-- upvalues: ScreenshotContentId (ref)
		ScreenshotContentId = ContentId
	end)
end
local ScreenshotHelper = {}
ScreenshotHelper.__index = ScreenshotHelper

function ScreenshotHelper:GetScreenshotContentId()
	-- upvalues: ScreenshotContentId (ref)
	return ScreenshotContentId
end

function ScreenshotHelper:SetScreenshotContentId(Value)
	-- upvalues: ScreenshotContentId (ref)
	ScreenshotContentId = Value
end

return ScreenshotHelper