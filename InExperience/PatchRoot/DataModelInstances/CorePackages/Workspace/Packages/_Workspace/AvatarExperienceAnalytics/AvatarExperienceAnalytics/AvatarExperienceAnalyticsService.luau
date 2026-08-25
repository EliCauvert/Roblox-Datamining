local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local open3DFullViewModule = require(avatarExperienceAnalytics.open3DFullView)
local close3DFullViewModule = require(avatarExperienceAnalytics.close3DFullView)
local analyticsServiceModule = require(avatarExperienceAnalytics.AnalyticsService)
local reportAvatarEventCounterV1Module = require(avatarExperienceAnalytics.reportAvatarEventCounterV1)
local constantsModule = require(avatarExperienceAnalytics.Constants)
local t = {}
local var7 = nil

function t.get(_)
	-- upvalues: var7 (write), analyticsServiceModule (ref), open3DFullViewModule (ref), close3DFullViewModule (ref), reportAvatarEventCounterV1Module (ref), constantsModule (ref)
	if var7 then
		return var7
	end
	local t = {
		open3DFullView = function(p0)
			-- upvalues: open3DFullViewModule (copy), analyticsServiceModule (ref)
			open3DFullViewModule(analyticsServiceModule.EventStream, p0)
		end,
		close3DFullView = function(p1)
			-- upvalues: close3DFullViewModule (copy), analyticsServiceModule (ref)
			close3DFullViewModule(analyticsServiceModule.EventStream, p1)
		end,
		toggleCameraInEditorAndShop = function(p2, p3)
			-- upvalues: analyticsServiceModule (ref), reportAvatarEventCounterV1Module (copy), constantsModule (copy)
			analyticsServiceModule.EventStream:sendTelemetryEvent("CameraInEditorAndCatalogButton", "CameraInEditorAndCatalogButton_Toggle", {
				actionName = if p2 then "Button Enabled" else "Button Disabled",
				pageName = p3
			})
			reportAvatarEventCounterV1Module(if p2 then constantsModule.AVATAR_EVENT_COUNTER_NAME.AXCameraEnabled else constantsModule.AVATAR_EVENT_COUNTER_NAME.AXCameraDisabled)
		end
	}
	var7 = t
	
	return t
end

return t