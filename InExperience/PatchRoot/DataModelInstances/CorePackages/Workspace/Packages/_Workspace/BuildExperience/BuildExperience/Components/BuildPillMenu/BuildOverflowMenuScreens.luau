local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local _ = require(parent.DataHydration)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local fFlagBuildExperienceAnalytics = sharedFlagsModule.FFlagBuildExperienceAnalytics
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
local monetizationPageContainerModule = require(buildExperience.Components.MonetizationPage.MonetizationPageContainer)
local fFlagBuildBackButtonChevronModule = require(buildExperience.Flags.FFlagBuildBackButtonChevron)
local fFlagBuildPublishNavigationSheetModule = require(buildExperience.Flags.FFlagBuildPublishNavigationSheet)
local buildNavigationParamsModule = require(buildExperience.utils.BuildNavigationParams)
local gameInfoUtilsModule = require(buildExperience.utils.GameInfoUtils)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local useBuildPageLayoutModule = require(buildExperience.utils.useBuildPageLayout)
local useOnScreenKeyboardVisibleModule = require(buildExperience.utils.useOnScreenKeyboardVisible)
local iconName = foundationModule.Enums.IconName
local useTokens = foundationModule.Hooks.useTokens
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local t = {
	BuildPublish = "BuildPublish",
	BuildSettings = "BuildSettings",
	BuildAudience = "BuildAudience",
	BuildPrivateInvitesPicker = "BuildPrivateInvitesPicker",
	BuildPlaytestInviteManagement = "BuildPlaytestInviteManagement",
	BuildTitleDescription = "BuildTitleDescription",
	BuildVersionTitleDescription = "BuildVersionTitleDescription",
	BuildMediaSelection = "BuildMediaSelection",
	BuildMonetization = "BuildMonetization",
	BuildStats = "BuildStats"
}
local t_1 = { publish = t.BuildPublish, settings = t.BuildSettings }

if fFlagBuildExperienceMonetizationNativeUIModule then
	t_1.monetization = t.BuildMonetization
end
if fFlagBuildExperienceAnalytics then
	t_1.stats = t.BuildStats
end
local function _(p1)
	return if p1 == nil then nil else {
		universeId = p1.universeId,
		placeId = p1.placeId,
		sessionId = p1.sessionId,
		experienceName = p1.experienceName,
		gameIcon = p1.gameIcon,
		isNewGameTarget = p1.isNewGameTarget
	}
end

local function getTargetWithGameInfo(p1, p2, p3)
	-- upvalues: gameInfoUtilsModule (ref)
	if p1 == nil then
		return p1
	end
	local var1
	local var2 = if gameInfoUtilsModule.isGameInfoReady(p2) then p2 else nil
	local var3 = if var2 then var2.creator else nil
	local t = {
		universeId = p1.universeId,
		placeId = p1.placeId or (if var2 then tonumber(var2.rootPlaceId) else nil),
		sessionId = p1.sessionId,
		experienceName = gameInfoUtilsModule.getGameInfoName(p2),
		description = if var2 then var2.description or "" else p3,
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

local function BuildFullscreenPage(p1)
	-- upvalues: useBuildPageLayoutModule (ref), reactModule (ref), fullscreenPageWithSafeArea (ref)
	local var1 = useBuildPageLayoutModule()
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var1.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var1.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var1.shouldIncludeBottomBar and p1.hideBottomBar ~= true
	}, { Page = p1.pageContent })
end

local function BuildSheetPage(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "size-full",
		BackgroundColor3 = var1.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var1.Color.Surface.Surface_0.Transparency
	}, { Page = p1.pageContent })
end

