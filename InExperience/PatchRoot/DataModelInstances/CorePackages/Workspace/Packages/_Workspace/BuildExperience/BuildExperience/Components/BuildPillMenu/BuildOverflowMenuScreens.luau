local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local dataHydrationModule = require(parent.DataHydration)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local view = foundationModule.View
local audienceConfigurationContentModule = require(buildExperience.Components.GameConfigurations.AudienceConfigurationContent.AudienceConfigurationContent)
local privateInvitesPickerContainerModule = require(buildExperience.Components.PrivateInvitesPicker.PrivateInvitesPickerContainer)
local privateInvitesPickerHostModule = require(buildExperience.Components.PrivateInvitesPicker.PrivateInvitesPickerHost)
local privateInvitesManagementContainerModule = require(buildExperience.Components.GameConfigurations.PrivateInvitesManagement.PrivateInvitesManagementContainer)
local buildOverflowMenuPageModule = require(script.Parent.BuildOverflowMenuPage)
local overflowMenuPageShellModule = require(script.Parent.OverflowMenuPageShell)
local titleDescriptionPageModule = require(buildExperience.Components.TitleDescriptionPage.TitleDescriptionPage)
local mediaSelectionPageModule = require(buildExperience.Components.MediaSelectionPage.MediaSelectionPage)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(buildExperience.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local fFlagBuildBackButtonChevronModule = require(buildExperience.Flags.FFlagBuildBackButtonChevron)
local buildNavigationParamsModule = require(buildExperience.utils.BuildNavigationParams)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local useBuildPageLayoutModule = require(buildExperience.utils.useBuildPageLayout)
local useOnScreenKeyboardVisibleModule = require(buildExperience.utils.useOnScreenKeyboardVisible)
local iconName = foundationModule.Enums.IconName
local useTokens = foundationModule.Hooks.useTokens
local t = {
	BuildPublish = "BuildPublish",
	BuildSettings = "BuildSettings",
	BuildAudience = "BuildAudience",
	BuildPrivateInvitesPicker = "BuildPrivateInvitesPicker",
	BuildPlaytestInviteManagement = "BuildPlaytestInviteManagement",
	BuildTitleDescription = "BuildTitleDescription",
	BuildVersionTitleDescription = "BuildVersionTitleDescription",
	BuildMediaSelection = "BuildMediaSelection"
}
local t_1 = { publish = t.BuildPublish, settings = t.BuildSettings }

local function _(p0) --[[ line: 72 | named "normalizeTarget" ]]
	return if p0 == nil then nil else {
		universeId = p0.universeId,
		placeId = p0.placeId,
		sessionId = p0.sessionId,
		experienceName = p0.experienceName,
		gameIcon = p0.gameIcon,
		isNewGameTarget = p0.isNewGameTarget
	}
end

local _ = function(p1) --[[ line: 87 | named "getGameInfoName" ]]
	return if p1 == nil or p1.isUnavailable or (typeof(p1.name) ~= "string" or p1.name == "") then nil else p1.name
end

local function getTargetWithGameInfo(p2, p3, p4) --[[ line: 95 ]]
	-- upvalues: fFlagBuildLocalization (ref), localizationStringsModule (ref)
	if p2 == nil then
		return p2
	end
	local var32
	local var29 = if p3 ~= nil and not p3.isUnavailable then p3 else nil
	local var30 = if var29 then var29.creator else nil
	local t = {
		universeId = p2.universeId,
		placeId = p2.placeId or (if var29 then tonumber(var29.rootPlaceId) else nil),
		sessionId = p2.sessionId,
		experienceName = if p3 == nil or p3.isUnavailable or (typeof(p3.name) ~= "string" or p3.name == "") then nil else p3.name,
		description = if var29 then var29.description or "" elseif fFlagBuildLocalization then p4 else localizationStringsModule.BUILD_MENU_LOADING,
		creatorName = if var30 and var30.name ~= "" then var30.name elseif fFlagBuildLocalization then p4 else localizationStringsModule.BUILD_MENU_LOADING,
		gameIcon = p2.gameIcon
	}
	
	if var30 then
		var32 = var30.hasVerifiedBadge == true
		var32 = nil
	else
		var32 = false
	end
	t.isCreatorVerified = var32
	t.isNewGameTarget = p2.isNewGameTarget
	
	return t
end

local _ = function(p5) --[[ line: 125 | named "isTitleDescriptionReady" ]]
	return (if p5 == nil or p5.isUnavailable or (typeof(p5.name) ~= "string" or p5.name == "") then nil else p5.name) ~= nil
end

local function useGameInfo(p6) --[[ line: 129 ]]
	-- upvalues: reactModule (ref), signalsModule (ref), dataHydrationModule (ref), signalsReactModule (ref)
	local var33 = if p6 == nil then nil else tostring(p6)
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 131 ]]
		-- upvalues: signalsModule (copy), var33 (ref), dataHydrationModule (copy)
		return signalsModule.createComputed(function(p7) --[[ line: 132 ]]
			-- upvalues: var33 (copy), dataHydrationModule (copy)
			return if var33 == nil then nil else dataHydrationModule.Game.getGameInfoStore(p7).getAndFetchGameInfo(var33).data(p7)
		end)
	end, { var33 }))
