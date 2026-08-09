local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local dataHydrationModule = require(parent.DataHydration)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local view = foundationModule.View
local audienceConfigurationContentModule = require(buildExperience.Components.GameConfigurations.AudienceConfigurationContent.AudienceConfigurationContent)
local buildOverflowMenuPageModule = require(script.Parent.BuildOverflowMenuPage)
local overflowMenuPageShellModule = require(script.Parent.OverflowMenuPageShell)
local titleDescriptionPageModule = require(buildExperience.Components.TitleDescriptionPage.TitleDescriptionPage)
local mediaSelectionPageModule = require(buildExperience.Components.MediaSelectionPage.MediaSelectionPage)
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
	BuildTitleDescription = "BuildTitleDescription",
	BuildMediaSelection = "BuildMediaSelection"
}
local t_1 = { publish = t.BuildPublish, settings = t.BuildSettings }

local function _(p0) --[[ line: 57 | named "normalizeTarget" ]]
	return if p0 == nil then nil else {
		universeId = p0.universeId,
		placeId = p0.placeId,
		sessionId = p0.sessionId,
		experienceName = p0.experienceName,
		gameIcon = p0.gameIcon,
		isNewGameTarget = p0.isNewGameTarget
	}
end

local function getTargetWithGameInfo(p1, p2) --[[ line: 72 ]]
	if p1 == nil then
		return p1
	end
	local var25
	local var22 = if p2 ~= nil and not p2.isUnavailable then p2 else nil
	local var23 = if var22 then var22.creator else nil
	local t = {
		universeId = p1.universeId,
		placeId = p1.placeId or (if var22 then tonumber(var22.rootPlaceId) else nil),
		sessionId = p1.sessionId,
		experienceName = if var22 and var22.name ~= "" then var22.name else p1.experienceName,
		description = if var22 then var22.description or "" else "Loading...",
		creatorName = if var23 and var23.name ~= "" then var23.name else "Loading...",
		gameIcon = p1.gameIcon
	}
	
	if var23 then
		var25 = var23.hasVerifiedBadge == true
		var25 = nil
	else
		var25 = false
	end
	t.isCreatorVerified = var25
	t.isNewGameTarget = p1.isNewGameTarget
	
	return t
end

local function useGameInfo(p3) --[[ line: 98 ]]
	-- upvalues: reactModule (ref), signalsModule (ref), dataHydrationModule (ref), signalsReactModule (ref)
	local var26 = if p3 == nil then nil else tostring(p3)
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 100 ]]
		-- upvalues: signalsModule (copy), var26 (ref), dataHydrationModule (copy)
		return signalsModule.createComputed(function(p4) --[[ line: 101 ]]
			-- upvalues: var26 (copy), dataHydrationModule (copy)
			return if var26 == nil then nil else dataHydrationModule.Game.getGameInfoStore(p4).getAndFetchGameInfo(var26).data(p4)
		end)
	end, { var26 }))
end

local function BuildFullscreenPage(p5) --[[ line: 118 ]]
	-- upvalues: useBuildPageLayoutModule (ref), reactModule (ref), fullscreenPageWithSafeArea (ref)
	local var27 = useBuildPageLayoutModule()
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var27.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var27.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var27.shouldIncludeBottomBar and p5.hideBottomBar ~= true
	}, { Page = p5.pageContent })
end

local function BuildSheetPage(p6) --[[ line: 131 ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref)
	local var28 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "size-full",
		BackgroundColor3 = var28.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var28.Color.Surface.Surface_0.Transparency
	}, { Page = p6.pageContent })
end

local function ConfigurationScreen(p7, p8, p9) --[[ line: 143 ]]
	-- upvalues: buildNavigationParamsModule (ref), useGameInfo (ref), getTargetWithGameInfo (ref), reactModule (ref), t (ref), buildOverflowMenuPageModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
	local navigation = p7.navigation
	local screenProps = p7.screenProps or {}
	local var30 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
	local var31 = if var30 == nil then nil else {
		universeId = var30.universeId,
		placeId = var30.placeId,
		sessionId = var30.sessionId,
		experienceName = var30.experienceName,
		gameIcon = var30.gameIcon,
		isNewGameTarget = var30.isNewGameTarget
	}
	local var32 = getTargetWithGameInfo(var31, useGameInfo(if var31 then var31.universeId else nil))
	local var33 = if var32 == nil then nil else reactModule.createElement(buildOverflowMenuPageModule, {
		page = p8,
		target = var32,
		testId = p9,
		onClose = reactModule.useCallback(function() --[[ line: 150 ]]
			-- upvalues: screenProps (ref), navigation (ref)
			if screenProps.onClose then
				screenProps.onClose()
				
				return
			end
			navigation.goBack()
		end, { navigation, screenProps.onClose }),
		onOpenAudiencePage = reactModule.useCallback(function() --[[ line: 157 ]]
			-- upvalues: screenProps (ref), navigation (ref), t (copy), var32 (ref)
			if screenProps.onOpenAudiencePage then
				screenProps.onOpenAudiencePage()
				
				return
			end
			navigation.navigate(t.BuildAudience, { target = var32 })
		end, { navigation, screenProps.onOpenAudiencePage, var32 }),
		onOpenTitleDescriptionPage = reactModule.useCallback(function() --[[ line: 166 ]]
			-- upvalues: screenProps (ref), navigation (ref), t (copy), var32 (ref)
			if screenProps.onOpenTitleDescriptionPage then
				screenProps.onOpenTitleDescriptionPage()
				
				return
			end
			navigation.navigate(t.BuildTitleDescription, { target = var32 })
		end, {
			navigation,
			screenProps.onOpenTitleDescriptionPage,
			var32
		}),
		onOpenMediaSelectionPage = reactModule.useCallback(function() --[[ line: 175 ]]
			-- upvalues: screenProps (ref), navigation (ref), t (copy), var32 (ref)
			if screenProps.onOpenMediaSelectionPage then
				screenProps.onOpenMediaSelectionPage()
				
				return
			end
			navigation.navigate(t.BuildMediaSelection, { target = var32 })
		end, { navigation, screenProps.onOpenMediaSelectionPage, var32 }),
		showPreviewButton = screenProps.showPreviewButton
	})
	
	return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var33 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var33 })
