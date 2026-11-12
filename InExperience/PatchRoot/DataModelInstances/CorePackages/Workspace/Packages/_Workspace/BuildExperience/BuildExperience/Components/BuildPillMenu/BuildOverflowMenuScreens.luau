local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(Parent.DataHydration)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperienceAnalytics = require(Parent.SharedFlags).FFlagBuildExperienceAnalytics
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local View = FoundationModule.View
local AudienceConfigurationContentModule = require(BuildExperience.Components.GameConfigurations.AudienceConfigurationContent.AudienceConfigurationContent)
local PrivateInvitesPickerContainerModule = require(BuildExperience.Components.PrivateInvitesPicker.PrivateInvitesPickerContainer)
local PrivateInvitesPickerHostModule = require(BuildExperience.Components.PrivateInvitesPicker.PrivateInvitesPickerHost)
local PrivateInvitesManagementContainerModule = require(BuildExperience.Components.GameConfigurations.PrivateInvitesManagement.PrivateInvitesManagementContainer)
local BuildOverflowMenuPageModule = require(script.Parent.BuildOverflowMenuPage)
local OverflowMenuPageShellModule = require(script.Parent.OverflowMenuPageShell)
local TitleDescriptionPageModule = require(BuildExperience.Components.TitleDescriptionPage.TitleDescriptionPage)
local MediaSelectionPageModule = require(BuildExperience.Components.MediaSelectionPage.MediaSelectionPage)
local MonetizationPageContainerModule = require(BuildExperience.Components.MonetizationPage.MonetizationPageContainer)
local FFlagBuildPublishNavigationSheetModule = require(BuildExperience.Flags.FFlagBuildPublishNavigationSheet)
local BuildNavigationParamsModule = require(BuildExperience.utils.BuildNavigationParams)
local GameInfoUtilsModule = require(BuildExperience.utils.GameInfoUtils)
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local UseBuildPageLayoutModule = require(BuildExperience.utils.useBuildPageLayout)
local UseOnScreenKeyboardVisibleModule = require(BuildExperience.utils.useOnScreenKeyboardVisible)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local Screens = {
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
local config = {
	publish = Screens.BuildPublish,
	settings = Screens.BuildSettings
}

if FFlagBuildExperienceMonetizationNativeUIModule then
	config.monetization = Screens.BuildMonetization
end
if FFlagBuildExperienceAnalytics then
	config.stats = Screens.BuildStats
end
local function _(TargetWithGameInfo)
	return if TargetWithGameInfo == nil then nil else {
		universeId = TargetWithGameInfo.universeId,
		placeId = TargetWithGameInfo.placeId,
		sessionId = TargetWithGameInfo.sessionId,
		experienceName = TargetWithGameInfo.experienceName,
		gameIcon = TargetWithGameInfo.gameIcon,
		isNewGameTarget = TargetWithGameInfo.isNewGameTarget
	}
end

local function getTargetWithGameInfo(TargetWithGameInfo, UseGameInfoResult, Loading)
	-- upvalues: GameInfoUtilsModule (copy)
	if TargetWithGameInfo == nil then
		return TargetWithGameInfo
	else
		local UseGameInfoResult1 = if GameInfoUtilsModule.isGameInfoReady(UseGameInfoResult) then UseGameInfoResult else nil
		local Creator = if UseGameInfoResult1 then UseGameInfoResult1.creator else nil
		
		return {
			universeId = TargetWithGameInfo.universeId,
			placeId = TargetWithGameInfo.placeId or (if UseGameInfoResult1 then tonumber(UseGameInfoResult1.rootPlaceId) else nil),
			sessionId = TargetWithGameInfo.sessionId,
			experienceName = GameInfoUtilsModule.getGameInfoName(UseGameInfoResult),
			description = if UseGameInfoResult1 then UseGameInfoResult1.description or "" else Loading,
			creatorName = if Creator and Creator.name ~= "" then Creator.name else Loading,
			gameIcon = TargetWithGameInfo.gameIcon,
			isCreatorVerified = if Creator then Creator.hasVerifiedBadge == true else false,
			isNewGameTarget = TargetWithGameInfo.isNewGameTarget
		}
	end
end

local function BuildFullscreenPage(p1)
	-- upvalues: UseBuildPageLayoutModule (copy), ReactModule (copy), FullscreenPageWithSafeArea (copy)
	local UseBuildPageLayoutModuleResult = UseBuildPageLayoutModule()
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = UseBuildPageLayoutModuleResult.shouldIncludeBottomBar and p1.hideBottomBar ~= true
	}, { Page = p1.pageContent })
