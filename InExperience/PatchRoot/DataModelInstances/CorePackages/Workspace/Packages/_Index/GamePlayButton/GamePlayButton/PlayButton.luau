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

local var12 = function() end

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), useRoactService (ref), roactNetworking (ref), useSelector (ref), gamesProductInfoReducer (ref), tutilsModule (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), useBreakpointXOrSmaller (ref), responsiveModule (ref), usePlayButtonStateModule (ref), playButtonStatesModule (ref), fFlagLuaAppLaunchWhenLoadingForce (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), useOnPlayButtonCallbackModule (ref), luaAppFixPlayButtonDefaultLaunchSource (ref), fFlagLuaAppUnifiedPlayButtonSquadMenuDirection (ref), menuDirection (ref), useOnPlaySquadButtonCallbackModule (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (ref), usePlayOnReleaseAfterUnmountModule (ref), fFlagSduiExperienceDetailsSupport (ref), useLocalization (ref), fFlagLuaAppUpdatePlayButtonText (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), useUserExperiment (ref), appUserLayers (ref), fFlagLuaAppLogExposurePlayButtonUX (ref), IXPService (ref), useTokens (ref), fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP (ref), fIntLuaAppPlayButtonSecondaryButtonGap (ref), legacyPlayButtonModule (ref), fFlagLuaAppEnablePlaySquadButton (ref), var12 (ref), playButtonGroupViewModule (ref)
	local var13 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var13 (ref)
		var13.current = true
		
		return function()
			-- upvalues: var13 (copy)
			var13.current = false
		end
	end, {})
	local var14 = useRoactService(roactNetworking)
	local var15 = useSelector(function(p1)
		-- upvalues: p0 (ref), gamesProductInfoReducer (copy)
		return if p0.universeId then p1[gamesProductInfoReducer.key][p0.universeId] else nil
	end, tutilsModule.shallowEqual)
	local var16 = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then p0.eventContext or "PlayButton" else nil
	local var17 = useBreakpointXOrSmaller(responsiveModule.Keys.Small)
	local var18 = usePlayButtonStateModule(var14, p0.universeId, p0.fetchDelayInSeconds, p0.isPlayableWhenLoading, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var16 else nil)
	local playButtonState = var18.playButtonState
	local secondaryPlayButtonState = var18.secondaryPlayButtonState
	
	if secondaryPlayButtonState ~= nil then
		local var19 = secondaryPlayButtonState == playButtonStatesModule.UnplayableOther
		
		if p0.preferSecondaryPlayButton == true or var17 and playButtonState == playButtonStatesModule.UnplayableOther then
			playButtonState = secondaryPlayButtonState
			secondaryPlayButtonState = nil
		elseif var17 and var19 then
			secondaryPlayButtonState = nil
		end
	end
	local fFlagLuaAppLaunchWhenLoadingForce_1 = fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp and p0.launchWhenLoading == true
	local var21 = useOnPlayButtonCallbackModule(p0.universeId, p0.referralSource, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var16 else p0.eventContext or "PlayButton", nil, p0.launchSource or (if luaAppFixPlayButtonDefaultLaunchSource then "UnknownLaunchSource" else "LuaGameCard"), p0.experienceJoinData, p0.placeId, if fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppLaunchWhenLoadingForce then p0.launchWhenLoading else nil)
	local var22 = if fFlagLuaAppUnifiedPlayButtonSquadMenuDirection and p0.squadButtonMenuDirection ~= nil then p0.squadButtonMenuDirection else menuDirection.Up
	local var23 = useOnPlaySquadButtonCallbackModule(var22, playButtonState, p0.referralSource, p0.universeId)
	local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 = fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp and p0.launchOnReleaseAfterUnmount == true
	local _ = nil
	local _ = nil
	local useCallback = reactModule.useCallback
	useCallback = useCallback(function(p2)
		-- upvalues: fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 (ref), var13 (ref), p0 (ref), playButtonStatesModule (copy), var21 (ref)
		if p2 == nil then return end
		if not fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and not var13.current then return end
		if p0.onActivated then
			p0.onActivated()
		end
		if p0.onPurchaseRequiredCallback and (p2 == playButtonStatesModule.PaidAccess or p2 == playButtonStatesModule.FiatPaidAccess) then
			p0.onPurchaseRequiredCallback()
			
			return
		end
		var21(p2, p0.reportExperienceLaunched)
	end, {
		var21,
		p0.onPurchaseRequiredCallback,
		p0.reportExperienceLaunched,
		p0.onActivated,
		if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 else nil
	})
	local var25 = reactModule.useCallback(function()
		-- upvalues: useCallback (ref), playButtonState (write)
		useCallback(playButtonState)
	end, { useCallback, playButtonState })
	local var26 = reactModule.useCallback(function()
		-- upvalues: useCallback (ref), secondaryPlayButtonState (write)
		useCallback(secondaryPlayButtonState)
	end, { useCallback, secondaryPlayButtonState })
	var25 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce then usePlayOnReleaseAfterUnmountModule(var25) else nil
	local var27 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and var25 then var25.playButtonRef else nil
	local var28 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and var25 then var25.loadingCaptureRef else nil
	local var29 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 then var25.onActivated else var25
	local var30 = reactModule.useCallback(function(p3)
		-- upvalues: var13 (ref), p0 (ref), var23 (ref)
		if not var13.current then return end
		if p0.onActivated then
			p0.onActivated()
		end
		var23(p3)
	end, { var23, p0.onActivated })
	
	if fFlagSduiExperienceDetailsSupport then
		reactModule.useEffect(function()
			-- upvalues: p0 (ref), var29 (ref)
			local onRegisterActivation = p0.onRegisterActivation
			
			if onRegisterActivation == nil then
				return
			end
			return onRegisterActivation(var29)
		end, { p0.onRegisterActivation, var29 })
	end
	local var31 = useLocalization({
		join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		playDemo = "Feature.ExperienceDetails.PlayButtonText.PlayDemo",
		unlock = "Feature.ExperienceDetails.PlayButtonText.Unlock",
		joinWithParty = "Feature.Squads.Action.JoinWithParty",
		unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		waitingForParty = "Feature.Squads.Action.WaitingForParty",
		play = if fFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else nil
	})
	local var32 = nil
	local var33 = nil
	local var34 = nil
	
	if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		local var35, var36, var37 = useUserExperiment({ appUserLayers.PlayButtonUXExposureLayer }, function(p4)
			-- upvalues: appUserLayers (copy)
			local playButtonUXExposureLayer = p4[appUserLayers.PlayButtonUXExposureLayer] or {}
			
			return playButtonUXExposureLayer.HasJoinTextButton, playButtonUXExposureLayer.HasIconPlayButton, playButtonUXExposureLayer.HasPlayButtonLoadingSkeleton
		end, true)
		var32 = var35
		var33 = var36
		var34 = var37
	end
	if fFlagLuaAppLogExposurePlayButtonUX then
		reactModule.useEffect(function()
			-- upvalues: IXPService (copy), appUserLayers (copy)
			IXPService:LogUserLayerExposure(appUserLayers.PlayButtonUXExposureLayer)
		end, {})
	end
	local var38 = useTokens()
	
	if not fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP or not p0.shouldUseModuleLegacyPlayButtonView then
		return reactModule.createElement(playButtonGroupViewModule, {
			playButtonState = playButtonState,
			secondaryPlayButtonState = secondaryPlayButtonState,
			gameProductInfo = var15,
			localized = var31,
			tokens = var38,
			hasJoinTextPlayableButtonIxp = var32,
			hasIconPlayButtonIxp = var33,
			hasPlayButtonLoadingSkeletonIxp = var34,
			onPlayButtonActivated = var29,
			onSecondaryPlayButtonActivated = var26,
			onPlaySquadButtonActivated = var30,
			playButtonCaptureRef = var27,
			loadingCaptureRef = var28,
			shouldLaunchWhenLoading = fFlagLuaAppLaunchWhenLoadingForce_1,
			shouldLaunchOnReleaseAfterUnmount = fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1,
			squadButtonMenuDirection = var22,
			playableText = p0.playableText,
			fiatText = p0.fiatText,
			hidePlayableIcon = p0.hidePlayableIcon,
			hideOptionalText = p0.hideOptionalText,
			buttonSize = p0.buttonSize,
			width = p0.width,
			expandWidthForSecondaryPlayButton = p0.expandWidthForSecondaryPlayButton,
			fillBehavior = p0.fillBehavior,
			useUIBloxButton = p0.useUIBloxButton,
			hideIfUnplayable = p0.hideIfUnplayable,
			hideIfLoading = p0.hideIfLoading,
			LayoutOrder = p0.LayoutOrder,
			Position = p0.Position,
			tag = p0.tag,
			testId = p0.testId
		})
	end
	local var39 = if var15 then var15.price else 0
	local var40 = if var15 then var15.localizedFiatPrice else ""
	
	if secondaryPlayButtonState == nil then
		return reactModule.createElement(legacyPlayButtonModule, {
			Size = UDim2.new(p0.width or UDim.new(1, 0), UDim.new(1, 0)),
			LayoutOrder = p0.LayoutOrder,
			playButtonState = playButtonState,
			price = var39,
			localizedFiatPrice = var40,
			onPlayButtonActivated = var29,
			onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then var30 else nil,
			testId = p0.testId
		})
	end
	local uDim2 = UDim2.new(0.5, -fIntLuaAppPlayButtonSecondaryButtonGap / 2, 1, 0)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(p0.width or UDim.new(1, 0), UDim.new(1, 0)),
		LayoutOrder = p0.LayoutOrder,
		Position = p0.Position
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
			price = var39,
			localizedFiatPrice = var40,
			onPlayButtonActivated = var29,
			onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then var30 else nil,
			testId = p0.testId
		}),
		SecondaryPlayButton = reactModule.createElement(legacyPlayButtonModule, {
			LayoutOrder = 2,
			Size = uDim2,
			playButtonState = secondaryPlayButtonState,
			price = var39,
			localizedFiatPrice = var40,
			onPlayButtonActivated = var26 or var12,
			onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then var30 else nil,
			testId = if p0.testId then `{p0.testId}--secondary` else nil
		})
	})
end)