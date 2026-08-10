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

local function _(p0) --[[ line: 67 | named "normalizeTarget" ]]
	return if p0 == nil then nil else {
		universeId = p0.universeId,
		placeId = p0.placeId,
		sessionId = p0.sessionId,
		experienceName = p0.experienceName,
		gameIcon = p0.gameIcon,
		isNewGameTarget = p0.isNewGameTarget
	}
end

local _ = function(p1) --[[ line: 82 | named "getGameInfoName" ]]
	return if p1 == nil or p1.isUnavailable or (typeof(p1.name) ~= "string" or p1.name == "") then nil else p1.name
end

local function getTargetWithGameInfo(p2, p3) --[[ line: 90 ]]
	-- upvalues: localizationStringsModule (ref)
	if p2 == nil then
		return p2
	end
	local var30
	local var27 = if p3 ~= nil and not p3.isUnavailable then p3 else nil
	local var28 = if var27 then var27.creator else nil
	local t = {
		universeId = p2.universeId,
		placeId = p2.placeId or (if var27 then tonumber(var27.rootPlaceId) else nil),
		sessionId = p2.sessionId,
		experienceName = if p3 == nil or p3.isUnavailable or (typeof(p3.name) ~= "string" or p3.name == "") then nil else p3.name,
		description = if var27 then var27.description or "" else localizationStringsModule.BUILD_MENU_LOADING,
		creatorName = if var28 and var28.name ~= "" then var28.name else localizationStringsModule.BUILD_MENU_LOADING,
		gameIcon = p2.gameIcon
	}
	
	if var28 then
		var30 = var28.hasVerifiedBadge == true
		var30 = nil
	else
		var30 = false
	end
	t.isCreatorVerified = var30
	t.isNewGameTarget = p2.isNewGameTarget
	
	return t
end

local _ = function(p4) --[[ line: 115 | named "isTitleDescriptionReady" ]]
	return (if p4 == nil or p4.isUnavailable or (typeof(p4.name) ~= "string" or p4.name == "") then nil else p4.name) ~= nil
end

local function useGameInfo(p5) --[[ line: 119 ]]
	-- upvalues: reactModule (ref), signalsModule (ref), dataHydrationModule (ref), signalsReactModule (ref)
	local var31 = if p5 == nil then nil else tostring(p5)
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 121 ]]
		-- upvalues: signalsModule (copy), var31 (ref), dataHydrationModule (copy)
		return signalsModule.createComputed(function(p6) --[[ line: 122 ]]
			-- upvalues: var31 (copy), dataHydrationModule (copy)
			return if var31 == nil then nil else dataHydrationModule.Game.getGameInfoStore(p6).getAndFetchGameInfo(var31).data(p6)
		end)
	end, { var31 }))
end

local function BuildFullscreenPage(p7) --[[ line: 139 ]]
	-- upvalues: useBuildPageLayoutModule (ref), reactModule (ref), fullscreenPageWithSafeArea (ref)
	local var32 = useBuildPageLayoutModule()
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var32.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var32.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var32.shouldIncludeBottomBar and p7.hideBottomBar ~= true
	}, { Page = p7.pageContent })
end

local function BuildSheetPage(p8) --[[ line: 152 ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref)
	local var33 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "size-full",
		BackgroundColor3 = var33.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var33.Color.Surface.Surface_0.Transparency
	}, { Page = p8.pageContent })
end

