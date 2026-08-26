local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local parent = avatarExperienceAnalytics.Parent
local analyticsServiceModule = require(avatarExperienceAnalytics.AnalyticsService)
local impressionEnumsModule = require(avatarExperienceAnalytics.Enums.ImpressionEnums)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXExtendUndoRedoTracking = avatarExperienceFlagsModule.FFlagAXExtendUndoRedoTracking
local fFlagAXResetAvatarButton = avatarExperienceFlagsModule.FFlagAXResetAvatarButton
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen

local function trackSlotClick(p1)
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		subcategory = p1.editorSubcategory,
		surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackSaveClick()
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "SaveAvatarButton",
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackSlotsCustomizeFtuxPrompt()
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "SlotsCustomizeFtuxPrompt",
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackSlotsAvatarSwitcherFtuxPrompt()
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "SlotsAvatarSwitcherFtuxPrompt",
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackSaveBlockPromptLeaveClick()
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "SaveAvatarBlockPrompt_Leave",
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackSaveBlockPromptSaveClick()
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		group = "SaveAvatarBlockPrompt_Save",
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackControlBarClick(p1)
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		group = `ControlBar_{p1}`,
		surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackAdvancedCustomizationControlBarClick(p1)
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		group = `ControlBar_AdvancedCustomization_{p1}`,
		surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end

local function trackAdvancedCustomizationControlBarClickFromSurface(p1, p2)
	-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
		actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
		group = `ControlBar_AdvancedCustomization_{p1}`,
		surface = mapAvatarScreenToSurface(p2)
	})
end

function mapAvatarScreenToSurface(p1)
	-- upvalues: impressionEnumsModule (ref), avatarScreen (ref)
	local HOMEPAGE = impressionEnumsModule.MarketplaceSurfaceType.HOMEPAGE
	
	if p1 == avatarScreen.Catalog then
		HOMEPAGE = impressionEnumsModule.MarketplaceSurfaceType.HOMEPAGE
		
		return HOMEPAGE
	elseif p1 == avatarScreen.CatalogSearch then
		HOMEPAGE = impressionEnumsModule.MarketplaceSurfaceType.SEARCH
		
		return HOMEPAGE
	elseif p1 == avatarScreen.AvatarEditor then
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
	trackUndoRedoClick = function(p1, p2)
		-- upvalues: fFlagAXExtendUndoRedoTracking (ref), impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			group = `UndoRedo_{if p1 then "Undo" else "Redo"}`,
			surface = if fFlagAXExtendUndoRedoTracking then if fFlagAXExtendUndoRedoTracking and p2 then mapAvatarScreenToSurface(p2) else impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY else impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackSlotsCustomizeFtuxPrompt = trackSlotsCustomizeFtuxPrompt,
	trackSlotsAvatarSwitcherFtuxPrompt = trackSlotsAvatarSwitcherFtuxPrompt,
	trackAddNewAvatarClick = function()
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarSwitcher_AddNewAvatar",
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackUpdateAvatarClick = function()
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarSwitcher_UpdateAvatar",
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackManageAvatarsClick = function()
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarSwitcher_ManageAvatars",
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackDeleteAvatarAttemptClick = function(p3)
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			group = if p3 then "AvatarSwitcher_DeleteAvatar_Attempt_Mass" else "AvatarSwitcher_DeleteAvatar_Attempt_Single",
			surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackDeleteAvatarConfirm = function()
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarSwitcher_DeleteAvatar_Confirm",
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackSettingsTileClick = function()
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarSwitcher_SettingsTile",
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = impressionEnumsModule.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
		})
	end,
	trackUndoHistoryCount = if fFlagAXExtendUndoRedoTracking then function(p3, p4)
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			group = `UndoRedo_history_count_{p4}`,
			surface = mapAvatarScreenToSurface(p3)
		})
	end else nil,
	trackAvatarRemoveAllClick = if fFlagAXResetAvatarButton then function(p3)
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarRemoveAll",
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = mapAvatarScreenToSurface(p3)
		})
	end else nil,
	trackAvatarRestoreClick = if fFlagAXResetAvatarButton then function(p3)
		-- upvalues: impressionEnumsModule (ref), analyticsServiceModule (ref)
		analyticsServiceModule.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", {
			group = "AvatarRestoreSaved",
			actionType = impressionEnumsModule.ActionType.UI_BUTTON_CLICK,
			surface = mapAvatarScreenToSurface(p3)
		})
	end else nil
}