end

local function BuildSheetPage(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "size-full",
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = UseTokensResult.Color.Surface.Surface_0.Transparency
	}, { Page = p1.pageContent })
end

local function ConfigurationScreen(p1, Page, TestId)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), BuildNavigationParamsModule (copy), GameInfoUtilsModule (copy), getTargetWithGameInfo (copy), ReactModule (copy), Screens (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), BuildOverflowMenuPageModule (copy), BuildSheetPage (copy), BuildFullscreenPage (copy), PrivateInvitesPickerHostModule (copy), BuildExperience (copy)
	local Navigation = p1.navigation
	local ScreenProps = p1.screenProps or {}
	local Target = BuildNavigationParamsModule.getTarget(Navigation) or ScreenProps.target
	local Config = if Target == nil then nil else {
		universeId = Target.universeId,
		placeId = Target.placeId,
		sessionId = Target.sessionId,
		experienceName = Target.experienceName,
		gameIcon = Target.gameIcon,
		isNewGameTarget = Target.isNewGameTarget
	}
	local UseGameInfoResult = GameInfoUtilsModule.useGameInfo(if Config then Config.universeId else nil)
	local TargetWithGameInfo = getTargetWithGameInfo(Config, UseGameInfoResult, UseLocalizationFunction({ loading = LocalizationStringsModule.BUILD_MENU_LOADING }).loading)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: ScreenProps (copy), Navigation (copy)
		if ScreenProps.onClose then
			ScreenProps.onClose()
			
			return
		else
			Navigation.goBack()
		end
	end, { Navigation, ScreenProps.onClose })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: ScreenProps (copy), Navigation (copy), Screens (upval), TargetWithGameInfo (copy)
		if ScreenProps.onOpenAudiencePage then
			ScreenProps.onOpenAudiencePage()
			
			return
		else
			Navigation.navigate(Screens.BuildAudience, { target = TargetWithGameInfo })
		end
	end, {
		Navigation,
		ScreenProps.onOpenAudiencePage,
		TargetWithGameInfo
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: GameInfoUtilsModule (upval), UseGameInfoResult (copy), ScreenProps (copy), Navigation (copy), Screens (upval), TargetWithGameInfo (copy)
		if not GameInfoUtilsModule.isTitleDescriptionReady(UseGameInfoResult) then return end
		if ScreenProps.onOpenTitleDescriptionPage then
			ScreenProps.onOpenTitleDescriptionPage()
			
			return
		else
			Navigation.navigate(Screens.BuildTitleDescription, { target = TargetWithGameInfo })
		end
	end, {
		UseGameInfoResult,
		Navigation,
		ScreenProps.onOpenTitleDescriptionPage,
		TargetWithGameInfo
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: ScreenProps (copy), Navigation (copy), Screens (upval), TargetWithGameInfo (copy)
		if ScreenProps.onOpenMediaSelectionPage then
			ScreenProps.onOpenMediaSelectionPage()
			
			return
		else
			Navigation.navigate(Screens.BuildMediaSelection, { target = TargetWithGameInfo })
		end
	end, {
		Navigation,
		ScreenProps.onOpenMediaSelectionPage,
		TargetWithGameInfo
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: TargetWithGameInfo (copy), ScreenProps (copy), Navigation (copy), Screens (upval)
		if TargetWithGameInfo == nil or TargetWithGameInfo.placeId == nil then return end
		if ScreenProps.onOpenVersionTitleDescriptionPage then
			ScreenProps.onOpenVersionTitleDescriptionPage()
			
			return
		else
			Navigation.navigate(Screens.BuildVersionTitleDescription, { target = TargetWithGameInfo })
		end
	end, {
		Navigation,
		ScreenProps.onOpenVersionTitleDescriptionPage,
		TargetWithGameInfo
	})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: TargetWithGameInfo (copy), ScreenProps (copy), UseStateResult2_1 (copy)
		if TargetWithGameInfo == nil or TargetWithGameInfo.placeId == nil then return end
		if ScreenProps.onOpenVersionHistory then
			ScreenProps.onOpenVersionHistory()
			
			return
		else
			UseStateResult2_1(true)
		end
	end, { ScreenProps.onOpenVersionHistory, TargetWithGameInfo })
	local UseResult6 = if FFlagBuildExperienceMonetizationNativeUIModule then ReactModule.useCallback(function()
		-- upvalues: Navigation (copy), Screens (upval), TargetWithGameInfo (copy)
		Navigation.navigate(Screens.BuildMonetization, { target = TargetWithGameInfo })
	end, { Navigation, TargetWithGameInfo }) else nil
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(false)
	end, {})
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), UseResult (copy)
		UseStateResult2_1(false)
		UseResult()
	end, { UseResult })
	local UseResult9 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	local UseResult10 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: Navigation (copy), Screens (upval), TargetWithGameInfo (copy)
		Navigation.navigate(Screens.BuildPlaytestInviteManagement, { target = TargetWithGameInfo })
	end, { Navigation, TargetWithGameInfo })
	local UseResult12 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), UseResult11 (copy)
		UseStateResult2(false)
		UseResult11()
	end, { UseResult11 })
	local IsSettings = Page == "settings"
	local Element = if TargetWithGameInfo == nil then nil else ReactModule.createElement(BuildOverflowMenuPageModule, {
		page = Page,
		target = TargetWithGameInfo,
		testId = TestId,
		onClose = UseResult,
		onOpenAudiencePage = UseResult1,
		onOpenTitleDescriptionPage = UseResult2,
		onOpenMediaSelectionPage = UseResult3,
		onOpenMonetizationPage = if FFlagBuildExperienceMonetizationNativeUIModule and IsSettings then UseResult6 else nil,
		onOpenVersionTitleDescriptionPage = UseResult4,
		onOpenVersionHistory = UseResult5,
		onOpenPlaytestPicker = if IsSettings then UseResult9 else nil,
		onOpenPlaytestManagement = if IsSettings then UseResult11 else nil,
		showPreviewButton = ScreenProps.showPreviewButton
	})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Page = if ScreenProps.onClose then ReactModule.createElement(BuildSheetPage, { pageContent = Element }) else ReactModule.createElement(BuildFullscreenPage, { pageContent = Element }),
		Picker = if UseStateResult and TargetWithGameInfo ~= nil then ReactModule.createElement(PrivateInvitesPickerHostModule, {
			universeId = TargetWithGameInfo.universeId,
			onClose = UseResult10,
			onInvitesSent = UseResult12
		}) else nil,
		VersionHistory = if UseStateResult1 and TargetWithGameInfo ~= nil and TargetWithGameInfo.placeId ~= nil then ReactModule.createElement(require(BuildExperience.Components.VersionHistory.VersionHistoryContainer), {
			isOpen = true,
			testId = "build-publish-version-history",
			universeId = TargetWithGameInfo.universeId,
			placeId = TargetWithGameInfo.placeId,
			onClose = UseResult7,
			onAgentRollbackStarted = UseResult8
		}) else nil
	})