end

local function BuildFullscreenPage(p8) --[[ line: 149 ]]
	-- upvalues: useBuildPageLayoutModule (ref), reactModule (ref), fullscreenPageWithSafeArea (ref)
	local var34 = useBuildPageLayoutModule()
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var34.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var34.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var34.shouldIncludeBottomBar and p8.hideBottomBar ~= true
	}, { Page = p8.pageContent })
end

local function BuildSheetPage(p9) --[[ line: 162 ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref)
	local var35 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "size-full",
		BackgroundColor3 = var35.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var35.Color.Surface.Surface_0.Transparency
	}, { Page = p9.pageContent })
end

local function ConfigurationScreen(p10, p11, p12) --[[ line: 174 ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), buildNavigationParamsModule (ref), useGameInfo (ref), getTargetWithGameInfo (ref), reactModule (ref), t (ref), buildOverflowMenuPageModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref), privateInvitesPickerHostModule (ref), buildExperience (ref)
	local var36 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({ loading = localizationStringsModule.BUILD_MENU_LOADING }) else nil).loading else nil
	local navigation = p10.navigation
	local screenProps = p10.screenProps or {}
	local var38 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
	local var39 = if var38 == nil then nil else {
		universeId = var38.universeId,
		placeId = var38.placeId,
		sessionId = var38.sessionId,
		experienceName = var38.experienceName,
		gameIcon = var38.gameIcon,
		isNewGameTarget = var38.isNewGameTarget
	}
	local var40 = useGameInfo(if var39 then var39.universeId else nil)
	local var41 = getTargetWithGameInfo(var39, var40, var36)
	local var42, var43 = reactModule.useState(false)
	local var44, var45 = reactModule.useState(false)
	local var46 = reactModule.useCallback(function() --[[ line: 189 ]]
		-- upvalues: screenProps (ref), navigation (ref)
		if screenProps.onClose then
			screenProps.onClose()
			
			return
		end
		navigation.goBack()
	end, { navigation, screenProps.onClose })
	local var47 = reactModule.useCallback(function() --[[ line: 196 ]]
		-- upvalues: screenProps (ref), navigation (ref), t (copy), var41 (ref)
		if screenProps.onOpenAudiencePage then
			screenProps.onOpenAudiencePage()
			
			return
		end
		navigation.navigate(t.BuildAudience, { target = var41 })
	end, { navigation, screenProps.onOpenAudiencePage, var41 })
	local var48 = reactModule.useCallback(function() --[[ line: 205 ]]
		-- upvalues: var40 (ref), screenProps (ref), navigation (ref), t (copy), var41 (ref)
		if (if var40 == nil or var40.isUnavailable or (typeof(var40.name) ~= "string" or var40.name == "") then nil else var40.name) == nil then return end
		if screenProps.onOpenTitleDescriptionPage then
			screenProps.onOpenTitleDescriptionPage()
			
			return
		end
		navigation.navigate(t.BuildTitleDescription, { target = var41 })
	end, {
		var40,
		navigation,
		screenProps.onOpenTitleDescriptionPage,
		var41
	})
	local var49 = reactModule.useCallback(function() --[[ line: 217 ]]
		-- upvalues: screenProps (ref), navigation (ref), t (copy), var41 (ref)
		if screenProps.onOpenMediaSelectionPage then
			screenProps.onOpenMediaSelectionPage()
			
			return
		end
		navigation.navigate(t.BuildMediaSelection, { target = var41 })
	end, { navigation, screenProps.onOpenMediaSelectionPage, var41 })
	local var50 = reactModule.useCallback(function() --[[ line: 226 ]]
		-- upvalues: var41 (ref), screenProps (ref), navigation (ref), t (copy)
		if var41 == nil or var41.placeId == nil then return end
		if screenProps.onOpenVersionTitleDescriptionPage then
			screenProps.onOpenVersionTitleDescriptionPage()
			
			return
		end
		navigation.navigate(t.BuildVersionTitleDescription, { target = var41 })
	end, {
		navigation,
		screenProps.onOpenVersionTitleDescriptionPage,
		var41
	})
	local var51 = reactModule.useCallback(function() --[[ line: 238 ]]
		-- upvalues: var41 (ref), screenProps (ref), var45 (ref)
		if var41 == nil or var41.placeId == nil then return end
		if screenProps.onOpenVersionHistory then
			screenProps.onOpenVersionHistory()
			
			return
		end
		var45(true)
	end, { screenProps.onOpenVersionHistory, var41 })
	local var52 = reactModule.useCallback(function() --[[ line: 248 ]]
		-- upvalues: var45 (ref)
		var45(false)
	end, {})
	local var53 = reactModule.useCallback(function() --[[ line: 251 ]]
		-- upvalues: var43 (ref)
		var43(true)
	end, {})
	local var54 = reactModule.useCallback(function() --[[ line: 254 ]]
		-- upvalues: var43 (ref)
		var43(false)
	end, {})
	local var55 = reactModule.useCallback(function() --[[ line: 257 ]]
		-- upvalues: navigation (ref), t (copy), var41 (ref)
		navigation.navigate(t.BuildPlaytestInviteManagement, { target = var41 })
	end, { navigation, var41 })
	local var56 = reactModule.useCallback(function() --[[ line: 264 ]]
		-- upvalues: var43 (ref), var55 (ref)
		var43(false)
		var55()
	end, { var55 })
	local isSettings = p11 == "settings"
	local var58 = if var41 == nil then nil else reactModule.createElement(buildOverflowMenuPageModule, {
		page = p11,
		target = var41,
		testId = p12,
		onClose = var46,
		onOpenAudiencePage = var47,
		onOpenTitleDescriptionPage = var48,
		onOpenMediaSelectionPage = var49,
		onOpenVersionTitleDescriptionPage = var50,
		onOpenVersionHistory = var51,
		onOpenPlaytestPicker = if isSettings then var53 else nil,
		onOpenPlaytestManagement = if isSettings then var55 else nil,
		showPreviewButton = screenProps.showPreviewButton
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Page = if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var58 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var58 }),
		Picker = if var42 and var41 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
			universeId = var41.universeId,
			onClose = var54,
			onInvitesSent = var56
		}) else nil,
		VersionHistory = if var44 and var41 ~= nil and var41.placeId ~= nil then reactModule.createElement(require(buildExperience.Components.VersionHistory.VersionHistoryContainer), {
			isOpen = true,
			testId = "build-publish-version-history",
			placeId = var41.placeId,
			onClose = var52
		}) else nil
	})