local function ConfigurationScreen(p9, p10, p11) --[[ line: 164 ]]
	-- upvalues: buildNavigationParamsModule (ref), useGameInfo (ref), getTargetWithGameInfo (ref), reactModule (ref), t (ref), buildOverflowMenuPageModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref), privateInvitesPickerHostModule (ref), buildExperience (ref)
	local navigation = p9.navigation
	local screenProps = p9.screenProps or {}
	local var35 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
	local var36 = if var35 == nil then nil else {
		universeId = var35.universeId,
		placeId = var35.placeId,
		sessionId = var35.sessionId,
		experienceName = var35.experienceName,
		gameIcon = var35.gameIcon,
		isNewGameTarget = var35.isNewGameTarget
	}
	local var37 = useGameInfo(if var36 then var36.universeId else nil)
	local var38 = getTargetWithGameInfo(var36, var37)
	local var39, var40 = reactModule.useState(false)
	local var41, var42 = reactModule.useState(false)
	local var43 = reactModule.useCallback(function() --[[ line: 173 ]]
		-- upvalues: screenProps (ref), navigation (ref)
		if screenProps.onClose then
			screenProps.onClose()
			
			return
		end
		navigation.goBack()
	end, { navigation, screenProps.onClose })
	local var44 = reactModule.useCallback(function() --[[ line: 180 ]]
		-- upvalues: screenProps (ref), navigation (ref), t (copy), var38 (ref)
		if screenProps.onOpenAudiencePage then
			screenProps.onOpenAudiencePage()
			
			return
		end
		navigation.navigate(t.BuildAudience, { target = var38 })
	end, { navigation, screenProps.onOpenAudiencePage, var38 })
	local var45 = reactModule.useCallback(function() --[[ line: 189 ]]
		-- upvalues: var37 (ref), screenProps (ref), navigation (ref), t (copy), var38 (ref)
		if (if var37 == nil or var37.isUnavailable or (typeof(var37.name) ~= "string" or var37.name == "") then nil else var37.name) == nil then return end
		if screenProps.onOpenTitleDescriptionPage then
			screenProps.onOpenTitleDescriptionPage()
			
			return
		end
		navigation.navigate(t.BuildTitleDescription, { target = var38 })
	end, {
		var37,
		navigation,
		screenProps.onOpenTitleDescriptionPage,
		var38
	})
	local var46 = reactModule.useCallback(function() --[[ line: 201 ]]
		-- upvalues: screenProps (ref), navigation (ref), t (copy), var38 (ref)
		if screenProps.onOpenMediaSelectionPage then
			screenProps.onOpenMediaSelectionPage()
			
			return
		end
		navigation.navigate(t.BuildMediaSelection, { target = var38 })
	end, { navigation, screenProps.onOpenMediaSelectionPage, var38 })
	local var47 = reactModule.useCallback(function() --[[ line: 210 ]]
		-- upvalues: var38 (ref), screenProps (ref), navigation (ref), t (copy)
		if var38 == nil or var38.placeId == nil then return end
		if screenProps.onOpenVersionTitleDescriptionPage then
			screenProps.onOpenVersionTitleDescriptionPage()
			
			return
		end
		navigation.navigate(t.BuildVersionTitleDescription, { target = var38 })
	end, {
		navigation,
		screenProps.onOpenVersionTitleDescriptionPage,
		var38
	})
	local var48 = reactModule.useCallback(function() --[[ line: 222 ]]
		-- upvalues: var38 (ref), screenProps (ref), var42 (ref)
		if var38 == nil or var38.placeId == nil then return end
		if screenProps.onOpenVersionHistory then
			screenProps.onOpenVersionHistory()
			
			return
		end
		var42(true)
	end, { screenProps.onOpenVersionHistory, var38 })
	local var49 = reactModule.useCallback(function() --[[ line: 232 ]]
		-- upvalues: var42 (ref)
		var42(false)
	end, {})
	local var50 = reactModule.useCallback(function() --[[ line: 235 ]]
		-- upvalues: var40 (ref)
		var40(true)
	end, {})
	local var51 = reactModule.useCallback(function() --[[ line: 238 ]]
		-- upvalues: var40 (ref)
		var40(false)
	end, {})
	local var52 = reactModule.useCallback(function() --[[ line: 241 ]]
		-- upvalues: navigation (ref), t (copy), var38 (ref)
		navigation.navigate(t.BuildPlaytestInviteManagement, { target = var38 })
	end, { navigation, var38 })
	local var53 = reactModule.useCallback(function() --[[ line: 248 ]]
		-- upvalues: var40 (ref), var52 (ref)
		var40(false)
		var52()
	end, { var52 })
	local isSettings = p10 == "settings"
	local var55 = if var38 == nil then nil else reactModule.createElement(buildOverflowMenuPageModule, {
		page = p10,
		target = var38,
		testId = p11,
		onClose = var43,
		onOpenAudiencePage = var44,
		onOpenTitleDescriptionPage = var45,
		onOpenMediaSelectionPage = var46,
		onOpenVersionTitleDescriptionPage = var47,
		onOpenVersionHistory = var48,
		onOpenPlaytestPicker = if isSettings then var50 else nil,
		onOpenPlaytestManagement = if isSettings then var52 else nil,
		showPreviewButton = screenProps.showPreviewButton
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Page = if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var55 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var55 }),
		Picker = if var39 and var38 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
			universeId = var38.universeId,
			onClose = var51,
			onInvitesSent = var53
		}) else nil,
		VersionHistory = if var41 and var38 ~= nil and var38.placeId ~= nil then reactModule.createElement(require(buildExperience.Components.VersionHistory.VersionHistoryContainer), {
			isOpen = true,
			testId = "build-publish-version-history",
			placeId = var38.placeId,
			onClose = var49
		}) else nil
	})