end

local _ = function(p1, p2)
	-- upvalues: FFlagBuildPublishNavigationSheetModule (copy), BuildNavigationParamsModule (copy)
	return if FFlagBuildPublishNavigationSheetModule and p2 ~= nil and BuildNavigationParamsModule.getShouldDismissOnBack(p1) then p2 else p1.goBack
end

local function BuildTitleDescriptionContent(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), GameInfoUtilsModule (copy), getTargetWithGameInfo (copy), ReactModule (copy), TitleDescriptionPageModule (copy)
	local Loading = UseLocalizationFunction({ loading = LocalizationStringsModule.BUILD_MENU_LOADING }).loading
	local UseGameInfoResult = GameInfoUtilsModule.useGameInfo(p1.target.universeId)
	
	if GameInfoUtilsModule.isTitleDescriptionReady(UseGameInfoResult) then
		local TargetWithGameInfo = getTargetWithGameInfo(p1.target, UseGameInfoResult, Loading)
		
		return if TargetWithGameInfo == nil then nil else ReactModule.createElement(TitleDescriptionPageModule, {
			universeId = TargetWithGameInfo.universeId,
			titleText = TargetWithGameInfo.experienceName or Loading,
			descriptionText = TargetWithGameInfo.description or "",
			onBack = p1.onBack,
			testId = p1.testId
		})
	else
		return nil
	end
end

