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
local playButtonGroupViewModule = require(script.Parent.PlayButtonGroupView)
local playButtonViewModule = require(script.Parent.PlayButtonView)
local playButtonStatesModule = require(script.Parent.PlayButtonStates)
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
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
local usePlayOnReleaseAfterUnmountModule = require(script.Parent.usePlayOnReleaseAfterUnmount)
local var14 = if fFlagLuaAppIconPlayButton then "play-xlarge" else nil
local play = images["icons/common/play"]
local truncationCollapse = images["icons/actions/truncationCollapse"]
local truncationExpand = images["icons/actions/truncationExpand"]

local var15 = function() --[[ line: 84 ]] end

local var16 = if fFlagLuaAppDemoModePlayButton then require(script.Parent.ButtonHeightSizeKeyByInputSize) else {
	[inputSize.XSmall] = "Size_600",
	[inputSize.Small] = "Size_800",
	[inputSize.Medium] = "Size_1000",
	[inputSize.Large] = "Size_1200"
}

return reactModule.memo(function(p0) --[[ line: 183 | named "PlayButton" ]]
	-- upvalues: reactModule (ref), useRoactService (ref), roactNetworking (ref), useSelector (ref), gamesProductInfoReducer (ref), tutilsModule (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), fFlagLuaAppDemoModePlayButton (ref), useBreakpointXOrSmaller (ref), responsiveModule (ref), usePlayButtonStateModule (ref), playButtonStatesModule (ref), fFlagLuaAppLaunchWhenLoadingForce (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), useOnPlayButtonCallbackModule (ref), luaAppFixPlayButtonDefaultLaunchSource (ref), fFlagLuaAppUnifiedPlayButtonSquadMenuDirection (ref), menuDirection (ref), useOnPlaySquadButtonCallbackModule (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (ref), usePlayOnReleaseAfterUnmountModule (ref), fFlagSduiExperienceDetailsSupport (ref), useLocalization (ref), fFlagLuaAppUpdatePlayButtonText (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), useUserExperiment (ref), appUserLayers (ref), fFlagLuaAppLogExposurePlayButtonUX (ref), IXPService (ref), useTokens (ref), fFlagLuaAppPlayButtonViewRefactor (ref), playButtonGroupViewModule (ref), playButtonViewModule (ref), inputSize (ref), fFlagLuaAppUseTokenHeightForPlayButton (ref), var16 (ref), fFlagLuaAppPlayButtonLoadingSkeleton (ref), skeleton (ref), radius (ref), buttonVariant (ref), fFlagLuaAppIconTextPlayButton (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppJoinTextPlayableButton (ref), var14 (ref), fFlagLuaAppIconPlayButton (ref), getFFlagIsSquadEnabled (ref), play (ref), comboButton (ref), truncationExpand (ref), truncationCollapse (ref), buttonType (ref), images (ref), button (ref), var15 (ref), getFFlagUIBloxUseFoundationButton (ref), fFlagLuaAppPlayButtonOptOutFoundationButton (ref), iconButton (ref), button_1 (ref)
	local var17 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 185 ]]
		-- upvalues: var17 (ref)
		var17.current = true
		
		return function() --[[ line: 187 ]]
			-- upvalues: var17 (copy)
			var17.current = false
		end
	end, {})
	local var18 = useRoactService(roactNetworking)
	local var19 = useSelector(function(p1) --[[ line: 193 ]]
		-- upvalues: p0 (ref), gamesProductInfoReducer (copy)
		return if p0.universeId then p1[gamesProductInfoReducer.key][p0.universeId] else nil
	end, tutilsModule.shallowEqual)
	local var20 = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then p0.eventContext or "PlayButton" else nil
	local var21 = if fFlagLuaAppDemoModePlayButton then useBreakpointXOrSmaller(responsiveModule.Keys.Small) else nil
	local var22 = usePlayButtonStateModule(var18, p0.universeId, p0.fetchDelayInSeconds, p0.isPlayableWhenLoading, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var20 else nil)
	local playButtonState = var22.playButtonState
	local var23 = if fFlagLuaAppDemoModePlayButton then var22.secondaryPlayButtonState else nil
	
	if fFlagLuaAppDemoModePlayButton and var23 ~= nil then
		local var24 = var23 == playButtonStatesModule.UnplayableOther
		
		if p0.preferSecondaryPlayButton == true or var21 and playButtonState == playButtonStatesModule.UnplayableOther then
			playButtonState = var23
			var23 = nil
		elseif var21 and var24 then
			var23 = nil
		end
	end
	local var31
	local fFlagLuaAppLaunchWhenLoadingForce_1 = fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp and p0.launchWhenLoading == true
	local var26 = useOnPlayButtonCallbackModule(p0.universeId, p0.referralSource, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var20 else p0.eventContext or "PlayButton", nil, p0.launchSource or (if luaAppFixPlayButtonDefaultLaunchSource then "UnknownLaunchSource" else "LuaGameCard"), p0.experienceJoinData, p0.placeId, if fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppLaunchWhenLoadingForce then p0.launchWhenLoading else nil)
	local var27 = if fFlagLuaAppUnifiedPlayButtonSquadMenuDirection and p0.squadButtonMenuDirection ~= nil then p0.squadButtonMenuDirection else menuDirection.Up
	local var28 = useOnPlaySquadButtonCallbackModule(var27, playButtonState, p0.referralSource, p0.universeId)
	local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 = fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp and p0.launchOnReleaseAfterUnmount == true
	local _ = nil
	local var30 = nil
	
	if fFlagLuaAppDemoModePlayButton then
		local useCallback = reactModule.useCallback
		useCallback = useCallback(function(p2) --[[ line: 264 ]]
			-- upvalues: fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 (ref), var17 (ref), p0 (ref), playButtonStatesModule (copy), var26 (ref)
			if p2 == nil then return end
			if not fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and not var17.current then return end
			if p0.onActivated then
				p0.onActivated()
			end
			if p0.onPurchaseRequiredCallback and (p2 == playButtonStatesModule.PaidAccess or p2 == playButtonStatesModule.FiatPaidAccess) then
				p0.onPurchaseRequiredCallback()
				
				return
			end
			var26(p2, p0.reportExperienceLaunched)
		end, {
			var26,
			p0.onPurchaseRequiredCallback,
			p0.reportExperienceLaunched,
			p0.onActivated,
			if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 else nil
		})
		var31 = reactModule.useCallback(function() --[[ line: 301 ]]
			-- upvalues: useCallback (ref), playButtonState (write)
			useCallback(playButtonState)
		end, { useCallback, playButtonState })
		var30 = reactModule.useCallback(function() --[[ line: 305 ]]
			-- upvalues: useCallback (ref), var23 (write)
			useCallback(var23)
		end, { useCallback, var23 })
	else
		var31 = reactModule.useCallback(function() --[[ line: 310 ]]
			-- upvalues: fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 (ref), var17 (ref), p0 (ref), playButtonState (write), playButtonStatesModule (copy), var26 (ref)
			if not fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and not var17.current then return end
			if p0.onActivated then
				p0.onActivated()
			end
			if p0.onPurchaseRequiredCallback and (playButtonState == playButtonStatesModule.PaidAccess or playButtonState == playButtonStatesModule.FiatPaidAccess) then
				p0.onPurchaseRequiredCallback()
				
				return
			end
			var26(playButtonState, p0.reportExperienceLaunched)
		end, {
			var26, playButtonState, p0.onPurchaseRequiredCallback,
			p0.reportExperienceLaunched, p0.onActivated,
			if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 else nil
		})
	end
	local var32 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce then usePlayOnReleaseAfterUnmountModule(var31) else nil
	local var33 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and var32 then var32.playButtonRef else nil
	local var34 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and var32 then var32.loadingCaptureRef else nil
	local var35 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 then var32.onActivated else var31
	local var36 = reactModule.useCallback(function(p3) --[[ line: 360 ]]
		-- upvalues: var17 (ref), p0 (ref), var28 (ref)
		if not var17.current then return end
		if p0.onActivated then
			p0.onActivated()
		end
		var28(p3)
	end, { var28, p0.onActivated })
	
	if fFlagSduiExperienceDetailsSupport then
		reactModule.useEffect(function() --[[ line: 371 ]]
			-- upvalues: p0 (ref), var35 (ref)
			local onRegisterActivation = p0.onRegisterActivation
			
			if onRegisterActivation == nil then
				return
			end
			return onRegisterActivation(var35)
		end, { p0.onRegisterActivation, var35 })
	end
	local var37 = useLocalization({
		join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		unlock = "Feature.ExperienceDetails.PlayButtonText.Unlock",
		joinWithParty = "Feature.Squads.Action.JoinWithParty",
		unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		waitingForParty = "Feature.Squads.Action.WaitingForParty",
		play = if fFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else nil,
		playDemo = if fFlagLuaAppDemoModePlayButton then "Feature.ExperienceDetails.PlayButtonText.PlayDemo" else nil
	})
	local var38 = nil
	local var39 = nil
	local var40 = nil
	
	if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		local var41, var42, var43 = useUserExperiment({ appUserLayers.PlayButtonUXExposureLayer }, function(p4) --[[ line: 394 ]]
			-- upvalues: appUserLayers (copy)
			local playButtonUXExposureLayer = p4[appUserLayers.PlayButtonUXExposureLayer] or {}
			
			return playButtonUXExposureLayer.HasJoinTextButton, playButtonUXExposureLayer.HasIconPlayButton, playButtonUXExposureLayer.HasPlayButtonLoadingSkeleton
		end, true)
		var38 = var41
		var39 = var42
		var40 = var43
	end
	if fFlagLuaAppLogExposurePlayButtonUX then
		reactModule.useEffect(function() --[[ line: 403 ]]
			-- upvalues: IXPService (copy), appUserLayers (copy)
			IXPService:LogUserLayerExposure(appUserLayers.PlayButtonUXExposureLayer)
		end, {})
	end
	local var44 = useTokens()
	
	if fFlagLuaAppPlayButtonViewRefactor then
		return reactModule.createElement(if fFlagLuaAppDemoModePlayButton then playButtonGroupViewModule else playButtonViewModule, {
			playButtonState = playButtonState,
			secondaryPlayButtonState = if fFlagLuaAppDemoModePlayButton then var23 else nil,
			gameProductInfo = var19,
			localized = var37,
			tokens = var44,
			hasJoinTextPlayableButtonIxp = var38,
			hasIconPlayButtonIxp = var39,
			hasPlayButtonLoadingSkeletonIxp = var40,
			onPlayButtonActivated = var35,
			onSecondaryPlayButtonActivated = if fFlagLuaAppDemoModePlayButton then var30 else nil,
			onPlaySquadButtonActivated = var36,
			playButtonCaptureRef = var33,
			loadingCaptureRef = var34,
			shouldLaunchWhenLoading = fFlagLuaAppLaunchWhenLoadingForce_1,
			shouldLaunchOnReleaseAfterUnmount = fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1,
			squadButtonMenuDirection = var27,
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
	local var45 = false
	local var46 = false
	local var47 = false
	local buttonSize = p0.buttonSize or inputSize.Medium
	local var49 = nil
	
	if fFlagLuaAppUseTokenHeightForPlayButton then
		local var50 = var16[buttonSize] or "Size_1000"
		var49 = if var44 and var44.Size[var50] then var44.Size[var50] else 40
	end
	local var51 = if p0.width then "Fill" else p0.fillBehavior
	local subtle = nil
	local var52 = nil
	local var53 = nil
	local textButton = nil
	local var55 = nil
	
	if playButtonState == playButtonStatesModule.Loading then
		if p0.hideIfLoading then
			return nil
		elseif fFlagLuaAppPlayButtonLoadingSkeleton and (not p0.useUIBloxButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or var40)) then
			local _ = nil
			local var56 = if fFlagLuaAppUseTokenHeightForPlayButton then var49 else var44 and var44.Size[var16[buttonSize] or "Size_1000"]
			var55 = if var51 == "Fill" then UDim.new(1, 0) else UDim.new(0, var56)
			local uDim2 = UDim2.new(var55, UDim.new(0, var56))
			local fFlagLuaAppUnifyPlayButtonAllSurfacesIxp_1 = fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or (fFlagLuaAppLaunchWhenLoadingForce_1 or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1)
			local var59 = reactModule.createElement(skeleton, {
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
				ref = var34,
				[reactModule.Event.Activated] = var35
			}, { Skeleton = var59 }) else var59
			var47 = true
		end
		subtle = buttonVariant.Emphasis
	elseif playButtonState == playButtonStatesModule.Playable then
		subtle = buttonVariant.Emphasis
		
		if fFlagLuaAppIconTextPlayButton or (fFlagLuaAppTextOnlyPlayButton or (fFlagLuaAppJoinTextPlayableButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or var38))) then
			var53 = p0.playableText or (if fFlagLuaAppUpdatePlayButtonText then var37.play else var37.join)
			
			if fFlagLuaAppIconTextPlayButton and not p0.hidePlayableIcon then
				var52 = var14
			end
		elseif not fFlagLuaAppIconPlayButton and not p0.hidePlayableIcon then
			var52 = "icons/common/play"
		end
		var53 = p0.playableText
		
		if fFlagLuaAppIconPlayButton and not p0.hidePlayableIcon then
			var52 = if var53 and var53 ~= "" then "icons/common/play" else var14
		end
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.PlayableWithParty then
		var52 = play
		var53 = if p0.hideOptionalText then nil else var37.joinWithParty
		var45 = true
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.WaitingForParty then
		var52 = play
		var53 = if p0.hideOptionalText then nil else var37.waitingForParty
		var47 = true
		var46 = true
		var45 = true
	elseif playButtonState == playButtonStatesModule.PaidAccess then
		var53 = tostring(if var19 then var19.price else 0)
		subtle = buttonVariant.Emphasis
		var52 = "icons/common/robux"
	elseif playButtonState == playButtonStatesModule.FiatPaidAccess then
		subtle = buttonVariant.Emphasis
		var53 = p0.fiatText or (if var19 then var19.localizedFiatPrice else "")
	elseif playButtonState == playButtonStatesModule.ActionNeeded then
		subtle = buttonVariant.Emphasis
		var53 = var37.unlock
	elseif playButtonState == playButtonStatesModule.UnplayableOther then
		if p0.hideIfUnplayable then
			return nil
		end
		subtle = buttonVariant.Subtle
		var52 = "icons/status/unavailable"
		var53 = if p0.hideOptionalText then nil else var37.unavailable
		var47 = true
	else
		error("invalid play button state!")
	end
	local var61, var68
	local _ = nil
	
	if var45 then
		if not fFlagLuaAppUseTokenHeightForPlayButton then
			local var60 = var16[buttonSize] or "Size_1000"
			var49 = if var44 and var44.Size[var60] then var44.Size[var60] else 40
		end
		var61 = reactModule.createElement(comboButton, {
			size = UDim2.new(1, 0, 0, var49),
			button = {
				icon = var52,
				text = var53,
				isDisabled = var47,
				onActivated = if not var47 then var35 else function() --[[ line: 597 ]] end
			},
			overflow = {
				icon = if fFlagLuaAppUnifiedPlayButtonSquadMenuDirection and var27 == menuDirection.Down then truncationExpand else truncationCollapse,
				isDisabled = var46,
				onActivated = if not var46 then var36 else function() --[[ line: 605 ]] end
			},
			testId = p0.testId
		})
	elseif p0.useUIBloxButton then
		if not fFlagLuaAppUseTokenHeightForPlayButton then
			local var62 = var16[buttonSize] or "Size_1000"
			var49 = if var44 and var44.Size[var62] then var44.Size[var62] else 40
		end
		local isFit = var51 == "Fit"
		local var64 = if isFit then UDim2.new(0, 0, 0, var49) else UDim2.new(1, 0, 0, var49)
		local var65 = playButtonState == playButtonStatesModule.Loading
		local var66 = if subtle == buttonVariant.SubEmphasis then buttonType.PrimarySystem elseif subtle == buttonVariant.Subtle then buttonType.Secondary else buttonType.PrimaryContextual
		local var67 = if var52 == var14 then play else var52
		
		if type(var67) == "string" then
			var67 = images[var67]
		end
		var61 = reactModule.createElement(button, {
			size = var64,
			fitContent = isFit,
			buttonType = var66,
			icon = var67,
			text = var53,
			isLoading = var65,
			isDisabled = var47 or var65,
			userInteractionEnabled = not (var47 or var65),
			onActivated = if var47 or var65 then var15 else var35,
			ref = var33,
			[reactModule.Tag] = if p0.testId then `data-testid={p0.testId}` else nil,
			DO_NOT_USE_useUIBloxButton = if getFFlagUIBloxUseFoundationButton() or fFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
		})
		
		if (fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or fFlagLuaAppLaunchWhenLoadingForce_1 or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1) and var65 then
			textButton = reactModule.createElement("TextButton", {
				Size = var64,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 2,
				ref = var34,
				[reactModule.Event.Activated] = var35
			})
		end
	elseif fFlagLuaAppIconPlayButton then
		if var53 ~= nil then
			var68 = false
			
			if var53 == "" then
				local _ = var52 ~= nil
			end
		end
	else
		var68 = nil
	end
	var61 = if fFlagLuaAppIconPlayButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or var39) and var68 then reactModule.createElement(iconButton, {
		icon = var52,
		variant = subtle,
		size = buttonSize,
		width = if fFlagLuaAppPlayButtonLoadingSkeleton and playButtonState == playButtonStatesModule.Loading then var55 else nil,
		fillBehavior = var51,
		isDisabled = var47,
		onActivated = if not var47 then var35 else var15,
		ref = var33,
		testId = p0.testId
	}) else reactModule.createElement(button_1, {
		icon = var52,
		text = var53,
		variant = subtle,
		size = buttonSize,
		width = if fFlagLuaAppPlayButtonLoadingSkeleton and playButtonState == playButtonStatesModule.Loading then var55 else nil,
		fillBehavior = var51,
		isDisabled = var47,
		onActivated = if not var47 then var35 else var15,
		ref = var33,
		testId = p0.testId
	})
	return reactModule.createElement("Frame", {
		LayoutOrder = p0.LayoutOrder,
		Position = p0.Position,
		Size = if fFlagLuaAppUseTokenHeightForPlayButton then UDim2.new(if p0.width then p0.width elseif var51 == "Fill" then UDim.new(1, 0) else UDim.new(0, 0), UDim.new(0, var49)) elseif p0.width then UDim2.new(p0.width, UDim.new(0, 0)) elseif var51 == "Fill" then UDim2.new(1, 0, 1, 0) else nil,
		AutomaticSize = if fFlagLuaAppUseTokenHeightForPlayButton then if var51 == "Fill" then nil else Enum.AutomaticSize.X elseif var51 == "Fill" then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Tag] = if fFlagSduiExperienceDetailsSupport then p0.tag else nil
	}, {
		LoadingSkeleton = if playButtonState == playButtonStatesModule.Loading then textButton else nil,
		PlayButton = var61
	})
end)