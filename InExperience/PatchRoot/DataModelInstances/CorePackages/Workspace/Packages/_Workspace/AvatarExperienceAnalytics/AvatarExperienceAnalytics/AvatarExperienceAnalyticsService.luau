local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local open3DFullViewModule = require(avatarExperienceAnalytics.open3DFullView)
local close3DFullViewModule = require(avatarExperienceAnalytics.close3DFullView)
local analyticsServiceModule = require(avatarExperienceAnalytics.AnalyticsService)
local reportAvatarEventCounterV1Module = require(avatarExperienceAnalytics.reportAvatarEventCounterV1)
local constantsModule = require(avatarExperienceAnalytics.Constants)
local t = {}
local var1 = nil

function t.get(_)
	-- upvalues: var1 (write), analyticsServiceModule (ref), open3DFullViewModule (ref), close3DFullViewModule (ref), reportAvatarEventCounterV1Module (ref), constantsModule (ref)
	if var1 then
		return var1
	end
	local t = {
		open3DFullView = function(p1)
			-- upvalues: open3DFullViewModule (copy), analyticsServiceModule (ref)
			open3DFullViewModule(analyticsServiceModule.EventStream, p1)
		end,
		close3DFullView = function(p1)
			-- upvalues: close3DFullViewModule (copy), analyticsServiceModule (ref)
			close3DFullViewModule(analyticsServiceModule.EventStream, p1)
		end,
		toggleCameraInEditorAndShop = function(p1, p2)
			-- upvalues: analyticsServiceModule (ref), reportAvatarEventCounterV1Module (copy), constantsModule (copy)
			analyticsServiceModule.EventStream:sendTelemetryEvent("CameraInEditorAndCatalogButton", "CameraInEditorAndCatalogButton_Toggle", {
				actionName = if p1 then "Button Enabled" else "Button Disabled",
				pageName = p2
			})
			reportAvatarEventCounterV1Module(if p1 then constantsModule.AVATAR_EVENT_COUNTER_NAME.AXCameraEnabled else constantsModule.AVATAR_EVENT_COUNTER_NAME.AXCameraDisabled)
		end
	}
	var1 = t
	
	return t
end

return t