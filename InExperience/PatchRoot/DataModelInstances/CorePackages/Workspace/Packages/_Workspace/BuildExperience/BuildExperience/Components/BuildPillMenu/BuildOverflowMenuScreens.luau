local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local dataHydrationModule = require(parent.DataHydration)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
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

local function _(p0) --[[ line: 68 | named "normalizeTarget" ]]
	return if p0 == nil then nil else {
		universeId = p0.universeId,
		placeId = p0.placeId,
		sessionId = p0.sessionId,
		experienceName = p0.experienceName,
		gameIcon = p0.gameIcon,
		isNewGameTarget = p0.isNewGameTarget
	}
end

local _ = function(p1) --[[ line: 83 | named "getGameInfoName" ]]
	return if p1 == nil or p1.isUnavailable or (typeof(p1.name) ~= "string" or p1.name == "") then nil else p1.name
end

local function getTargetWithGameInfo(p2, p3) --[[ line: 91 ]]
	-- upvalues: localizationStringsModule (ref)
	if p2 == nil then
		return p2
	end
	local var31
	local var28 = if p3 ~= nil and not p3.isUnavailable then p3 else nil
	local var29 = if var28 then var28.creator else nil
	local t = {
		universeId = p2.universeId,
		placeId = p2.placeId or (if var28 then tonumber(var28.rootPlaceId) else nil),
		sessionId = p2.sessionId,
		experienceName = if p3 == nil or p3.isUnavailable or (typeof(p3.name) ~= "string" or p3.name == "") then nil else p3.name,
		description = if var28 then var28.description or "" else localizationStringsModule.BUILD_MENU_LOADING,
		creatorName = if var29 and var29.name ~= "" then var29.name else localizationStringsModule.BUILD_MENU_LOADING,
		gameIcon = p2.gameIcon
	}
	
	if var29 then
		var31 = var29.hasVerifiedBadge == true
		var31 = nil
	else
		var31 = false
	end
	t.isCreatorVerified = var31
	t.isNewGameTarget = p2.isNewGameTarget
	
	return t
end

local _ = function(p4) --[[ line: 116 | named "isTitleDescriptionReady" ]]
	return (if p4 == nil or p4.isUnavailable or (typeof(p4.name) ~= "string" or p4.name == "") then nil else p4.name) ~= nil
end

local function useGameInfo(p5) --[[ line: 120 ]]
	-- upvalues: reactModule (ref), signalsModule (ref), dataHydrationModule (ref), signalsReactModule (ref)
	local var32 = if p5 == nil then nil else tostring(p5)
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 122 ]]
		-- upvalues: signalsModule (copy), var32 (ref), dataHydrationModule (copy)
		return signalsModule.createComputed(function(p6) --[[ line: 123 ]]
			-- upvalues: var32 (copy), dataHydrationModule (copy)
			return if var32 == nil then nil else dataHydrationModule.Game.getGameInfoStore(p6).getAndFetchGameInfo(var32).data(p6)
		end)
	end, { var32 }))
end

local function BuildFullscreenPage(p7) --[[ line: 140 ]]
	-- upvalues: useBuildPageLayoutModule (ref), reactModule (ref), fullscreenPageWithSafeArea (ref)
	local var33 = useBuildPageLayoutModule()
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var33.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var33.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var33.shouldIncludeBottomBar and p7.hideBottomBar ~= true
	}, { Page = p7.pageContent })
end

local function BuildSheetPage(p8) --[[ line: 153 ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref)
	local var34 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "size-full",
		BackgroundColor3 = var34.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var34.Color.Surface.Surface_0.Transparency
	}, { Page = p8.pageContent })
end

