local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local DataHydrationModule = require(Parent.DataHydration)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local View = FoundationModule.View
local AudienceConfigurationContentModule = require(BuildExperience.Components.GameConfigurations.AudienceConfigurationContent.AudienceConfigurationContent)
local BuildOverflowMenuPageModule = require(script.Parent.BuildOverflowMenuPage)
local OverflowMenuPageShellModule = require(script.Parent.OverflowMenuPageShell)
local TitleDescriptionPageModule = require(BuildExperience.Components.TitleDescriptionPage.TitleDescriptionPage)
local MediaSelectionPageModule = require(BuildExperience.Components.MediaSelectionPage.MediaSelectionPage)
local BuildNavigationParamsModule = require(BuildExperience.utils.BuildNavigationParams)
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local UseBuildPageLayoutModule = require(BuildExperience.utils.useBuildPageLayout)
local UseOnScreenKeyboardVisibleModule = require(BuildExperience.utils.useOnScreenKeyboardVisible)
local IconName = FoundationModule.Enums.IconName
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Screens = {
	BuildPublish = "BuildPublish",
	BuildSettings = "BuildSettings",
	BuildAudience = "BuildAudience",
	BuildTitleDescription = "BuildTitleDescription",
	BuildMediaSelection = "BuildMediaSelection"
}

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

local _ = function(p1)
	return if p1 == nil or p1.isUnavailable or typeof(p1.name) ~= "string" or p1.name == "" then nil else p1.name
end

local function getTargetWithGameInfo(TargetWithGameInfo, p1)
	if TargetWithGameInfo == nil then
		return TargetWithGameInfo
	else
		local NoIsUnavailable: boolean = p1 ~= nil and not p1.isUnavailable
		local v1 = if NoIsUnavailable then p1 else nil
		local Creator = if v1 then v1.creator else nil
		
		return {
			universeId = TargetWithGameInfo.universeId,
			placeId = TargetWithGameInfo.placeId or (if v1 then tonumber(v1.rootPlaceId) else nil),
			sessionId = TargetWithGameInfo.sessionId,
			experienceName = if p1 == nil or p1.isUnavailable or typeof(p1.name) ~= "string" or p1.name == "" then nil else p1.name,
			description = if v1 then v1.description or "" else "Loading...",
			creatorName = if Creator and Creator.name ~= "" then Creator.name else "Loading...",
			gameIcon = TargetWithGameInfo.gameIcon,
			isCreatorVerified = if Creator then Creator.hasVerifiedBadge == true else false,
			isNewGameTarget = TargetWithGameInfo.isNewGameTarget
		}
	end
end

local _ = function(p1): boolean
	return (if p1 == nil or p1.isUnavailable or typeof(p1.name) ~= "string" or p1.name == "" then nil else p1.name) ~= nil
end

local function useGameInfo(UniverseId)
	-- upvalues: ReactModule (copy), SignalsModule (copy), DataHydrationModule (copy), SignalsReactModule (copy)
	local Text = if UniverseId == nil then nil else tostring(UniverseId)
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Text (copy), DataHydrationModule (upval)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: Text (upval), DataHydrationModule (upval)
			return if Text == nil then nil else DataHydrationModule.Game.getGameInfoStore(p1).getAndFetchGameInfo(Text).data(p1)
		end)
	end, { Text })))
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
	-- upvalues: BuildNavigationParamsModule (copy), useGameInfo (copy), getTargetWithGameInfo (copy), ReactModule (copy), Screens (copy), BuildOverflowMenuPageModule (copy), BuildSheetPage (copy), BuildFullscreenPage (copy)
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
	local UseGameInfoResult = useGameInfo(if Config then Config.universeId else nil)
	local TargetWithGameInfo = getTargetWithGameInfo(Config, UseGameInfoResult)
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
		-- upvalues: UseGameInfoResult (copy), ScreenProps (copy), Navigation (copy), Screens (upval), TargetWithGameInfo (copy)
		if (if UseGameInfoResult == nil or UseGameInfoResult.isUnavailable or typeof(UseGameInfoResult.name) ~= "string" or UseGameInfoResult.name == "" then nil else UseGameInfoResult.name) == nil then return end
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
	local Element = if TargetWithGameInfo == nil then nil else ReactModule.createElement(BuildOverflowMenuPageModule, {
		page = Page,
		target = TargetWithGameInfo,
		testId = TestId,
		onClose = UseResult,
		onOpenAudiencePage = UseResult1,
		onOpenTitleDescriptionPage = UseResult2,
		onOpenMediaSelectionPage = UseResult3,
		showPreviewButton = ScreenProps.showPreviewButton
	})
	
	return if ScreenProps.onClose then ReactModule.createElement(BuildSheetPage, { pageContent = Element }) else ReactModule.createElement(BuildFullscreenPage, { pageContent = Element })
