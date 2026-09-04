local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local buildAppStorageModule = require(buildExperience.Storage.BuildAppStorage)
local buildModeLaunchModule = require(buildExperience.utils.BuildModeLaunch)
local fFlagBuildExperienceTooltipsLightDismissModule = require(buildExperience.Flags.FFlagBuildExperienceTooltipsLightDismiss)
local educationalTooltip = foundationModule.EducationalTooltip
local overlayProvider = foundationModule.OverlayProvider
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local fIntUnpublishedPlaytestModeTooltipDisplayLimit = sharedFlagsModule.FIntUnpublishedPlaytestModeTooltipDisplayLimit

local function _(p1)
	-- upvalues: fIntUnpublishedPlaytestModeTooltipDisplayLimit (ref), buildModeLaunchModule (ref), buildAppStorageModule (ref)
	return fIntUnpublishedPlaytestModeTooltipDisplayLimit > 0 and (buildModeLaunchModule:hasBuildMode() and (buildAppStorageModule.getUnpublishedPlaytestModeTooltipDisplayCount() < fIntUnpublishedPlaytestModeTooltipDisplayLimit and (p1 ~= nil and p1.current ~= nil)))
end

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), fIntUnpublishedPlaytestModeTooltipDisplayLimit (ref), buildModeLaunchModule (ref), buildAppStorageModule (ref), overlayProvider (ref), educationalTooltip (ref), popoverSide (ref), popoverAlign (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref)
	local var1 = useLocalization({
		description = localizationStringsModule.UNPUBLISHED_PLAYTEST_MODE_TOOLTIP_DESCRIPTION,
		title = localizationStringsModule.UNPUBLISHED_PLAYTEST_MODE_TOOLTIP_TITLE
	})
	local useState = reactModule.useState
	local anchorRef = p1.anchorRef
	local var2 = fIntUnpublishedPlaytestModeTooltipDisplayLimit > 0 and (buildModeLaunchModule:hasBuildMode() and (buildAppStorageModule.getUnpublishedPlaytestModeTooltipDisplayCount() < fIntUnpublishedPlaytestModeTooltipDisplayLimit and (anchorRef ~= nil and anchorRef.current ~= nil)))
	useState, var9 = useState(var2)
	local var3 = reactModule.useRef(false)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(false)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref), fIntUnpublishedPlaytestModeTooltipDisplayLimit (copy), buildModeLaunchModule (copy), buildAppStorageModule (copy)
		local anchorRef = p1.anchorRef
		var2(fIntUnpublishedPlaytestModeTooltipDisplayLimit > 0 and (buildModeLaunchModule:hasBuildMode() and (buildAppStorageModule.getUnpublishedPlaytestModeTooltipDisplayCount() < fIntUnpublishedPlaytestModeTooltipDisplayLimit and (anchorRef ~= nil and anchorRef.current ~= nil))))
	end, { p1.anchorRef })
	reactModule.useEffect(function()
		-- upvalues: useState (ref), var3 (ref), buildAppStorageModule (copy)
		if useState and not var3.current then
			var3.current = true
			buildAppStorageModule.incrementUnpublishedPlaytestModeTooltipDisplayCount()
		end
	end, { useState })
	
	return if useState then reactModule.createElement(overlayProvider, nil, {
		Tooltip = reactModule.createElement(educationalTooltip, {
			testId = "unpublished-playtest-mode-tooltip",
			anchorRef = p1.anchorRef,
			title = var1.title,
			text = var1.description,
			side = popoverSide.Bottom,
			align = popoverAlign.Start,
			isOpen = useState,
			onClose = var4,
			onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then var4 else nil,
			Visible = p1.isVisible
		})
	}) else nil
end)