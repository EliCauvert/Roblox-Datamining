local parent = script:FindFirstAncestor("GamePlayButton").Parent
local IXPService = game:GetService("IXPService")
local tutilsModule = require(parent.tutils)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local useBreakpointXOrSmaller = responsiveModule.useBreakpointXOrSmaller
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(parent.Localization).Hooks.useLocalization
local menuDirection = require(parent.UIBlox).App.Menu.MenuDirection
local useTokens = require(parent.Foundation).Hooks.useTokens
local gamesProductInfoReducer = require(parent.GameProductInfoRodux).GamesProductInfoReducer
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local useOnPlayButtonCallbackModule = require(script.Parent.useOnPlayButtonCallback)
local useOnPlaySquadButtonCallbackModule = require(script.Parent.useOnPlaySquadButtonCallback)
local usePlayButtonStateModule = require(script.Parent.usePlayButtonState)
local legacyPlayButtonModule = require(script.Parent.LegacyPlayButton)
local playButtonGroupViewModule = require(script.Parent.PlayButtonGroupView)
local playButtonViewModule = require(script.Parent.PlayButtonView)
local playButtonStatesModule = require(script.Parent.PlayButtonStates)
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local fFlagLuaAppEnablePlaySquadButton = require(parent.SharedFlags).FFlagLuaAppEnablePlaySquadButton
local fFlagLuaAppUnifyPlayButtonAllSurfacesIxp = require(parent.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local luaAppFixPlayButtonDefaultLaunchSource = game:DefineFastFlag("LuaAppFixPlayButtonDefaultLaunchSource", false)
local fFlagLuaAppUnifiedPlayButtonSquadMenuDirection = require(parent.SharedFlags).FFlagLuaAppUnifiedPlayButtonSquadMenuDirection
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagLuaAppPlayButtonLoadingDurationTelemetry = require(parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local fFlagLuaAppUpdatePlayButtonText = require(parent.SharedFlags).FFlagLuaAppUpdatePlayButtonText
local fFlagLuaAppLogExposurePlayButtonUX = require(parent.SharedFlags).FFlagLuaAppLogExposurePlayButtonUX
local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp = require(parent.SharedFlags).FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp
local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce = require(parent.SharedFlags).FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce
local fFlagLuaAppLaunchWhenLoadingEdp = require(parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingEdp
local fFlagLuaAppLaunchWhenLoadingForce = require(parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingForce
local fFlagLuaAppDemoModePlayButton = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButton
local fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP = require(parent.SharedFlags).FFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP
local fIntLuaAppPlayButtonSecondaryButtonGap = require(parent.SharedFlags).FIntLuaAppPlayButtonSecondaryButtonGap
local usePlayOnReleaseAfterUnmountModule = require(script.Parent.usePlayOnReleaseAfterUnmount)

local var1 = function() end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useRoactService (ref), roactNetworking (ref), useSelector (ref), gamesProductInfoReducer (ref), tutilsModule (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), fFlagLuaAppDemoModePlayButton (ref), useBreakpointXOrSmaller (ref), responsiveModule (ref), usePlayButtonStateModule (ref), playButtonStatesModule (ref), fFlagLuaAppLaunchWhenLoadingForce (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), useOnPlayButtonCallbackModule (ref), luaAppFixPlayButtonDefaultLaunchSource (ref), fFlagLuaAppUnifiedPlayButtonSquadMenuDirection (ref), menuDirection (ref), useOnPlaySquadButtonCallbackModule (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (ref), usePlayOnReleaseAfterUnmountModule (ref), fFlagSduiExperienceDetailsSupport (ref), useLocalization (ref), fFlagLuaAppUpdatePlayButtonText (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), useUserExperiment (ref), appUserLayers (ref), fFlagLuaAppLogExposurePlayButtonUX (ref), IXPService (ref), useTokens (ref), fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP (ref), fIntLuaAppPlayButtonSecondaryButtonGap (ref), legacyPlayButtonModule (ref), fFlagLuaAppEnablePlaySquadButton (ref), var1 (ref), playButtonGroupViewModule (ref), playButtonViewModule (ref)
	local var2 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		var2.current = true
		
		return function()
			-- upvalues: var2 (copy)
			var2.current = false
		end
	end, {})
	local var3 = useRoactService(roactNetworking)
	local var4 = useSelector(function(p2)
		-- upvalues: p1 (ref), gamesProductInfoReducer (copy)
		return if p1.universeId then p2[gamesProductInfoReducer.key][p1.universeId] else nil
	end, tutilsModule.shallowEqual)
	local var5 = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then p1.eventContext or "PlayButton" else nil
	local var6 = if fFlagLuaAppDemoModePlayButton then useBreakpointXOrSmaller(responsiveModule.Keys.Small) else nil
	local var7 = usePlayButtonStateModule(var3, p1.universeId, p1.fetchDelayInSeconds, p1.isPlayableWhenLoading, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var5 else nil)
	local playButtonState = var7.playButtonState
	local var8 = if fFlagLuaAppDemoModePlayButton then var7.secondaryPlayButtonState else nil
	
	if fFlagLuaAppDemoModePlayButton and var8 ~= nil then
		local var9 = var8 == playButtonStatesModule.UnplayableOther
		
		if p1.preferSecondaryPlayButton == true or var6 and playButtonState == playButtonStatesModule.UnplayableOther then
			playButtonState = var8
			var8 = nil
		elseif var6 and var9 then
			var8 = nil
		end
	end
	local var10
	local fFlagLuaAppLaunchWhenLoadingForce_1 = fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp and p1.launchWhenLoading == true
	local var11 = useOnPlayButtonCallbackModule(p1.universeId, p1.referralSource, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var5 else p1.eventContext or "PlayButton", nil, p1.launchSource or (if luaAppFixPlayButtonDefaultLaunchSource then "UnknownLaunchSource" else "LuaGameCard"), p1.experienceJoinData, p1.placeId, if fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppLaunchWhenLoadingForce then p1.launchWhenLoading else nil)
	local var12 = if fFlagLuaAppUnifiedPlayButtonSquadMenuDirection and p1.squadButtonMenuDirection ~= nil then p1.squadButtonMenuDirection else menuDirection.Up
	local var13 = useOnPlaySquadButtonCallbackModule(var12, playButtonState, p1.referralSource, p1.universeId)
	local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 = fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp and p1.launchOnReleaseAfterUnmount == true
	local _ = nil
	local var14 = nil
	
	if fFlagLuaAppDemoModePlayButton then
		local useCallback = reactModule.useCallback
		useCallback = useCallback(function(p2)
			-- upvalues: fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 (ref), var2 (ref), p1 (ref), playButtonStatesModule (copy), var11 (ref)
			if p2 == nil then return end
			if not fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and not var2.current then return end
			if p1.onActivated then
				p1.onActivated()
			end
			if p1.onPurchaseRequiredCallback and (p2 == playButtonStatesModule.PaidAccess or p2 == playButtonStatesModule.FiatPaidAccess) then
				p1.onPurchaseRequiredCallback()
				
				return
			end
			var11(p2, p1.reportExperienceLaunched)
		end, {
			var11,
			p1.onPurchaseRequiredCallback,
			p1.reportExperienceLaunched,
			p1.onActivated,
			if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 else nil
		})
		var10 = reactModule.useCallback(function()
			-- upvalues: useCallback (ref), playButtonState (write)
			useCallback(playButtonState)
		end, { useCallback, playButtonState })
		var14 = reactModule.useCallback(function()
			-- upvalues: useCallback (ref), var8 (write)
			useCallback(var8)
		end, { useCallback, var8 })
	else
		var10 = reactModule.useCallback(function()
			-- upvalues: fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 (ref), var2 (ref), p1 (ref), playButtonState (write), playButtonStatesModule (copy), var11 (ref)
			if not fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and not var2.current then return end
			if p1.onActivated then
				p1.onActivated()
			end
			if p1.onPurchaseRequiredCallback and (playButtonState == playButtonStatesModule.PaidAccess or playButtonState == playButtonStatesModule.FiatPaidAccess) then
				p1.onPurchaseRequiredCallback()
				
				return
			end
			var11(playButtonState, p1.reportExperienceLaunched)
		end, {
			var11, playButtonState, p1.onPurchaseRequiredCallback,
			p1.reportExperienceLaunched, p1.onActivated,
			if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 else nil
		})
	end
	local var15 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce then usePlayOnReleaseAfterUnmountModule(var10) else nil
	local var16 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and var15 then var15.playButtonRef else nil
	local var17 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and var15 then var15.loadingCaptureRef else nil
	local var18 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 then var15.onActivated else var10
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), p1 (ref), var13 (ref)
		if not var2.current then return end
		if p1.onActivated then
			p1.onActivated()
		end
		var13(p2)
	end, { var13, p1.onActivated })
	
	if fFlagSduiExperienceDetailsSupport then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var18 (ref)
			local onRegisterActivation = p1.onRegisterActivation
			
			if onRegisterActivation == nil then
				return
			end
			return onRegisterActivation(var18)
		end, { p1.onRegisterActivation, var18 })
	end
	local var20 = useLocalization({
		join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		unlock = "Feature.ExperienceDetails.PlayButtonText.Unlock",
		joinWithParty = "Feature.Squads.Action.JoinWithParty",
		unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		waitingForParty = "Feature.Squads.Action.WaitingForParty",
		play = if fFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else nil,
		playDemo = if fFlagLuaAppDemoModePlayButton then "Feature.ExperienceDetails.PlayButtonText.PlayDemo" else nil
	})
	local var21 = nil
	local var22 = nil
	local var23 = nil
	
	if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		local var24, var25, var26 = useUserExperiment({ appUserLayers.PlayButtonUXExposureLayer }, function(p2)
			-- upvalues: appUserLayers (copy)
			local playButtonUXExposureLayer = p2[appUserLayers.PlayButtonUXExposureLayer] or {}
			
			return playButtonUXExposureLayer.HasJoinTextButton, playButtonUXExposureLayer.HasIconPlayButton, playButtonUXExposureLayer.HasPlayButtonLoadingSkeleton
		end, true)
		var21 = var24
		var22 = var25
		var23 = var26
	end
	if fFlagLuaAppLogExposurePlayButtonUX then
		reactModule.useEffect(function()
			-- upvalues: IXPService (copy), appUserLayers (copy)
			IXPService:LogUserLayerExposure(appUserLayers.PlayButtonUXExposureLayer)
		end, {})
	end
	local var27 = useTokens()
	
	if not fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP or not p1.shouldUseModuleLegacyPlayButtonView then
		return reactModule.createElement(if fFlagLuaAppDemoModePlayButton then playButtonGroupViewModule else playButtonViewModule, {
			playButtonState = playButtonState,
			secondaryPlayButtonState = if fFlagLuaAppDemoModePlayButton then var8 else nil,
			gameProductInfo = var4,
			localized = var20,
			tokens = var27,
			hasJoinTextPlayableButtonIxp = var21,
			hasIconPlayButtonIxp = var22,
			hasPlayButtonLoadingSkeletonIxp = var23,
			onPlayButtonActivated = var18,
			onSecondaryPlayButtonActivated = if fFlagLuaAppDemoModePlayButton then var14 else nil,
			onPlaySquadButtonActivated = var19,
			playButtonCaptureRef = var16,
			loadingCaptureRef = var17,
			shouldLaunchWhenLoading = fFlagLuaAppLaunchWhenLoadingForce_1,
			shouldLaunchOnReleaseAfterUnmount = fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1,
			squadButtonMenuDirection = var12,
			playableText = p1.playableText,
			fiatText = p1.fiatText,
			hidePlayableIcon = p1.hidePlayableIcon,
			hideOptionalText = p1.hideOptionalText,
			buttonSize = p1.buttonSize,
			width = p1.width,
			expandWidthForSecondaryPlayButton = if fFlagLuaAppDemoModePlayButton then p1.expandWidthForSecondaryPlayButton else nil,
			fillBehavior = p1.fillBehavior,
			useUIBloxButton = p1.useUIBloxButton,
			hideIfUnplayable = p1.hideIfUnplayable,
			hideIfLoading = p1.hideIfLoading,
			LayoutOrder = p1.LayoutOrder,
			Position = p1.Position,
			tag = p1.tag,
			testId = p1.testId
		})
	end
	local var28 = if var4 then var4.price else 0
	local var29 = if var4 then var4.localizedFiatPrice else ""
	
	if fFlagLuaAppDemoModePlayButton and var8 ~= nil then
		local uDim2 = UDim2.new(0.5, -fIntLuaAppPlayButtonSecondaryButtonGap / 2, 1, 0)
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(p1.width or UDim.new(1, 0), UDim.new(1, 0)),
			LayoutOrder = p1.LayoutOrder,
			Position = p1.Position
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, fIntLuaAppPlayButtonSecondaryButtonGap)
			}),
			PlayButton = reactModule.createElement(legacyPlayButtonModule, {
				LayoutOrder = 1,
				Size = uDim2,
				playButtonState = playButtonState,
				price = var28,
				localizedFiatPrice = var29,
				onPlayButtonActivated = var18,
				onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then var19 else nil,
				testId = p1.testId
			}),
			SecondaryPlayButton = reactModule.createElement(legacyPlayButtonModule, {
				LayoutOrder = 2,
				Size = uDim2,
				playButtonState = var8,
				price = var28,
				localizedFiatPrice = var29,
				onPlayButtonActivated = var14 or var1,
				onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then var19 else nil,
				testId = if p1.testId then `{p1.testId}--secondary` else nil
			})
		})
	end
	return reactModule.createElement(legacyPlayButtonModule, {
		Size = UDim2.new(p1.width or UDim.new(1, 0), UDim.new(1, 0)),
		LayoutOrder = p1.LayoutOrder,
		playButtonState = playButtonState,
		price = var28,
		localizedFiatPrice = var29,
		onPlayButtonActivated = var18,
		onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then var19 else nil,
		testId = p1.testId
	})
end)