end

local function BuildTitleDescriptionContent(p1)
	-- upvalues: useGameInfo (copy), getTargetWithGameInfo (copy), ReactModule (copy), TitleDescriptionPageModule (copy)
	local UseGameInfoResult = useGameInfo(p1.target.universeId)
	
	if (if UseGameInfoResult == nil or UseGameInfoResult.isUnavailable or typeof(UseGameInfoResult.name) ~= "string" or UseGameInfoResult.name == "" then nil else UseGameInfoResult.name) ~= nil then
		local TargetWithGameInfo = getTargetWithGameInfo(p1.target, UseGameInfoResult)
		
		return if TargetWithGameInfo == nil then nil else ReactModule.createElement(TitleDescriptionPageModule, {
			universeId = TargetWithGameInfo.universeId,
			titleText = TargetWithGameInfo.experienceName or "Loading...",
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
	SCREEN_BY_PAGE = {
		publish = Screens.BuildPublish,
		settings = Screens.BuildSettings
	},
	BuildPublishScreen = function(p1)
		-- upvalues: ConfigurationScreen (copy)
		return ConfigurationScreen(p1, "publish", "BuildPage.publish.Page")
	end,
	BuildSettingsScreen = function(p1)
		-- upvalues: ConfigurationScreen (copy)
		return ConfigurationScreen(p1, "settings", "BuildPage.settings.Page")
	end,
	BuildAudienceScreen = function(p1)
		-- upvalues: BuildNavigationParamsModule (copy), ReactModule (copy), OverflowMenuPageShellModule (copy), IconName (copy), AudienceConfigurationContentModule (copy), BuildSheetPage (copy), BuildFullscreenPage (copy)
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
			title = "Audience",
			testId = "BuildPage.audience.Page",
			closeIcon = IconName.ChevronLargeLeft,
			onClose = UseResult,
			content = ReactModule.createElement(AudienceConfigurationContentModule, { universeId = Config.universeId })
		})
		
		return if ScreenProps.onClose then ReactModule.createElement(BuildSheetPage, { pageContent = Element }) else ReactModule.createElement(BuildFullscreenPage, { pageContent = Element })
	end,
	BuildTitleDescriptionScreen = function(p1)
		-- upvalues: BuildNavigationParamsModule (copy), UseOnScreenKeyboardVisibleModule (copy), ReactModule (copy), BuildTitleDescriptionContent (copy), BuildSheetPage (copy), BuildFullscreenPage (copy)
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
		local Element = if Config == nil then nil else ReactModule.createElement(BuildTitleDescriptionContent, {
			testId = "BuildPage.titleDescription.Page",
			target = Config,
			onBack = Navigation.goBack
		})
		
		return if ScreenProps.onClose then ReactModule.createElement(BuildSheetPage, { pageContent = Element }) else ReactModule.createElement(BuildFullscreenPage, {
			hideBottomBar = UseOnScreenKeyboardVisibleModuleResult,
			pageContent = Element
		})
	end,
	BuildMediaSelectionScreen = function(p1)
		-- upvalues: BuildNavigationParamsModule (copy), UseBuildPageLayoutModule (copy), ReactModule (copy), MediaSelectionPageModule (copy), FullscreenPageWithSafeArea (copy)
		local Navigation = p1.navigation
		local Target = BuildNavigationParamsModule.getTarget(Navigation)
		local UseBuildPageLayoutModuleResult = UseBuildPageLayoutModule()
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: Navigation (copy)
			Navigation.goBack()
		end, { Navigation })
		
		return ReactModule.createElement(FullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BackgroundColor3 = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Color3,
			BackgroundTransparency = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Transparency,
			includeBottomBar = UseBuildPageLayoutModuleResult.shouldIncludeBottomBar
		}, {
			Page = if Target == nil or Target.universeId == nil then nil else ReactModule.createElement(MediaSelectionPageModule, { onClose = UseResult, universeId = Target.universeId })
		})
	end
}