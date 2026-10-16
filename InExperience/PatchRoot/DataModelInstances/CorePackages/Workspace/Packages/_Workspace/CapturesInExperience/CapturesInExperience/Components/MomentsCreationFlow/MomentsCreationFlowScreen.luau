local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent

if require(Parent.Flags.FFlagCapturesInExpUseMomentsCreation) then
	local _ = require(Parent1.MomentsTypes)
	local ReactModule = require(Parent1.React)
	local RoactUtilsModule = require(Parent1.RoactUtils)
	local SignalsModule = require(Parent1.Signals)
	local CoreGui = game:GetService("CoreGui")
	local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
	local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
	local ConstantsModule = require(Parent.Constants)
	local FFlagCapturesInExpStickersAndVoiceModule = require(Parent.Flags.FFlagCapturesInExpStickersAndVoice)
	local MomentsCreationFlowClosedModule = require(Parent.Actions.MomentsCreationFlowClosed)
	local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
	local EventNames = require(Parent1.MomentsCommon).Analytics.EventNames
	local config = {
		[EventNames.EditingFlowNextButtonPressed] = true,
		[EventNames.EditingFlowReturnButtonPressed] = true
	}
	
	local function isTextFiltered(_): boolean --[[ Line: 38 ]]
		return false
	end
	
	local function MomentsCreationScreen(p1) --[[ Line: 42 ]]
		-- upvalues: Parent1 (copy), Parent (copy), ReactModule (copy), SignalsModule (copy), UseDispatchFunction (copy), UseAnalyticsModule (copy), UseSelectorFunction (copy), ConstantsModule (copy), config (copy), MomentsCreationFlowClosedModule (copy), FFlagCapturesInExpStickersAndVoiceModule (copy), isTextFiltered (copy), CoreGui (copy)
		local MomentsCreationModule = require(Parent1.MomentsCreation)
		local CreateMomentModule = require(Parent.Thunks.CreateMoment)
		local CreationFlowScreen = MomentsCreationModule.CreationFlowScreen
		local GetCreationFlowStoreFunction = MomentsCreationModule.Stores.GetCreationFlowStore
		local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 48 ]]
			-- upvalues: GetCreationFlowStoreFunction (copy)
			return GetCreationFlowStoreFunction(false).getSelectedCapture(false)
		end)
		ReactModule.useEffect(function() --[[ Line: 51 ]]
			-- upvalues: SignalsModule (upval), UseStateResult2 (copy), GetCreationFlowStoreFunction (copy)
			return SignalsModule.createEffect(function(p2) --[[ Line: 52 ]]
				-- upvalues: UseStateResult2 (upval), GetCreationFlowStoreFunction (upval)
				UseStateResult2(GetCreationFlowStoreFunction(p2).getSelectedCapture(p2))
			end)
		end, { GetCreationFlowStoreFunction })
		local IsUseStateResultMatch = UseStateResult == p1.expectedCapture
		local UseDispatchResult = UseDispatchFunction()
		local FireEventFunction = UseAnalyticsModule().fireEvent
		local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 59 ]]
			-- upvalues: ConstantsModule (upval)
			return p2[ConstantsModule.RoduxKey].MomentsCreationFlow.SessionId
		end)
		local RegisterAnalyticsListenerFunction = MomentsCreationModule.registerAnalyticsListener
		ReactModule.useLayoutEffect(function() --[[ Line: 65 ]]
			-- upvalues: RegisterAnalyticsListenerFunction (copy), UseSelectorResult (copy), config (upval), GetCreationFlowStoreFunction (copy), FireEventFunction (copy)
			return RegisterAnalyticsListenerFunction(function(Text, p2) --[[ Line: 66 ]]
				-- upvalues: UseSelectorResult (upval), config (upval), GetCreationFlowStoreFunction (upval), FireEventFunction (upval)
				local Copy = table.clone(p2 or {})
				Copy.creationSessionId = UseSelectorResult
				
				if config[Text] then
					Copy.editFlowState = GetCreationFlowStoreFunction(false).getStep(false)
				end
				FireEventFunction("XExp" .. Text, Copy)
			end)
		end, {
			GetCreationFlowStoreFunction,
			FireEventFunction,
			RegisterAnalyticsListenerFunction,
			UseSelectorResult
		})
		local UseResult = ReactModule.useCallback(function() --[[ Line: 76 ]]
			-- upvalues: UseDispatchResult (copy), MomentsCreationFlowClosedModule (upval)
			UseDispatchResult(MomentsCreationFlowClosedModule())
		end, { UseDispatchResult })
		local UseResult1 = ReactModule.useCallback(function(p2, p3, p4, p5, _, p6) --[[ Line: 82 ]]
			-- upvalues: UseDispatchResult (copy), CreateMomentModule (copy)
			UseDispatchResult(CreateMomentModule(p2, p3, p4, p5, nil, p6))
		end, { UseDispatchResult, CreateMomentModule })
		local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 95 ]]
			-- upvalues: UseResult1 (copy), FFlagCapturesInExpStickersAndVoiceModule (upval), UseResult (copy), isTextFiltered (upval), CoreGui (upval)
			return {
				disableDrafts = true,
				publishDebounceSeconds = 0.5,
				createMoment = UseResult1,
				disableExperimentExposure = not FFlagCapturesInExpStickersAndVoiceModule,
				exitCreationFlow = UseResult,
				isTextFiltered = isTextFiltered,
				toolKinds = if FFlagCapturesInExpStickersAndVoiceModule then nil else { "trim", "music", "text" },
				ttsAudioParent = if FFlagCapturesInExpStickersAndVoiceModule then CoreGui else nil
			}
		end, { UseResult1, UseResult })
		ReactModule.useEffect(function() --[[ Line: 114 ]]
			-- upvalues: IsUseStateResultMatch (copy), FFlagCapturesInExpStickersAndVoiceModule (upval), MomentsCreationModule (copy), UseDispatchResult (copy), MomentsCreationFlowClosedModule (upval)
			if not IsUseStateResultMatch then
				if FFlagCapturesInExpStickersAndVoiceModule then
					MomentsCreationModule.resetCreationFlow(MomentsCreationModule.Enums.CreationFlowState.Preview)
				end
				UseDispatchResult(MomentsCreationFlowClosedModule())
			end
		end, {
			IsUseStateResultMatch,
			UseDispatchResult,
			MomentsCreationModule
		})
		
		return if IsUseStateResultMatch then ReactModule.createElement(CreationFlowScreen, { excludeGallery = true, host = UseMemoResult }) else nil
	end
	
	return function() --[[ Line: 133 | Named "MomentsCreationFlowScreen" ]]
		-- upvalues: UseSelectorFunction (copy), ConstantsModule (copy), ReactModule (copy), MomentsCreationScreen (copy)
		local UseSelectorResult = UseSelectorFunction(function(p1) --[[ Line: 134 ]]
			-- upvalues: ConstantsModule (upval)
			return p1[ConstantsModule.RoduxKey].MomentsCreationFlow.IsOpen
		end)
		local UseSelectorResult1 = UseSelectorFunction(function(p1) --[[ Line: 137 ]]
			-- upvalues: ConstantsModule (upval)
			return p1[ConstantsModule.RoduxKey].MomentsCreationFlow.Capture
		end)
		
		return if UseSelectorResult and UseSelectorResult1 ~= nil then ReactModule.createElement(MomentsCreationScreen, { expectedCapture = UseSelectorResult1 }) else nil
	end
