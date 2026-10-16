local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(Parent.DataHydration)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local PublishBottomSheetModule = require(script.Parent.PublishBottomSheet)
local GameInfoUtilsModule = require(BuildExperience.utils.GameInfoUtils)

local function getEnrichedTarget(EnrichedTarget, GameInfo, Loading) --[[ Line: 39 ]]
	-- upvalues: GameInfoUtilsModule (copy)
	local GameInfo1 = if GameInfoUtilsModule.isGameInfoReady(GameInfo) then GameInfo else nil
	local Creator = if GameInfo1 then GameInfo1.creator else nil
	
	return {
		universeId = EnrichedTarget.universeId,
		placeId = EnrichedTarget.placeId or (if GameInfo1 then tonumber(GameInfo1.rootPlaceId) else nil),
		sessionId = EnrichedTarget.sessionId,
		experienceName = GameInfoUtilsModule.getGameInfoName(GameInfo),
		creatorName = if Creator and Creator.name ~= "" then Creator.name else Loading,
		gameIcon = EnrichedTarget.gameIcon,
		isCreatorVerified = if Creator then Creator.hasVerifiedBadge == true else false,
		isNewGameTarget = EnrichedTarget.isNewGameTarget
	}
end

return function(p1) --[[ Line: 55 | Named "PublishBottomSheetContainer" ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), getEnrichedTarget (copy), ReactModule (copy), PublishBottomSheetModule (copy)
	return ReactModule.createElement(PublishBottomSheetModule, {
		isOpen = p1.isOpen,
		target = getEnrichedTarget(p1.target, p1.gameInfo, UseLocalizationFunction({ loading = LocalizationStringsModule.BUILD_MENU_LOADING }).loading),
		onClose = p1.onClose,
		onOpenTitleDescriptionPage = p1.onOpenTitleDescriptionPage,
		onOpenMediaSelectionPage = p1.onOpenMediaSelectionPage,
		onOpenVersionTitleDescriptionPage = p1.onOpenVersionTitleDescriptionPage,
		onOpenVersionHistory = p1.onOpenVersionHistory,
		showPreviewButton = p1.showPreviewButton,
		testId = p1.testId
	})
end