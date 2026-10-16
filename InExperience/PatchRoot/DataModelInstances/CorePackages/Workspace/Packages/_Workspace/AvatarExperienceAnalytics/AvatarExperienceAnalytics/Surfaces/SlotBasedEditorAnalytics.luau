local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local Parent = AvatarExperienceAnalytics.Parent
local AnalyticsServiceModule = require(AvatarExperienceAnalytics.AnalyticsService)
local ImpressionEnumsModule = require(AvatarExperienceAnalytics.Enums.ImpressionEnums)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXExtendUndoRedoTracking = AvatarExperienceFlagsModule.FFlagAXExtendUndoRedoTracking
local FFlagAXResetAvatarButton = AvatarExperienceFlagsModule.FFlagAXResetAvatarButton
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen

local function trackSlotClick(p1) --[[ Line: 16 ]]
	-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
	AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		subcategory = p1.editorSubcategory,
		surface = ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackSaveClick() --[[ Line: 27 ]]
	-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
	AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "SaveAvatarButton",
		actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackSlotsCustomizeFtuxPrompt() --[[ Line: 36 ]]
	-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
	AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "SlotsCustomizeFtuxPrompt",
		actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackSlotsAvatarSwitcherFtuxPrompt() --[[ Line: 45 ]]
	-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
	AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "SlotsAvatarSwitcherFtuxPrompt",
		actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackSaveBlockPromptLeaveClick() --[[ Line: 54 ]]
	-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
	AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "SaveAvatarBlockPrompt_Leave",
		actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackSaveBlockPromptSaveClick() --[[ Line: 63 ]]
	-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
	AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "SaveAvatarBlockPrompt_Save",
		actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackControlBarClick(p1) --[[ Line: 72 ]]
	-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
	AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		group = `ControlBar_{p1}`,
		surface = ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackAdvancedCustomizationControlBarClick(p1) --[[ Line: 81 ]]
	-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
	AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		group = `ControlBar_AdvancedCustomization_{p1}`,
		surface = ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackAdvancedCustomizationControlBarClickFromSurface(p1, p2) --[[ Line: 90 ]]
	-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
	AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		group = `ControlBar_AdvancedCustomization_{p1}`,
		surface = mapAvatarScreenToSurface(p2)
	})
end

function mapAvatarScreenToSurface(AvatarEditor) --[[ Line: 101 ]]
	-- upvalues: ImpressionEnumsModule (copy), AvatarScreen (copy)
	local HOMEPAGE = ImpressionEnumsModule.MarketplaceSurfaceType.HOMEPAGE
	
	if AvatarEditor == AvatarScreen.Catalog then
		HOMEPAGE = ImpressionEnumsModule.MarketplaceSurfaceType.HOMEPAGE
		
		return HOMEPAGE
	end
	if AvatarEditor == AvatarScreen.CatalogSearch then
		HOMEPAGE = ImpressionEnumsModule.MarketplaceSurfaceType.SEARCH
		
		return HOMEPAGE
	end
	if AvatarEditor == AvatarScreen.AvatarEditor then
		HOMEPAGE = ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	end
	return HOMEPAGE
end

local function trackUndoHistoryCount(p1, p2) --[[ Line: 129 ]]
	-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
	AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		group = `UndoRedo_history_count_{p2}`,
		surface = mapAvatarScreenToSurface(p1)
	})
end

local function trackAvatarRestoreClick(p1) --[[ Line: 140 ]]
	-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
	AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "AvatarRestoreSaved",
		actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = mapAvatarScreenToSurface(p1)
	})
end

local function trackAvatarRemoveAllClick(p1) --[[ Line: 151 ]]
	-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
	AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "AvatarRemoveAll",
		actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = mapAvatarScreenToSurface(p1)
	})
end

return {
	trackSlotClick = trackSlotClick,
	trackSaveClick = trackSaveClick,
	trackControlBarClick = trackControlBarClick,
	trackAdvancedCustomizationControlBarClick = trackAdvancedCustomizationControlBarClick,
	trackAdvancedCustomizationControlBarClickFromSurface = trackAdvancedCustomizationControlBarClickFromSurface,
	trackSaveBlockPromptLeaveClick = trackSaveBlockPromptLeaveClick,
	trackSaveBlockPromptSaveClick = trackSaveBlockPromptSaveClick,
	trackUndoRedoClick = function(p1, p2) --[[ Line: 113 ]]
		-- upvalues: FFlagAXExtendUndoRedoTracking (copy), ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
		local MapAvatarScreenToSurfaceResult = if FFlagAXExtendUndoRedoTracking and p2 then mapAvatarScreenToSurface(p2) else ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			group = `UndoRedo_{if p1 then "Undo" else "Redo"}`,
			surface = if FFlagAXExtendUndoRedoTracking then MapAvatarScreenToSurfaceResult else ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackSlotsCustomizeFtuxPrompt = trackSlotsCustomizeFtuxPrompt,
	trackSlotsAvatarSwitcherFtuxPrompt = trackSlotsAvatarSwitcherFtuxPrompt,
	trackAddNewAvatarClick = function() --[[ Line: 162 ]]
		-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
		AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarSwitcher_AddNewAvatar",
			actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackUpdateAvatarClick = function() --[[ Line: 171 ]]
		-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
		AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarSwitcher_UpdateAvatar",
			actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackManageAvatarsClick = function() --[[ Line: 180 ]]
		-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
		AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarSwitcher_ManageAvatars",
			actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackDeleteAvatarAttemptClick = function(p3) --[[ Line: 189 ]]
		-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
		AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			group = if p3 then "AvatarSwitcher_DeleteAvatar_Attempt_Mass" else "AvatarSwitcher_DeleteAvatar_Attempt_Single",
			surface = ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackDeleteAvatarConfirm = function() --[[ Line: 201 ]]
		-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
		AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarSwitcher_DeleteAvatar_Confirm",
			actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackSettingsTileClick = function() --[[ Line: 210 ]]
		-- upvalues: ImpressionEnumsModule (copy), AnalyticsServiceModule (copy)
		AnalyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarSwitcher_SettingsTile",
			actionType = ImpressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = ImpressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackUndoHistoryCount = if FFlagAXExtendUndoRedoTracking then trackUndoHistoryCount else nil,
	trackAvatarRemoveAllClick = if FFlagAXResetAvatarButton then trackAvatarRemoveAllClick else nil,
	trackAvatarRestoreClick = if FFlagAXResetAvatarButton then trackAvatarRestoreClick else nil
}