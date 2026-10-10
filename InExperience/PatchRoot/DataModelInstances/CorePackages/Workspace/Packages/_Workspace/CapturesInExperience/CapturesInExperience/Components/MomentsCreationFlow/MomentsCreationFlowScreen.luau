local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent

if require(parent.Flags.FFlagCapturesInExpUseMomentsCreation) then
	local momentsCommonModule = require(parent_1.MomentsCommon)
	local _ = require(parent_1.MomentsTypes)
	local reactModule = require(parent_1.React)
	local roactUtilsModule = require(parent_1.RoactUtils)
	local signalsModule = require(parent_1.Signals)
	local coreGuiService = game:GetService("CoreGui")
	local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
	local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
	local constantsModule = require(parent.Constants)
	local fFlagCapturesInExpStickersAndVoiceModule = require(parent.Flags.FFlagCapturesInExpStickersAndVoice)
	local momentsCreationFlowClosedModule = require(parent.Actions.MomentsCreationFlowClosed)
	local useAnalyticsModule = require(parent.Analytics.useAnalytics)
	local eventNames = momentsCommonModule.Analytics.EventNames
	local t = {
		[eventNames.EditingFlowNextButtonPressed] = true,
		[eventNames.EditingFlowReturnButtonPressed] = true
	}
	
	local function isTextFiltered(_)
		return false
	end
	
	local function MomentsCreationScreen(p1)
		-- upvalues: parent_1 (ref), parent (ref), reactModule (ref), signalsModule (ref), useDispatch (ref), useAnalyticsModule (ref), useSelector (ref), constantsModule (ref), t (ref), momentsCreationFlowClosedModule (ref), fFlagCapturesInExpStickersAndVoiceModule (ref), isTextFiltered (ref), coreGuiService (ref)
		local momentsCreationModule = require(parent_1.MomentsCreation)
		local createMomentModule = require(parent.Thunks.CreateMoment)
		local creationFlowScreen = momentsCreationModule.CreationFlowScreen
		local getCreationFlowStore = momentsCreationModule.Stores.GetCreationFlowStore
		local var1, var2 = reactModule.useState(function()
			-- upvalues: getCreationFlowStore (ref)
			return getCreationFlowStore(false).getSelectedCapture(false)
		end)
		reactModule.useEffect(function()
			-- upvalues: signalsModule (copy), var2 (ref), getCreationFlowStore (ref)
			return signalsModule.createEffect(function(p2)
				-- upvalues: var2 (copy), getCreationFlowStore (copy)
				var2(getCreationFlowStore(p2).getSelectedCapture(p2))
			end)
		end, { getCreationFlowStore })
		local var3 = var1 == p1.expectedCapture
		local var4 = useDispatch()
		local fireEvent = useAnalyticsModule().fireEvent
		local var5 = useSelector(function(p2)
			-- upvalues: constantsModule (copy)
			return p2[constantsModule.RoduxKey].MomentsCreationFlow.SessionId
		end)
		local registerAnalyticsListener = momentsCreationModule.registerAnalyticsListener
		reactModule.useLayoutEffect(function()
			-- upvalues: registerAnalyticsListener (ref), var5 (ref), t (copy), getCreationFlowStore (ref), fireEvent (ref)
			return registerAnalyticsListener(function(p2, p3)
				-- upvalues: var5 (copy), t (copy), getCreationFlowStore (copy), fireEvent (copy)
				local cloned = table.clone(p3 or {})
				cloned.creationSessionId = var5
				
				if t[p2] then
					cloned.editFlowState = getCreationFlowStore(false).getStep(false)
				end
				fireEvent("XExp" .. p3, cloned)
			end)
		end, {
			getCreationFlowStore,
			fireEvent,
			registerAnalyticsListener,
			var5
		})
		local var6 = reactModule.useCallback(function()
			-- upvalues: var4 (ref), momentsCreationFlowClosedModule (copy)
			var4(momentsCreationFlowClosedModule())
		end, { var4 })
		local var7 = reactModule.useCallback(function(p2, p3, p4, p5, _, p6)
			-- upvalues: var4 (ref), createMomentModule (ref)
			var4(createMomentModule(p2, p3, p4, p5, nil, p6))
		end, { var4, createMomentModule })
		local var8 = reactModule.useMemo(function()
			-- upvalues: var7 (ref), fFlagCapturesInExpStickersAndVoiceModule (copy), var6 (ref), isTextFiltered (copy), coreGuiService (copy)
			return {
				disableDrafts = true,
				publishDebounceSeconds = 0.5,
				createMoment = var7,
				disableExperimentExposure = not fFlagCapturesInExpStickersAndVoiceModule,
				exitCreationFlow = var6,
				isTextFiltered = isTextFiltered,
				toolKinds = if fFlagCapturesInExpStickersAndVoiceModule then nil else { "trim", "music", "text" },
				ttsAudioParent = if fFlagCapturesInExpStickersAndVoiceModule then coreGuiService else nil
			}
		end, { var7, var6 })
		reactModule.useEffect(function()
			-- upvalues: var3 (ref), fFlagCapturesInExpStickersAndVoiceModule (copy), momentsCreationModule (ref), var4 (ref), momentsCreationFlowClosedModule (copy)
			if not var3 then
				if fFlagCapturesInExpStickersAndVoiceModule then
					momentsCreationModule.resetCreationFlow(momentsCreationModule.Enums.CreationFlowState.Preview)
				end
				var4(momentsCreationFlowClosedModule())
			end
		end, { var3, var4, momentsCreationModule })
		
		return if var3 then reactModule.createElement(creationFlowScreen, { excludeGallery = true, host = var8 }) else nil
	end
	
	return function()
		-- upvalues: useSelector (ref), constantsModule (ref), reactModule (ref), MomentsCreationScreen (ref)
		local var1 = useSelector(function(p1)
			-- upvalues: constantsModule (copy)
			return p1[constantsModule.RoduxKey].MomentsCreationFlow.Capture
		end)
		
		return if useSelector(function(p1)
			-- upvalues: constantsModule (copy)
			return p1[constantsModule.RoduxKey].MomentsCreationFlow.IsOpen
		end) and var1 ~= nil then reactModule.createElement(MomentsCreationScreen, { expectedCapture = var1 }) else nil
	end