local function ConfigurationScreen(p9, p10, p11) --[[ line: 165 ]]
	-- upvalues: buildNavigationParamsModule (ref), useGameInfo (ref), getTargetWithGameInfo (ref), reactModule (ref), t (ref), buildOverflowMenuPageModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref), privateInvitesPickerHostModule (ref), buildExperience (ref)
	local navigation = p9.navigation
	local screenProps = p9.screenProps or {}
	local var36 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
	local var37 = if var36 == nil then nil else {
		universeId = var36.universeId,
		placeId = var36.placeId,
		sessionId = var36.sessionId,
		experienceName = var36.experienceName,
		gameIcon = var36.gameIcon,
		isNewGameTarget = var36.isNewGameTarget
	}
	local var38 = useGameInfo(if var37 then var37.universeId else nil)
	local var39 = getTargetWithGameInfo(var37, var38)
	local var40, var41 = reactModule.useState(false)
	local var42, var43 = reactModule.useState(false)
	local var44 = reactModule.useCallback(function() --[[ line: 174 ]]
		-- upvalues: screenProps (ref), navigation (ref)
		if screenProps.onClose then
			screenProps.onClose()
			
			return
		end
		navigation.goBack()
	end, { navigation, screenProps.onClose })
	local var45 = reactModule.useCallback(function() --[[ line: 181 ]]
		-- upvalues: screenProps (ref), navigation (ref), t (copy), var39 (ref)
		if screenProps.onOpenAudiencePage then
			screenProps.onOpenAudiencePage()
			
			return
		end
		navigation.navigate(t.BuildAudience, { target = var39 })
	end, { navigation, screenProps.onOpenAudiencePage, var39 })
	local var46 = reactModule.useCallback(function() --[[ line: 190 ]]
		-- upvalues: var38 (ref), screenProps (ref), navigation (ref), t (copy), var39 (ref)
		if (if var38 == nil or var38.isUnavailable or (typeof(var38.name) ~= "string" or var38.name == "") then nil else var38.name) == nil then return end
		if screenProps.onOpenTitleDescriptionPage then
			screenProps.onOpenTitleDescriptionPage()
			
			return
		end
		navigation.navigate(t.BuildTitleDescription, { target = var39 })
	end, {
		var38,
		navigation,
		screenProps.onOpenTitleDescriptionPage,
		var39
	})
	local var47 = reactModule.useCallback(function() --[[ line: 202 ]]
		-- upvalues: screenProps (ref), navigation (ref), t (copy), var39 (ref)
		if screenProps.onOpenMediaSelectionPage then
			screenProps.onOpenMediaSelectionPage()
			
			return
		end
		navigation.navigate(t.BuildMediaSelection, { target = var39 })
	end, { navigation, screenProps.onOpenMediaSelectionPage, var39 })
	local var48 = reactModule.useCallback(function() --[[ line: 211 ]]
		-- upvalues: var39 (ref), screenProps (ref), navigation (ref), t (copy)
		if var39 == nil or var39.placeId == nil then return end
		if screenProps.onOpenVersionTitleDescriptionPage then
			screenProps.onOpenVersionTitleDescriptionPage()
			
			return
		end
		navigation.navigate(t.BuildVersionTitleDescription, { target = var39 })
	end, {
		navigation,
		screenProps.onOpenVersionTitleDescriptionPage,
		var39
	})
	local var49 = reactModule.useCallback(function() --[[ line: 223 ]]
		-- upvalues: var39 (ref), screenProps (ref), var43 (ref)
		if var39 == nil or var39.placeId == nil then return end
		if screenProps.onOpenVersionHistory then
			screenProps.onOpenVersionHistory()
			
			return
		end
		var43(true)
	end, { screenProps.onOpenVersionHistory, var39 })
	local var50 = reactModule.useCallback(function() --[[ line: 233 ]]
		-- upvalues: var43 (ref)
		var43(false)
	end, {})
	local var51 = reactModule.useCallback(function() --[[ line: 236 ]]
		-- upvalues: var41 (ref)
		var41(true)
	end, {})
	local var52 = reactModule.useCallback(function() --[[ line: 239 ]]
		-- upvalues: var41 (ref)
		var41(false)
	end, {})
	local var53 = reactModule.useCallback(function() --[[ line: 242 ]]
		-- upvalues: navigation (ref), t (copy), var39 (ref)
		navigation.navigate(t.BuildPlaytestInviteManagement, { target = var39 })
	end, { navigation, var39 })
	local var54 = reactModule.useCallback(function() --[[ line: 249 ]]
		-- upvalues: var41 (ref), var53 (ref)
		var41(false)
		var53()
	end, { var53 })
	local isSettings = p10 == "settings"
	local var56 = if var39 == nil then nil else reactModule.createElement(buildOverflowMenuPageModule, {
		page = p10,
		target = var39,
		testId = p11,
		onClose = var44,
		onOpenAudiencePage = var45,
		onOpenTitleDescriptionPage = var46,
		onOpenMediaSelectionPage = var47,
		onOpenVersionTitleDescriptionPage = var48,
		onOpenVersionHistory = var49,
		onOpenPlaytestPicker = if isSettings then var51 else nil,
		onOpenPlaytestManagement = if isSettings then var53 else nil,
		showPreviewButton = screenProps.showPreviewButton
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Page = if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var56 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var56 }),
		Picker = if var40 and var39 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
			universeId = var39.universeId,
			onClose = var52,
			onInvitesSent = var54
		}) else nil,
		VersionHistory = if var42 and var39 ~= nil and var39.placeId ~= nil then reactModule.createElement(require(buildExperience.Components.VersionHistory.VersionHistoryContainer), {
			isOpen = true,
			testId = "build-publish-version-history",
			placeId = var39.placeId,
			onClose = var50
		}) else nil
	})
