local CorePackages = game:GetService("CorePackages")
local AnalyticsService = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).AnalyticsService
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums
local FFlagAXImproveSlotBasedEditorPerformanceModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Flags.FFlagAXImproveSlotBasedEditorPerformance)
local v1 = nil

local function _(p1)
	-- upvalues: ImpressionEnums (copy), FFlagAXImproveSlotBasedEditorPerformanceModule (copy), v1 (ref)
	local config = {
		slotClick = function(p2)
			-- upvalues: ImpressionEnums (upval), p1 (copy)
			p1.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
				actionType = ImpressionEnums.ActionType.UI_BUTTON_CLICK,
				subcategory = p2.editorSubcategory,
				surface = ImpressionEnums.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY,
				event_sender_api = ImpressionEnums.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT
			})
		end
	}
	
	if FFlagAXImproveSlotBasedEditorPerformanceModule then
		v1 = config
	end
	return config
end

return {
	get = function(_)
		-- upvalues: FFlagAXImproveSlotBasedEditorPerformanceModule (copy), v1 (ref), AnalyticsService (copy), ImpressionEnums (copy)
		if FFlagAXImproveSlotBasedEditorPerformanceModule and v1 then
			return v1
		end
		local config = {
			slotClick = function(p1)
				-- upvalues: ImpressionEnums (upval), AnalyticsService (copy)
				AnalyticsService.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
					actionType = ImpressionEnums.ActionType.UI_BUTTON_CLICK,
					subcategory = p1.editorSubcategory,
					surface = ImpressionEnums.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY,
					event_sender_api = ImpressionEnums.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT
				})
			end
		}
		
		if FFlagAXImproveSlotBasedEditorPerformanceModule then
			v1 = config
		end
		return config
	end
}