local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local Parent = GamePlayButton.Parent
local IXPService = game:GetService("IXPService")
local TutilsModule = require(Parent.tutils)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local UseBreakpointXOrSmallerFunction = ResponsiveModule.useBreakpointXOrSmaller
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local MenuDirection = require(Parent.UIBlox).App.Menu.MenuDirection
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local GamesProductInfoReducer = require(Parent.GameProductInfoRodux).GamesProductInfoReducer
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseOnPlayButtonCallbackModule = require(script.Parent.useOnPlayButtonCallback)
local UseOnPlaySquadButtonCallbackModule = require(script.Parent.useOnPlaySquadButtonCallback)
local UsePlayButtonStateModule = require(script.Parent.usePlayButtonState)
local UseEarlyAccessCaptionModule = require(script.Parent.EarlyAccess.useEarlyAccessCaption)
local LegacyPlayButtonModule = require(script.Parent.LegacyPlayButton)
local PlayButtonGroupViewModule = require(script.Parent.PlayButtonGroupView)
local PlayButtonStatesModule = require(script.Parent.PlayButtonStates)
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagLuaAppUnifyPlayButtonAllSurfacesIxp = require(Parent.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local LuaAppFixPlayButtonDefaultLaunchSource = game:DefineFastFlag("LuaAppFixPlayButtonDefaultLaunchSource", false)
local LuaAppHidePlayButtonOptionalTextForDualButtons = game:DefineFastFlag("LuaAppHidePlayButtonOptionalTextForDualButtons", false)
local FFlagLuaAppUnifiedPlayButtonSquadMenuDirection = require(Parent.SharedFlags).FFlagLuaAppUnifiedPlayButtonSquadMenuDirection
local FFlagLuaAppPlayButtonLoadingDurationTelemetry = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local FFlagLuaAppUpdatePlayButtonText = require(Parent.SharedFlags).FFlagLuaAppUpdatePlayButtonText
local FFlagEnableGameJoinEarlyAccess = require(Parent.SharedFlags).FFlagEnableGameJoinEarlyAccess
local FFlagLuaAppLogExposurePlayButtonUX = require(Parent.SharedFlags).FFlagLuaAppLogExposurePlayButtonUX
local FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce
local FFlagLuaAppLaunchWhenLoadingEdp = require(Parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingEdp
local FFlagLuaAppLaunchWhenLoadingForce = require(Parent.SharedFlags).FFlagLuaAppLaunchWhenLoadingForce
local FFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP = require(Parent.SharedFlags).FFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP
local FIntLuaAppPlayButtonSecondaryButtonGap = require(Parent.SharedFlags).FIntLuaAppPlayButtonSecondaryButtonGap
local FFlagLuaAppPlayButtonPrivatePT = require(Parent.SharedFlags).FFlagLuaAppPlayButtonPrivatePT
local FStringR20UniverseIdModule = require(GamePlayButton.Flags.FStringR20UniverseId)
local UsePlayOnReleaseAfterUnmountModule = require(script.Parent.usePlayOnReleaseAfterUnmount)

local function v33() --[[ Line: 60 ]] end

return ReactModule.memo(function(Frame: Frame) --[[ Line: 156 | Named "PlayButton" ]]
	-- upvalues: ReactModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseSelectorFunction (copy), GamesProductInfoReducer (copy), TutilsModule (copy), FFlagLuaAppPlayButtonLoadingDurationTelemetry (copy), UseBreakpointXOrSmallerFunction (copy), ResponsiveModule (copy), UsePlayButtonStateModule (copy), FFlagEnableGameJoinEarlyAccess (copy), PlayButtonStatesModule (copy), UseEarlyAccessCaptionModule (copy), FFlagLuaAppLaunchWhenLoadingForce (copy), FFlagLuaAppLaunchWhenLoadingEdp (copy), UseOnPlayButtonCallbackModule (copy), LuaAppFixPlayButtonDefaultLaunchSource (copy), FFlagLuaAppUnifiedPlayButtonSquadMenuDirection (copy), MenuDirection (copy), UseOnPlaySquadButtonCallbackModule (copy), FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce (copy), UsePlayOnReleaseAfterUnmountModule (copy), UseLocalizationFunction (copy), FFlagLuaAppUpdatePlayButtonText (copy), FFlagLuaAppPlayButtonPrivatePT (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), UseUserExperimentFunction (copy), AppUserLayers (copy), FFlagLuaAppLogExposurePlayButtonUX (copy), IXPService (copy), UseTokensFunction (copy), FFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP (copy), FIntLuaAppPlayButtonSecondaryButtonGap (copy), LegacyPlayButtonModule (copy), GetFFlagIsSquadEnabledFunction (copy), v33 (copy), FStringR20UniverseIdModule (copy), LuaAppHidePlayButtonOptionalTextForDualButtons (copy), PlayButtonGroupViewModule (copy)
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 158 ]]
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = true
		
		return function() --[[ Line: 160 ]]
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = false
		end
	end, {})
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseSelectorResult = UseSelectorFunction(function(p1) --[[ Line: 166 ]]
		-- upvalues: Frame (copy), GamesProductInfoReducer (upval)
		return if Frame.universeId then p1[GamesProductInfoReducer.key][Frame.universeId] else nil
	end, TutilsModule.shallowEqual)
	local EventContext = if FFlagLuaAppPlayButtonLoadingDurationTelemetry then Frame.eventContext or "PlayButton" else nil
	local UseBreakpointXOrSmallerResult = UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.Small)
	local UsePlayButtonStateModuleResult = UsePlayButtonStateModule(UseRoactServiceResult, Frame.universeId, Frame.fetchDelayInSeconds, Frame.isPlayableWhenLoading, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then EventContext else nil, if FFlagEnableGameJoinEarlyAccess then Frame.enableEarlyAccessState else nil)
	local PlayButtonState = UsePlayButtonStateModuleResult.playButtonState
	local SecondaryPlayButtonState = UsePlayButtonStateModuleResult.secondaryPlayButtonState
	
	if SecondaryPlayButtonState ~= nil then
		local IsPlayButtonStateMatch = PlayButtonState == PlayButtonStatesModule.UnplayableOther
		local IsSecondaryPlayButtonStateMatch = SecondaryPlayButtonState == PlayButtonStatesModule.UnplayableOther
		
		if Frame.preferSecondaryPlayButton == true or UseBreakpointXOrSmallerResult and IsPlayButtonStateMatch then
			PlayButtonState = SecondaryPlayButtonState
			SecondaryPlayButtonState = nil
		elseif UseBreakpointXOrSmallerResult and IsSecondaryPlayButtonStateMatch then
			SecondaryPlayButtonState = nil
		end
	end
	local v1 = nil
	local IsIsPendingUnlock: boolean? = nil
	
	if FFlagEnableGameJoinEarlyAccess then
		local EarlyAccess = UsePlayButtonStateModuleResult.earlyAccess
		v1 = UseEarlyAccessCaptionModule(EarlyAccess)
		IsIsPendingUnlock = if EarlyAccess then EarlyAccess.isPendingUnlock == true else false
	end
	local FFlagLuaAppLaunchWhenLoadingForce1 = FFlagLuaAppLaunchWhenLoadingForce or FFlagLuaAppLaunchWhenLoadingEdp and Frame.launchWhenLoading == true
	local UseOnPlayButtonCallbackModuleResult = UseOnPlayButtonCallbackModule(Frame.universeId, Frame.referralSource, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then EventContext else Frame.eventContext or "PlayButton", nil, Frame.launchSource or (if LuaAppFixPlayButtonDefaultLaunchSource then "UnknownLaunchSource" else "LuaGameCard"), Frame.experienceJoinData, Frame.placeId, if FFlagLuaAppLaunchWhenLoadingEdp or FFlagLuaAppLaunchWhenLoadingForce then Frame.launchWhenLoading else nil)
	local SquadButtonMenuDirection = if FFlagLuaAppUnifiedPlayButtonSquadMenuDirection and Frame.squadButtonMenuDirection ~= nil then Frame.squadButtonMenuDirection else MenuDirection.Up
	local UseOnPlaySquadButtonCallbackModuleResult = UseOnPlaySquadButtonCallbackModule(SquadButtonMenuDirection, PlayButtonState, Frame.referralSource, Frame.universeId)
	local FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1 = FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce or Frame.launchOnReleaseAfterUnmount == true
	local UseResult = ReactModule.useCallback(function(FiatPaidAccess) --[[ Line: 241 ]]
		-- upvalues: FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1 (copy), UseRefResult (copy), Frame (copy), PlayButtonStatesModule (upval), UseOnPlayButtonCallbackModuleResult (copy)
		if FiatPaidAccess == nil then return end
		if not FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1 and not UseRefResult.current then return end
		if Frame.onActivated then
			Frame.onActivated()
		end
		if Frame.onPurchaseRequiredCallback and (FiatPaidAccess == PlayButtonStatesModule.PaidAccess or FiatPaidAccess == PlayButtonStatesModule.FiatPaidAccess) then
			Frame.onPurchaseRequiredCallback()
			
			return
		else
			UseOnPlayButtonCallbackModuleResult(FiatPaidAccess, Frame.reportExperienceLaunched)
		end
	end, {
		UseOnPlayButtonCallbackModuleResult,
		Frame.onPurchaseRequiredCallback,
		Frame.reportExperienceLaunched,
		Frame.onActivated,
		FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 275 ]]
		-- upvalues: UseResult (copy), PlayButtonState (ref)
		UseResult(PlayButtonState)
	end, { UseResult, PlayButtonState })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 279 ]]
		-- upvalues: UseResult (copy), SecondaryPlayButtonState (ref)
		UseResult(SecondaryPlayButtonState)
	end, { UseResult, SecondaryPlayButtonState })
	local UsePlayOnReleaseAfterUnmountModuleResult = UsePlayOnReleaseAfterUnmountModule(UseResult1)
	local PlayButtonRef = if FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1 and UsePlayOnReleaseAfterUnmountModuleResult then UsePlayOnReleaseAfterUnmountModuleResult.playButtonRef else nil
	local LoadingCaptureRef = if FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1 and UsePlayOnReleaseAfterUnmountModuleResult then UsePlayOnReleaseAfterUnmountModuleResult.loadingCaptureRef else nil
	local OnActivated = if FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1 then UsePlayOnReleaseAfterUnmountModuleResult.onActivated else UseResult1
	local UseResult3 = ReactModule.useCallback(function(p1) --[[ Line: 295 ]]
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
	ReactModule.useEffect(function() --[[ Line: 305 ]]
		-- upvalues: Frame (copy), OnActivated (copy)
		local OnRegisterActivationFunction = Frame.onRegisterActivation
		
		if OnRegisterActivationFunction == nil then return end
		return OnRegisterActivationFunction(OnActivated)
	end, { Frame.onRegisterActivation, OnActivated })
	local UseLocalizationResult = UseLocalizationFunction({
		join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		playDemo = "Feature.ExperienceDetails.PlayButtonText.PlayDemo",
		unlock = "Feature.ExperienceDetails.PlayButtonText.Unlock",
		joinWithParty = "Feature.Squads.Action.JoinWithParty",
		unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		waitingForParty = "Feature.Squads.Action.WaitingForParty",
		play = if FFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else nil,
		playtest = if FFlagLuaAppPlayButtonPrivatePT then "Feature.ExperienceDetails.PlayButtonText.Playtest" else nil,
		earlyAccess = if FFlagEnableGameJoinEarlyAccess then "Feature.VirtualEvents.Label.EarlyAccess" else nil
	})
	local HasJoinTextPlayableButtonIxp = nil
	local HasIconPlayButtonIxp = nil
	local HasPlayButtonLoadingSkeletonIxp = nil
	
	if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		HasJoinTextPlayableButtonIxp, HasIconPlayButtonIxp, HasPlayButtonLoadingSkeletonIxp = UseUserExperimentFunction({ AppUserLayers.PlayButtonUXExposureLayer }, function(p1) --[[ Line: 329 ]]
			-- upvalues: AppUserLayers (upval)
			local v2 = p1[AppUserLayers.PlayButtonUXExposureLayer] or {}
			
			return v2.HasJoinTextButton, v2.HasIconPlayButton, v2.HasPlayButtonLoadingSkeleton
		end, true)
	end
	if FFlagLuaAppLogExposurePlayButtonUX then
		ReactModule.useEffect(function() --[[ Line: 338 ]]
			-- upvalues: IXPService (upval), AppUserLayers (upval)
			IXPService:LogUserLayerExposure(AppUserLayers.PlayButtonUXExposureLayer)
		end, {})
	end
	local UseTokensResult = UseTokensFunction()
	
	if not FFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP or not Frame.shouldUseModuleLegacyPlayButtonView then
		local IsTextMatch = if FFlagEnableGameJoinEarlyAccess then Frame.enableEarlyAccessPlusTooltip == true and (UseBreakpointXOrSmallerResult and (FStringR20UniverseIdModule ~= "" and tostring(Frame.universeId) == FStringR20UniverseIdModule)) else nil
		
		return ReactModule.createElement(PlayButtonGroupViewModule, {
			playButtonState = PlayButtonState,
			secondaryPlayButtonState = SecondaryPlayButtonState,
			showEarlyAccessTooltip = if FFlagEnableGameJoinEarlyAccess then IsTextMatch else nil,
			earlyAccessCaption = if FFlagEnableGameJoinEarlyAccess then v1 else nil,
			earlyAccessPending = if FFlagEnableGameJoinEarlyAccess then IsIsPendingUnlock else nil,
			gameProductInfo = UseSelectorResult,
			localized = UseLocalizationResult,
			tokens = UseTokensResult,
			hasJoinTextPlayableButtonIxp = HasJoinTextPlayableButtonIxp,
			hasIconPlayButtonIxp = HasIconPlayButtonIxp,
			hasPlayButtonLoadingSkeletonIxp = HasPlayButtonLoadingSkeletonIxp,
			onPlayButtonActivated = OnActivated,
			onSecondaryPlayButtonActivated = UseResult2,
			onPlaySquadButtonActivated = UseResult3,
			playButtonCaptureRef = PlayButtonRef,
			loadingCaptureRef = LoadingCaptureRef,
			shouldLaunchWhenLoading = FFlagLuaAppLaunchWhenLoadingForce1,
			shouldLaunchOnReleaseAfterUnmount = FFlagLuaAppPlayButtonLaunchOnReleaseAfterUnmountForce1,
			squadButtonMenuDirection = SquadButtonMenuDirection,
			playableText = Frame.playableText,
			fiatText = Frame.fiatText,
			hidePlayableIcon = Frame.hidePlayableIcon,
			hideOptionalText = LuaAppHidePlayButtonOptionalTextForDualButtons and UseBreakpointXOrSmallerResult and SecondaryPlayButtonState ~= nil or Frame.hideOptionalText,
			buttonSize = Frame.buttonSize,
			width = Frame.width,
			expandWidthForSecondaryPlayButton = Frame.expandWidthForSecondaryPlayButton,
			fillBehavior = Frame.fillBehavior,
			useUIBloxButton = Frame.useUIBloxButton,
			hideIfUnplayable = Frame.hideIfUnplayable,
			hideIfLoading = Frame.hideIfLoading,
			LayoutOrder = Frame.LayoutOrder,
			Position = Frame.Position,
			tag = Frame.tag,
			testId = Frame.testId
		})
	end
	local Price = UseSelectorResult and UseSelectorResult.price or 0
	local LocalizedFiatPrice = UseSelectorResult and UseSelectorResult.localizedFiatPrice or ""
	
	if SecondaryPlayButtonState == nil then
		return ReactModule.createElement(LegacyPlayButtonModule, {
			Size = UDim2.new(Frame.width or UDim.new(1, 0), UDim.new(1, 0)),
			LayoutOrder = Frame.LayoutOrder,
			playButtonState = PlayButtonState,
			price = Price,
			localizedFiatPrice = LocalizedFiatPrice,
			onPlayButtonActivated = OnActivated,
			onPlaySquadButtonActivated = if GetFFlagIsSquadEnabledFunction() then UseResult3 else nil,
			testId = Frame.testId
		})
	else
		local _UDim2 = UDim2.new(0.5, -FIntLuaAppPlayButtonSecondaryButtonGap / 2, 1, 0)
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(Frame.width or UDim.new(1, 0), UDim.new(1, 0)),
			LayoutOrder = Frame.LayoutOrder,
			Position = Frame.Position
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, FIntLuaAppPlayButtonSecondaryButtonGap)
			}),
			PlayButton = ReactModule.createElement(LegacyPlayButtonModule, {
				LayoutOrder = 1,
				Size = _UDim2,
				playButtonState = PlayButtonState,
				price = Price,
				localizedFiatPrice = LocalizedFiatPrice,
				onPlayButtonActivated = OnActivated,
				onPlaySquadButtonActivated = if GetFFlagIsSquadEnabledFunction() then UseResult3 else nil,
				testId = Frame.testId
			}),
			SecondaryPlayButton = ReactModule.createElement(LegacyPlayButtonModule, {
				LayoutOrder = 2,
				Size = _UDim2,
				playButtonState = SecondaryPlayButtonState,
				price = Price,
				localizedFiatPrice = LocalizedFiatPrice,
				onPlayButtonActivated = UseResult2 or v33,
				onPlaySquadButtonActivated = if GetFFlagIsSquadEnabledFunction() then UseResult3 else nil,
				testId = if Frame.testId then `{Frame.testId}--secondary` else nil
			})
		})
	end
end)