local function ConfigurationScreen(p1, p2, p3)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), buildNavigationParamsModule (ref), gameInfoUtilsModule (ref), getTargetWithGameInfo (ref), reactModule (ref), t (ref), fFlagBuildAgentRollbackModule (ref), buildOverflowMenuPageModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref), privateInvitesPickerHostModule (ref), buildExperience (ref)
	local loading = useLocalization({ loading = localizationStringsModule.BUILD_MENU_LOADING }).loading
	local navigation = p1.navigation
	local screenProps = p1.screenProps or {}
	local var1 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
	local var2 = if var1 == nil then nil else {
		universeId = var1.universeId,
		placeId = var1.placeId,
		sessionId = var1.sessionId,
		experienceName = var1.experienceName,
		gameIcon = var1.gameIcon,
		isNewGameTarget = var1.isNewGameTarget
	}
	local var3 = gameInfoUtilsModule.useGameInfo(if var2 then var2.universeId else nil)
	local var4 = getTargetWithGameInfo(var2, var3, loading)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useCallback(function()
		-- upvalues: screenProps (ref), navigation (ref)
		if screenProps.onClose then
			screenProps.onClose()
			
			return
		end
		navigation.goBack()
	end, { navigation, screenProps.onClose })
	local var10 = reactModule.useCallback(function()
		-- upvalues: screenProps (ref), navigation (ref), t (copy), var4 (ref)
		if screenProps.onOpenAudiencePage then
			screenProps.onOpenAudiencePage()
			
			return
		end
		navigation.navigate(t.BuildAudience, { target = var4 })
	end, { navigation, screenProps.onOpenAudiencePage, var4 })
	local var11 = reactModule.useCallback(function()
		-- upvalues: gameInfoUtilsModule (copy), var3 (ref), screenProps (ref), navigation (ref), t (copy), var4 (ref)
		if not gameInfoUtilsModule.isTitleDescriptionReady(var3) then return end
		if screenProps.onOpenTitleDescriptionPage then
			screenProps.onOpenTitleDescriptionPage()
			
			return
		end
		navigation.navigate(t.BuildTitleDescription, { target = var4 })
	end, {
		var3,
		navigation,
		screenProps.onOpenTitleDescriptionPage,
		var4
	})
	local var12 = reactModule.useCallback(function()
		-- upvalues: screenProps (ref), navigation (ref), t (copy), var4 (ref)
		if screenProps.onOpenMediaSelectionPage then
			screenProps.onOpenMediaSelectionPage()
			
			return
		end
		navigation.navigate(t.BuildMediaSelection, { target = var4 })
	end, { navigation, screenProps.onOpenMediaSelectionPage, var4 })
	local var13 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), screenProps (ref), navigation (ref), t (copy)
		if var4 == nil or var4.placeId == nil then return end
		if screenProps.onOpenVersionTitleDescriptionPage then
			screenProps.onOpenVersionTitleDescriptionPage()
			
			return
		end
		navigation.navigate(t.BuildVersionTitleDescription, { target = var4 })
	end, {
		navigation,
		screenProps.onOpenVersionTitleDescriptionPage,
		var4
	})
	local var14 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), screenProps (ref), var8 (ref)
		if var4 == nil or var4.placeId == nil then return end
		if screenProps.onOpenVersionHistory then
			screenProps.onOpenVersionHistory()
			
			return
		end
		var8(true)
	end, { screenProps.onOpenVersionHistory, var4 })
	local var15 = reactModule.useCallback(function()
		-- upvalues: var8 (ref)
		var8(false)
	end, {})
	local var16 = if fFlagBuildAgentRollbackModule then reactModule.useCallback(function()
		-- upvalues: var8 (ref), var9 (ref)
		var8(false)
		var9()
	end, { var9 }) else nil
	local var17 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6(true)
	end, {})
	local var18 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6(false)
	end, {})
	local var19 = reactModule.useCallback(function()
		-- upvalues: navigation (ref), t (copy), var4 (ref)
		navigation.navigate(t.BuildPlaytestInviteManagement, { target = var4 })
	end, { navigation, var4 })
	local var20 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var19 (ref)
		var6(false)
		var19()
	end, { var19 })
	local isSettings = p2 == "settings"
	local var21 = if var4 == nil then nil else reactModule.createElement(buildOverflowMenuPageModule, {
		page = p2,
		target = var4,
		testId = p3,
		onClose = var9,
		onOpenAudiencePage = var10,
		onOpenTitleDescriptionPage = var11,
		onOpenMediaSelectionPage = var12,
		onOpenVersionTitleDescriptionPage = var13,
		onOpenVersionHistory = var14,
		onOpenPlaytestPicker = if isSettings then var17 else nil,
		onOpenPlaytestManagement = if isSettings then var19 else nil,
		showPreviewButton = screenProps.showPreviewButton
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Page = if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var21 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var21 }),
		Picker = if var5 and var4 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
			universeId = var4.universeId,
			onClose = var18,
			onInvitesSent = var20
		}) else nil,
		VersionHistory = if var7 and var4 ~= nil and var4.placeId ~= nil then reactModule.createElement(require(buildExperience.Components.VersionHistory.VersionHistoryContainer), {
			isOpen = true,
			testId = "build-publish-version-history",
			universeId = var4.universeId,
			placeId = var4.placeId,
			onClose = var15,
			onAgentRollbackStarted = if fFlagBuildAgentRollbackModule then var16 else nil
		}) else nil
	})
