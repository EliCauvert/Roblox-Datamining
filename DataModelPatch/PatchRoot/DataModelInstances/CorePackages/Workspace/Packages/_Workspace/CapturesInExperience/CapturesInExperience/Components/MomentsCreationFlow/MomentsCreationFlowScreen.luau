local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local DashModule = require(Parent1.Dash)
local MomentsCreationFlowModule = require(Parent1.MomentsCreationFlow)
local _ = require(Parent1.MomentsTypes)
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local CreateMomentModule = require(Parent.Thunks.CreateMoment)
local ConstantsModule = require(Parent.Constants)
local MomentsCreationFlowClosedModule = require(Parent.Actions.MomentsCreationFlowClosed)
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local CreationFlowContextProvider = MomentsCreationFlowModule.CreationFlowContextProvider
local CreationFlowLocalization = MomentsCreationFlowModule.CreationFlowLocalization
local CreationFlowScreen = MomentsCreationFlowModule.CreationFlowScreen
local config = {
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
	[CreationFlowLocalization.PublishingCtaReturn] = "Feature.Moments.Action.Return",
	[CreationFlowLocalization.PublishingCtaSecondary] = "Feature.Moments.Action.ReturnToEditing",
	[CreationFlowLocalization.PublishingDescription] = "Feature.Moments.Description.PublishMoment",
	[CreationFlowLocalization.StayFriendlyModeration] = "Feature.Moments.Description.StayFriendly"
}

return function()
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), config (copy), UseSelectorFunction (copy), ConstantsModule (copy), ReactModule (copy), MomentsCreationFlowClosedModule (copy), CreateMomentModule (copy), DashModule (copy), CreationFlowContextProvider (copy), CreationFlowScreen (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].MomentsCreationFlow.IsOpen
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].MomentsCreationFlow.Capture
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), MomentsCreationFlowClosedModule (upval)
		UseDispatchResult(MomentsCreationFlowClosedModule())
	end, { UseDispatchResult })
	local UseResult1 = ReactModule.useCallback(function(p1)
		-- upvalues: UseLocalizationResult (copy)
		return UseLocalizationResult[p1] or nil
	end, { UseLocalizationResult })
	local UseResult2 = ReactModule.useCallback(function(p1, p2, p3)
		-- upvalues: UseDispatchResult (copy), CreateMomentModule (upval)
		UseDispatchResult(CreateMomentModule(p1, p2, p3))
	end, { UseDispatchResult })
	
	return if UseSelectorResult and UseSelectorResult1 then ReactModule.createElement(CreationFlowContextProvider, {
		captures = { UseSelectorResult1 },
		exitCreationFlow = UseResult,
		value = {
			capturesPagesIsFinished = function(): boolean
				return true
			end,
			createMoment = UseResult2,
			fetchAdditionalCaptures = DashModule.noop,
			fetchInitialCaptures = DashModule.noop,
			fireEvent = function(Text, p1)
				-- upvalues: UseAnalyticsModuleResult (copy)
				UseAnalyticsModuleResult.fireEvent("XExp" .. Text, p1)
			end,
			getLocalization = UseResult1,
			getUserConfiguration = DashModule.noop,
			isTextFiltered = function(): boolean
				return false
			end,
			setScreenOrientation = DashModule.noop
		}
	}, {
		Screen = ReactModule.createElement(CreationFlowScreen, { excludeGallery = true })
	}) else nil
end