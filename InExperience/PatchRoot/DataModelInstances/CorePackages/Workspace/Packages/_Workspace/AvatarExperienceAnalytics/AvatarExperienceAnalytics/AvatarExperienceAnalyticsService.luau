local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local Open3DFullViewModule = require(AvatarExperienceAnalytics.open3DFullView)
local Close3DFullViewModule = require(AvatarExperienceAnalytics.close3DFullView)
local AnalyticsServiceModule = require(AvatarExperienceAnalytics.AnalyticsService)
local ReportAvatarEventCounterV1Module = require(AvatarExperienceAnalytics.reportAvatarEventCounterV1)
local ConstantsModule = require(AvatarExperienceAnalytics.Constants)
local v1 = nil

return {
	get = function(_)
		-- upvalues: v1 (ref), AnalyticsServiceModule (copy), Open3DFullViewModule (copy), Close3DFullViewModule (copy), ReportAvatarEventCounterV1Module (copy), ConstantsModule (copy)
		if v1 then
			return v1
		else
			local config = {
				open3DFullView = function(p1)
					-- upvalues: Open3DFullViewModule (upval), AnalyticsServiceModule (copy)
					Open3DFullViewModule(AnalyticsServiceModule.EventStream, p1)
				end,
				close3DFullView = function(p1)
					-- upvalues: Close3DFullViewModule (upval), AnalyticsServiceModule (copy)
					Close3DFullViewModule(AnalyticsServiceModule.EventStream, p1)
				end,
				toggleCameraInEditorAndShop = function(p1, PageName)
					-- upvalues: AnalyticsServiceModule (copy), ReportAvatarEventCounterV1Module (upval), ConstantsModule (upval)
					AnalyticsServiceModule.EventStream:sendTelemetryEvent("CameraInEditorAndCatalogButton", "CameraInEditorAndCatalogButton_Toggle", {
						actionName = if p1 then "Button Enabled" else "Button Disabled",
						pageName = PageName
					})
					ReportAvatarEventCounterV1Module(if p1 then ConstantsModule.AVATAR_EVENT_COUNTER_NAME.AXCameraEnabled else ConstantsModule.AVATAR_EVENT_COUNTER_NAME.AXCameraDisabled)
				end
			}
			v1 = config
			
			return config
		end
	end
}