end

local function BuildPublishScreen(p1)
	-- upvalues: ConfigurationScreen (ref)
	return ConfigurationScreen(p1, "publish", "BuildPage.publish.Page")
end

local function BuildSettingsScreen(value)
	-- upvalues: ConfigurationScreen (ref)
	return ConfigurationScreen(value, "settings", "BuildPage.settings.Page")
end

local function BuildMonetizationScreen(p1)
	-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), monetizationPageContainerModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
	local navigation = p1.navigation
	local screenProps = p1.screenProps or {}
	local var1 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
	local var2 = if var1 == nil then nil else {
		universeId = var1.universeId,
		placeId = var1.placeId,
		sessionId = var1.sessionId,
		experienceName = var1.experienceName,
		gameIcon = var1.gameIcon,
		isNewGameTarget = var1.isNewGameTarget
	}
	local var3 = reactModule.useCallback(function()
		-- upvalues: screenProps (ref), navigation (ref)
		if screenProps.onClose then
			screenProps.onClose()
			
			return
		end
		navigation.goBack()
	end, { navigation, screenProps.onClose })
	local var4 = reactModule.createElement(monetizationPageContainerModule, {
		onClose = var3,
		onComposerActivated = var3,
		placeId = if var2 ~= nil then nil else var2.placeId,
		sessionId = if var2 ~= nil then nil else var2.sessionId,
		universeId = if var2 ~= nil then nil else var2.universeId
	})
	
	return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var4 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var4 })
end

local function BuildAudienceScreen(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), buildNavigationParamsModule (ref), reactModule (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), audienceConfigurationContentModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
	local var1 = useLocalization({ audience = localizationStringsModule.BUILD_MENU_AUDIENCE })
	local navigation = p1.navigation
	local screenProps = p1.screenProps or {}
	local var2 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
	local var3 = if var2 == nil then nil else {
		universeId = var2.universeId,
		placeId = var2.placeId,
		sessionId = var2.sessionId,
		experienceName = var2.experienceName,
		gameIcon = var2.gameIcon,
		isNewGameTarget = var2.isNewGameTarget
	}
	local var4 = if var3 == nil then nil else reactModule.createElement(overflowMenuPageShellModule, {
		testId = "BuildPage.audience.Page",
		scrollPerformanceIntervalName = "LuaApp_Build_Audience_Scroll",
		title = var1.audience,
		closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
		onClose = reactModule.useCallback(function()
			-- upvalues: navigation (ref)
			navigation.goBack()
		end, { navigation }),
		content = reactModule.createElement(audienceConfigurationContentModule, { universeId = var3.universeId })
	})
	
	return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var4 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var4 })
end

local function BuildPrivateInvitesPickerScreen(p1)
	-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), privateInvitesPickerContainerModule (ref)
	local navigation = p1.navigation
	local screenProps = p1.screenProps or {}
	local var1 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
	local var2 = if var1 == nil then nil else {
		universeId = var1.universeId,
		placeId = var1.placeId,
		sessionId = var1.sessionId,
		experienceName = var1.experienceName,
		gameIcon = var1.gameIcon,
		isNewGameTarget = var1.isNewGameTarget
	}
	local var3 = reactModule.useCallback(function()
		-- upvalues: screenProps (ref), navigation (ref)
		if screenProps.onClose then
			screenProps.onClose()
			
			return
		end
		navigation.goBack()
	end, { navigation, screenProps.onClose })
	
	return if var2 == nil then nil else reactModule.createElement(privateInvitesPickerContainerModule, {
		universeId = var2.universeId,
		onClose = var3,
		onInvitesSent = var3
	})
end

