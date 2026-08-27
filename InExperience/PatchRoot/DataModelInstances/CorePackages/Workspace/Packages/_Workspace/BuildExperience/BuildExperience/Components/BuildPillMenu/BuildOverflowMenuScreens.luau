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
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
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

local _ = function(p1)
	return if p1 == nil or p1.isUnavailable or (typeof(p1.name) ~= "string" or p1.name == "") then nil else p1.name
end

local function getTargetWithGameInfo(p1, p2, p3)
	-- upvalues: fFlagBuildLocalization (ref), localizationStringsModule (ref)
	if p1 == nil then
		return p1
	end
	local var1
	local var2 = if p2 ~= nil and not p2.isUnavailable then p2 else nil
	local var3 = if var2 then var2.creator else nil
	local t = {
		universeId = p1.universeId,
		placeId = p1.placeId or (if var2 then tonumber(var2.rootPlaceId) else nil),
		sessionId = p1.sessionId,
		experienceName = if p2 == nil or p2.isUnavailable or (typeof(p2.name) ~= "string" or p2.name == "") then nil else p2.name,
		description = if var2 then var2.description or "" elseif fFlagBuildLocalization then p3 else localizationStringsModule.BUILD_MENU_LOADING,
		creatorName = if var3 and var3.name ~= "" then var3.name elseif fFlagBuildLocalization then p3 else localizationStringsModule.BUILD_MENU_LOADING,
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

local _ = function(p1)
	return (if p1 == nil or p1.isUnavailable or (typeof(p1.name) ~= "string" or p1.name == "") then nil else p1.name) ~= nil
end

local function useGameInfo(p1)
	-- upvalues: reactModule (ref), signalsModule (ref), dataHydrationModule (ref), signalsReactModule (ref)
	local var1 = if p1 == nil then nil else tostring(p1)
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (ref), dataHydrationModule (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var1 (copy), dataHydrationModule (copy)
			return if var1 == nil then nil else dataHydrationModule.Game.getGameInfoStore(p2).getAndFetchGameInfo(var1).data(p2)
		end)
	end, { var1 }))
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
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), buildNavigationParamsModule (ref), useGameInfo (ref), getTargetWithGameInfo (ref), reactModule (ref), t (ref), fFlagBuildAgentRollbackModule (ref), buildOverflowMenuPageModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref), privateInvitesPickerHostModule (ref), buildExperience (ref)
	local var1 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({ loading = localizationStringsModule.BUILD_MENU_LOADING }) else nil).loading else nil
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
	local var4 = useGameInfo(if var3 then var3.universeId else nil)
	local var5 = getTargetWithGameInfo(var3, var4, var1)
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(false)
	local var10 = reactModule.useCallback(function()
		-- upvalues: screenProps (ref), navigation (ref)
		if screenProps.onClose then
			screenProps.onClose()
			
			return
		end
		navigation.goBack()
	end, { navigation, screenProps.onClose })
	local var11 = reactModule.useCallback(function()
		-- upvalues: screenProps (ref), navigation (ref), t (copy), var5 (ref)
		if screenProps.onOpenAudiencePage then
			screenProps.onOpenAudiencePage()
			
			return
		end
		navigation.navigate(t.BuildAudience, { target = var5 })
	end, { navigation, screenProps.onOpenAudiencePage, var5 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), screenProps (ref), navigation (ref), t (copy), var5 (ref)
		if (if var4 == nil or var4.isUnavailable or (typeof(var4.name) ~= "string" or var4.name == "") then nil else var4.name) == nil then return end
		if screenProps.onOpenTitleDescriptionPage then
			screenProps.onOpenTitleDescriptionPage()
			
			return
		end
		navigation.navigate(t.BuildTitleDescription, { target = var5 })
	end, {
		var4,
		navigation,
		screenProps.onOpenTitleDescriptionPage,
		var5
	})
	local var13 = reactModule.useCallback(function()
		-- upvalues: screenProps (ref), navigation (ref), t (copy), var5 (ref)
		if screenProps.onOpenMediaSelectionPage then
			screenProps.onOpenMediaSelectionPage()
			
			return
		end
		navigation.navigate(t.BuildMediaSelection, { target = var5 })
	end, { navigation, screenProps.onOpenMediaSelectionPage, var5 })
	local var14 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), screenProps (ref), navigation (ref), t (copy)
		if var5 == nil or var5.placeId == nil then return end
		if screenProps.onOpenVersionTitleDescriptionPage then
			screenProps.onOpenVersionTitleDescriptionPage()
			
			return
		end
		navigation.navigate(t.BuildVersionTitleDescription, { target = var5 })
	end, {
		navigation,
		screenProps.onOpenVersionTitleDescriptionPage,
		var5
	})
	local var15 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), screenProps (ref), var9 (ref)
		if var5 == nil or var5.placeId == nil then return end
		if screenProps.onOpenVersionHistory then
			screenProps.onOpenVersionHistory()
			
			return
		end
		var9(true)
	end, { screenProps.onOpenVersionHistory, var5 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: var9 (ref)
		var9(false)
	end, {})
	local var17 = if fFlagBuildAgentRollbackModule then reactModule.useCallback(function()
		-- upvalues: var9 (ref), var10 (ref)
		var9(false)
		var10()
	end, { var10 }) else nil
	local var18 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		var7(true)
	end, {})
	local var19 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		var7(false)
	end, {})
	local var20 = reactModule.useCallback(function()
		-- upvalues: navigation (ref), t (copy), var5 (ref)
		navigation.navigate(t.BuildPlaytestInviteManagement, { target = var5 })
	end, { navigation, var5 })
	local var21 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var20 (ref)
		var7(false)
		var20()
	end, { var20 })
	local isSettings = p2 == "settings"
	local var22 = if var5 == nil then nil else reactModule.createElement(buildOverflowMenuPageModule, {
		page = p2,
		target = var5,
		testId = p3,
		onClose = var10,
		onOpenAudiencePage = var11,
		onOpenTitleDescriptionPage = var12,
		onOpenMediaSelectionPage = var13,
		onOpenVersionTitleDescriptionPage = var14,
		onOpenVersionHistory = var15,
		onOpenPlaytestPicker = if isSettings then var18 else nil,
		onOpenPlaytestManagement = if isSettings then var20 else nil,
		showPreviewButton = screenProps.showPreviewButton
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Page = if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var22 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var22 }),
		Picker = if var6 and var5 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
			universeId = var5.universeId,
			onClose = var19,
			onInvitesSent = var21
		}) else nil,
		VersionHistory = if var8 and var5 ~= nil and var5.placeId ~= nil then reactModule.createElement(require(buildExperience.Components.VersionHistory.VersionHistoryContainer), {
			isOpen = true,
			testId = "build-publish-version-history",
			universeId = var5.universeId,
			placeId = var5.placeId,
			onClose = var16,
			onAgentRollbackStarted = if fFlagBuildAgentRollbackModule then var17 else nil
		}) else nil
	})
