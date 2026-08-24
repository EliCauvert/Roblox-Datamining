local parent = script:FindFirstAncestor("GamePlayButton").Parent
local IXPService = game:GetService("IXPService")
local tutilsModule = require(parent.tutils)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local useBreakpointXOrSmaller = responsiveModule.useBreakpointXOrSmaller
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(parent.Localization).Hooks.useLocalization
local UIBloxModule = require(parent.UIBlox)
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local comboButton = UIBloxModule.App.Button.ComboButton
local images = UIBloxModule.App.ImageSet.Images
local menuDirection = UIBloxModule.App.Menu.MenuDirection
local foundationModule = require(parent.Foundation)
local button_1 = foundationModule.Button
local iconButton = foundationModule.IconButton
local skeleton = foundationModule.Skeleton
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
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
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagLuaAppEnablePlaySquadButton = require(parent.SharedFlags).FFlagLuaAppEnablePlaySquadButton
local fFlagLuaAppUnifyPlayButtonAllSurfacesIxp = require(parent.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local fFlagLuaAppJoinTextPlayableButton = require(parent.SharedFlags).FFlagLuaAppJoinTextPlayableButton
local fFlagLuaAppIconPlayButton = require(parent.SharedFlags).FFlagLuaAppIconPlayButton
local fFlagLuaAppPlayButtonLoadingSkeleton = require(parent.SharedFlags).FFlagLuaAppPlayButtonLoadingSkeleton
local luaAppFixPlayButtonDefaultLaunchSource = game:DefineFastFlag("LuaAppFixPlayButtonDefaultLaunchSource", false)
local fFlagLuaAppUnifiedPlayButtonSquadMenuDirection = require(parent.SharedFlags).FFlagLuaAppUnifiedPlayButtonSquadMenuDirection
local getFFlagUIBloxUseFoundationButton = require(parent.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton
local fFlagLuaAppPlayButtonOptOutFoundationButton = require(parent.SharedFlags).FFlagLuaAppPlayButtonOptOutFoundationButton
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagLuaAppPlayButtonLoadingDurationTelemetry = require(parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local fFlagLuaAppTextOnlyPlayButton = require(parent.SharedFlags).FFlagLuaAppTextOnlyPlayButton
local fFlagLuaAppIconTextPlayButton = require(parent.SharedFlags).FFlagLuaAppIconTextPlayButton
local fFlagLuaAppUpdatePlayButtonText = require(parent.SharedFlags).FFlagLuaAppUpdatePlayButtonText
local fFlagLuaAppLogExposurePlayButtonUX = require(parent.SharedFlags).FFlagLuaAppLogExposurePlayButtonUX
local fFlagLuaAppUseTokenHeightForPlayButton = require(parent.SharedFlags).FFlagLuaAppUseTokenHeightForPlayButton
local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp = require(parent.SharedFlags).FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp
local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce = require(parent.SharedFlags).FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce
local fFlagLuaAppLaunchWhenLoadingEdp = require(parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingEdp
local fFlagLuaAppLaunchWhenLoadingForce = require(parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingForce
local fFlagLuaAppDemoModePlayButton = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButton
local fFlagLuaAppPlayButtonViewRefactor = require(parent.SharedFlags).FFlagLuaAppPlayButtonViewRefactor
local fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP = require(parent.SharedFlags).FFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP
local fIntLuaAppPlayButtonSecondaryButtonGap = require(parent.SharedFlags).FIntLuaAppPlayButtonSecondaryButtonGap
local usePlayOnReleaseAfterUnmountModule = require(script.Parent.usePlayOnReleaseAfterUnmount)
local var15 = if fFlagLuaAppIconPlayButton then "play-xlarge" else nil
local play = images["icons/common/play"]
local truncationCollapse = images["icons/actions/truncationCollapse"]
local truncationExpand = images["icons/actions/truncationExpand"]

local var16 = function() end

local var17 = if fFlagLuaAppDemoModePlayButton then require(script.Parent.ButtonHeightSizeKeyByInputSize) else {
	[inputSize.XSmall] = "Size_600",
	[inputSize.Small] = "Size_800",
	[inputSize.Medium] = "Size_1000",
	[inputSize.Large] = "Size_1200"
}

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), useRoactService (ref), roactNetworking (ref), useSelector (ref), gamesProductInfoReducer (ref), tutilsModule (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), fFlagLuaAppDemoModePlayButton (ref), useBreakpointXOrSmaller (ref), responsiveModule (ref), usePlayButtonStateModule (ref), playButtonStatesModule (ref), fFlagLuaAppLaunchWhenLoadingForce (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), useOnPlayButtonCallbackModule (ref), luaAppFixPlayButtonDefaultLaunchSource (ref), fFlagLuaAppUnifiedPlayButtonSquadMenuDirection (ref), menuDirection (ref), useOnPlaySquadButtonCallbackModule (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (ref), usePlayOnReleaseAfterUnmountModule (ref), fFlagSduiExperienceDetailsSupport (ref), useLocalization (ref), fFlagLuaAppUpdatePlayButtonText (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), useUserExperiment (ref), appUserLayers (ref), fFlagLuaAppLogExposurePlayButtonUX (ref), IXPService (ref), useTokens (ref), fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP (ref), fIntLuaAppPlayButtonSecondaryButtonGap (ref), legacyPlayButtonModule (ref), fFlagLuaAppEnablePlaySquadButton (ref), var16 (ref), fFlagLuaAppPlayButtonViewRefactor (ref), playButtonGroupViewModule (ref), playButtonViewModule (ref), inputSize (ref), fFlagLuaAppUseTokenHeightForPlayButton (ref), var17 (ref), fFlagLuaAppPlayButtonLoadingSkeleton (ref), skeleton (ref), radius (ref), buttonVariant (ref), fFlagLuaAppIconTextPlayButton (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppJoinTextPlayableButton (ref), var15 (ref), fFlagLuaAppIconPlayButton (ref), getFFlagIsSquadEnabled (ref), play (ref), comboButton (ref), truncationExpand (ref), truncationCollapse (ref), buttonType (ref), images (ref), button (ref), getFFlagUIBloxUseFoundationButton (ref), fFlagLuaAppPlayButtonOptOutFoundationButton (ref), iconButton (ref), button_1 (ref)
	local var18 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var18 (ref)
		var18.current = true
		
		return function()
			-- upvalues: var18 (copy)
			var18.current = false
		end
	end, {})
	local var19 = useRoactService(roactNetworking)
	local var20 = useSelector(function(p1)
		-- upvalues: p0 (ref), gamesProductInfoReducer (copy)
		return if p0.universeId then p1[gamesProductInfoReducer.key][p0.universeId] else nil
	end, tutilsModule.shallowEqual)
	local var21 = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then p0.eventContext or "PlayButton" else nil
	local var22 = if fFlagLuaAppDemoModePlayButton then useBreakpointXOrSmaller(responsiveModule.Keys.Small) else nil
	local var23 = usePlayButtonStateModule(var19, p0.universeId, p0.fetchDelayInSeconds, p0.isPlayableWhenLoading, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var21 else nil)
	local playButtonState = var23.playButtonState
	local var24 = if fFlagLuaAppDemoModePlayButton then var23.secondaryPlayButtonState else nil
	
	if fFlagLuaAppDemoModePlayButton and var24 ~= nil then
		local var25 = var24 == playButtonStatesModule.UnplayableOther
		
		if p0.preferSecondaryPlayButton == true or var22 and playButtonState == playButtonStatesModule.UnplayableOther then
			playButtonState = var24
			var24 = nil
		elseif var22 and var25 then
			var24 = nil
		end
	end
	local var32
	local fFlagLuaAppLaunchWhenLoadingForce_1 = fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp and p0.launchWhenLoading == true
	local var27 = useOnPlayButtonCallbackModule(p0.universeId, p0.referralSource, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var21 else p0.eventContext or "PlayButton", nil, p0.launchSource or (if luaAppFixPlayButtonDefaultLaunchSource then "UnknownLaunchSource" else "LuaGameCard"), p0.experienceJoinData, p0.placeId, if fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppLaunchWhenLoadingForce then p0.launchWhenLoading else nil)
	local var28 = if fFlagLuaAppUnifiedPlayButtonSquadMenuDirection and p0.squadButtonMenuDirection ~= nil then p0.squadButtonMenuDirection else menuDirection.Up
	local var29 = useOnPlaySquadButtonCallbackModule(var28, playButtonState, p0.referralSource, p0.universeId)
	local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 = fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp and p0.launchOnReleaseAfterUnmount == true
	local _ = nil
	local var31 = nil
	
	if fFlagLuaAppDemoModePlayButton then
		local useCallback = reactModule.useCallback
		useCallback = useCallback(function(p2)
			-- upvalues: fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 (ref), var18 (ref), p0 (ref), playButtonStatesModule (copy), var27 (ref)
			if p2 == nil then return end
			if not fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and not var18.current then return end
			if p0.onActivated then
				p0.onActivated()
			end
			if p0.onPurchaseRequiredCallback and (p2 == playButtonStatesModule.PaidAccess or p2 == playButtonStatesModule.FiatPaidAccess) then
				p0.onPurchaseRequiredCallback()
				
				return
			end
			var27(p2, p0.reportExperienceLaunched)
		end, {
			var27,
			p0.onPurchaseRequiredCallback,
			p0.reportExperienceLaunched,
			p0.onActivated,
			if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 else nil
		})
		var32 = reactModule.useCallback(function()
			-- upvalues: useCallback (ref), playButtonState (write)
			useCallback(playButtonState)
		end, { useCallback, playButtonState })
		var31 = reactModule.useCallback(function()
			-- upvalues: useCallback (ref), var24 (write)
			useCallback(var24)
		end, { useCallback, var24 })
	else
		var32 = reactModule.useCallback(function()
			-- upvalues: fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 (ref), var18 (ref), p0 (ref), playButtonState (write), playButtonStatesModule (copy), var27 (ref)
			if not fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and not var18.current then return end
			if p0.onActivated then
				p0.onActivated()
			end
			if p0.onPurchaseRequiredCallback and (playButtonState == playButtonStatesModule.PaidAccess or playButtonState == playButtonStatesModule.FiatPaidAccess) then
				p0.onPurchaseRequiredCallback()
				
				return
			end
			var27(playButtonState, p0.reportExperienceLaunched)
		end, {
			var27, playButtonState, p0.onPurchaseRequiredCallback,
			p0.reportExperienceLaunched, p0.onActivated,
			if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 else nil
		})
	end
	local var33 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce then usePlayOnReleaseAfterUnmountModule(var32) else nil
	local var34 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and var33 then var33.playButtonRef else nil
	local var35 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and var33 then var33.loadingCaptureRef else nil
	local var36 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 then var33.onActivated else var32
	local var37 = reactModule.useCallback(function(p3)
		-- upvalues: var18 (ref), p0 (ref), var29 (ref)
		if not var18.current then return end
		if p0.onActivated then
			p0.onActivated()
		end
		var29(p3)
	end, { var29, p0.onActivated })
	
	if fFlagSduiExperienceDetailsSupport then
		reactModule.useEffect(function()
			-- upvalues: p0 (ref), var36 (ref)
			local onRegisterActivation = p0.onRegisterActivation
			
			if onRegisterActivation == nil then
				return
			end
			return onRegisterActivation(var36)
		end, { p0.onRegisterActivation, var36 })
	end
	local var38 = useLocalization({
		join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		unlock = "Feature.ExperienceDetails.PlayButtonText.Unlock",
		joinWithParty = "Feature.Squads.Action.JoinWithParty",
		unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		waitingForParty = "Feature.Squads.Action.WaitingForParty",
		play = if fFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else nil,
		playDemo = if fFlagLuaAppDemoModePlayButton then "Feature.ExperienceDetails.PlayButtonText.PlayDemo" else nil
	})
	local var39 = nil
	local var40 = nil
	local var41 = nil
	
	if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		local var42, var43, var44 = useUserExperiment({ appUserLayers.PlayButtonUXExposureLayer }, function(p4)
			-- upvalues: appUserLayers (copy)
			local playButtonUXExposureLayer = p4[appUserLayers.PlayButtonUXExposureLayer] or {}
			
			return playButtonUXExposureLayer.HasJoinTextButton, playButtonUXExposureLayer.HasIconPlayButton, playButtonUXExposureLayer.HasPlayButtonLoadingSkeleton
		end, true)
		var39 = var42
		var40 = var43
		var41 = var44
	end
	if fFlagLuaAppLogExposurePlayButtonUX then
		reactModule.useEffect(function()
			-- upvalues: IXPService (copy), appUserLayers (copy)
			IXPService:LogUserLayerExposure(appUserLayers.PlayButtonUXExposureLayer)
		end, {})
	end
	local var45 = useTokens()
	
	if fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP and p0.shouldUseModuleLegacyPlayButtonView then
		local var46 = if var20 then var20.price else 0
		local var47 = if var20 then var20.localizedFiatPrice else ""
		
		if fFlagLuaAppDemoModePlayButton and var24 ~= nil then
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
					price = var46,
					localizedFiatPrice = var47,
					onPlayButtonActivated = var36,
					onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then var37 else nil,
					testId = p0.testId
				}),
				SecondaryPlayButton = reactModule.createElement(legacyPlayButtonModule, {
					LayoutOrder = 2,
					Size = uDim2,
					playButtonState = var24,
					price = var46,
					localizedFiatPrice = var47,
					onPlayButtonActivated = var31 or var16,
					onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then var37 else nil,
					testId = if p0.testId then `{p0.testId}--secondary` else nil
				})
			})
		end
		return reactModule.createElement(legacyPlayButtonModule, {
			Size = UDim2.new(p0.width or UDim.new(1, 0), UDim.new(1, 0)),
			LayoutOrder = p0.LayoutOrder,
			playButtonState = playButtonState,
			price = var46,
			localizedFiatPrice = var47,
			onPlayButtonActivated = var36,
			onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then var37 else nil,
			testId = p0.testId
		})
	elseif fFlagLuaAppPlayButtonViewRefactor then
		return reactModule.createElement(if fFlagLuaAppDemoModePlayButton then playButtonGroupViewModule else playButtonViewModule, {
			playButtonState = playButtonState,
			secondaryPlayButtonState = if fFlagLuaAppDemoModePlayButton then var24 else nil,
			gameProductInfo = var20,
			localized = var38,
			tokens = var45,
			hasJoinTextPlayableButtonIxp = var39,
			hasIconPlayButtonIxp = var40,
			hasPlayButtonLoadingSkeletonIxp = var41,
			onPlayButtonActivated = var36,
			onSecondaryPlayButtonActivated = if fFlagLuaAppDemoModePlayButton then var31 else nil,
			onPlaySquadButtonActivated = var37,
			playButtonCaptureRef = var34,
			loadingCaptureRef = var35,
			shouldLaunchWhenLoading = fFlagLuaAppLaunchWhenLoadingForce_1,
			shouldLaunchOnReleaseAfterUnmount = fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1,
			squadButtonMenuDirection = var28,
			playableText = p0.playableText,
			fiatText = p0.fiatText,
			hidePlayableIcon = p0.hidePlayableIcon,
			hideOptionalText = p0.hideOptionalText,
			buttonSize = p0.buttonSize,
			width = p0.width,
			expandWidthForSecondaryPlayButton = if fFlagLuaAppDemoModePlayButton then p0.expandWidthForSecondaryPlayButton else nil,
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
	local var49 = false
	local var50 = false
	local var51 = false
	local buttonSize = p0.buttonSize or inputSize.Medium
	local var53 = nil
	
	if fFlagLuaAppUseTokenHeightForPlayButton then
		local var54 = var17[buttonSize] or "Size_1000"
		var53 = if var45 and var45.Size[var54] then var45.Size[var54] else 40
	end
	local var55 = if p0.width then "Fill" else p0.fillBehavior
	local subtle = nil
	local var56 = nil
	local var57 = nil
	local textButton = nil
	local var59 = nil
	
	if playButtonState == playButtonStatesModule.Loading then
		if p0.hideIfLoading then
			return nil
		elseif fFlagLuaAppPlayButtonLoadingSkeleton and (not p0.useUIBloxButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or var41)) then
			local _ = nil
			local var60 = if fFlagLuaAppUseTokenHeightForPlayButton then var53 else var45 and var45.Size[var17[buttonSize] or "Size_1000"]
			var59 = if var55 == "Fill" then UDim.new(1, 0) else UDim.new(0, var60)
			local uDim2 = UDim2.new(var59, UDim.new(0, var60))
			local fFlagLuaAppUnifyPlayButtonAllSurfacesIxp_1 = fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or (fFlagLuaAppLaunchWhenLoadingForce_1 or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1)
			local var63 = reactModule.createElement(skeleton, {
				ZIndex = 2,
				Size = if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp_1 then UDim2.fromScale(1, 1) else uDim2,
				radius = radius.Medium
			})
			textButton = if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp_1 then reactModule.createElement("TextButton", {
				Size = uDim2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 2,
				ref = var35,
				[reactModule.Event.Activated] = var36
			}, { Skeleton = var63 }) else var63
			var51 = true
		end
		subtle = buttonVariant.Emphasis
	elseif playButtonState == playButtonStatesModule.Playable then
		subtle = buttonVariant.Emphasis
		
		if fFlagLuaAppIconTextPlayButton or (fFlagLuaAppTextOnlyPlayButton or (fFlagLuaAppJoinTextPlayableButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or var39))) then
			var57 = p0.playableText or (if fFlagLuaAppUpdatePlayButtonText then var38.play else var38.join)
			
			if fFlagLuaAppIconTextPlayButton and not p0.hidePlayableIcon then
				var56 = var15
			end
		elseif not fFlagLuaAppIconPlayButton and not p0.hidePlayableIcon then
			var56 = "icons/common/play"
		end
		var57 = p0.playableText
		
		if fFlagLuaAppIconPlayButton and not p0.hidePlayableIcon then
			var56 = if var57 and var57 ~= "" then "icons/common/play" else var15
		end
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.PlayableWithParty then
		var56 = play
		var57 = if p0.hideOptionalText then nil else var38.joinWithParty
		var49 = true
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.WaitingForParty then
		var56 = play
		var57 = if p0.hideOptionalText then nil else var38.waitingForParty
		var51 = true
		var50 = true
		var49 = true
	elseif playButtonState == playButtonStatesModule.PaidAccess then
		var57 = tostring(if var20 then var20.price else 0)
		subtle = buttonVariant.Emphasis
		var56 = "icons/common/robux"
	elseif playButtonState == playButtonStatesModule.FiatPaidAccess then
		subtle = buttonVariant.Emphasis
		var57 = p0.fiatText or (if var20 then var20.localizedFiatPrice else "")
	elseif playButtonState == playButtonStatesModule.ActionNeeded then
		subtle = buttonVariant.Emphasis
		var57 = var38.unlock
	elseif playButtonState == playButtonStatesModule.UnplayableOther then
		if p0.hideIfUnplayable then
			return nil
		end
		subtle = buttonVariant.Subtle
		var56 = "icons/status/unavailable"
		var57 = if p0.hideOptionalText then nil else var38.unavailable
		var51 = true
	else
		error("invalid play button state!")
	end
	local var65, var72
	local _ = nil
	
	if var49 then
		if not fFlagLuaAppUseTokenHeightForPlayButton then
			local var64 = var17[buttonSize] or "Size_1000"
			var53 = if var45 and var45.Size[var64] then var45.Size[var64] else 40
		end
		var65 = reactModule.createElement(comboButton, {
			size = UDim2.new(1, 0, 0, var53),
			button = {
				icon = var56,
				text = var57,
				isDisabled = var51,
				onActivated = if not var51 then var36 else function() end
			},
			overflow = {
				icon = if fFlagLuaAppUnifiedPlayButtonSquadMenuDirection and var28 == menuDirection.Down then truncationExpand else truncationCollapse,
				isDisabled = var50,
				onActivated = if not var50 then var37 else function() end
			},
			testId = p0.testId
		})
	elseif p0.useUIBloxButton then
		if not fFlagLuaAppUseTokenHeightForPlayButton then
			local var66 = var17[buttonSize] or "Size_1000"
			var53 = if var45 and var45.Size[var66] then var45.Size[var66] else 40
		end
		local isFit = var55 == "Fit"
		local var68 = if isFit then UDim2.new(0, 0, 0, var53) else UDim2.new(1, 0, 0, var53)
		local var69 = playButtonState == playButtonStatesModule.Loading
		local var70 = if subtle == buttonVariant.SubEmphasis then buttonType.PrimarySystem elseif subtle == buttonVariant.Subtle then buttonType.Secondary else buttonType.PrimaryContextual
		local var71 = if var56 == var15 then play else var56
		
		if type(var71) == "string" then
			var71 = images[var71]
		end
		var65 = reactModule.createElement(button, {
			size = var68,
			fitContent = isFit,
			buttonType = var70,
			icon = var71,
			text = var57,
			isLoading = var69,
			isDisabled = var51 or var69,
			userInteractionEnabled = not (var51 or var69),
			onActivated = if var51 or var69 then var16 else var36,
			ref = var34,
			[reactModule.Tag] = if p0.testId then `data-testid={p0.testId}` else nil,
			DO_NOT_USE_useUIBloxButton = if getFFlagUIBloxUseFoundationButton() or fFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
		})
		
		if (fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or fFlagLuaAppLaunchWhenLoadingForce_1 or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1) and var69 then
			textButton = reactModule.createElement("TextButton", {
				Size = var68,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 2,
				ref = var35,
				[reactModule.Event.Activated] = var36
			})
		end
	elseif fFlagLuaAppIconPlayButton then
		if var57 ~= nil then
			var72 = false
			
			if var57 == "" then
				local _ = var56 ~= nil
			end
		end
	else
		var72 = nil
	end
	var65 = if fFlagLuaAppIconPlayButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or var40) and var72 then reactModule.createElement(iconButton, {
		icon = var56,
		variant = subtle,
		size = buttonSize,
		width = if fFlagLuaAppPlayButtonLoadingSkeleton and playButtonState == playButtonStatesModule.Loading then var59 else nil,
		fillBehavior = var55,
		isDisabled = var51,
		onActivated = if not var51 then var36 else var16,
		ref = var34,
		testId = p0.testId
	}) else reactModule.createElement(button_1, {
		icon = var56,
		text = var57,
		variant = subtle,
		size = buttonSize,
		width = if fFlagLuaAppPlayButtonLoadingSkeleton and playButtonState == playButtonStatesModule.Loading then var59 else nil,
		fillBehavior = var55,
		isDisabled = var51,
		onActivated = if not var51 then var36 else var16,
		ref = var34,
		testId = p0.testId
	})
	return reactModule.createElement("Frame", {
		LayoutOrder = p0.LayoutOrder,
		Position = p0.Position,
		Size = if fFlagLuaAppUseTokenHeightForPlayButton then UDim2.new(if p0.width then p0.width elseif var55 == "Fill" then UDim.new(1, 0) else UDim.new(0, 0), UDim.new(0, var53)) elseif p0.width then UDim2.new(p0.width, UDim.new(0, 0)) elseif var55 == "Fill" then UDim2.new(1, 0, 1, 0) else nil,
		AutomaticSize = if fFlagLuaAppUseTokenHeightForPlayButton then if var55 == "Fill" then nil else Enum.AutomaticSize.X elseif var55 == "Fill" then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Tag] = if fFlagSduiExperienceDetailsSupport then p0.tag else nil
	}, {
		LoadingSkeleton = if playButtonState == playButtonStatesModule.Loading then textButton else nil,
		PlayButton = var65
	})
end)