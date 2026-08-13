local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local sharedFlagsModule = require(parent.SharedFlags)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local buildAppStorageModule = require(buildExperience.Storage.BuildAppStorage)
local buildModeLaunchModule = require(buildExperience.utils.BuildModeLaunch)
local fFlagBuildExperienceTooltipsLightDismissModule = require(buildExperience.Flags.FFlagBuildExperienceTooltipsLightDismiss)
local educationalTooltip = foundationModule.EducationalTooltip
local overlayProvider = foundationModule.OverlayProvider
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local fIntUnpublishedPlaytestModeTooltipDisplayLimit = sharedFlagsModule.FIntUnpublishedPlaytestModeTooltipDisplayLimit

local function _(p0) --[[ line: 27 | named "getCanShow" ]]
	-- upvalues: fIntUnpublishedPlaytestModeTooltipDisplayLimit (ref), buildModeLaunchModule (ref), buildAppStorageModule (ref)
	return fIntUnpublishedPlaytestModeTooltipDisplayLimit > 0 and (buildModeLaunchModule:hasBuildMode() and (buildAppStorageModule.getUnpublishedPlaytestModeTooltipDisplayCount() < fIntUnpublishedPlaytestModeTooltipDisplayLimit and (p0 ~= nil and p0.current ~= nil)))
end

return reactModule.memo(function(p1) --[[ line: 35 | named "UnpublishedPlaytestModeTooltip" ]]
	-- upvalues: reactModule (ref), fIntUnpublishedPlaytestModeTooltipDisplayLimit (ref), buildModeLaunchModule (ref), buildAppStorageModule (ref), overlayProvider (ref), educationalTooltip (ref), localizationStringsModule (ref), popoverSide (ref), popoverAlign (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref)
	local useState = reactModule.useState
	local anchorRef = p1.anchorRef
	local var8 = fIntUnpublishedPlaytestModeTooltipDisplayLimit > 0 and (buildModeLaunchModule:hasBuildMode() and (buildAppStorageModule.getUnpublishedPlaytestModeTooltipDisplayCount() < fIntUnpublishedPlaytestModeTooltipDisplayLimit and (anchorRef ~= nil and anchorRef.current ~= nil)))
	useState, var8 = useState(var8)
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useCallback(function() --[[ line: 39 ]]
		-- upvalues: var8 (ref)
		var8(false)
	end, {})
	reactModule.useEffect(function() --[[ line: 43 ]]
		-- upvalues: var8 (ref), p1 (ref), fIntUnpublishedPlaytestModeTooltipDisplayLimit (copy), buildModeLaunchModule (copy), buildAppStorageModule (copy)
		local anchorRef = p1.anchorRef
		var8(fIntUnpublishedPlaytestModeTooltipDisplayLimit > 0 and (buildModeLaunchModule:hasBuildMode() and (buildAppStorageModule.getUnpublishedPlaytestModeTooltipDisplayCount() < fIntUnpublishedPlaytestModeTooltipDisplayLimit and (anchorRef ~= nil and anchorRef.current ~= nil))))
	end, { p1.anchorRef })
	reactModule.useEffect(function() --[[ line: 47 ]]
		-- upvalues: useState (ref), var9 (ref), buildAppStorageModule (copy)
		if useState and not var9.current then
			var9.current = true
			buildAppStorageModule.incrementUnpublishedPlaytestModeTooltipDisplayCount()
		end
	end, { useState })
	
	return if useState then reactModule.createElement(overlayProvider, nil, {
		Tooltip = reactModule.createElement(educationalTooltip, {
			testId = "unpublished-playtest-mode-tooltip",
			anchorRef = p1.anchorRef,
			title = localizationStringsModule.UNPUBLISHED_PLAYTEST_MODE_TOOLTIP_TITLE,
			text = localizationStringsModule.UNPUBLISHED_PLAYTEST_MODE_TOOLTIP_DESCRIPTION,
			side = popoverSide.Bottom,
			align = popoverAlign.Start,
			isOpen = useState,
			onClose = var10,
			onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then var10 else nil,
			Visible = p1.isVisible
		})
	}) else nil
end)