end

local function BuildTitleDescriptionContent(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useGameInfo (ref), getTargetWithGameInfo (ref), reactModule (ref), titleDescriptionPageModule (ref)
	local var1 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({ loading = localizationStringsModule.BUILD_MENU_LOADING }) else nil).loading else nil
	local var2 = useGameInfo(p1.target.universeId)
	
	if (if var2 == nil or var2.isUnavailable or (typeof(var2.name) ~= "string" or var2.name == "") then nil else var2.name) == nil then
		return nil
	end
	local var3 = getTargetWithGameInfo(p1.target, var2, var1)
	
	return if var3 == nil then nil else reactModule.createElement(titleDescriptionPageModule, {
		universeId = var3.universeId,
		titleText = var3.experienceName or (if fFlagBuildLocalization then var1 else localizationStringsModule.BUILD_MENU_LOADING),
		descriptionText = var3.description or "",
		onBack = p1.onBack,
		testId = p1.testId
	})
end

return {
	Screens = t,
	SCREEN_BY_PAGE = t_1,
	BuildPublishScreen = function(p1)
		-- upvalues: ConfigurationScreen (ref)
		return ConfigurationScreen(p1, "publish", "BuildPage.publish.Page")
	end,
	BuildSettingsScreen = function(value)
		-- upvalues: ConfigurationScreen (ref)
		return ConfigurationScreen(value, "settings", "BuildPage.settings.Page")
	end,
	BuildAudienceScreen = function(p1)
		-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), buildNavigationParamsModule (ref), reactModule (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), audienceConfigurationContentModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
		local var1 = if fFlagBuildLocalization then useLocalization({ audience = localizationStringsModule.BUILD_MENU_AUDIENCE }) else nil
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
			title = if fFlagBuildLocalization then var1.audience else localizationStringsModule.BUILD_MENU_AUDIENCE,
			closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
			onClose = reactModule.useCallback(function()
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation }),
			scrollPerformanceIntervalName = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then "LuaApp_Build_Audience_Scroll" else nil,
			content = reactModule.createElement(audienceConfigurationContentModule, { universeId = var3.universeId })
		})
		
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var4 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var4 })
	end,
	BuildPrivateInvitesPickerScreen = function(p1)
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
	end,
	BuildPlaytestInviteManagementScreen = function(p1)
		-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), buildNavigationParamsModule (ref), reactModule (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), privateInvitesManagementContainerModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref), privateInvitesPickerHostModule (ref)
		local var1 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
			pageTitle = localizationStringsModule.PRIVATE_INVITES_PAGE_TITLE
		}) else nil).pageTitle else localizationStringsModule.PRIVATE_INVITES_PAGE_TITLE
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
		local var4, var5 = reactModule.useState(false)
		local var6 = reactModule.useCallback(function()
			-- upvalues: var5 (ref)
			var5(false)
		end, {})
		local var7 = if var3 == nil then nil else reactModule.createElement(overflowMenuPageShellModule, {
			testId = "BuildPage.playtestInviteManagement.Page",
			title = var1,
			closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
			onClose = reactModule.useCallback(function()
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation }),
			content = reactModule.createElement(privateInvitesManagementContainerModule, {
				universeId = var3.universeId,
				onOpenInvitePicker = reactModule.useCallback(function()
					-- upvalues: var5 (ref)
					var5(true)
				end, {})
			})
		})
		
		return reactModule.createElement(reactModule.Fragment, nil, {
			Page = if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var7 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var7 }),
			Picker = if var4 and var3 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
				universeId = var3.universeId,
				onClose = var6,
				onInvitesSent = var6
			}) else nil
		})
	end,
	BuildTitleDescriptionScreen = function(p1)
		-- upvalues: buildNavigationParamsModule (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), BuildTitleDescriptionContent (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
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
		local var3 = if var2 == nil then nil else reactModule.createElement(BuildTitleDescriptionContent, {
			testId = "BuildPage.titleDescription.Page",
			target = var2,
			onBack = navigation.goBack
		})
		
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var3 }) else reactModule.createElement(BuildFullscreenPage, {
			hideBottomBar = useOnScreenKeyboardVisibleModule(),
			pageContent = var3
		})
	end,
	BuildVersionTitleDescriptionScreen = function(p1)
		-- upvalues: buildNavigationParamsModule (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), buildExperience (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
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
		local var3 = if var2 == nil or var2.placeId == nil then nil else reactModule.createElement(require(buildExperience.Components.VersionTitleDescriptionPage.VersionTitleDescriptionPageContainer), {
			testId = "BuildPage.versionTitleDescription.Page",
			placeId = var2.placeId,
			onBack = navigation.goBack
		})
		
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var3 }) else reactModule.createElement(BuildFullscreenPage, {
			hideBottomBar = useOnScreenKeyboardVisibleModule(),
			pageContent = var3
		})
	end,
	BuildMediaSelectionScreen = function(p1)
		-- upvalues: buildNavigationParamsModule (ref), useBuildPageLayoutModule (ref), reactModule (ref), mediaSelectionPageModule (ref), fullscreenPageWithSafeArea (ref)
		local navigation = p1.navigation
		local target = buildNavigationParamsModule.getTarget(navigation)
		local var1 = useBuildPageLayoutModule()
		
		return reactModule.createElement(fullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BackgroundColor3 = var1.tokens.Color.Surface.Surface_0.Color3,
			BackgroundTransparency = var1.tokens.Color.Surface.Surface_0.Transparency,
			includeBottomBar = var1.shouldIncludeBottomBar
		}, {
			Page = if target == nil or target.universeId == nil then nil else reactModule.createElement(mediaSelectionPageModule, {
				onClose = reactModule.useCallback(function()
					-- upvalues: navigation (ref)
					navigation.goBack()
				end, { navigation }),
				universeId = target.universeId
			})
		})
	end
}