return {
	Screens = Screens,
	SCREEN_BY_PAGE = config,
	BuildPublishScreen = function(p1)
		-- upvalues: ConfigurationScreen (copy)
		return ConfigurationScreen(p1, "publish", "BuildPage.publish.Page")
	end,
	BuildSettingsScreen = function(p1)
		-- upvalues: ConfigurationScreen (copy)
		return ConfigurationScreen(p1, "settings", "BuildPage.settings.Page")
	end,
	BuildMonetizationScreen = function(p1)
		-- upvalues: BuildNavigationParamsModule (copy), FFlagBuildPublishNavigationSheetModule (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), ReactModule (copy), MonetizationPageContainerModule (copy), BuildSheetPage (copy), BuildFullscreenPage (copy)
		local Navigation = p1.navigation
		local ScreenProps = p1.screenProps or {}
		local Target = BuildNavigationParamsModule.getTarget(Navigation) or ScreenProps.target
		local Config = if Target == nil then nil else {
			universeId = Target.universeId,
			placeId = Target.placeId,
			sessionId = Target.sessionId,
			experienceName = Target.experienceName,
			gameIcon = Target.gameIcon,
			isNewGameTarget = Target.isNewGameTarget
		}
		local OnClose = ScreenProps.onClose
		local OnClose1 = if FFlagBuildPublishNavigationSheetModule and OnClose ~= nil and BuildNavigationParamsModule.getShouldDismissOnBack(Navigation) then OnClose else Navigation.goBack
		local Element = ReactModule.createElement(MonetizationPageContainerModule, {
			onClose = OnClose1,
			onComposerActivated = (if FFlagBuildExperienceMonetizationNativeUIModule and ScreenProps.onClose == nil then p1.onComposerActivated else ScreenProps.onClose) or OnClose1,
			placeId = if Config == nil then nil else Config.placeId,
			sessionId = if Config == nil then nil else Config.sessionId,
			universeId = if Config == nil then nil else Config.universeId
		})
		
		return if ScreenProps.onClose then ReactModule.createElement(BuildSheetPage, { pageContent = Element }) else ReactModule.createElement(BuildFullscreenPage, { pageContent = Element })
	end,
	BuildStatsScreen = function(p1)
		-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), BuildNavigationParamsModule (copy), ReactModule (copy), BuildExperience (copy), OverflowMenuPageShellModule (copy), BuildSheetPage (copy), BuildFullscreenPage (copy)
		local Stats = UseLocalizationFunction({ stats = LocalizationStringsModule.BUILD_MENU_STATS }).stats
		local Navigation = p1.navigation
		local ScreenProps = p1.screenProps or {}
		local Target = BuildNavigationParamsModule.getTarget(Navigation) or ScreenProps.target
		local Config = if Target == nil then nil else {
			universeId = Target.universeId,
			placeId = Target.placeId,
			sessionId = Target.sessionId,
			experienceName = Target.experienceName,
			gameIcon = Target.gameIcon,
			isNewGameTarget = Target.isNewGameTarget
		}
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: ScreenProps (copy), Navigation (copy)
			if ScreenProps.onClose then
				ScreenProps.onClose()
				
				return
			else
				Navigation.goBack()
			end
		end, { Navigation, ScreenProps.onClose })
		local UseResult1 = ReactModule.useCallback(function(InitialPrompt)
			-- upvalues: ScreenProps (copy), Navigation (copy), BuildNavigationParamsModule (upval), Config (copy)
			if ScreenProps.onOpenChat == nil then
				Navigation.navigate(BuildNavigationParamsModule.BUILD_CHAT_SCREEN, { target = Config, initialPrompt = InitialPrompt })
				
				return
			else
				ScreenProps.onOpenChat(InitialPrompt)
			end
		end, { Navigation, ScreenProps.onOpenChat, Config })
		local AnalyticsOverviewModule = require(BuildExperience.Components.Analytics.Overview.AnalyticsOverview)
		local Element = if Config == nil then nil else ReactModule.createElement(OverflowMenuPageShellModule, {
			testId = "BuildPage.stats.Page",
			scrollPerformanceIntervalName = "LuaApp_Build_Stats_Scroll",
			title = Stats,
			onClose = UseResult,
			content = ReactModule.createElement(AnalyticsOverviewModule, { universeId = Config.universeId, onOpenChat = UseResult1 })
		})
		
		return if ScreenProps.onClose then ReactModule.createElement(BuildSheetPage, { pageContent = Element }) else ReactModule.createElement(BuildFullscreenPage, { pageContent = Element })
	end,
	BuildAudienceScreen = function(p1)
		-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), BuildNavigationParamsModule (copy), ReactModule (copy), OverflowMenuPageShellModule (copy), AudienceConfigurationContentModule (copy), BuildSheetPage (copy), BuildFullscreenPage (copy)
		local UseLocalizationResult = UseLocalizationFunction({ audience = LocalizationStringsModule.BUILD_MENU_AUDIENCE })
		local Navigation = p1.navigation
		local ScreenProps = p1.screenProps or {}
		local Target = BuildNavigationParamsModule.getTarget(Navigation) or ScreenProps.target
		local Config = if Target == nil then nil else {
			universeId = Target.universeId,
			placeId = Target.placeId,
			sessionId = Target.sessionId,
			experienceName = Target.experienceName,
			gameIcon = Target.gameIcon,
			isNewGameTarget = Target.isNewGameTarget
		}
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: Navigation (copy)
			Navigation.goBack()
		end, { Navigation })
		local Element = if Config == nil then nil else ReactModule.createElement(OverflowMenuPageShellModule, {
			testId = "BuildPage.audience.Page",
			scrollPerformanceIntervalName = "LuaApp_Build_Audience_Scroll",
			title = UseLocalizationResult.audience,
			onClose = UseResult,
			content = ReactModule.createElement(AudienceConfigurationContentModule, { universeId = Config.universeId })
		})
		
		return if ScreenProps.onClose then ReactModule.createElement(BuildSheetPage, { pageContent = Element }) else ReactModule.createElement(BuildFullscreenPage, { pageContent = Element })
	end,
	BuildPrivateInvitesPickerScreen = function(p1)
		-- upvalues: BuildNavigationParamsModule (copy), ReactModule (copy), PrivateInvitesPickerContainerModule (copy)
		local Navigation = p1.navigation
		local ScreenProps = p1.screenProps or {}
		local Target = BuildNavigationParamsModule.getTarget(Navigation) or ScreenProps.target
		local Config = if Target == nil then nil else {
			universeId = Target.universeId,
			placeId = Target.placeId,
			sessionId = Target.sessionId,
			experienceName = Target.experienceName,
			gameIcon = Target.gameIcon,
			isNewGameTarget = Target.isNewGameTarget
		}
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: ScreenProps (copy), Navigation (copy)
			if ScreenProps.onClose then
				ScreenProps.onClose()
				
				return
			else
				Navigation.goBack()
			end
		end, { Navigation, ScreenProps.onClose })
		
		return if Config == nil then nil else ReactModule.createElement(PrivateInvitesPickerContainerModule, {
			universeId = Config.universeId,
			onClose = UseResult,
			onInvitesSent = UseResult
		})
	end,
	BuildPlaytestInviteManagementScreen = function(p1)
		-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), BuildNavigationParamsModule (copy), ReactModule (copy), OverflowMenuPageShellModule (copy), PrivateInvitesManagementContainerModule (copy), BuildSheetPage (copy), BuildFullscreenPage (copy), PrivateInvitesPickerHostModule (copy)
		local PageTitle = UseLocalizationFunction({
			pageTitle = LocalizationStringsModule.PRIVATE_INVITES_PAGE_TITLE
		}).pageTitle
		local Navigation = p1.navigation
		local ScreenProps = p1.screenProps or {}
		local Target = BuildNavigationParamsModule.getTarget(Navigation) or ScreenProps.target
		local Config = if Target == nil then nil else {
			universeId = Target.universeId,
			placeId = Target.placeId,
			sessionId = Target.sessionId,
			experienceName = Target.experienceName,
			gameIcon = Target.gameIcon,
			isNewGameTarget = Target.isNewGameTarget
		}
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: Navigation (copy)
			Navigation.goBack()
		end, { Navigation })
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(true)
		end, {})
		local UseResult2 = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end, {})
		local Element = if Config == nil then nil else ReactModule.createElement(OverflowMenuPageShellModule, {
			testId = "BuildPage.playtestInviteManagement.Page",
			title = PageTitle,
			onClose = UseResult,
			content = ReactModule.createElement(PrivateInvitesManagementContainerModule, {
				universeId = Config.universeId,
				onOpenInvitePicker = UseResult1
			})
		})
		
		return ReactModule.createElement(ReactModule.Fragment, nil, {
			Page = if ScreenProps.onClose then ReactModule.createElement(BuildSheetPage, { pageContent = Element }) else ReactModule.createElement(BuildFullscreenPage, { pageContent = Element }),
			Picker = if UseStateResult and Config ~= nil then ReactModule.createElement(PrivateInvitesPickerHostModule, {
				universeId = Config.universeId,
				onClose = UseResult2,
				onInvitesSent = UseResult2
			}) else nil
		})
	end,
	BuildTitleDescriptionScreen = function(p1)
		-- upvalues: BuildNavigationParamsModule (copy), UseOnScreenKeyboardVisibleModule (copy), ReactModule (copy), BuildTitleDescriptionContent (copy), FFlagBuildPublishNavigationSheetModule (copy), BuildSheetPage (copy), BuildFullscreenPage (copy)
		local Navigation = p1.navigation
		local ScreenProps = p1.screenProps or {}
		local Target = BuildNavigationParamsModule.getTarget(Navigation) or ScreenProps.target
		local Config = if Target == nil then nil else {
			universeId = Target.universeId,
			placeId = Target.placeId,
			sessionId = Target.sessionId,
			experienceName = Target.experienceName,
			gameIcon = Target.gameIcon,
			isNewGameTarget = Target.isNewGameTarget
		}
		local UseOnScreenKeyboardVisibleModuleResult = UseOnScreenKeyboardVisibleModule()
		local PageContent = nil
		
		if Config == nil then
			PageContent = nil
		else
			local OnClose = ScreenProps.onClose
			PageContent = ReactModule.createElement(BuildTitleDescriptionContent, {
				testId = "BuildPage.titleDescription.Page",
				target = Config,
				onBack = if FFlagBuildPublishNavigationSheetModule and OnClose ~= nil and BuildNavigationParamsModule.getShouldDismissOnBack(Navigation) then OnClose else Navigation.goBack
			})
		end
		return if ScreenProps.onClose then ReactModule.createElement(BuildSheetPage, { pageContent = PageContent }) else ReactModule.createElement(BuildFullscreenPage, {
			hideBottomBar = UseOnScreenKeyboardVisibleModuleResult,
			pageContent = PageContent
		})
	end,
	BuildVersionTitleDescriptionScreen = function(p1)
		-- upvalues: BuildNavigationParamsModule (copy), UseOnScreenKeyboardVisibleModule (copy), ReactModule (copy), BuildExperience (copy), FFlagBuildPublishNavigationSheetModule (copy), BuildSheetPage (copy), BuildFullscreenPage (copy)
		local Navigation = p1.navigation
		local ScreenProps = p1.screenProps or {}
		local Target = BuildNavigationParamsModule.getTarget(Navigation) or ScreenProps.target
		local Config = if Target == nil then nil else {
			universeId = Target.universeId,
			placeId = Target.placeId,
			sessionId = Target.sessionId,
			experienceName = Target.experienceName,
			gameIcon = Target.gameIcon,
			isNewGameTarget = Target.isNewGameTarget
		}
		local UseOnScreenKeyboardVisibleModuleResult = UseOnScreenKeyboardVisibleModule()
		local PageContent = nil
		
		if Config == nil or Config.placeId == nil then
			PageContent = nil
		else
			local OnClose = ScreenProps.onClose
			PageContent = ReactModule.createElement(require(BuildExperience.Components.VersionTitleDescriptionPage.VersionTitleDescriptionPageContainer), {
				testId = "BuildPage.versionTitleDescription.Page",
				placeId = Config.placeId,
				onBack = if FFlagBuildPublishNavigationSheetModule and OnClose ~= nil and BuildNavigationParamsModule.getShouldDismissOnBack(Navigation) then OnClose else Navigation.goBack
			})
		end
		return if ScreenProps.onClose then ReactModule.createElement(BuildSheetPage, { pageContent = PageContent }) else ReactModule.createElement(BuildFullscreenPage, {
			hideBottomBar = UseOnScreenKeyboardVisibleModuleResult,
			pageContent = PageContent
		})
	end,
	BuildMediaSelectionScreen = function(p1)
		-- upvalues: BuildNavigationParamsModule (copy), FFlagBuildPublishNavigationSheetModule (copy), ReactModule (copy), MediaSelectionPageModule (copy), BuildSheetPage (copy), BuildFullscreenPage (copy)
		local Navigation = p1.navigation
		local ScreenProps = p1.screenProps or {}
		local Target = BuildNavigationParamsModule.getTarget(Navigation)
		local OnClose = ScreenProps.onClose
		local OnClose1 = if FFlagBuildPublishNavigationSheetModule and OnClose ~= nil and BuildNavigationParamsModule.getShouldDismissOnBack(Navigation) then OnClose else Navigation.goBack
		local Element = if Target == nil or Target.universeId == nil then nil else ReactModule.createElement(MediaSelectionPageModule, { onClose = OnClose1, universeId = Target.universeId })
		
		return if ScreenProps.onClose then ReactModule.createElement(BuildSheetPage, { pageContent = Element }) else ReactModule.createElement(BuildFullscreenPage, { pageContent = Element })
	end
}