end
local cryoModule = require(parent_1.Cryo)
local dashModule = require(parent_1.Dash)
local localizationModule = require(parent_1.Localization)
local momentsCommonModule = require(parent_1.MomentsCommon)
local momentsCreationFlowModule = require(parent_1.MomentsCreationFlow)
local _ = require(parent_1.MomentsTypes)
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalization = localizationModule.Hooks.useLocalization
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local createMomentModule = require(parent.Thunks.CreateMoment)
local constantsModule = require(parent.Constants)
local momentsCreationFlowClosedModule = require(parent.Actions.MomentsCreationFlowClosed)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local creationFlowContextProvider = momentsCreationFlowModule.CreationFlowContextProvider
local creationFlowLocalization = momentsCreationFlowModule.CreationFlowLocalization
local creationFlowScreen = momentsCreationFlowModule.CreationFlowScreen
local fFlagMomentsCreationBackCta = momentsCommonModule.Flags.FFlagMomentsCreationBackCta
local t = {
	[creationFlowLocalization.CommunityStandardsText] = "Feature.Moments.Description.CommunityStandards",
	[creationFlowLocalization.CreationTooltip] = "Feature.Moments.Tooltip.Creation",
	[creationFlowLocalization.EditingCtaMusic] = "Feature.Moments.Action.AddMusic",
	[creationFlowLocalization.EditingCtaTextOverlay] = "Feature.Moments.Action.AddText",
	[creationFlowLocalization.EditingCtaTrimming] = "Feature.Moments.Action.TrimVideo",
	[creationFlowLocalization.GeneralAllChipLabel] = "Feature.Moments.Label.All",
	[creationFlowLocalization.GeneralCtaBack] = "Feature.Moments.Action.Back",
	[creationFlowLocalization.GeneralCtaCancel] = "Feature.Moments.Action.Cancel",
	[creationFlowLocalization.GeneralCtaDone] = "Feature.Moments.Action.Done",
	[creationFlowLocalization.GeneralCtaLeave] = "Feature.Moments.Action.Leave",
	[creationFlowLocalization.GeneralCtaOk] = "Feature.Moments.Action.Ok",
	[creationFlowLocalization.GeneralCtaShowMore] = "Feature.Moments.Action.ShowMore",
	[creationFlowLocalization.GeneralEmptyStateText] = "Feature.Moments.Description.NothingHereYet",
	[creationFlowLocalization.GeneralPhotosChipLabel] = "Feature.Moments.Label.Photos",
	[creationFlowLocalization.GeneralSearchPlaceholder] = "Feature.Moments.Label.Search",
	[creationFlowLocalization.GeneralVideosChipLabel] = "Feature.Moments.Label.Videos",
	[creationFlowLocalization.LeaveMomentCreationBody] = "Feature.Moments.Description.LeaveMomentsCreation",
	[creationFlowLocalization.LeaveMomentCreationTitle] = "Feature.Moments.Title.LeaveMomentCreation",
	[creationFlowLocalization.MusicNoResults] = "Feature.Moments.Description.NoMusicResults",
	[creationFlowLocalization.PostRemovedTitle] = "Feature.Moments.Title.MomentRemoved",
	[creationFlowLocalization.PublishingCtaContinue] = "Feature.Moments.Action.Continue",
	[creationFlowLocalization.PublishingCtaPrimary] = "Feature.Moments.Action.Post",
	[creationFlowLocalization.PublishingCtaReturn] = if fFlagMomentsCreationBackCta then "Feature.Moments.Action.Back" else "Feature.Moments.Action.Return",
	[creationFlowLocalization.PublishingCtaSecondary] = if fFlagMomentsCreationBackCta then "Feature.Moments.Action.Back" else "Feature.Moments.Action.ReturnToEditing",
	[creationFlowLocalization.PublishingDescription] = "Feature.Moments.Description.PublishMoment",
	[creationFlowLocalization.StayFriendlyModeration] = "Feature.Moments.Description.StayFriendly"
}