local function BuildPlaytestInviteManagementScreen(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), buildNavigationParamsModule (ref), reactModule (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), privateInvitesManagementContainerModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref), privateInvitesPickerHostModule (ref)
	local pageTitle = useLocalization({
		pageTitle = localizationStringsModule.PRIVATE_INVITES_PAGE_TITLE
	}).pageTitle
	local navigation = p1.navigation
	local screenProps = p1.screenProps or {}
	local var1 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
	local var2 = if var1 == nil then nil else {
		universeId = var1.universeId,
		placeId = var1.placeId,
		sessionId = var1.sessionId,
		experienceName = var1.experienceName,
		gameIcon = var1.gameIcon,
		isNewGameTarget = var1.isNewGameTarget
	}
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4(false)
	end, {})
	local var6 = if var2 == nil then nil else reactModule.createElement(overflowMenuPageShellModule, {
		testId = "BuildPage.playtestInviteManagement.Page",
		title = pageTitle,
		closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
		onClose = reactModule.useCallback(function()
			-- upvalues: navigation (ref)
			navigation.goBack()
		end, { navigation }),
		content = reactModule.createElement(privateInvitesManagementContainerModule, {
			universeId = var2.universeId,
			onOpenInvitePicker = reactModule.useCallback(function()
				-- upvalues: var4 (ref)
				var4(true)
			end, {})
		})
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Page = if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var6 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var6 }),
		Picker = if var3 and var2 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
			universeId = var2.universeId,
			onClose = var5,
			onInvitesSent = var5
		}) else nil
	})
end

local function BuildTitleDescriptionContent(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), gameInfoUtilsModule (ref), getTargetWithGameInfo (ref), reactModule (ref), titleDescriptionPageModule (ref)
	local loading = useLocalization({ loading = localizationStringsModule.BUILD_MENU_LOADING }).loading
	local var1 = gameInfoUtilsModule.useGameInfo(p1.target.universeId)
	
	if not gameInfoUtilsModule.isTitleDescriptionReady(var1) then
		return nil
	end
	local var2 = getTargetWithGameInfo(p1.target, var1, loading)
	
	return if var2 == nil then nil else reactModule.createElement(titleDescriptionPageModule, {
		universeId = var2.universeId,
		titleText = var2.experienceName or loading,
		descriptionText = var2.description or "",
		onBack = p1.onBack,
		testId = p1.testId
	})
end

local _ = function(p1, p2)
	-- upvalues: fFlagBuildPublishNavigationSheetModule (ref), buildNavigationParamsModule (ref)
	return if fFlagBuildPublishNavigationSheetModule and p2 ~= nil and buildNavigationParamsModule.getShouldDismissOnBack(p1) then p2 else p1.goBack
end