end

local function BuildTitleDescriptionContent(p12) --[[ line: 436 ]]
	-- upvalues: useGameInfo (ref), getTargetWithGameInfo (ref), reactModule (ref), titleDescriptionPageModule (ref), localizationStringsModule (ref)
	local var57 = useGameInfo(p12.target.universeId)
	
	if (if var57 == nil or var57.isUnavailable or (typeof(var57.name) ~= "string" or var57.name == "") then nil else var57.name) == nil then
		return nil
	end
	local var58 = getTargetWithGameInfo(p12.target, var57)
	
	return if var58 == nil then nil else reactModule.createElement(titleDescriptionPageModule, {
		universeId = var58.universeId,
		titleText = var58.experienceName or localizationStringsModule.BUILD_MENU_LOADING,
		descriptionText = var58.description or "",
		onBack = p12.onBack,
		testId = p12.testId
	})
end

return {
	Screens = t,
	SCREEN_BY_PAGE = t_1,
	BuildPublishScreen = function(p13) --[[ line: 307 ]]
		-- upvalues: ConfigurationScreen (ref)
		return ConfigurationScreen(p13, "publish", "BuildPage.publish.Page")
	end,
	BuildSettingsScreen = function(value) --[[ line: 311 ]]
		-- upvalues: ConfigurationScreen (ref)
		return ConfigurationScreen(value, "settings", "BuildPage.settings.Page")
	end,
	BuildAudienceScreen = function(p14) --[[ line: 315 ]]
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), overflowMenuPageShellModule (ref), localizationStringsModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), audienceConfigurationContentModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
		local navigation = p14.navigation
		local screenProps = p14.screenProps or {}
		local var60 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var61 = if var60 == nil then nil else {
			universeId = var60.universeId,
			placeId = var60.placeId,
			sessionId = var60.sessionId,
			experienceName = var60.experienceName,
			gameIcon = var60.gameIcon,
			isNewGameTarget = var60.isNewGameTarget
		}
		local var62 = if var61 == nil then nil else reactModule.createElement(overflowMenuPageShellModule, {
			testId = "BuildPage.audience.Page",
			title = localizationStringsModule.BUILD_MENU_AUDIENCE,
			closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
			onClose = reactModule.useCallback(function() --[[ line: 320 ]]
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation }),
			scrollPerformanceIntervalName = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then "LuaApp_Build_Audience_Scroll" else nil,
			content = reactModule.createElement(audienceConfigurationContentModule, { universeId = var61.universeId })
		})
		
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var62 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var62 })
	end,
	BuildPrivateInvitesPickerScreen = function(p15) --[[ line: 354 ]]
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), privateInvitesPickerContainerModule (ref)
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
		local var66 = reactModule.useCallback(function() --[[ line: 359 ]]
			-- upvalues: screenProps (ref), navigation (ref)
			if screenProps.onClose then
				screenProps.onClose()
				
				return
			end
			navigation.goBack()
		end, { navigation, screenProps.onClose })
		
		return if var65 == nil then nil else reactModule.createElement(privateInvitesPickerContainerModule, {
			universeId = var65.universeId,
			onClose = var66,
			onInvitesSent = var66
		})
	end,
	BuildPlaytestInviteManagementScreen = function(p16) --[[ line: 378 ]]
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), overflowMenuPageShellModule (ref), localizationStringsModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), privateInvitesManagementContainerModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref), privateInvitesPickerHostModule (ref)
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
		local var70, var71 = reactModule.useState(false)
		local var72 = reactModule.useCallback(function() --[[ line: 390 ]]
			-- upvalues: var71 (ref)
			var71(false)
		end, {})
		local var73 = if var69 == nil then nil else reactModule.createElement(overflowMenuPageShellModule, {
			testId = "BuildPage.playtestInviteManagement.Page",
			title = localizationStringsModule.PRIVATE_INVITES_PAGE_TITLE,
			closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
			onClose = reactModule.useCallback(function() --[[ line: 384 ]]
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation }),
			content = reactModule.createElement(privateInvitesManagementContainerModule, {
				universeId = var69.universeId,
				onOpenInvitePicker = reactModule.useCallback(function() --[[ line: 387 ]]
					-- upvalues: var71 (ref)
					var71(true)
				end, {})
			})
		})
		
		return reactModule.createElement(reactModule.Fragment, nil, {
			Page = if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var73 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var73 }),
			Picker = if var70 and var69 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
				universeId = var69.universeId,
				onClose = var72,
				onInvitesSent = var72
			}) else nil
		})
	end,
	BuildTitleDescriptionScreen = function(p17) --[[ line: 458 ]]
		-- upvalues: buildNavigationParamsModule (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), BuildTitleDescriptionContent (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
		local navigation = p17.navigation
		local screenProps = p17.screenProps or {}
		local var75 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var76 = if var75 == nil then nil else {
			universeId = var75.universeId,
			placeId = var75.placeId,
			sessionId = var75.sessionId,
			experienceName = var75.experienceName,
			gameIcon = var75.gameIcon,
			isNewGameTarget = var75.isNewGameTarget
		}
		local var77 = if var76 == nil then nil else reactModule.createElement(BuildTitleDescriptionContent, {
			testId = "BuildPage.titleDescription.Page",
			target = var76,
			onBack = navigation.goBack
		})
		
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var77 }) else reactModule.createElement(BuildFullscreenPage, {
			hideBottomBar = useOnScreenKeyboardVisibleModule(),
			pageContent = var77
		})
	end,
	BuildVersionTitleDescriptionScreen = function(p18) --[[ line: 484 ]]
		-- upvalues: buildNavigationParamsModule (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), buildExperience (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
		local navigation = p18.navigation
		local screenProps = p18.screenProps or {}
		local var79 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var80 = if var79 == nil then nil else {
			universeId = var79.universeId,
			placeId = var79.placeId,
			sessionId = var79.sessionId,
			experienceName = var79.experienceName,
			gameIcon = var79.gameIcon,
			isNewGameTarget = var79.isNewGameTarget
		}
		local var81 = if var80 == nil or var80.placeId == nil then nil else reactModule.createElement(require(buildExperience.Components.VersionTitleDescriptionPage.VersionTitleDescriptionPageContainer), {
			testId = "BuildPage.versionTitleDescription.Page",
			placeId = var80.placeId,
			onBack = navigation.goBack
		})
		
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var81 }) else reactModule.createElement(BuildFullscreenPage, {
			hideBottomBar = useOnScreenKeyboardVisibleModule(),
			pageContent = var81
		})
	end,
	BuildMediaSelectionScreen = function(p19) --[[ line: 513 ]]
		-- upvalues: buildNavigationParamsModule (ref), useBuildPageLayoutModule (ref), reactModule (ref), mediaSelectionPageModule (ref), fullscreenPageWithSafeArea (ref)
		local navigation = p19.navigation
		local target = buildNavigationParamsModule.getTarget(navigation)
		local var83 = useBuildPageLayoutModule()
		
		return reactModule.createElement(fullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BackgroundColor3 = var83.tokens.Color.Surface.Surface_0.Color3,
			BackgroundTransparency = var83.tokens.Color.Surface.Surface_0.Transparency,
			includeBottomBar = var83.shouldIncludeBottomBar
		}, {
			Page = if target == nil or target.universeId == nil then nil else reactModule.createElement(mediaSelectionPageModule, {
				onClose = reactModule.useCallback(function() --[[ line: 518 ]]
					-- upvalues: navigation (ref)
					navigation.goBack()
				end, { navigation }),
				universeId = target.universeId
			})
		})
	end
}