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
				var1.fireEvent("XExp" .. p6, cryoModule.Dictionary.join(p2 or {}, { creationSessionId = var6 }))
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