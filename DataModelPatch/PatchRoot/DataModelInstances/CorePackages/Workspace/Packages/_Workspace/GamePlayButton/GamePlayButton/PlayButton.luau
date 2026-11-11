local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local IXPService = game:GetService("IXPService")
local TutilsModule = require(Parent.tutils)
local ReactModule = require(Parent.React)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UIBloxModule = require(Parent.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ComboButton = UIBloxModule.App.Button.ComboButton
local Images = UIBloxModule.App.ImageSet.Images
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local FoundationModule = require(Parent.Foundation)
local Button1 = FoundationModule.Button
local IconButton = FoundationModule.IconButton
local Skeleton = FoundationModule.Skeleton
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GamesProductInfoReducer = require(Parent.GameProductInfoRodux).GamesProductInfoReducer
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseOnPlayButtonCallbackModule = require(script.Parent.useOnPlayButtonCallback)
local UseOnPlaySquadButtonCallbackModule = require(script.Parent.useOnPlaySquadButtonCallback)
local UsePlayButtonStateModule = require(script.Parent.usePlayButtonState)
local PlayButtonStatesModule = require(script.Parent.PlayButtonStates)
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagLuaAppSupportUnifiedUIBloxPlayButton = require(Parent.SharedFlags).FFlagLuaAppSupportUnifiedUIBloxPlayButton
local FFlagLuaAppUnifyPlayButtonAllSurfacesIxp = require(Parent.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local LuaAppJoinTextPlayableButton = game:DefineFastFlag("LuaAppJoinTextPlayableButton", false) or FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local LuaAppIconPlayButton = game:DefineFastFlag("LuaAppIconPlayButton", false) or FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local LuaAppPlayButtonLoadingSkeleton3 = FFlagLuaAppSupportUnifiedUIBloxPlayButton and (game:DefineFastFlag("LuaAppPlayButtonLoadingSkeleton3", false) or FFlagLuaAppUnifyPlayButtonAllSurfacesIxp)
local LuaAppFixPlayButtonDefaultLaunchSource = game:DefineFastFlag("LuaAppFixPlayButtonDefaultLaunchSource", false)
local FFlagUpdateActionNeededPlayButtonUi = require(Parent.SharedFlags).FFlagUpdateActionNeededPlayButtonUi
local FFlagLuaAppUnifiedPlayButtonSquadMenuDirection = require(Parent.SharedFlags).FFlagLuaAppUnifiedPlayButtonSquadMenuDirection
local GetFFlagUIBloxUseFoundationButtonFunction = require(Parent.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton
local FFlagLuaAppPlayButtonOptOutFoundationButton = require(Parent.SharedFlags).FFlagLuaAppPlayButtonOptOutFoundationButton
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagLuaAppPlayButtonLoadingDurationTelemetry = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local FFlagLuaAppTextOnlyPlayButton = require(Parent.SharedFlags).FFlagLuaAppTextOnlyPlayButton
local FFlagLuaAppIconTextPlayButton = require(Parent.SharedFlags).FFlagLuaAppIconTextPlayButton
local FFlagLuaAppUpdatePlayButtonText = require(Parent.SharedFlags).FFlagLuaAppUpdatePlayButtonText
local FFlagLuaAppLogExposurePlayButtonUX = require(Parent.SharedFlags).FFlagLuaAppLogExposurePlayButtonUX
local LuaAppUseTokenHeightForPlayButton = game:DefineFastFlag("LuaAppUseTokenHeightForPlayButton", false)
local FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp
local FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce
local FFlagLuaAppLaunchWhenLoadingEdp = require(Parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingEdp
local FFlagLuaAppLaunchWhenLoadingForce = require(Parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingForce
local UsePlayOnReleaseAfterUnmountModule = require(script.Parent.usePlayOnReleaseAfterUnmount)
local PlayXlarge = if LuaAppIconPlayButton then "play-xlarge" else nil
local IconsCommonPlay = Images["icons/common/play"]
local IconsActionsTruncationCollapse = Images["icons/actions/truncationCollapse"]
local IconsActionsTruncationExpand = Images["icons/actions/truncationExpand"]

local function v49() end

local config = {
	[InputSize.XSmall] = "Size_600",
	[InputSize.Small] = "Size_800",
	[InputSize.Medium] = "Size_1000",
	[InputSize.Large] = "Size_1200"
}

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: ReactModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseSelectorFunction (copy), GamesProductInfoReducer (copy), TutilsModule (copy), FFlagLuaAppPlayButtonLoadingDurationTelemetry (copy), UsePlayButtonStateModule (copy), FFlagLuaAppLaunchWhenLoadingForce (copy), FFlagLuaAppLaunchWhenLoadingEdp (copy), UseOnPlayButtonCallbackModule (copy), LuaAppFixPlayButtonDefaultLaunchSource (copy), FFlagLuaAppUnifiedPlayButtonSquadMenuDirection (copy), MenuDirection (copy), UseOnPlaySquadButtonCallbackModule (copy), FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce (copy), FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp (copy), PlayButtonStatesModule (copy), UsePlayOnReleaseAfterUnmountModule (copy), FFlagSduiExperienceDetailsSupport (copy), UseLocalizationFunction (copy), FFlagLuaAppUpdatePlayButtonText (copy), FFlagUpdateActionNeededPlayButtonUi (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), UseUserExperimentFunction (copy), AppUserLayers (copy), FFlagLuaAppLogExposurePlayButtonUX (copy), IXPService (copy), FFlagLuaAppSupportUnifiedUIBloxPlayButton (copy), UseTokensFunction (copy), InputSize (copy), LuaAppUseTokenHeightForPlayButton (copy), config (copy), LuaAppPlayButtonLoadingSkeleton3 (copy), Skeleton (copy), Radius (copy), ButtonVariant (copy), FFlagLuaAppIconTextPlayButton (copy), FFlagLuaAppTextOnlyPlayButton (copy), LuaAppJoinTextPlayableButton (copy), PlayXlarge (copy), LuaAppIconPlayButton (copy), GetFFlagIsSquadEnabledFunction (copy), IconsCommonPlay (copy), ComboButton (copy), IconsActionsTruncationExpand (copy), IconsActionsTruncationCollapse (copy), ButtonType (copy), Images (copy), Button (copy), v49 (copy), GetFFlagUIBloxUseFoundationButtonFunction (copy), FFlagLuaAppPlayButtonOptOutFoundationButton (copy), IconButton (copy), Button1 (copy)
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = true
		
		return function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = false
		end
	end, {})
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: Frame (copy), GamesProductInfoReducer (upval)
		return if Frame.universeId then p1[GamesProductInfoReducer.key][Frame.universeId] else nil
	end, TutilsModule.shallowEqual)
	local EventContext = if FFlagLuaAppPlayButtonLoadingDurationTelemetry then Frame.eventContext or "PlayButton" else nil
	local PlayButtonState = UsePlayButtonStateModule(UseRoactServiceResult, Frame.universeId, Frame.fetchDelayInSeconds, Frame.isPlayableWhenLoading, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then EventContext else nil).playButtonState
	local FFlagLuaAppLaunchWhenLoadingForce1 = FFlagLuaAppLaunchWhenLoadingForce or FFlagLuaAppLaunchWhenLoadingEdp and Frame.launchWhenLoading == true
	local UseOnPlayButtonCallbackModuleResult = UseOnPlayButtonCallbackModule(Frame.universeId, Frame.referralSource, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then EventContext else Frame.eventContext or "PlayButton", nil, Frame.launchSource or (if LuaAppFixPlayButtonDefaultLaunchSource then "UnknownLaunchSource" else "LuaGameCard"), Frame.experienceJoinData, Frame.placeId, if FFlagLuaAppLaunchWhenLoadingEdp or FFlagLuaAppLaunchWhenLoadingForce then Frame.launchWhenLoading else nil)
	local SquadButtonMenuDirection = if FFlagLuaAppUnifiedPlayButtonSquadMenuDirection and Frame.squadButtonMenuDirection ~= nil then Frame.squadButtonMenuDirection else MenuDirection.Up
	local UseOnPlaySquadButtonCallbackModuleResult = UseOnPlaySquadButtonCallbackModule(SquadButtonMenuDirection, PlayButtonState, Frame.referralSource, Frame.universeId)
	local FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1 = FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp and Frame.launchOnReleaseAfterUnmount == true
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1 (copy), UseRefResult (copy), Frame (copy), PlayButtonState (copy), PlayButtonStatesModule (upval), UseOnPlayButtonCallbackModuleResult (copy)
		if not FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1 and not UseRefResult.current then return end
		if Frame.onActivated then
			Frame.onActivated()
		end
		if Frame.onPurchaseRequiredCallback and (PlayButtonState == PlayButtonStatesModule.PaidAccess or PlayButtonState == PlayButtonStatesModule.FiatPaidAccess) then
			Frame.onPurchaseRequiredCallback()
			
			return
		else
			UseOnPlayButtonCallbackModuleResult(PlayButtonState, Frame.reportExperienceLaunched)
		end
	end, {
		UseOnPlayButtonCallbackModuleResult, PlayButtonState,
		Frame.onPurchaseRequiredCallback, Frame.reportExperienceLaunched,
		Frame.onActivated,
		if FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp then FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1 else nil
	})
	local UsePlayOnReleaseAfterUnmountModuleResult = if FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountEdp or FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce then UsePlayOnReleaseAfterUnmountModule(UseResult) else nil
	local PlayButtonRef = if FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1 and UsePlayOnReleaseAfterUnmountModuleResult then UsePlayOnReleaseAfterUnmountModuleResult.playButtonRef else nil
	local LoadingCaptureRef = if FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1 and UsePlayOnReleaseAfterUnmountModuleResult then UsePlayOnReleaseAfterUnmountModuleResult.loadingCaptureRef else nil
	local OnActivated = if FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1 then UsePlayOnReleaseAfterUnmountModuleResult.onActivated else UseResult
	local UseResult1 = ReactModule.useCallback(function(p1)
		-- upvalues: UseRefResult (copy), Frame (copy), UseOnPlaySquadButtonCallbackModuleResult (copy)
		if not UseRefResult.current then return end
		if Frame.onActivated then
			Frame.onActivated()
		end
		UseOnPlaySquadButtonCallbackModuleResult(p1)
	end, {
		UseOnPlaySquadButtonCallbackModuleResult,
		Frame.onActivated
	})
	
	if FFlagSduiExperienceDetailsSupport then
		ReactModule.useEffect(function()
			-- upvalues: Frame (copy), OnActivated (copy)
			local OnRegisterActivationFunction = Frame.onRegisterActivation
			
			if OnRegisterActivationFunction == nil then return end
			return OnRegisterActivationFunction(OnActivated)
		end, { Frame.onRegisterActivation, OnActivated })
	end
	local UseLocalizationResult = UseLocalizationFunction({
		join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		joinWithParty = "Feature.Squads.Action.JoinWithParty",
		unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		waitingForParty = "Feature.Squads.Action.WaitingForParty",
		play = if FFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else nil,
		unlock = if FFlagUpdateActionNeededPlayButtonUi then "Feature.ExperienceDetails.PlayButtonText.Unlock" else nil
	})
	local v1 = nil
	local v2 = nil
	local v3 = nil
	
	if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		v1, v2, v70 = UseUserExperimentFunction({ AppUserLayers.PlayButtonUXExposureLayer }, function(p1)
			-- upvalues: AppUserLayers (upval)
			local v4 = p1[AppUserLayers.PlayButtonUXExposureLayer] or {}
			
			return v4.HasJoinTextButton, v4.HasIconPlayButton, v4.HasPlayButtonLoadingSkeleton
		end, true)
	end
	if FFlagLuaAppLogExposurePlayButtonUX then
		ReactModule.useEffect(function()
			-- upvalues: IXPService (upval), AppUserLayers (upval)
			IXPService:LogUserLayerExposure(AppUserLayers.PlayButtonUXExposureLayer)
		end, {})
	end
	local UseTokensResult = if FFlagLuaAppSupportUnifiedUIBloxPlayButton then UseTokensFunction() else nil
	local Flag = false
	local IsDisabled = false
	local IsDisabled1 = false
	local ButtonSize = Frame.buttonSize or InputSize.Medium
	local YOffset = nil
	
	if LuaAppUseTokenHeightForPlayButton then
		local Entry = config[ButtonSize] or "Size_1000"
		YOffset = if UseTokensResult and UseTokensResult.Size[Entry] then UseTokensResult.Size[Entry] else 40
	end
	local Fill = if FFlagLuaAppSupportUnifiedUIBloxPlayButton and Frame.width then "Fill" else Frame.fillBehavior
	local Emphasis = nil
	local Icon = nil
	local Text = nil
	local TextButton = nil
	local XScale: UDim? = nil
	
	if PlayButtonState == PlayButtonStatesModule.Loading then
		if Frame.hideIfLoading then
			return nil
		end
		if LuaAppPlayButtonLoadingSkeleton3 and (not (FFlagLuaAppSupportUnifiedUIBloxPlayButton and Frame.useUIBloxButton) and (not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or v3)) then
			local Offset = nil
			if LuaAppUseTokenHeightForPlayButton then
				Offset = YOffset
			else
				local Entry = config[ButtonSize] or "Size_1000"
				Offset = UseTokensResult and UseTokensResult.Size[Entry]
			end
			XScale = if Fill == "Fill" then UDim.new(1, 0) else UDim.new(0, Offset)
			local _UDim2 = UDim2.new(XScale, UDim.new(0, Offset))
			local FFlagLuaAppUnifyPlayButtonAllSurfacesIxp1 = FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or (FFlagLuaAppLaunchWhenLoadingForce1 or FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1)
			local Element = ReactModule.createElement(Skeleton, {
				ZIndex = 2,
				Size = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp1 then UDim2.fromScale(1, 1) else _UDim2,
				radius = Radius.Medium
			})
			TextButton = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp1 then ReactModule.createElement("TextButton", {
				Size = _UDim2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 2,
				ref = LoadingCaptureRef,
				[ReactModule.Event.Activated] = OnActivated
			}, { Skeleton = Element }) else Element
			IsDisabled1 = true
		end
		Emphasis = ButtonVariant.Emphasis
	elseif PlayButtonState == PlayButtonStatesModule.Playable then
		Emphasis = ButtonVariant.Emphasis
		
		if FFlagLuaAppIconTextPlayButton or (FFlagLuaAppTextOnlyPlayButton or LuaAppJoinTextPlayableButton and (not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or v1)) then
			Text = Frame.playableText or (if FFlagLuaAppUpdatePlayButtonText then UseLocalizationResult.play else UseLocalizationResult.join)
			
			if FFlagLuaAppIconTextPlayButton and not Frame.hidePlayableIcon then
				Icon = PlayXlarge
			end
		else
			if not LuaAppIconPlayButton and not Frame.hidePlayableIcon then
				Icon = "icons/common/play"
			end
			Text = Frame.playableText
			
			if LuaAppIconPlayButton and not Frame.hidePlayableIcon then
				Icon = if Text and Text ~= "" then "icons/common/play" else PlayXlarge
			end
		end
	elseif GetFFlagIsSquadEnabledFunction() and PlayButtonState == PlayButtonStatesModule.PlayableWithParty then
		Icon = IconsCommonPlay
		Text = if Frame.hideOptionalText then nil else UseLocalizationResult.joinWithParty
		Flag = true
	elseif GetFFlagIsSquadEnabledFunction() and PlayButtonState == PlayButtonStatesModule.WaitingForParty then
		Icon = IconsCommonPlay
		Text = if Frame.hideOptionalText then nil else UseLocalizationResult.waitingForParty
		IsDisabled1 = true
		IsDisabled = true
		Flag = true
	elseif PlayButtonState == PlayButtonStatesModule.PaidAccess then
		Text = tostring(UseSelectorResult and UseSelectorResult.price or 0)
		Emphasis = ButtonVariant.Emphasis
		Icon = "icons/common/robux"
	elseif PlayButtonState == PlayButtonStatesModule.FiatPaidAccess then
		Emphasis = ButtonVariant.Emphasis
		local LocalizedFiatPrice = UseSelectorResult and UseSelectorResult.localizedFiatPrice or ""
		Text = Frame.fiatText or LocalizedFiatPrice
	elseif PlayButtonState == PlayButtonStatesModule.ActionNeeded then
		if FFlagUpdateActionNeededPlayButtonUi then
			Emphasis = ButtonVariant.Emphasis
			Text = UseLocalizationResult.unlock
		else
			Emphasis = ButtonVariant.SubEmphasis
			Icon = "icons/status/private"
			Text = if Frame.hideOptionalText then nil else UseLocalizationResult.join
		end
	elseif PlayButtonState == PlayButtonStatesModule.UnplayableOther then
		if Frame.hideIfUnplayable then
			return nil
		end
		Emphasis = ButtonVariant.Subtle
		Icon = "icons/status/unavailable"
		Text = if Frame.hideOptionalText then nil else UseLocalizationResult.unavailable
		IsDisabled1 = true
	else
		error("invalid play button state!")
	end
	local Element = nil
	if Flag then
		if not LuaAppUseTokenHeightForPlayButton and FFlagLuaAppSupportUnifiedUIBloxPlayButton then
			local Entry = config[ButtonSize] or "Size_1000"
			YOffset = if UseTokensResult and UseTokensResult.Size[Entry] then UseTokensResult.Size[Entry] else 40
		end
		Element = ReactModule.createElement(ComboButton, {
			layoutOrder = if FFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else Frame.LayoutOrder,
			position = if FFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else Frame.Position,
			size = if FFlagLuaAppSupportUnifiedUIBloxPlayButton then UDim2.new(1, 0, 0, YOffset) else UDim2.new(Frame.width or UDim.new(1, 0), Frame.squadButtonHeight or UDim.new(1, 0)),
			button = {
				icon = Icon,
				text = Text,
				isDisabled = IsDisabled1,
				onActivated = if IsDisabled1 then function() end else OnActivated
			},
			overflow = {
				icon = if FFlagLuaAppUnifiedPlayButtonSquadMenuDirection and SquadButtonMenuDirection == MenuDirection.Down then IconsActionsTruncationExpand else IconsActionsTruncationCollapse,
				isDisabled = IsDisabled,
				onActivated = if IsDisabled then function() end else UseResult1
			},
			testId = Frame.testId
		})
	elseif FFlagLuaAppSupportUnifiedUIBloxPlayButton and Frame.useUIBloxButton then
		if not LuaAppUseTokenHeightForPlayButton then
			local Entry = config[ButtonSize] or "Size_1000"
			YOffset = if UseTokensResult and UseTokensResult.Size[Entry] then UseTokensResult.Size[Entry] else 40
		end
		local IsFit = Fill == "Fit"
		local _UDim2: UDim2 = if IsFit then UDim2.new(0, 0, 0, YOffset) else UDim2.new(1, 0, 0, YOffset)
		local IsPlayButtonStateMatch = PlayButtonState == PlayButtonStatesModule.Loading
		local PrimarySystem = if Emphasis == ButtonVariant.SubEmphasis then ButtonType.PrimarySystem elseif Emphasis == ButtonVariant.Subtle then ButtonType.Secondary else ButtonType.PrimaryContextual
		local IconsCommonPlay1 = if Icon == PlayXlarge then IconsCommonPlay else Icon
		
		if type(IconsCommonPlay1) == "string" then
			IconsCommonPlay1 = Images[IconsCommonPlay1]
		end
		Element = ReactModule.createElement(Button, {
			size = _UDim2,
			fitContent = IsFit,
			buttonType = PrimarySystem,
			icon = IconsCommonPlay1,
			text = Text,
			isLoading = IsPlayButtonStateMatch,
			isDisabled = IsDisabled1 or IsPlayButtonStateMatch,
			userInteractionEnabled = not (IsDisabled1 or IsPlayButtonStateMatch),
			onActivated = if IsDisabled1 or IsPlayButtonStateMatch then v49 else OnActivated,
			ref = PlayButtonRef,
			[ReactModule.Tag] = if Frame.testId then `data-testid={Frame.testId}` else nil,
			DO_NOT_USE_useUIBloxButton = if GetFFlagUIBloxUseFoundationButtonFunction() or FFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
		})
		
		if (FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or FFlagLuaAppLaunchWhenLoadingForce1 or FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1) and IsPlayButtonStateMatch then
			TextButton = ReactModule.createElement("TextButton", {
				Size = _UDim2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 2,
				ref = LoadingCaptureRef,
				[ReactModule.Event.Activated] = OnActivated
			})
		end
	else
		local HasIcon = if LuaAppIconPlayButton then if Text == nil then Icon ~= nil else Text == "" and Icon ~= nil else nil
		Element = if LuaAppIconPlayButton and (not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or v2) and HasIcon then ReactModule.createElement(IconButton, {
			LayoutOrder = if FFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else Frame.LayoutOrder,
			Position = if FFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else Frame.Position,
			icon = Icon,
			variant = Emphasis,
			size = ButtonSize,
			width = if LuaAppPlayButtonLoadingSkeleton3 and PlayButtonState == PlayButtonStatesModule.Loading then XScale elseif FFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else Frame.width,
			fillBehavior = Fill,
			isDisabled = IsDisabled1,
			onActivated = if IsDisabled1 then v49 else OnActivated,
			ref = PlayButtonRef,
			testId = Frame.testId
		}) else ReactModule.createElement(Button1, {
			LayoutOrder = if FFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else Frame.LayoutOrder,
			Position = if FFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else Frame.Position,
			icon = Icon,
			text = Text,
			variant = Emphasis,
			size = ButtonSize,
			width = if LuaAppPlayButtonLoadingSkeleton3 and PlayButtonState == PlayButtonStatesModule.Loading then XScale elseif FFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else Frame.width,
			fillBehavior = Fill,
			isDisabled = IsDisabled1,
			onActivated = if IsDisabled1 then v49 else OnActivated,
			ref = PlayButtonRef,
			testId = Frame.testId
		})
	end
	return if FFlagLuaAppSupportUnifiedUIBloxPlayButton then ReactModule.createElement("Frame", {
		LayoutOrder = Frame.LayoutOrder,
		Position = Frame.Position,
		Size = if LuaAppUseTokenHeightForPlayButton then UDim2.new(if Frame.width then Frame.width elseif Fill == "Fill" then UDim.new(1, 0) else UDim.new(0, 0), UDim.new(0, YOffset)) elseif Frame.width then UDim2.new(Frame.width, UDim.new(0, 0)) elseif Fill == "Fill" then UDim2.new(1, 0, 1, 0) else nil,
		AutomaticSize = if LuaAppUseTokenHeightForPlayButton then if Fill == "Fill" then nil else Enum.AutomaticSize.X elseif Fill == "Fill" then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[ReactModule.Tag] = if FFlagSduiExperienceDetailsSupport then Frame.tag else nil
	}, {
		LoadingSkeleton = if PlayButtonState == PlayButtonStatesModule.Loading then TextButton else nil,
		PlayButton = Element
	}) else Element
end)