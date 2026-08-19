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
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization

local function _(p0) --[[ line: 29 | named "getCanShow" ]]
	-- upvalues: fIntUnpublishedPlaytestModeTooltipDisplayLimit (ref), buildModeLaunchModule (ref), buildAppStorageModule (ref)
	return fIntUnpublishedPlaytestModeTooltipDisplayLimit > 0 and (buildModeLaunchModule:hasBuildMode() and (buildAppStorageModule.getUnpublishedPlaytestModeTooltipDisplayCount() < fIntUnpublishedPlaytestModeTooltipDisplayLimit and (p0 ~= nil and p0.current ~= nil)))
end

return reactModule.memo(function(p1) --[[ line: 37 | named "UnpublishedPlaytestModeTooltip" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), fIntUnpublishedPlaytestModeTooltipDisplayLimit (ref), buildModeLaunchModule (ref), buildAppStorageModule (ref), overlayProvider (ref), educationalTooltip (ref), popoverSide (ref), popoverAlign (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref)
	local var8 = if fFlagBuildLocalization then useLocalization({
		description = localizationStringsModule.UNPUBLISHED_PLAYTEST_MODE_TOOLTIP_DESCRIPTION,
		title = localizationStringsModule.UNPUBLISHED_PLAYTEST_MODE_TOOLTIP_TITLE
	}) else nil
	local useState = reactModule.useState
	local anchorRef = p1.anchorRef
	local var9 = fIntUnpublishedPlaytestModeTooltipDisplayLimit > 0 and (buildModeLaunchModule:hasBuildMode() and (buildAppStorageModule.getUnpublishedPlaytestModeTooltipDisplayCount() < fIntUnpublishedPlaytestModeTooltipDisplayLimit and (anchorRef ~= nil and anchorRef.current ~= nil)))
	useState, var9 = useState(var9)
	local var10 = reactModule.useRef(false)
	local var11 = reactModule.useCallback(function() --[[ line: 47 ]]
		-- upvalues: var9 (ref)
		var9(false)
	end, {})
	reactModule.useEffect(function() --[[ line: 51 ]]
		-- upvalues: var9 (ref), p1 (ref), fIntUnpublishedPlaytestModeTooltipDisplayLimit (copy), buildModeLaunchModule (copy), buildAppStorageModule (copy)
		local anchorRef = p1.anchorRef
		var9(fIntUnpublishedPlaytestModeTooltipDisplayLimit > 0 and (buildModeLaunchModule:hasBuildMode() and (buildAppStorageModule.getUnpublishedPlaytestModeTooltipDisplayCount() < fIntUnpublishedPlaytestModeTooltipDisplayLimit and (anchorRef ~= nil and anchorRef.current ~= nil))))
	end, { p1.anchorRef })
	reactModule.useEffect(function() --[[ line: 55 ]]
		-- upvalues: useState (ref), var10 (ref), buildAppStorageModule (copy)
		if useState and not var10.current then
			var10.current = true
			buildAppStorageModule.incrementUnpublishedPlaytestModeTooltipDisplayCount()
		end
	end, { useState })
	
	return if useState then reactModule.createElement(overlayProvider, nil, {
		Tooltip = reactModule.createElement(educationalTooltip, {
			testId = "unpublished-playtest-mode-tooltip",
			anchorRef = p1.anchorRef,
			title = if fFlagBuildLocalization then var8.title else localizationStringsModule.UNPUBLISHED_PLAYTEST_MODE_TOOLTIP_TITLE,
			text = if fFlagBuildLocalization then var8.description else localizationStringsModule.UNPUBLISHED_PLAYTEST_MODE_TOOLTIP_DESCRIPTION,
			side = popoverSide.Bottom,
			align = popoverAlign.Start,
			isOpen = useState,
			onClose = var11,
			onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then var11 else nil,
			Visible = p1.isVisible
		})
	}) else nil
end)