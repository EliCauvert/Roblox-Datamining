local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local BuildAppStorageModule = require(BuildExperience.Storage.BuildAppStorage)
local BuildModeLaunchModule = require(Parent.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local EducationalTooltip = FoundationModule.EducationalTooltip
local OverlayProvider = FoundationModule.OverlayProvider
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local FIntUnpublishedPlaytestModeTooltipDisplayLimit = require(Parent.SharedFlags).FIntUnpublishedPlaytestModeTooltipDisplayLimit

local function _(p1): boolean
	-- upvalues: FIntUnpublishedPlaytestModeTooltipDisplayLimit (copy), BuildModeLaunchModule (copy), BuildAppStorageModule (copy)
	return FIntUnpublishedPlaytestModeTooltipDisplayLimit > 0 and (BuildModeLaunchModule:hasBuildMode() and (BuildAppStorageModule.getUnpublishedPlaytestModeTooltipDisplayCount() < FIntUnpublishedPlaytestModeTooltipDisplayLimit and (p1 ~= nil and p1.current ~= nil)))
end

return ReactModule.memo(function(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), FIntUnpublishedPlaytestModeTooltipDisplayLimit (copy), BuildModeLaunchModule (copy), BuildAppStorageModule (copy), OverlayProvider (copy), EducationalTooltip (copy), PopoverSide (copy), PopoverAlign (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		description = LocalizationStringsModule.UNPUBLISHED_PLAYTEST_MODE_TOOLTIP_DESCRIPTION,
		title = LocalizationStringsModule.UNPUBLISHED_PLAYTEST_MODE_TOOLTIP_TITLE
	})
	local AnchorRef = p1.anchorRef
	local UseStateResult, UseStateResult2 = ReactModule.useState(FIntUnpublishedPlaytestModeTooltipDisplayLimit > 0 and (BuildModeLaunchModule:hasBuildMode() and (BuildAppStorageModule.getUnpublishedPlaytestModeTooltipDisplayCount() < FIntUnpublishedPlaytestModeTooltipDisplayLimit and (AnchorRef ~= nil and AnchorRef.current ~= nil))))
	local UseRefResult = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy), FIntUnpublishedPlaytestModeTooltipDisplayLimit (upval), BuildModeLaunchModule (upval), BuildAppStorageModule (upval)
		local AnchorRef = p1.anchorRef
		UseStateResult2(FIntUnpublishedPlaytestModeTooltipDisplayLimit > 0 and (BuildModeLaunchModule:hasBuildMode() and (BuildAppStorageModule.getUnpublishedPlaytestModeTooltipDisplayCount() < FIntUnpublishedPlaytestModeTooltipDisplayLimit and (AnchorRef ~= nil and AnchorRef.current ~= nil))))
	end, { p1.anchorRef })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRefResult (copy), BuildAppStorageModule (upval)
		if UseStateResult and not UseRefResult.current then
			UseRefResult.current = true
			BuildAppStorageModule.incrementUnpublishedPlaytestModeTooltipDisplayCount()
		end
	end, { UseStateResult })
	
	return if UseStateResult then ReactModule.createElement(OverlayProvider, nil, {
		Tooltip = ReactModule.createElement(EducationalTooltip, {
			testId = "unpublished-playtest-mode-tooltip",
			anchorRef = p1.anchorRef,
			title = UseLocalizationResult.title,
			text = UseLocalizationResult.description,
			side = PopoverSide.Bottom,
			align = PopoverAlign.Start,
			isOpen = UseStateResult,
			onClose = UseResult,
			onPressedOutside = UseResult,
			Visible = p1.isVisible
		})
	}) else nil
end)