return {
	Screens = t,
	SCREEN_BY_PAGE = t_1,
	BuildPublishScreen = BuildPublishScreen,
	BuildSettingsScreen = BuildSettingsScreen,
	BuildMonetizationScreen = BuildMonetizationScreen,
	BuildStatsScreen = function(p1)
		-- upvalues: useLocalization (ref), localizationStringsModule (ref), buildNavigationParamsModule (ref), reactModule (ref), buildExperience (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
		local stats = useLocalization({ stats = localizationStringsModule.BUILD_MENU_STATS }).stats
		local navigation = p1.navigation
		local screenProps = p1.screenProps or {}
		local var1 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var2 = if var1 == nil then nil else {
			universeId = var1.universeId,
			placeId = var1.placeId,
			sessionId = var1.sessionId,
			experienceName = var1.experienceName,
			gameIcon = var1.gameIcon,
			isNewGameTarget = var1.isNewGameTarget
		}
		local var3 = if var2 == nil then nil else reactModule.createElement(overflowMenuPageShellModule, {
			testId = "BuildPage.stats.Page",
			scrollPerformanceIntervalName = "LuaApp_Build_Stats_Scroll",
			title = stats,
			closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
			onClose = reactModule.useCallback(function()
				-- upvalues: screenProps (ref), navigation (ref)
				if screenProps.onClose then
					screenProps.onClose()
					
					return
				end
				navigation.goBack()
			end, { navigation, screenProps.onClose }),
			content = reactModule.createElement(require(buildExperience.Components.Analytics.Overview.AnalyticsOverview), {
				universeId = var2.universeId,
				onOpenChat = reactModule.useCallback(function(p2)
					-- upvalues: screenProps (ref), navigation (ref), buildNavigationParamsModule (copy), var2 (ref)
					if screenProps.onOpenChat == nil then
						navigation.navigate(buildNavigationParamsModule.BUILD_CHAT_SCREEN, { target = var2, initialPrompt = p2 })
						
						return
					end
					screenProps.onOpenChat(p2)
				end, { navigation, screenProps.onOpenChat, var2 })
			})
		})
		
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var3 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var3 })
	end,
	BuildAudienceScreen = BuildAudienceScreen,
	BuildPrivateInvitesPickerScreen = BuildPrivateInvitesPickerScreen,
	BuildPlaytestInviteManagementScreen = BuildPlaytestInviteManagementScreen,
	BuildTitleDescriptionScreen = function(p1)
		-- upvalues: buildNavigationParamsModule (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), BuildTitleDescriptionContent (ref), fFlagBuildPublishNavigationSheetModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
		local var1
		local navigation = p1.navigation
		local screenProps = p1.screenProps or {}
		local var2 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var3 = if var2 == nil then nil else {
			universeId = var2.universeId,
			placeId = var2.placeId,
			sessionId = var2.sessionId,
			experienceName = var2.experienceName,
			gameIcon = var2.gameIcon,
			isNewGameTarget = var2.isNewGameTarget
		}
		local var4 = useOnScreenKeyboardVisibleModule()
		
		if var3 == nil then
			var1 = nil
		else
			var1 = reactModule.createElement
			local var5 = BuildTitleDescriptionContent
			local t = {
				testId = "BuildPage.titleDescription.Page",
				target = var3
			}
			local onClose = screenProps.onClose
			t.onBack = if fFlagBuildPublishNavigationSheetModule and onClose ~= nil and buildNavigationParamsModule.getShouldDismissOnBack(navigation) then onClose else navigation.goBack
			var1 = var1(var5, t)
		end
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var1 }) else reactModule.createElement(BuildFullscreenPage, { hideBottomBar = var4, pageContent = var1 })
	end,
	BuildVersionTitleDescriptionScreen = function(p1)
		-- upvalues: buildNavigationParamsModule (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), buildExperience (ref), fFlagBuildPublishNavigationSheetModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
		local createElement
		local navigation = p1.navigation
		local screenProps = p1.screenProps or {}
		local var1 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var2 = if var1 == nil then nil else {
			universeId = var1.universeId,
			placeId = var1.placeId,
			sessionId = var1.sessionId,
			experienceName = var1.experienceName,
			gameIcon = var1.gameIcon,
			isNewGameTarget = var1.isNewGameTarget
		}
		local var3 = useOnScreenKeyboardVisibleModule()
		
		if var2 == nil or var2.placeId == nil then
			createElement = nil
		else
			createElement = reactModule.createElement
			local versionTitleDescriptionPageContainerModule = require(buildExperience.Components.VersionTitleDescriptionPage.VersionTitleDescriptionPageContainer)
			local t = {
				testId = "BuildPage.versionTitleDescription.Page",
				placeId = var2.placeId
			}
			local onClose = screenProps.onClose
			t.onBack = if fFlagBuildPublishNavigationSheetModule and onClose ~= nil and buildNavigationParamsModule.getShouldDismissOnBack(navigation) then onClose else navigation.goBack
			createElement = createElement(versionTitleDescriptionPageContainerModule, t)
		end
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = createElement }) else reactModule.createElement(BuildFullscreenPage, { hideBottomBar = var3, pageContent = createElement })
	end,
	BuildMediaSelectionScreen = function(p1)
		-- upvalues: buildNavigationParamsModule (ref), fFlagBuildPublishNavigationSheetModule (ref), reactModule (ref), mediaSelectionPageModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
		local navigation = p1.navigation
		local screenProps = p1.screenProps or {}
		local target = buildNavigationParamsModule.getTarget(navigation)
		local onClose = screenProps.onClose
		onClose = if target == nil or target.universeId == nil then nil else reactModule.createElement(mediaSelectionPageModule, {
			onClose = if fFlagBuildPublishNavigationSheetModule and onClose ~= nil and buildNavigationParamsModule.getShouldDismissOnBack(navigation) then onClose else navigation.goBack,
			universeId = target.universeId
		})
		
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = onClose }) else reactModule.createElement(BuildFullscreenPage, { pageContent = onClose })
	end
}