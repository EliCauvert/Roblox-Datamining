local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local parent = avatarExperienceAnalytics.Parent
local analyticsServiceModule = require(avatarExperienceAnalytics.AnalyticsService)
local impressionEnumsModule = require(avatarExperienceAnalytics.Enums.ImpressionEnums)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXExtendUndoRedoTracking = avatarExperienceFlagsModule.FFlagAXExtendUndoRedoTracking
local fFlagAXResetAvatarButton = avatarExperienceFlagsModule.FFlagAXResetAvatarButton
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen

local function trackSlotClick(p0) --[[ line: 16 ]]
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		subcategory = p0.editorSubcategory,
		surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackSaveClick() --[[ line: 27 ]]
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "SaveAvatarButton",
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackSlotsCustomizeFtuxPrompt() --[[ line: 36 ]]
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "SlotsCustomizeFtuxPrompt",
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackSlotsAvatarSwitcherFtuxPrompt() --[[ line: 45 ]]
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "SlotsAvatarSwitcherFtuxPrompt",
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackSaveBlockPromptLeaveClick() --[[ line: 54 ]]
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "SaveAvatarBlockPrompt_Leave",
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackSaveBlockPromptSaveClick() --[[ line: 63 ]]
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "SaveAvatarBlockPrompt_Save",
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackControlBarClick(p1) --[[ line: 72 ]]
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		group = `ControlBar_{p1}`,
		surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackAdvancedCustomizationControlBarClick(p2) --[[ line: 81 ]]
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		group = `ControlBar_AdvancedCustomization_{p2}`,
		surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackAdvancedCustomizationControlBarClickFromSurface(p3, p4) --[[ line: 90 ]]
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		group = `ControlBar_AdvancedCustomization_{p3}`,
		surface = mapAvatarScreenToSurface(p4)
	})
end

function mapAvatarScreenToSurface(p5) --[[ line: 101 ]]
	-- upvalues: impressionEnumsModule (ref), avatarScreen (ref)
	local HOMEPAGE = impressionEnumsModule.MarketplaceSurfaceType.HOMEPAGE
	
	if p5 == avatarScreen.Catalog then
		HOMEPAGE = impressionEnumsModule.MarketplaceSurfaceType.HOMEPAGE
		
		return HOMEPAGE
	elseif p5 == avatarScreen.CatalogSearch then
		HOMEPAGE = impressionEnumsModule.MarketplaceSurfaceType.SEARCH
		
		return HOMEPAGE
	elseif p5 == avatarScreen.AvatarEditor then
		HOMEPAGE = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	end
	return HOMEPAGE
end

return {
	trackSlotClick = trackSlotClick,
	trackSaveClick = trackSaveClick,
	trackControlBarClick = trackControlBarClick,
	trackAdvancedCustomizationControlBarClick = trackAdvancedCustomizationControlBarClick,
	trackAdvancedCustomizationControlBarClickFromSurface = trackAdvancedCustomizationControlBarClickFromSurface,
	trackSaveBlockPromptLeaveClick = trackSaveBlockPromptLeaveClick,
	trackSaveBlockPromptSaveClick = trackSaveBlockPromptSaveClick,
	trackUndoRedoClick = function(p6, p7) --[[ line: 113 ]]
		-- upvalues: fFlagAXExtendUndoRedoTracking (ref), impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			group = `UndoRedo_{if p6 then "Undo" else "Redo"}`,
			surface = if fFlagAXExtendUndoRedoTracking then if fFlagAXExtendUndoRedoTracking and p7 then mapAvatarScreenToSurface(p7) else impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY else impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackSlotsCustomizeFtuxPrompt = trackSlotsCustomizeFtuxPrompt,
	trackSlotsAvatarSwitcherFtuxPrompt = trackSlotsAvatarSwitcherFtuxPrompt,
	trackAddNewAvatarClick = function() --[[ line: 162 ]]
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarSwitcher_AddNewAvatar",
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackUpdateAvatarClick = function() --[[ line: 171 ]]
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarSwitcher_UpdateAvatar",
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackManageAvatarsClick = function() --[[ line: 180 ]]
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarSwitcher_ManageAvatars",
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackDeleteAvatarAttemptClick = function(p8) --[[ line: 189 ]]
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			group = if p8 then "AvatarSwitcher_DeleteAvatar_Attempt_Mass" else "AvatarSwitcher_DeleteAvatar_Attempt_Single",
			surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackDeleteAvatarConfirm = function() --[[ line: 201 ]]
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarSwitcher_DeleteAvatar_Confirm",
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackSettingsTileClick = function() --[[ line: 210 ]]
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarSwitcher_SettingsTile",
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackUndoHistoryCount = if fFlagAXExtendUndoRedoTracking then function(p9, p10) --[[ line: 129 | named "trackUndoHistoryCount" ]]
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			group = `UndoRedo_history_count_{p10}`,
			surface = mapAvatarScreenToSurface(p9)
		})
	end else nil,
	trackAvatarRemoveAllClick = if fFlagAXResetAvatarButton then function(p11) --[[ line: 151 | named "trackAvatarRemoveAllClick" ]]
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarRemoveAll",
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = mapAvatarScreenToSurface(p11)
		})
	end else nil,
	trackAvatarRestoreClick = if fFlagAXResetAvatarButton then function(p12) --[[ line: 140 | named "trackAvatarRestoreClick" ]]
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarRestoreSaved",
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = mapAvatarScreenToSurface(p12)
		})
	end else nil
}