local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Open3DFullViewModule = require(Modules.AvatarExperience.Common.Analytics.open3DFullView)
local Close3DFullViewModule = require(Modules.AvatarExperience.Common.Analytics.close3DFullView)
local AnalyticsService = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).AnalyticsService
local ReportAvatarEventCounterV1Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterV1
local Constants = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Constants
local v1 = nil

return {
	get = function(_)
		-- upvalues: v1 (ref), AnalyticsService (copy), Open3DFullViewModule (copy), Close3DFullViewModule (copy), ReportAvatarEventCounterV1Function (copy), Constants (copy)
		if v1 then
			return v1
		else
			local config = {
				open3DFullView = function(p1)
					-- upvalues: Open3DFullViewModule (upval), AnalyticsService (copy)
					Open3DFullViewModule(AnalyticsService.EventStream, p1)
				end,
				close3DFullView = function(p1)
					-- upvalues: Close3DFullViewModule (upval), AnalyticsService (copy)
					Close3DFullViewModule(AnalyticsService.EventStream, p1)
				end,
				toggleCameraInEditorAndShop = function(p1, PageName)
					-- upvalues: AnalyticsService (copy), ReportAvatarEventCounterV1Function (upval), Constants (upval)
					AnalyticsService.EventStream:sendTelemetryEvent("CameraInEditorAndCatalogButton", "CameraInEditorAndCatalogButton_Toggle", {
						actionName = if p1 then "Button Enabled" else "Button Disabled",
						pageName = PageName
					})
					ReportAvatarEventCounterV1Function(if p1 then Constants.AVATAR_EVENT_COUNTER_NAME.AXCameraEnabled else Constants.AVATAR_EVENT_COUNTER_NAME.AXCameraDisabled)
				end
			}
			v1 = config
			
			return config
		end
	end
}