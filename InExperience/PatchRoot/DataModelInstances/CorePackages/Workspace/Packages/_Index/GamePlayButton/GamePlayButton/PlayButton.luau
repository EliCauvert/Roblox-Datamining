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
local fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP = require(parent.SharedFlags).FFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP
local fIntLuaAppPlayButtonSecondaryButtonGap = require(parent.SharedFlags).FIntLuaAppPlayButtonSecondaryButtonGap
local usePlayOnReleaseAfterUnmountModule = require(script.Parent.usePlayOnReleaseAfterUnmount)

local var1 = function() end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useRoactService (ref), roactNetworking (ref), useSelector (ref), gamesProductInfoReducer (ref), tutilsModule (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), useBreakpointXOrSmaller (ref), responsiveModule (ref), usePlayButtonStateModule (ref), playButtonStatesModule (ref), fFlagLuaAppLaunchWhenLoadingForce (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), useOnPlayButtonCallbackModule (ref), luaAppFixPlayButtonDefaultLaunchSource (ref), fFlagLuaAppUnifiedPlayButtonSquadMenuDirection (ref), menuDirection (ref), useOnPlaySquadButtonCallbackModule (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (ref), usePlayOnReleaseAfterUnmountModule (ref), fFlagSduiExperienceDetailsSupport (ref), useLocalization (ref), fFlagLuaAppUpdatePlayButtonText (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), useUserExperiment (ref), appUserLayers (ref), fFlagLuaAppLogExposurePlayButtonUX (ref), IXPService (ref), useTokens (ref), fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP (ref), fIntLuaAppPlayButtonSecondaryButtonGap (ref), legacyPlayButtonModule (ref), fFlagLuaAppEnablePlaySquadButton (ref), var1 (ref), playButtonGroupViewModule (ref)
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
	local var6 = useBreakpointXOrSmaller(responsiveModule.Keys.Small)
	local var7 = usePlayButtonStateModule(var3, p1.universeId, p1.fetchDelayInSeconds, p1.isPlayableWhenLoading, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var5 else nil)
	local playButtonState = var7.playButtonState
	local secondaryPlayButtonState = var7.secondaryPlayButtonState
	
	if secondaryPlayButtonState ~= nil then
		local var8 = secondaryPlayButtonState == playButtonStatesModule.UnplayableOther
		
		if p1.preferSecondaryPlayButton == true or var6 and playButtonState == playButtonStatesModule.UnplayableOther then
			playButtonState = secondaryPlayButtonState
			secondaryPlayButtonState = nil
		elseif var6 and var8 then
			secondaryPlayButtonState = nil
		end
	end
	local fFlagLuaAppLaunchWhenLoadingForce_1 = fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp and p1.launchWhenLoading == true
	local var9 = useOnPlayButtonCallbackModule(p1.universeId, p1.referralSource, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var5 else p1.eventContext or "PlayButton", nil, p1.launchSource or (if luaAppFixPlayButtonDefaultLaunchSource then "UnknownLaunchSource" else "LuaGameCard"), p1.experienceJoinData, p1.placeId, if fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppLaunchWhenLoadingForce then p1.launchWhenLoading else nil)
	local var10 = if fFlagLuaAppUnifiedPlayButtonSquadMenuDirection and p1.squadButtonMenuDirection ~= nil then p1.squadButtonMenuDirection else menuDirection.Up
	local var11 = useOnPlaySquadButtonCallbackModule(var10, playButtonState, p1.referralSource, p1.universeId)
	local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 = fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp and p1.launchOnReleaseAfterUnmount == true
	local _ = nil
	local _ = nil
	local useCallback = reactModule.useCallback
	useCallback = useCallback(function(p2)
		-- upvalues: fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 (ref), var2 (ref), p1 (ref), playButtonStatesModule (copy), var9 (ref)
		if p2 == nil then return end
		if not fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and not var2.current then return end
		if p1.onActivated then
			p1.onActivated()
		end
		if p1.onPurchaseRequiredCallback and (p2 == playButtonStatesModule.PaidAccess or p2 == playButtonStatesModule.FiatPaidAccess) then
			p1.onPurchaseRequiredCallback()
			
			return
		end
		var9(p2, p1.reportExperienceLaunched)
	end, {
		var9,
		p1.onPurchaseRequiredCallback,
		p1.reportExperienceLaunched,
		p1.onActivated,
		if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 else nil
	})
	local var12 = reactModule.useCallback(function()
		-- upvalues: useCallback (ref), playButtonState (write)
		useCallback(playButtonState)
	end, { useCallback, playButtonState })
	local var13 = reactModule.useCallback(function()
		-- upvalues: useCallback (ref), secondaryPlayButtonState (write)
		useCallback(secondaryPlayButtonState)
	end, { useCallback, secondaryPlayButtonState })
	var12 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce then usePlayOnReleaseAfterUnmountModule(var12) else nil
	local var14 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and var12 then var12.playButtonRef else nil
	local var15 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and var12 then var12.loadingCaptureRef else nil
	local var16 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 then var12.onActivated else var12
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), p1 (ref), var11 (ref)
		if not var2.current then return end
		if p1.onActivated then
			p1.onActivated()
		end
		var11(p2)
	end, { var11, p1.onActivated })
	
	if fFlagSduiExperienceDetailsSupport then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var16 (ref)
			local onRegisterActivation = p1.onRegisterActivation
			
			if onRegisterActivation == nil then
				return
			end
			return onRegisterActivation(var16)
		end, { p1.onRegisterActivation, var16 })
	end
	local var18 = useLocalization({
		join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		playDemo = "Feature.ExperienceDetails.PlayButtonText.PlayDemo",
		unlock = "Feature.ExperienceDetails.PlayButtonText.Unlock",
		joinWithParty = "Feature.Squads.Action.JoinWithParty",
		unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		waitingForParty = "Feature.Squads.Action.WaitingForParty",
		play = if fFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else nil
	})
	local var19 = nil
	local var20 = nil
	local var21 = nil
	
	if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		local var22, var23, var24 = useUserExperiment({ appUserLayers.PlayButtonUXExposureLayer }, function(p2)
			-- upvalues: appUserLayers (copy)
			local playButtonUXExposureLayer = p2[appUserLayers.PlayButtonUXExposureLayer] or {}
			
			return playButtonUXExposureLayer.HasJoinTextButton, playButtonUXExposureLayer.HasIconPlayButton, playButtonUXExposureLayer.HasPlayButtonLoadingSkeleton
		end, true)
		var19 = var22
		var20 = var23
		var21 = var24
	end
	if fFlagLuaAppLogExposurePlayButtonUX then
		reactModule.useEffect(function()
			-- upvalues: IXPService (copy), appUserLayers (copy)
			IXPService:LogUserLayerExposure(appUserLayers.PlayButtonUXExposureLayer)
		end, {})
	end
	local var25 = useTokens()
	
	if not fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP or not p1.shouldUseModuleLegacyPlayButtonView then
		return reactModule.createElement(playButtonGroupViewModule, {
			playButtonState = playButtonState,
			secondaryPlayButtonState = secondaryPlayButtonState,
			gameProductInfo = var4,
			localized = var18,
			tokens = var25,
			hasJoinTextPlayableButtonIxp = var19,
			hasIconPlayButtonIxp = var20,
			hasPlayButtonLoadingSkeletonIxp = var21,
			onPlayButtonActivated = var16,
			onSecondaryPlayButtonActivated = var13,
			onPlaySquadButtonActivated = var17,
			playButtonCaptureRef = var14,
			loadingCaptureRef = var15,
			shouldLaunchWhenLoading = fFlagLuaAppLaunchWhenLoadingForce_1,
			shouldLaunchOnReleaseAfterUnmount = fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1,
			squadButtonMenuDirection = var10,
			playableText = p1.playableText,
			fiatText = p1.fiatText,
			hidePlayableIcon = p1.hidePlayableIcon,
			hideOptionalText = p1.hideOptionalText,
			buttonSize = p1.buttonSize,
			width = p1.width,
			expandWidthForSecondaryPlayButton = p1.expandWidthForSecondaryPlayButton,
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
	local var26 = if var4 then var4.price else 0
	local var27 = if var4 then var4.localizedFiatPrice else ""
	
	if secondaryPlayButtonState == nil then
		return reactModule.createElement(legacyPlayButtonModule, {
			Size = UDim2.new(p1.width or UDim.new(1, 0), UDim.new(1, 0)),
			LayoutOrder = p1.LayoutOrder,
			playButtonState = playButtonState,
			price = var26,
			localizedFiatPrice = var27,
			onPlayButtonActivated = var16,
			onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then var17 else nil,
			testId = p1.testId
		})
	end
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
			price = var26,
			localizedFiatPrice = var27,
			onPlayButtonActivated = var16,
			onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then var17 else nil,
			testId = p1.testId
		}),
		SecondaryPlayButton = reactModule.createElement(legacyPlayButtonModule, {
			LayoutOrder = 2,
			Size = uDim2,
			playButtonState = secondaryPlayButtonState,
			price = var26,
			localizedFiatPrice = var27,
			onPlayButtonActivated = var13 or var1,
			onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then var17 else nil,
			testId = if p1.testId then `{p1.testId}--secondary` else nil
		})
	})
end)