end

local function BuildTitleDescriptionContent(p12) --[[ line: 435 ]]
	-- upvalues: useGameInfo (ref), getTargetWithGameInfo (ref), reactModule (ref), titleDescriptionPageModule (ref), localizationStringsModule (ref)
	local var56 = useGameInfo(p12.target.universeId)
	
	if (if var56 == nil or var56.isUnavailable or (typeof(var56.name) ~= "string" or var56.name == "") then nil else var56.name) == nil then
		return nil
	end
	local var57 = getTargetWithGameInfo(p12.target, var56)
	
	return if var57 == nil then nil else reactModule.createElement(titleDescriptionPageModule, {
		universeId = var57.universeId,
		titleText = var57.experienceName or localizationStringsModule.BUILD_MENU_LOADING,
		descriptionText = var57.description or "",
		onBack = p12.onBack,
		testId = p12.testId
	})
end

return {
	Screens = t,
	SCREEN_BY_PAGE = t_1,
	BuildPublishScreen = function(p13) --[[ line: 306 ]]
		-- upvalues: ConfigurationScreen (ref)
		return ConfigurationScreen(p13, "publish", "BuildPage.publish.Page")
	end,
	BuildSettingsScreen = function(value) --[[ line: 310 ]]
		-- upvalues: ConfigurationScreen (ref)
		return ConfigurationScreen(value, "settings", "BuildPage.settings.Page")
	end,
	BuildAudienceScreen = function(p14) --[[ line: 314 ]]
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), overflowMenuPageShellModule (ref), localizationStringsModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), audienceConfigurationContentModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
		local navigation = p14.navigation
		local screenProps = p14.screenProps or {}
		local var59 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var60 = if var59 == nil then nil else {
			universeId = var59.universeId,
			placeId = var59.placeId,
			sessionId = var59.sessionId,
			experienceName = var59.experienceName,
			gameIcon = var59.gameIcon,
			isNewGameTarget = var59.isNewGameTarget
		}
		local var61 = if var60 == nil then nil else reactModule.createElement(overflowMenuPageShellModule, {
			testId = "BuildPage.audience.Page",
			title = localizationStringsModule.BUILD_MENU_AUDIENCE,
			closeIcon = iconName.ChevronLargeLeft,
			onClose = reactModule.useCallback(function() --[[ line: 319 ]]
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation }),
			scrollPerformanceIntervalName = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then "LuaApp_Build_Audience_Scroll" else nil,
			content = reactModule.createElement(audienceConfigurationContentModule, { universeId = var60.universeId })
		})
		
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var61 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var61 })
	end,
	BuildPrivateInvitesPickerScreen = function(p15) --[[ line: 353 ]]
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), privateInvitesPickerContainerModule (ref)
		local navigation = p15.navigation
		local screenProps = p15.screenProps or {}
		local var63 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var64 = if var63 == nil then nil else {
			universeId = var63.universeId,
			placeId = var63.placeId,
			sessionId = var63.sessionId,
			experienceName = var63.experienceName,
			gameIcon = var63.gameIcon,
			isNewGameTarget = var63.isNewGameTarget
		}
		local var65 = reactModule.useCallback(function() --[[ line: 358 ]]
			-- upvalues: screenProps (ref), navigation (ref)
			if screenProps.onClose then
				screenProps.onClose()
				
				return
			end
			navigation.goBack()
		end, { navigation, screenProps.onClose })
		
		return if var64 == nil then nil else reactModule.createElement(privateInvitesPickerContainerModule, {
			universeId = var64.universeId,
			onClose = var65,
			onInvitesSent = var65
		})
	end,
	BuildPlaytestInviteManagementScreen = function(p16) --[[ line: 377 ]]
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), overflowMenuPageShellModule (ref), localizationStringsModule (ref), iconName (ref), privateInvitesManagementContainerModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref), privateInvitesPickerHostModule (ref)
		local navigation = p16.navigation
		local screenProps = p16.screenProps or {}
		local var67 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var68 = if var67 == nil then nil else {
			universeId = var67.universeId,
			placeId = var67.placeId,
			sessionId = var67.sessionId,
			experienceName = var67.experienceName,
			gameIcon = var67.gameIcon,
			isNewGameTarget = var67.isNewGameTarget
		}
		local var69, var70 = reactModule.useState(false)
		local var71 = reactModule.useCallback(function() --[[ line: 389 ]]
			-- upvalues: var70 (ref)
			var70(false)
		end, {})
		local var72 = if var68 == nil then nil else reactModule.createElement(overflowMenuPageShellModule, {
			testId = "BuildPage.playtestInviteManagement.Page",
			title = localizationStringsModule.PRIVATE_INVITES_PAGE_TITLE,
			closeIcon = iconName.ChevronLargeLeft,
			onClose = reactModule.useCallback(function() --[[ line: 383 ]]
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation }),
			content = reactModule.createElement(privateInvitesManagementContainerModule, {
				universeId = var68.universeId,
				onOpenInvitePicker = reactModule.useCallback(function() --[[ line: 386 ]]
					-- upvalues: var70 (ref)
					var70(true)
				end, {})
			})
		})
		
		return reactModule.createElement(reactModule.Fragment, nil, {
			Page = if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var72 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var72 }),
			Picker = if var69 and var68 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
				universeId = var68.universeId,
				onClose = var71,
				onInvitesSent = var71
			}) else nil
		})
	end,
	BuildTitleDescriptionScreen = function(p17) --[[ line: 457 ]]
		-- upvalues: buildNavigationParamsModule (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), BuildTitleDescriptionContent (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
		local navigation = p17.navigation
		local screenProps = p17.screenProps or {}
		local var74 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var75 = if var74 == nil then nil else {
			universeId = var74.universeId,
			placeId = var74.placeId,
			sessionId = var74.sessionId,
			experienceName = var74.experienceName,
			gameIcon = var74.gameIcon,
			isNewGameTarget = var74.isNewGameTarget
		}
		local var76 = if var75 == nil then nil else reactModule.createElement(BuildTitleDescriptionContent, {
			testId = "BuildPage.titleDescription.Page",
			target = var75,
			onBack = navigation.goBack
		})
		
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var76 }) else reactModule.createElement(BuildFullscreenPage, {
			hideBottomBar = useOnScreenKeyboardVisibleModule(),
			pageContent = var76
		})
	end,
	BuildVersionTitleDescriptionScreen = function(p18) --[[ line: 483 ]]
		-- upvalues: buildNavigationParamsModule (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), buildExperience (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
		local navigation = p18.navigation
		local screenProps = p18.screenProps or {}
		local var78 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var79 = if var78 == nil then nil else {
			universeId = var78.universeId,
			placeId = var78.placeId,
			sessionId = var78.sessionId,
			experienceName = var78.experienceName,
			gameIcon = var78.gameIcon,
			isNewGameTarget = var78.isNewGameTarget
		}
		local var80 = if var79 == nil or var79.placeId == nil then nil else reactModule.createElement(require(buildExperience.Components.VersionTitleDescriptionPage.VersionTitleDescriptionPageContainer), {
			testId = "BuildPage.versionTitleDescription.Page",
			placeId = var79.placeId,
			onBack = navigation.goBack
		})
		
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var80 }) else reactModule.createElement(BuildFullscreenPage, {
			hideBottomBar = useOnScreenKeyboardVisibleModule(),
			pageContent = var80
		})
	end,
	BuildMediaSelectionScreen = function(p19) --[[ line: 512 ]]
		-- upvalues: buildNavigationParamsModule (ref), useBuildPageLayoutModule (ref), reactModule (ref), mediaSelectionPageModule (ref), fullscreenPageWithSafeArea (ref)
		local navigation = p19.navigation
		local target = buildNavigationParamsModule.getTarget(navigation)
		local var82 = useBuildPageLayoutModule()
		
		return reactModule.createElement(fullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BackgroundColor3 = var82.tokens.Color.Surface.Surface_0.Color3,
			BackgroundTransparency = var82.tokens.Color.Surface.Surface_0.Transparency,
			includeBottomBar = var82.shouldIncludeBottomBar
		}, {
			Page = if target == nil or target.universeId == nil then nil else reactModule.createElement(mediaSelectionPageModule, {
				onClose = reactModule.useCallback(function() --[[ line: 517 ]]
					-- upvalues: navigation (ref)
					navigation.goBack()
				end, { navigation }),
				universeId = target.universeId
			})
		})
	end
}