end

local function BuildTitleDescriptionContent(p13) --[[ line: 464 ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useGameInfo (ref), getTargetWithGameInfo (ref), reactModule (ref), titleDescriptionPageModule (ref)
	local var59 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({ loading = localizationStringsModule.BUILD_MENU_LOADING }) else nil).loading else nil
	local var60 = useGameInfo(p13.target.universeId)
	
	if (if var60 == nil or var60.isUnavailable or (typeof(var60.name) ~= "string" or var60.name == "") then nil else var60.name) == nil then
		return nil
	end
	local var61 = getTargetWithGameInfo(p13.target, var60, var59)
	
	return if var61 == nil then nil else reactModule.createElement(titleDescriptionPageModule, {
		universeId = var61.universeId,
		titleText = var61.experienceName or (if fFlagBuildLocalization then var59 else localizationStringsModule.BUILD_MENU_LOADING),
		descriptionText = var61.description or "",
		onBack = p13.onBack,
		testId = p13.testId
	})
end

return {
	Screens = t,
	SCREEN_BY_PAGE = t_1,
	BuildPublishScreen = function(p14) --[[ line: 322 ]]
		-- upvalues: ConfigurationScreen (ref)
		return ConfigurationScreen(p14, "publish", "BuildPage.publish.Page")
	end,
	BuildSettingsScreen = function(value) --[[ line: 326 ]]
		-- upvalues: ConfigurationScreen (ref)
		return ConfigurationScreen(value, "settings", "BuildPage.settings.Page")
	end,
	BuildAudienceScreen = function(p15) --[[ line: 330 ]]
		-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), buildNavigationParamsModule (ref), reactModule (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), audienceConfigurationContentModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
		local var62 = if fFlagBuildLocalization then useLocalization({ audience = localizationStringsModule.BUILD_MENU_AUDIENCE }) else nil
		local navigation = p15.navigation
		local screenProps = p15.screenProps or {}
		local var64 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var65 = if var64 == nil then nil else {
			universeId = var64.universeId,
			placeId = var64.placeId,
			sessionId = var64.sessionId,
			experienceName = var64.experienceName,
			gameIcon = var64.gameIcon,
			isNewGameTarget = var64.isNewGameTarget
		}
		local var66 = if var65 == nil then nil else reactModule.createElement(overflowMenuPageShellModule, {
			testId = "BuildPage.audience.Page",
			title = if fFlagBuildLocalization then var62.audience else localizationStringsModule.BUILD_MENU_AUDIENCE,
			closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
			onClose = reactModule.useCallback(function() --[[ line: 340 ]]
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation }),
			scrollPerformanceIntervalName = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then "LuaApp_Build_Audience_Scroll" else nil,
			content = reactModule.createElement(audienceConfigurationContentModule, { universeId = var65.universeId })
		})
		
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var66 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var66 })
	end,
	BuildPrivateInvitesPickerScreen = function(p16) --[[ line: 374 ]]
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), privateInvitesPickerContainerModule (ref)
		local navigation = p16.navigation
		local screenProps = p16.screenProps or {}
		local var68 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var69 = if var68 == nil then nil else {
			universeId = var68.universeId,
			placeId = var68.placeId,
			sessionId = var68.sessionId,
			experienceName = var68.experienceName,
			gameIcon = var68.gameIcon,
			isNewGameTarget = var68.isNewGameTarget
		}
		local var70 = reactModule.useCallback(function() --[[ line: 379 ]]
			-- upvalues: screenProps (ref), navigation (ref)
			if screenProps.onClose then
				screenProps.onClose()
				
				return
			end
			navigation.goBack()
		end, { navigation, screenProps.onClose })
		
		return if var69 == nil then nil else reactModule.createElement(privateInvitesPickerContainerModule, {
			universeId = var69.universeId,
			onClose = var70,
			onInvitesSent = var70
		})
	end,
	BuildPlaytestInviteManagementScreen = function(p17) --[[ line: 398 ]]
		-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), buildNavigationParamsModule (ref), reactModule (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), privateInvitesManagementContainerModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref), privateInvitesPickerHostModule (ref)
		local var71 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
			pageTitle = localizationStringsModule.PRIVATE_INVITES_PAGE_TITLE
		}) else nil).pageTitle else localizationStringsModule.PRIVATE_INVITES_PAGE_TITLE
		local navigation = p17.navigation
		local screenProps = p17.screenProps or {}
		local var73 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var74 = if var73 == nil then nil else {
			universeId = var73.universeId,
			placeId = var73.placeId,
			sessionId = var73.sessionId,
			experienceName = var73.experienceName,
			gameIcon = var73.gameIcon,
			isNewGameTarget = var73.isNewGameTarget
		}
		local var75, var76 = reactModule.useState(false)
		local var77 = reactModule.useCallback(function() --[[ line: 418 ]]
			-- upvalues: var76 (ref)
			var76(false)
		end, {})
		local var78 = if var74 == nil then nil else reactModule.createElement(overflowMenuPageShellModule, {
			testId = "BuildPage.playtestInviteManagement.Page",
			title = var71,
			closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
			onClose = reactModule.useCallback(function() --[[ line: 412 ]]
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation }),
			content = reactModule.createElement(privateInvitesManagementContainerModule, {
				universeId = var74.universeId,
				onOpenInvitePicker = reactModule.useCallback(function() --[[ line: 415 ]]
					-- upvalues: var76 (ref)
					var76(true)
				end, {})
			})
		})
		
		return reactModule.createElement(reactModule.Fragment, nil, {
			Page = if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var78 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var78 }),
			Picker = if var75 and var74 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
				universeId = var74.universeId,
				onClose = var77,
				onInvitesSent = var77
			}) else nil
		})
	end,
	BuildTitleDescriptionScreen = function(p18) --[[ line: 493 ]]
		-- upvalues: buildNavigationParamsModule (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), BuildTitleDescriptionContent (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
		local navigation = p18.navigation
		local screenProps = p18.screenProps or {}
		local var80 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var81 = if var80 == nil then nil else {
			universeId = var80.universeId,
			placeId = var80.placeId,
			sessionId = var80.sessionId,
			experienceName = var80.experienceName,
			gameIcon = var80.gameIcon,
			isNewGameTarget = var80.isNewGameTarget
		}
		local var82 = if var81 == nil then nil else reactModule.createElement(BuildTitleDescriptionContent, {
			testId = "BuildPage.titleDescription.Page",
			target = var81,
			onBack = navigation.goBack
		})
		
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var82 }) else reactModule.createElement(BuildFullscreenPage, {
			hideBottomBar = useOnScreenKeyboardVisibleModule(),
			pageContent = var82
		})
	end,
	BuildVersionTitleDescriptionScreen = function(p19) --[[ line: 519 ]]
		-- upvalues: buildNavigationParamsModule (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), buildExperience (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
		local navigation = p19.navigation
		local screenProps = p19.screenProps or {}
		local var84 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var85 = if var84 == nil then nil else {
			universeId = var84.universeId,
			placeId = var84.placeId,
			sessionId = var84.sessionId,
			experienceName = var84.experienceName,
			gameIcon = var84.gameIcon,
			isNewGameTarget = var84.isNewGameTarget
		}
		local var86 = if var85 == nil or var85.placeId == nil then nil else reactModule.createElement(require(buildExperience.Components.VersionTitleDescriptionPage.VersionTitleDescriptionPageContainer), {
			testId = "BuildPage.versionTitleDescription.Page",
			placeId = var85.placeId,
			onBack = navigation.goBack
		})
		
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var86 }) else reactModule.createElement(BuildFullscreenPage, {
			hideBottomBar = useOnScreenKeyboardVisibleModule(),
			pageContent = var86
		})
	end,
	BuildMediaSelectionScreen = function(p20) --[[ line: 548 ]]
		-- upvalues: buildNavigationParamsModule (ref), useBuildPageLayoutModule (ref), reactModule (ref), mediaSelectionPageModule (ref), fullscreenPageWithSafeArea (ref)
		local navigation = p20.navigation
		local target = buildNavigationParamsModule.getTarget(navigation)
		local var88 = useBuildPageLayoutModule()
		
		return reactModule.createElement(fullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BackgroundColor3 = var88.tokens.Color.Surface.Surface_0.Color3,
			BackgroundTransparency = var88.tokens.Color.Surface.Surface_0.Transparency,
			includeBottomBar = var88.shouldIncludeBottomBar
		}, {
			Page = if target == nil or target.universeId == nil then nil else reactModule.createElement(mediaSelectionPageModule, {
				onClose = reactModule.useCallback(function() --[[ line: 553 ]]
					-- upvalues: navigation (ref)
					navigation.goBack()
				end, { navigation }),
				universeId = target.universeId
			})
		})
	end
}