local parent = script:FindFirstAncestor("GamePlayButton").Parent
local IXPService = game:GetService("IXPService")
local tutilsModule = require(parent.tutils)
local reactModule = require(parent.React)
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
local playButtonStatesModule = require(script.Parent.PlayButtonStates)
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagLuaAppSupportUnifiedUIBloxPlayButton = require(parent.SharedFlags).FFlagLuaAppSupportUnifiedUIBloxPlayButton
local fFlagLuaAppUnifyPlayButtonAllSurfacesIxp = require(parent.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local luaAppJoinTextPlayableButton = game:DefineFastFlag("LuaAppJoinTextPlayableButton", false) or fFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local luaAppIconPlayButton = game:DefineFastFlag("LuaAppIconPlayButton", false) or fFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local var11 = fFlagLuaAppSupportUnifiedUIBloxPlayButton and (game:DefineFastFlag("LuaAppPlayButtonLoadingSkeleton3", false) or fFlagLuaAppUnifyPlayButtonAllSurfacesIxp)
local luaAppFixPlayButtonDefaultLaunchSource = game:DefineFastFlag("LuaAppFixPlayButtonDefaultLaunchSource", false)
local fFlagUpdateActionNeededPlayButtonUi = require(parent.SharedFlags).FFlagUpdateActionNeededPlayButtonUi
local fFlagLuaAppUnifiedPlayButtonSquadMenuDirection = require(parent.SharedFlags).FFlagLuaAppUnifiedPlayButtonSquadMenuDirection
local getFFlagUIBloxUseFoundationButton = require(parent.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton
local fFlagLuaAppPlayButtonOptOutFoundationButton = require(parent.SharedFlags).FFlagLuaAppPlayButtonOptOutFoundationButton
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagLuaAppPlayButtonLoadingDurationTelemetry = require(parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local fFlagLuaAppTextOnlyPlayButton = require(parent.SharedFlags).FFlagLuaAppTextOnlyPlayButton
local fFlagLuaAppIconTextPlayButton = require(parent.SharedFlags).FFlagLuaAppIconTextPlayButton
local fFlagLuaAppUpdatePlayButtonText = require(parent.SharedFlags).FFlagLuaAppUpdatePlayButtonText
local fFlagLuaAppLogExposurePlayButtonUX = require(parent.SharedFlags).FFlagLuaAppLogExposurePlayButtonUX
local luaAppUseTokenHeightForPlayButton = game:DefineFastFlag("LuaAppUseTokenHeightForPlayButton", false)
local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp = require(parent.SharedFlags).FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp
local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce = require(parent.SharedFlags).FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce
local fFlagLuaAppLaunchWhenLoadingEdp = require(parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingEdp
local fFlagLuaAppLaunchWhenLoadingForce = require(parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingForce
local usePlayOnReleaseAfterUnmountModule = require(script.Parent.usePlayOnReleaseAfterUnmount)
local var15 = if luaAppIconPlayButton then "play-xlarge" else nil
local play = images["icons/common/play"]
local truncationCollapse = images["icons/actions/truncationCollapse"]
local truncationExpand = images["icons/actions/truncationExpand"]

local var16 = function() --[[ line: 85 ]] end

local t = {
	[inputSize.XSmall] = "Size_600",
	[inputSize.Small] = "Size_800",
	[inputSize.Medium] = "Size_1000",
	[inputSize.Large] = "Size_1200"
}

return reactModule.memo(function(p0) --[[ line: 180 | named "PlayButton" ]]
	-- upvalues: reactModule (ref), useRoactService (ref), roactNetworking (ref), useSelector (ref), gamesProductInfoReducer (ref), tutilsModule (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), usePlayButtonStateModule (ref), fFlagLuaAppLaunchWhenLoadingForce (ref), fFlagLuaAppLaunchWhenLoadingEdp (ref), useOnPlayButtonCallbackModule (ref), luaAppFixPlayButtonDefaultLaunchSource (ref), fFlagLuaAppUnifiedPlayButtonSquadMenuDirection (ref), menuDirection (ref), useOnPlaySquadButtonCallbackModule (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce (ref), fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (ref), playButtonStatesModule (ref), usePlayOnReleaseAfterUnmountModule (ref), fFlagSduiExperienceDetailsSupport (ref), useLocalization (ref), fFlagLuaAppUpdatePlayButtonText (ref), fFlagUpdateActionNeededPlayButtonUi (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), useUserExperiment (ref), appUserLayers (ref), fFlagLuaAppLogExposurePlayButtonUX (ref), IXPService (ref), fFlagLuaAppSupportUnifiedUIBloxPlayButton (ref), useTokens (ref), inputSize (ref), luaAppUseTokenHeightForPlayButton (ref), t (ref), var11 (ref), skeleton (ref), radius (ref), buttonVariant (ref), fFlagLuaAppIconTextPlayButton (ref), fFlagLuaAppTextOnlyPlayButton (ref), luaAppJoinTextPlayableButton (ref), var15 (ref), luaAppIconPlayButton (ref), getFFlagIsSquadEnabled (ref), play (ref), comboButton (ref), truncationExpand (ref), truncationCollapse (ref), buttonType (ref), images (ref), button (ref), var16 (ref), getFFlagUIBloxUseFoundationButton (ref), fFlagLuaAppPlayButtonOptOutFoundationButton (ref), iconButton (ref), button_1 (ref)
	local var18 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 182 ]]
		-- upvalues: var18 (ref)
		var18.current = true
		
		return function() --[[ line: 184 ]]
			-- upvalues: var18 (copy)
			var18.current = false
		end
	end, {})
	local var19 = useRoactService(roactNetworking)
	local var20 = useSelector(function(p1) --[[ line: 190 ]]
		-- upvalues: p0 (ref), gamesProductInfoReducer (copy)
		return if p0.universeId then p1[gamesProductInfoReducer.key][p0.universeId] else nil
	end, tutilsModule.shallowEqual)
	local var21 = if fFlagLuaAppPlayButtonLoadingDurationTelemetry then p0.eventContext or "PlayButton" else nil
	local playButtonState = usePlayButtonStateModule(var19, p0.universeId, p0.fetchDelayInSeconds, p0.isPlayableWhenLoading, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var21 else nil).playButtonState
	local fFlagLuaAppLaunchWhenLoadingForce_1 = fFlagLuaAppLaunchWhenLoadingForce or fFlagLuaAppLaunchWhenLoadingEdp and p0.launchWhenLoading == true
	local var23 = useOnPlayButtonCallbackModule(p0.universeId, p0.referralSource, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then var21 else p0.eventContext or "PlayButton", nil, p0.launchSource or (if luaAppFixPlayButtonDefaultLaunchSource then "UnknownLaunchSource" else "LuaGameCard"), p0.experienceJoinData, p0.placeId, if fFlagLuaAppLaunchWhenLoadingEdp or fFlagLuaAppLaunchWhenLoadingForce then p0.launchWhenLoading else nil)
	local var24 = if fFlagLuaAppUnifiedPlayButtonSquadMenuDirection and p0.squadButtonMenuDirection ~= nil then p0.squadButtonMenuDirection else menuDirection.Up
	local var25 = useOnPlaySquadButtonCallbackModule(var24, playButtonState, p0.referralSource, p0.universeId)
	local fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 = fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp and p0.launchOnReleaseAfterUnmount == true
	local useCallback = reactModule.useCallback
	useCallback = useCallback(function() --[[ line: 237 ]]
		-- upvalues: fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 (ref), var18 (ref), p0 (ref), playButtonState (ref), playButtonStatesModule (copy), var23 (ref)
		if not fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and not var18.current then return end
		if p0.onActivated then
			p0.onActivated()
		end
		if p0.onPurchaseRequiredCallback and (playButtonState == playButtonStatesModule.PaidAccess or playButtonState == playButtonStatesModule.FiatPaidAccess) then
			p0.onPurchaseRequiredCallback()
			
			return
		end
		var23(playButtonState, p0.reportExperienceLaunched)
	end, {
		var23, playButtonState, p0.onPurchaseRequiredCallback,
		p0.reportExperienceLaunched, p0.onActivated,
		if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 else nil
	})
	local var27 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce then usePlayOnReleaseAfterUnmountModule(useCallback) else nil
	local var28 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and var27 then var27.playButtonRef else nil
	local var29 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 and var27 then var27.loadingCaptureRef else nil
	local var30 = if fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1 then var27.onActivated else useCallback
	local var31 = reactModule.useCallback(function(p2) --[[ line: 286 ]]
		-- upvalues: var18 (ref), p0 (ref), var25 (ref)
		if not var18.current then return end
		if p0.onActivated then
			p0.onActivated()
		end
		var25(p2)
	end, { var25, p0.onActivated })
	
	if fFlagSduiExperienceDetailsSupport then
		reactModule.useEffect(function() --[[ line: 297 ]]
			-- upvalues: p0 (ref), var30 (ref)
			local onRegisterActivation = p0.onRegisterActivation
			
			if onRegisterActivation == nil then
				return
			end
			return onRegisterActivation(var30)
		end, { p0.onRegisterActivation, var30 })
	end
	local var32 = useLocalization({
		join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		joinWithParty = "Feature.Squads.Action.JoinWithParty",
		unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		waitingForParty = "Feature.Squads.Action.WaitingForParty",
		play = if fFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else nil,
		unlock = if fFlagUpdateActionNeededPlayButtonUi then "Feature.ExperienceDetails.PlayButtonText.Unlock" else nil
	})
	local var33 = nil
	local var34 = nil
	local var35 = nil
	
	if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		local var36, var37, var38 = useUserExperiment({ appUserLayers.PlayButtonUXExposureLayer }, function(p3) --[[ line: 319 ]]
			-- upvalues: appUserLayers (copy)
			local playButtonUXExposureLayer = p3[appUserLayers.PlayButtonUXExposureLayer] or {}
			
			return playButtonUXExposureLayer.HasJoinTextButton, playButtonUXExposureLayer.HasIconPlayButton, playButtonUXExposureLayer.HasPlayButtonLoadingSkeleton
		end, true)
		var33 = var36
		var34 = var37
		var35 = var38
	end
	if fFlagLuaAppLogExposurePlayButtonUX then
		reactModule.useEffect(function() --[[ line: 328 ]]
			-- upvalues: IXPService (copy), appUserLayers (copy)
			IXPService:LogUserLayerExposure(appUserLayers.PlayButtonUXExposureLayer)
		end, {})
	end
	local var39 = if fFlagLuaAppSupportUnifiedUIBloxPlayButton then useTokens() else nil
	local var40 = false
	local var41 = false
	local var42 = false
	local buttonSize = p0.buttonSize or inputSize.Medium
	local var44 = nil
	
	if luaAppUseTokenHeightForPlayButton then
		local var45 = t[buttonSize] or "Size_1000"
		var44 = if var39 and var39.Size[var45] then var39.Size[var45] else 40
	end
	local var46 = if fFlagLuaAppSupportUnifiedUIBloxPlayButton and p0.width then "Fill" else p0.fillBehavior
	local subtle = nil
	local var47 = nil
	local var48 = nil
	local textButton = nil
	local var50 = nil
	
	if playButtonState == playButtonStatesModule.Loading then
		if p0.hideIfLoading then
			return nil
		elseif var11 and (not (fFlagLuaAppSupportUnifiedUIBloxPlayButton and p0.useUIBloxButton) and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or var35)) then
			local _ = nil
			local var51 = if luaAppUseTokenHeightForPlayButton then var44 else var39 and var39.Size[t[buttonSize] or "Size_1000"]
			var50 = if var46 == "Fill" then UDim.new(1, 0) else UDim.new(0, var51)
			local uDim2 = UDim2.new(var50, UDim.new(0, var51))
			local fFlagLuaAppUnifyPlayButtonAllSurfacesIxp_1 = fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or (fFlagLuaAppLaunchWhenLoadingForce_1 or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1)
			local var54 = reactModule.createElement(skeleton, {
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
				ref = var29,
				[reactModule.Event.Activated] = var30
			}, { Skeleton = var54 }) else var54
			var42 = true
		end
		subtle = buttonVariant.Emphasis
	elseif playButtonState == playButtonStatesModule.Playable then
		subtle = buttonVariant.Emphasis
		
		if fFlagLuaAppIconTextPlayButton or (fFlagLuaAppTextOnlyPlayButton or (luaAppJoinTextPlayableButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or var33))) then
			var48 = p0.playableText or (if fFlagLuaAppUpdatePlayButtonText then var32.play else var32.join)
			
			if fFlagLuaAppIconTextPlayButton and not p0.hidePlayableIcon then
				var47 = var15
			end
		elseif not luaAppIconPlayButton and not p0.hidePlayableIcon then
			var47 = "icons/common/play"
		end
		var48 = p0.playableText
		
		if luaAppIconPlayButton and not p0.hidePlayableIcon then
			var47 = if var48 and var48 ~= "" then "icons/common/play" else var15
		end
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.PlayableWithParty then
		var47 = play
		var48 = if p0.hideOptionalText then nil else var32.joinWithParty
		var40 = true
	elseif getFFlagIsSquadEnabled() and playButtonState == playButtonStatesModule.WaitingForParty then
		var47 = play
		var48 = if p0.hideOptionalText then nil else var32.waitingForParty
		var42 = true
		var41 = true
		var40 = true
	elseif playButtonState == playButtonStatesModule.PaidAccess then
		var48 = tostring(if var20 then var20.price else 0)
		subtle = buttonVariant.Emphasis
		var47 = "icons/common/robux"
	elseif playButtonState == playButtonStatesModule.FiatPaidAccess then
		subtle = buttonVariant.Emphasis
		var48 = p0.fiatText or (if var20 then var20.localizedFiatPrice else "")
	elseif playButtonState == playButtonStatesModule.ActionNeeded then
		if fFlagUpdateActionNeededPlayButtonUi then
			subtle = buttonVariant.Emphasis
			var48 = var32.unlock
		else
			subtle = buttonVariant.SubEmphasis
			var47 = "icons/status/private"
			var48 = if p0.hideOptionalText then nil else var32.join
		end
	elseif playButtonState == playButtonStatesModule.UnplayableOther then
		if p0.hideIfUnplayable then
			return nil
		end
		subtle = buttonVariant.Subtle
		var47 = "icons/status/unavailable"
		var48 = if p0.hideOptionalText then nil else var32.unavailable
		var42 = true
	else
		error("invalid play button state!")
	end
	local var58, var59
	local _ = nil
	
	if var40 then
		if not luaAppUseTokenHeightForPlayButton and fFlagLuaAppSupportUnifiedUIBloxPlayButton then
			local var55 = t[buttonSize] or "Size_1000"
			var44 = if var39 and var39.Size[var55] then var39.Size[var55] else 40
		end
		local new
		local createElement = reactModule.createElement
		local var56 = comboButton
		local t_1 = {
			layoutOrder = if fFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else p0.LayoutOrder,
			position = if fFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else p0.Position
		}
		
		if fFlagLuaAppSupportUnifiedUIBloxPlayButton then
			new = UDim2.new(1, 0, 0, var44)
		else
			new = UDim2.new
			new = new(p0.width or UDim.new(1, 0), p0.squadButtonHeight or UDim.new(1, 0))
		end
		t_1.size = new
		t_1.button = {
			icon = var47,
			text = var48,
			isDisabled = var42,
			onActivated = if not var42 then var30 else function() --[[ line: 493 ]] end
		}
		t_1.overflow = {
			icon = if fFlagLuaAppUnifiedPlayButtonSquadMenuDirection and var24 == menuDirection.Down then truncationExpand else truncationCollapse,
			isDisabled = var41,
			onActivated = if not var41 then var31 else function() --[[ line: 501 ]] end
		}
		t_1.testId = p0.testId
		var58 = createElement(var56, t_1)
	elseif fFlagLuaAppSupportUnifiedUIBloxPlayButton and p0.useUIBloxButton then
		if not luaAppUseTokenHeightForPlayButton then
			local var60 = t[buttonSize] or "Size_1000"
			var44 = if var39 and var39.Size[var60] then var39.Size[var60] else 40
		end
		local isFit = var46 == "Fit"
		local var62 = if isFit then UDim2.new(0, 0, 0, var44) else UDim2.new(1, 0, 0, var44)
		local var63 = playButtonState == playButtonStatesModule.Loading
		local var64 = if subtle == buttonVariant.SubEmphasis then buttonType.PrimarySystem elseif subtle == buttonVariant.Subtle then buttonType.Secondary else buttonType.PrimaryContextual
		local var65 = if var47 == var15 then play else var47
		
		if type(var65) == "string" then
			var65 = images[var65]
		end
		var58 = reactModule.createElement(button, {
			size = var62,
			fitContent = isFit,
			buttonType = var64,
			icon = var65,
			text = var48,
			isLoading = var63,
			isDisabled = var42 or var63,
			userInteractionEnabled = not (var42 or var63),
			onActivated = if var42 or var63 then var16 else var30,
			ref = var28,
			[reactModule.Tag] = if p0.testId then `data-testid={p0.testId}` else nil,
			DO_NOT_USE_useUIBloxButton = if getFFlagUIBloxUseFoundationButton() or fFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
		})
		
		if (fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or fFlagLuaAppLaunchWhenLoadingForce_1 or fFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce_1) and var63 then
			textButton = reactModule.createElement("TextButton", {
				Size = var62,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 2,
				ref = var29,
				[reactModule.Event.Activated] = var30
			})
		end
	elseif luaAppIconPlayButton then
		if var48 ~= nil then
			var59 = false
			
			if var48 == "" then
				local _ = var47 ~= nil
			end
		end
	else
		var59 = nil
	end
	var58 = if luaAppIconPlayButton and (not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or var34) and var59 then reactModule.createElement(iconButton, {
		LayoutOrder = if fFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else p0.LayoutOrder,
		Position = if fFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else p0.Position,
		icon = var47,
		variant = subtle,
		size = buttonSize,
		width = if var11 and playButtonState == playButtonStatesModule.Loading then var50 elseif fFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else p0.width,
		fillBehavior = var46,
		isDisabled = var42,
		onActivated = if not var42 then var30 else var16,
		ref = var28,
		testId = p0.testId
	}) else reactModule.createElement(button_1, {
		LayoutOrder = if fFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else p0.LayoutOrder,
		Position = if fFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else p0.Position,
		icon = var47,
		text = var48,
		variant = subtle,
		size = buttonSize,
		width = if var11 and playButtonState == playButtonStatesModule.Loading then var50 elseif fFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else p0.width,
		fillBehavior = var46,
		isDisabled = var42,
		onActivated = if not var42 then var30 else var16,
		ref = var28,
		testId = p0.testId
	})
	return if fFlagLuaAppSupportUnifiedUIBloxPlayButton then reactModule.createElement("Frame", {
		LayoutOrder = p0.LayoutOrder,
		Position = p0.Position,
		Size = if luaAppUseTokenHeightForPlayButton then UDim2.new(if p0.width then p0.width elseif var46 == "Fill" then UDim.new(1, 0) else UDim.new(0, 0), UDim.new(0, var44)) elseif p0.width then UDim2.new(p0.width, UDim.new(0, 0)) elseif var46 == "Fill" then UDim2.new(1, 0, 1, 0) else nil,
		AutomaticSize = if luaAppUseTokenHeightForPlayButton then if var46 == "Fill" then nil else Enum.AutomaticSize.X elseif var46 == "Fill" then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[reactModule.Tag] = if fFlagSduiExperienceDetailsSupport then p0.tag else nil
	}, {
		LoadingSkeleton = if playButtonState == playButtonStatesModule.Loading then textButton else nil,
		PlayButton = var58
	}) else var58
end)