end

local function BuildTitleDescriptionContent(p10) --[[ line: 255 ]]
	-- upvalues: useGameInfo (ref), getTargetWithGameInfo (ref), reactModule (ref), titleDescriptionPageModule (ref)
	local var34 = useGameInfo(p10.target.universeId)
	
	if var34 == nil or var34.isUnavailable then
		return nil
	end
	local var35 = getTargetWithGameInfo(p10.target, var34)
	
	return if var35 == nil then nil else reactModule.createElement(titleDescriptionPageModule, {
		universeId = var35.universeId,
		titleText = var35.experienceName or "Loading...",
		descriptionText = var35.description or "",
		onBack = p10.onBack,
		testId = p10.testId
	})
end

return {
	Screens = t,
	SCREEN_BY_PAGE = t_1,
	BuildPublishScreen = function(p11) --[[ line: 209 ]]
		-- upvalues: ConfigurationScreen (ref)
		return ConfigurationScreen(p11, "publish", "BuildPage.publish.Page")
	end,
	BuildSettingsScreen = function(value) --[[ line: 213 ]]
		-- upvalues: ConfigurationScreen (ref)
		return ConfigurationScreen(value, "settings", "BuildPage.settings.Page")
	end,
	BuildAudienceScreen = function(p12) --[[ line: 217 ]]
		-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), overflowMenuPageShellModule (ref), iconName (ref), audienceConfigurationContentModule (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
		local navigation = p12.navigation
		local screenProps = p12.screenProps or {}
		local var37 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var38 = if var37 == nil then nil else {
			universeId = var37.universeId,
			placeId = var37.placeId,
			sessionId = var37.sessionId,
			experienceName = var37.experienceName,
			gameIcon = var37.gameIcon,
			isNewGameTarget = var37.isNewGameTarget
		}
		local var39 = if var38 == nil then nil else reactModule.createElement(overflowMenuPageShellModule, {
			title = "Audience",
			testId = "BuildPage.audience.Page",
			closeIcon = iconName.ChevronLargeLeft,
			onClose = reactModule.useCallback(function() --[[ line: 222 ]]
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation }),
			content = reactModule.createElement(audienceConfigurationContentModule, { universeId = var38.universeId })
		})
		
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var39 }) else reactModule.createElement(BuildFullscreenPage, { pageContent = var39 })
	end,
	BuildTitleDescriptionScreen = function(p13) --[[ line: 277 ]]
		-- upvalues: buildNavigationParamsModule (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), BuildTitleDescriptionContent (ref), BuildSheetPage (ref), BuildFullscreenPage (ref)
		local navigation = p13.navigation
		local screenProps = p13.screenProps or {}
		local var41 = buildNavigationParamsModule.getTarget(navigation) or screenProps.target
		local var42 = if var41 == nil then nil else {
			universeId = var41.universeId,
			placeId = var41.placeId,
			sessionId = var41.sessionId,
			experienceName = var41.experienceName,
			gameIcon = var41.gameIcon,
			isNewGameTarget = var41.isNewGameTarget
		}
		local var43 = if var42 == nil then nil else reactModule.createElement(BuildTitleDescriptionContent, {
			testId = "BuildPage.titleDescription.Page",
			target = var42,
			onBack = navigation.goBack
		})
		
		return if screenProps.onClose then reactModule.createElement(BuildSheetPage, { pageContent = var43 }) else reactModule.createElement(BuildFullscreenPage, {
			hideBottomBar = useOnScreenKeyboardVisibleModule(),
			pageContent = var43
		})
	end,
	BuildMediaSelectionScreen = function(p14) --[[ line: 303 ]]
		-- upvalues: buildNavigationParamsModule (ref), useBuildPageLayoutModule (ref), reactModule (ref), mediaSelectionPageModule (ref), fullscreenPageWithSafeArea (ref)
		local navigation = p14.navigation
		local target = buildNavigationParamsModule.getTarget(navigation)
		local var45 = useBuildPageLayoutModule()
		
		return reactModule.createElement(fullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BackgroundColor3 = var45.tokens.Color.Surface.Surface_0.Color3,
			BackgroundTransparency = var45.tokens.Color.Surface.Surface_0.Transparency,
			includeBottomBar = var45.shouldIncludeBottomBar
		}, {
			Page = if target == nil then nil else reactModule.createElement(mediaSelectionPageModule, {
				onClose = reactModule.useCallback(function() --[[ line: 308 ]]
					-- upvalues: navigation (ref)
					navigation.goBack()
				end, { navigation }),
				universeId = target.universeId
			})
		})
	end
}