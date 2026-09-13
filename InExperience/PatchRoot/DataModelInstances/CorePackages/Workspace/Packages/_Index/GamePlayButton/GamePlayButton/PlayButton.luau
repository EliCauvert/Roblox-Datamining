local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local parent = gamePlayButton.Parent
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
local useEarlyAccessCaptionModule = require(script.Parent.EarlyAccess.useEarlyAccessCaption)
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
local fFlagEnableGameJoinEarlyAccess = require(parent.SharedFlags).FFlagEnableGameJoinEarlyAccess
local fFlagLuaAppLogExposurePlayButtonUX = require(parent.SharedFlags).FFlagLuaAppLogExposurePlayButtonUX
local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce = require(parent.SharedFlags).FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce
local fFlagLuaAppLaunchWhenLoadingEdp = require(parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingEdp
local fFlagLuaAppLaunchWhenLoadingForce = require(parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingForce
local fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP = require(parent.SharedFlags).FFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP
local fIntLuaAppPlayButtonSecondaryButtonGap = require(parent.SharedFlags).FIntLuaAppPlayButtonSecondaryButtonGap
local fFlagLuaAppPlayButtonPrivatePT = require(parent.SharedFlags).FFlagLuaAppPlayButtonPrivatePT
local fStringR20UniverseIdModule = require(gamePlayButton.Flags.FStringR20UniverseId)
local usePlayOnReleaseAfterUnmountModule = require(script.Parent.usePlayOnReleaseAfterUnmount)

local var1 = function() end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useRoactService (ref), roactNetworking (ref), useSelector (ref), gamesProductInfoReducer (ref), tutilsModule (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), useBreakpointXOrSmaller (ref), responsiveModule (ref), usePlayButtonStateModule (ref), fFlagEnableGameJoinEarlyAccess (ref), playButtonStatesModule (ref), useEarlyAccessCaptionModule (ref), fFlagLuaAppLaunchWhenLoadingForce (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), useOnPlayButtonCallbackModule (ref), luaAppFixPlayButtonDefaultLaunchSource (ref), fFlagLuaAppUnifiedPlayButtonSquadMenuDirection (ref), menuDirection (ref), useOnPlaySquadButtonCallbackModule (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce (ref), usePlayOnReleaseAfterUnmountModule (ref), fFlagSduiExperienceDetailsSupport (ref), useLocalization (ref), fFlagLuaAppUpdatePlayButtonText (ref), fFlagLuaAppPlayButtonPrivatePT (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), useUserExperiment (ref), appUserLayers (ref), fFlagLuaAppLogExposurePlayButtonUX (ref), IXPService (ref), useTokens (ref), fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP (ref), fIntLuaAppPlayButtonSecondaryButtonGap (ref), legacyPlayButtonModule (ref), fFlagLuaAppEnablePlaySquadButton (ref), var1 (ref), fStringR20UniverseIdModule (ref), playButtonGroupViewModule (ref)
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
	local var7 = usePlayButtonStateModule(var3, p1.universeId, p1.fetchDelayInSeconds, p1.isPlayableWhenLoading, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var5 else nil, if fFlagEnableGameJoinEarlyAccess then p1.enableEarlyAccessState else nil)
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
	local var9 = nil
	local var10 = nil
	
	if fFlagEnableGameJoinEarlyAccess then
		local earlyAccess = var7.earlyAccess
		var9 = useEarlyAccessCaptionModule(earlyAccess)
		
		if earlyAccess then
			var10 = earlyAccess.isPendingUnlock == true
			var10 = nil
		else
			var10 = false
		end
	end
	local fFlagLuaAppLaunchWhenLoadingForce_1 = fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp and p1.launchWhenLoading == true
	local var11 = useOnPlayButtonCallbackModule(p1.universeId, p1.referralSource, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var5 else p1.eventContext or "PlayButton", nil, p1.launchSource or (if luaAppFixPlayButtonDefaultLaunchSource then "UnknownLaunchSource" else "LuaGameCard"), p1.experienceJoinData, p1.placeId, if fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppLaunchWhenLoadingForce then p1.launchWhenLoading else nil)
	local var12 = if fFlagLuaAppUnifiedPlayButtonSquadMenuDirection and p1.squadButtonMenuDirection ~= nil then p1.squadButtonMenuDirection else menuDirection.Up
	local var13 = useOnPlaySquadButtonCallbackModule(var12, playButtonState, p1.referralSource, p1.universeId)
	local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 = fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or p1.launchOnReleaseAfterUnmount == true
	local _ = nil
	local _ = nil
	local var14 = reactModule.useCallback(function(p2)
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
		fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1
	})
	local var15 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), playButtonState (write)
		var14(playButtonState)
	end, { var14, playButtonState })
	local var16 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), secondaryPlayButtonState (write)
		var14(secondaryPlayButtonState)
	end, { var14, secondaryPlayButtonState })
	var15 = usePlayOnReleaseAfterUnmountModule(var15)
	local var17 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and var15 then var15.playButtonRef else nil
	local var18 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and var15 then var15.loadingCaptureRef else nil
	local var19 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 then var15.onActivated else var15
	local var20 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), p1 (ref), var13 (ref)
		if not var2.current then return end
		if p1.onActivated then
			p1.onActivated()
		end
		var13(p2)
	end, { var13, p1.onActivated })
	
	if fFlagSduiExperienceDetailsSupport then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var19 (ref)
			local onRegisterActivation = p1.onRegisterActivation
			
			if onRegisterActivation == nil then
				return
			end
			return onRegisterActivation(var19)
		end, { p1.onRegisterActivation, var19 })
	end
	local var21 = useLocalization({
		join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		playDemo = "Feature.ExperienceDetails.PlayButtonText.PlayDemo",
		unlock = "Feature.ExperienceDetails.PlayButtonText.Unlock",
		joinWithParty = "Feature.Squads.Action.JoinWithParty",
		unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		waitingForParty = "Feature.Squads.Action.WaitingForParty",
		play = if fFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else nil,
		playtest = if fFlagLuaAppPlayButtonPrivatePT then "Feature.Build.Action.Playtest" else nil,
		earlyAccess = if fFlagEnableGameJoinEarlyAccess then "Feature.VirtualEvents.Label.EarlyAccess" else nil
	})
	local var22 = nil
	local var23 = nil
	local var24 = nil
	
	if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		local var25, var26, var27 = useUserExperiment({ appUserLayers.PlayButtonUXExposureLayer }, function(p2)
			-- upvalues: appUserLayers (copy)
			local playButtonUXExposureLayer = p2[appUserLayers.PlayButtonUXExposureLayer] or {}
			
			return playButtonUXExposureLayer.HasJoinTextButton, playButtonUXExposureLayer.HasIconPlayButton, playButtonUXExposureLayer.HasPlayButtonLoadingSkeleton
		end, true)
		var22 = var25
		var23 = var26
		var24 = var27
	end
	if fFlagLuaAppLogExposurePlayButtonUX then
		reactModule.useEffect(function()
			-- upvalues: IXPService (copy), appUserLayers (copy)
			IXPService:LogUserLayerExposure(appUserLayers.PlayButtonUXExposureLayer)
		end, {})
	end
	local var28 = useTokens()
	
	if fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP and p1.shouldUseModuleLegacyPlayButtonView then
		local var29 = if var4 then var4.price else 0
		local var30 = if var4 then var4.localizedFiatPrice else ""
		
		if secondaryPlayButtonState == nil then
			return reactModule.createElement(legacyPlayButtonModule, {
				Size = UDim2.new(p1.width or UDim.new(1, 0), UDim.new(1, 0)),
				LayoutOrder = p1.LayoutOrder,
				playButtonState = playButtonState,
				price = var29,
				localizedFiatPrice = var30,
				onPlayButtonActivated = var19,
				onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then var20 else nil,
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
				price = var29,
				localizedFiatPrice = var30,
				onPlayButtonActivated = var19,
				onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then var20 else nil,
				testId = p1.testId
			}),
			SecondaryPlayButton = reactModule.createElement(legacyPlayButtonModule, {
				LayoutOrder = 2,
				Size = uDim2,
				playButtonState = secondaryPlayButtonState,
				price = var29,
				localizedFiatPrice = var30,
				onPlayButtonActivated = var16 or var1,
				onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then var20 else nil,
				testId = if p1.testId then `{p1.testId}--secondary` else nil
			})
		})
	else
		local var31 = nil
		
		if fFlagEnableGameJoinEarlyAccess then
			var31 = p1.enableEarlyAccessPlusTooltip == true and (var6 and (fStringR20UniverseIdModule ~= "" and tostring(p1.universeId) == fStringR20UniverseIdModule))
		end
		return reactModule.createElement(playButtonGroupViewModule, {
			playButtonState = playButtonState,
			secondaryPlayButtonState = secondaryPlayButtonState,
			showEarlyAccessTooltip = if fFlagEnableGameJoinEarlyAccess then var31 else nil,
			earlyAccessCaption = if fFlagEnableGameJoinEarlyAccess then var9 else nil,
			earlyAccessPending = if fFlagEnableGameJoinEarlyAccess then var10 else nil,
			gameProductInfo = var4,
			localized = var21,
			tokens = var28,
			hasJoinTextPlayableButtonIxp = var22,
			hasIconPlayButtonIxp = var23,
			hasPlayButtonLoadingSkeletonIxp = var24,
			onPlayButtonActivated = var19,
			onSecondaryPlayButtonActivated = var16,
			onPlaySquadButtonActivated = var20,
			playButtonCaptureRef = var17,
			loadingCaptureRef = var18,
			shouldLaunchWhenLoading = fFlagLuaAppLaunchWhenLoadingForce_1,
			shouldLaunchOnReleaseAfterUnmount = fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1,
			squadButtonMenuDirection = var12,
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
end)