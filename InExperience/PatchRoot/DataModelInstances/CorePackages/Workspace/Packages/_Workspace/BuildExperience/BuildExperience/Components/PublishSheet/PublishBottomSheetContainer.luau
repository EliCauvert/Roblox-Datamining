local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local _ = require(parent.DataHydration)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local publishBottomSheetModule = require(script.Parent.PublishBottomSheet)
local gameInfoUtilsModule = require(buildExperience.utils.GameInfoUtils)

local function getEnrichedTarget(p1, p2, p3)
	-- upvalues: gameInfoUtilsModule (ref)
	local var1
	local var2 = if gameInfoUtilsModule.isGameInfoReady(p2) then p2 else nil
	local var3 = if var2 then var2.creator else nil
	local t = {
		universeId = p1.universeId,
		placeId = p1.placeId or (if var2 then tonumber(var2.rootPlaceId) else nil),
		sessionId = p1.sessionId,
		experienceName = gameInfoUtilsModule.getGameInfoName(p2),
		creatorName = if var3 and var3.name ~= "" then var3.name else p3,
		gameIcon = p1.gameIcon
	}
	
	if var3 then
		var1 = var3.hasVerifiedBadge == true
		var1 = nil
	else
		var1 = false
	end
	t.isCreatorVerified = var1
	t.isNewGameTarget = p1.isNewGameTarget
	
	return t
end

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), getEnrichedTarget (ref), reactModule (ref), publishBottomSheetModule (ref)
	return reactModule.createElement(publishBottomSheetModule, {
		isOpen = p1.isOpen,
		target = getEnrichedTarget(p1.target, p1.gameInfo, if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({ loading = localizationStringsModule.BUILD_MENU_LOADING }) else nil).loading else localizationStringsModule.BUILD_MENU_LOADING),
		onClose = p1.onClose,
		onOpenTitleDescriptionPage = p1.onOpenTitleDescriptionPage,
		onOpenMediaSelectionPage = p1.onOpenMediaSelectionPage,
		onOpenVersionTitleDescriptionPage = p1.onOpenVersionTitleDescriptionPage,
		onOpenVersionHistory = p1.onOpenVersionHistory,
		showPreviewButton = p1.showPreviewButton,
		testId = p1.testId
	})
end