return function()
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useLocalization (ref), t (ref), useSelector (ref), constantsModule (ref), reactModule (ref), momentsCreationFlowClosedModule (ref), createMomentModule (ref), dashModule (ref), cryoModule (ref), creationFlowContextProvider (ref), creationFlowScreen (ref)
	local var1 = useAnalyticsModule()
	local var2 = useDispatch()
	local var3 = useLocalization(t)
	local var4 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].MomentsCreationFlow.IsOpen
	end)
	local var5 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].MomentsCreationFlow.Capture
	end)
	local var6 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].MomentsCreationFlow.SessionId
	end)
	
	return if var4 and var5 then reactModule.createElement(creationFlowContextProvider, {
		captures = { var5 },
		exitCreationFlow = reactModule.useCallback(function()
			-- upvalues: var2 (ref), momentsCreationFlowClosedModule (copy)
			var2(momentsCreationFlowClosedModule())
		end, { var2 }),
		value = {
			capturesPagesIsFinished = function()
				return true
			end,
			createMoment = reactModule.useCallback(function(p1, p2, p3)
				-- upvalues: var2 (ref), createMomentModule (copy)
				var2(createMomentModule(p1, p2, p3))
			end, { var2 }),
			fetchAdditionalCaptures = dashModule.noop,
			fetchInitialCaptures = dashModule.noop,
			fireEvent = function(p1, p2)
				-- upvalues: var1 (ref), cryoModule (copy), var6 (ref)
				var1.fireEvent("XExp" .. p18, cryoModule.Dictionary.join(p2 or {}, { creationSessionId = var6 }))
			end,
			getLocalization = reactModule.useCallback(function(p1)
				-- upvalues: var3 (ref)
				return var3[p1] or nil
			end, { var3 }),
			getUserConfiguration = dashModule.noop,
			isTextFiltered = function()
				return false
			end,
			setScreenOrientation = dashModule.noop
		}
	}, {
		Screen = reactModule.createElement(creationFlowScreen, { excludeGallery = true })
	}) else nil
end