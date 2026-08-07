local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local dashModule = require(parent_1.Dash)
local localizationModule = require(parent_1.Localization)
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
	[creationFlowLocalization.PublishingCtaReturn] = "Feature.Moments.Action.Return",
	[creationFlowLocalization.PublishingCtaSecondary] = "Feature.Moments.Action.ReturnToEditing",
	[creationFlowLocalization.PublishingDescription] = "Feature.Moments.Description.PublishMoment",
	[creationFlowLocalization.StayFriendlyModeration] = "Feature.Moments.Description.StayFriendly"
}

return function() --[[ line: 61 | named "MomentsCreationFlowScreen" ]]
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useLocalization (ref), t (ref), useSelector (ref), constantsModule (ref), reactModule (ref), momentsCreationFlowClosedModule (ref), createMomentModule (ref), dashModule (ref), cryoModule (ref), creationFlowContextProvider (ref), creationFlowScreen (ref)
	local var11 = useAnalyticsModule()
	local var12 = useDispatch()
	local var13 = useLocalization(t)
	local var14 = useSelector(function(p0) --[[ line: 67 ]]
		-- upvalues: constantsModule (copy)
		return p0[constantsModule.RoduxKey].MomentsCreationFlow.IsOpen
	end)
	local var15 = useSelector(function(p1) --[[ line: 71 ]]
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].MomentsCreationFlow.Capture
	end)
	local var16 = useSelector(function(p2) --[[ line: 75 ]]
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].MomentsCreationFlow.SessionId
	end)
	
	return if var14 and var15 then reactModule.createElement(creationFlowContextProvider, {
		captures = { var15 },
		exitCreationFlow = reactModule.useCallback(function() --[[ line: 79 ]]
			-- upvalues: var12 (ref), momentsCreationFlowClosedModule (copy)
			var12(momentsCreationFlowClosedModule())
		end, { var12 }),
		value = {
			capturesPagesIsFinished = function() --[[ line: 103 ]]
				return true
			end,
			createMoment = reactModule.useCallback(function(p3, p4, p5) --[[ line: 88 ]]
				-- upvalues: var12 (ref), createMomentModule (copy)
				var12(createMomentModule(p3, p4, p5))
			end, { var12 }),
			fetchAdditionalCaptures = dashModule.noop,
			fetchInitialCaptures = dashModule.noop,
			fireEvent = function(p6, p7) --[[ line: 109 ]]
				-- upvalues: var11 (ref), cryoModule (copy), var16 (ref)
				var11.fireEvent("XExp" .. p6, cryoModule.Dictionary.join(p7 or {}, { creationSessionId = var16 }))
			end,
			getLocalization = reactModule.useCallback(function(p8) --[[ line: 83 ]]
				-- upvalues: var13 (ref)
				return var13[p8] or nil
			end, { var13 }),
			getUserConfiguration = dashModule.noop,
			isTextFiltered = function() --[[ line: 119 ]]
				return false
			end,
			setScreenOrientation = dashModule.noop
		}
	}, {
		Screen = reactModule.createElement(creationFlowScreen, { excludeGallery = true })
	}) else nil
end