local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
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

return function() --[[ line: 60 | named "MomentsCreationFlowScreen" ]]
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useLocalization (ref), t (ref), useSelector (ref), constantsModule (ref), reactModule (ref), momentsCreationFlowClosedModule (ref), createMomentModule (ref), dashModule (ref), creationFlowContextProvider (ref), creationFlowScreen (ref)
	local var10 = useAnalyticsModule()
	local var11 = useDispatch()
	local var12 = useLocalization(t)
	local var13 = useSelector(function(p0) --[[ line: 70 ]]
		-- upvalues: constantsModule (copy)
		return p0[constantsModule.RoduxKey].MomentsCreationFlow.Capture
	end)
	
	return if useSelector(function(p1) --[[ line: 66 ]]
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].MomentsCreationFlow.IsOpen
	end) and var13 then reactModule.createElement(creationFlowContextProvider, {
		captures = { var13 },
		exitCreationFlow = reactModule.useCallback(function() --[[ line: 74 ]]
			-- upvalues: var11 (ref), momentsCreationFlowClosedModule (copy)
			var11(momentsCreationFlowClosedModule())
		end, { var11 }),
		value = {
			capturesPagesIsFinished = function() --[[ line: 98 ]]
				return true
			end,
			createMoment = reactModule.useCallback(function(p2, p3, p4) --[[ line: 83 ]]
				-- upvalues: var11 (ref), createMomentModule (copy)
				var11(createMomentModule(p2, p3, p4))
			end, { var11 }),
			fetchAdditionalCaptures = dashModule.noop,
			fetchInitialCaptures = dashModule.noop,
			fireEvent = function(p5, p6) --[[ line: 104 ]]
				-- upvalues: var10 (ref)
				var10.fireEvent("XExp" .. p5, p6)
			end,
			getLocalization = reactModule.useCallback(function(p7) --[[ line: 78 ]]
				-- upvalues: var12 (ref)
				return var12[p7] or nil
			end, { var12 }),
			getUserConfiguration = dashModule.noop,
			isTextFiltered = function() --[[ line: 109 ]]
				return false
			end,
			setScreenOrientation = dashModule.noop
		}
	}, {
		Screen = reactModule.createElement(creationFlowScreen, { excludeGallery = true })
	}) else nil
end