else
	local CryoModule = require(Parent1.Cryo)
	local DashModule = require(Parent1.Dash)
	local MomentsCreationFlowModule = require(Parent1.MomentsCreationFlow)
	local _ = require(Parent1.MomentsTypes)
	local ReactModule1 = require(Parent1.React)
	local RoactUtilsModule = require(Parent1.RoactUtils)
	local UseDispatchFunction1 = RoactUtilsModule.Hooks.RoactRodux.useDispatch
	local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
	local UseSelectorFunction1 = RoactUtilsModule.Hooks.RoactRodux.useSelector
	local CreateMomentModule = require(Parent.Thunks.CreateMoment)
	local ConstantsModule1 = require(Parent.Constants)
	local MomentsCreationFlowClosedModule1 = require(Parent.Actions.MomentsCreationFlowClosed)
	local UseAnalyticsModule1 = require(Parent.Analytics.useAnalytics)
	local CreationFlowContextProvider = MomentsCreationFlowModule.CreationFlowContextProvider
	local CreationFlowLocalization = MomentsCreationFlowModule.CreationFlowLocalization
	local CreationFlowScreen = MomentsCreationFlowModule.CreationFlowScreen
	local FFlagMomentsCreationBackCta = require(Parent1.MomentsCommon).Flags.FFlagMomentsCreationBackCta
	local config1 = {
		[CreationFlowLocalization.CommunityStandardsText] = "Feature.Moments.Description.CommunityStandards",
		[CreationFlowLocalization.CreationTooltip] = "Feature.Moments.Tooltip.Creation",
		[CreationFlowLocalization.EditingCtaMusic] = "Feature.Moments.Action.AddMusic",
		[CreationFlowLocalization.EditingCtaTextOverlay] = "Feature.Moments.Action.AddText",
		[CreationFlowLocalization.EditingCtaTrimming] = "Feature.Moments.Action.TrimVideo",
		[CreationFlowLocalization.GeneralAllChipLabel] = "Feature.Moments.Label.All",
		[CreationFlowLocalization.GeneralCtaBack] = "Feature.Moments.Action.Back",
		[CreationFlowLocalization.GeneralCtaCancel] = "Feature.Moments.Action.Cancel",
		[CreationFlowLocalization.GeneralCtaDone] = "Feature.Moments.Action.Done",
		[CreationFlowLocalization.GeneralCtaLeave] = "Feature.Moments.Action.Leave",
		[CreationFlowLocalization.GeneralCtaOk] = "Feature.Moments.Action.Ok",
		[CreationFlowLocalization.GeneralCtaShowMore] = "Feature.Moments.Action.ShowMore",
		[CreationFlowLocalization.GeneralEmptyStateText] = "Feature.Moments.Description.NothingHereYet",
		[CreationFlowLocalization.GeneralPhotosChipLabel] = "Feature.Moments.Label.Photos",
		[CreationFlowLocalization.GeneralSearchPlaceholder] = "Feature.Moments.Label.Search",
		[CreationFlowLocalization.GeneralVideosChipLabel] = "Feature.Moments.Label.Videos",
		[CreationFlowLocalization.LeaveMomentCreationBody] = "Feature.Moments.Description.LeaveMomentsCreation",
		[CreationFlowLocalization.LeaveMomentCreationTitle] = "Feature.Moments.Title.LeaveMomentCreation",
		[CreationFlowLocalization.MusicNoResults] = "Feature.Moments.Description.NoMusicResults",
		[CreationFlowLocalization.PostRemovedTitle] = "Feature.Moments.Title.MomentRemoved",
		[CreationFlowLocalization.PublishingCtaContinue] = "Feature.Moments.Action.Continue",
		[CreationFlowLocalization.PublishingCtaPrimary] = "Feature.Moments.Action.Post",
		[CreationFlowLocalization.PublishingCtaReturn] = if FFlagMomentsCreationBackCta then "Feature.Moments.Action.Back" else "Feature.Moments.Action.Return",
		[CreationFlowLocalization.PublishingCtaSecondary] = if FFlagMomentsCreationBackCta then "Feature.Moments.Action.Back" else "Feature.Moments.Action.ReturnToEditing",
		[CreationFlowLocalization.PublishingDescription] = "Feature.Moments.Description.PublishMoment",
		[CreationFlowLocalization.StayFriendlyModeration] = "Feature.Moments.Description.StayFriendly"
	}
	
	return function() --[[ Line: 217 | Named "MomentsCreationFlowScreen" ]]
		-- upvalues: UseAnalyticsModule1 (copy), UseDispatchFunction1 (copy), UseLocalizationFunction (copy), config1 (copy), UseSelectorFunction1 (copy), ConstantsModule1 (copy), ReactModule1 (copy), MomentsCreationFlowClosedModule1 (copy), CreateMomentModule (copy), DashModule (copy), CryoModule (copy), CreationFlowContextProvider (copy), CreationFlowScreen (copy)
		local UseAnalyticsModuleResult = UseAnalyticsModule1()
		local UseDispatchResult = UseDispatchFunction1()
		local UseLocalizationResult = UseLocalizationFunction(config1)
		local UseSelectorResult = UseSelectorFunction1(function(p1) --[[ Line: 223 ]]
			-- upvalues: ConstantsModule1 (upval)
			return p1[ConstantsModule1.RoduxKey].MomentsCreationFlow.IsOpen
		end)
		local UseSelectorResult1 = UseSelectorFunction1(function(p1) --[[ Line: 227 ]]
			-- upvalues: ConstantsModule1 (upval)
			return p1[ConstantsModule1.RoduxKey].MomentsCreationFlow.Capture
		end)
		local UseSelectorResult2 = UseSelectorFunction1(function(p1) --[[ Line: 231 ]]
			-- upvalues: ConstantsModule1 (upval)
			return p1[ConstantsModule1.RoduxKey].MomentsCreationFlow.SessionId
		end)
		local UseResult = ReactModule1.useCallback(function() --[[ Line: 235 ]]
			-- upvalues: UseDispatchResult (copy), MomentsCreationFlowClosedModule1 (upval)
			UseDispatchResult(MomentsCreationFlowClosedModule1())
		end, { UseDispatchResult })
		local UseResult1 = ReactModule1.useCallback(function(p1) --[[ Line: 239 ]]
			-- upvalues: UseLocalizationResult (copy)
			return UseLocalizationResult[p1] or nil
		end, { UseLocalizationResult })
		local UseResult2 = ReactModule1.useCallback(function(p1, p2, p3) --[[ Line: 244 ]]
			-- upvalues: UseDispatchResult (copy), CreateMomentModule (upval)
			UseDispatchResult(CreateMomentModule(p1, p2, p3))
		end, { UseDispatchResult })
		
		return if UseSelectorResult and UseSelectorResult1 then ReactModule1.createElement(CreationFlowContextProvider, {
			captures = { UseSelectorResult1 },
			exitCreationFlow = UseResult,
			value = {
				capturesPagesIsFinished = function(): boolean --[[ Line: 259 ]]
					return true
				end,
				createMoment = UseResult2,
				fetchAdditionalCaptures = DashModule.noop,
				fetchInitialCaptures = DashModule.noop,
				fireEvent = function(Text, JoinResult) --[[ Line: 265 ]]
					-- upvalues: UseAnalyticsModuleResult (copy), CryoModule (upval), UseSelectorResult2 (copy)
					UseAnalyticsModuleResult.fireEvent("XExp" .. Text, CryoModule.Dictionary.join(JoinResult or {}, { creationSessionId = UseSelectorResult2 }))
				end,
				getLocalization = UseResult1,
				getUserConfiguration = DashModule.noop,
				isTextFiltered = function(): boolean --[[ Line: 275 ]]
					return false
				end,
				setScreenOrientation = DashModule.noop
			}
		}, {
			Screen = ReactModule1.createElement(CreationFlowScreen, { excludeGallery = true })
		}) else nil
	end
end