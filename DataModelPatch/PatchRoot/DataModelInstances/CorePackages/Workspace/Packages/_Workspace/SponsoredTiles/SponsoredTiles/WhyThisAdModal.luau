local SponsoredTiles = script:FindFirstAncestor("SponsoredTiles")
local Parent = SponsoredTiles.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local Dialog = FoundationModule.Dialog
local View = FoundationModule.View
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local FlaggedMutedErrorFunction = require(Parent.Loggers).flaggedMutedError
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local ApiFetchGameDetails = require(Parent.GameDetailRodux).GameDetails.ApiFetchGameDetails
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local SponsoredUserCohortModule = require(SponsoredTiles.Enums.SponsoredUserCohort)
local FStringLuaAppAdPreferencesUrl = require(Parent.SharedFlags).FStringLuaAppAdPreferencesUrl

local function useCreatorName(UniverseId)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseSelectorFunction (copy), ApiFetchGameDetails (copy), ReactModule (copy), RetrievalStatus (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: UniverseId (copy), ApiFetchGameDetails (upval)
		return UniverseId and ApiFetchGameDetails.GetFetchingStatus(p1, UniverseId) or nil
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: UniverseId (copy)
		return UniverseId and p1.GameDetails[UniverseId] or nil
	end)
	ReactModule.useEffect(function()
		-- upvalues: UniverseId (copy), UseSelectorResult1 (copy), UseSelectorResult (copy), RetrievalStatus (upval), UseDispatchResult (copy), ApiFetchGameDetails (upval), UseRoactServiceResult (copy)
		if UniverseId and not UseSelectorResult1 and UseSelectorResult ~= RetrievalStatus.Fetching then
			UseDispatchResult(ApiFetchGameDetails.Fetch(UseRoactServiceResult, { UniverseId }))
		end
	end, {
		UniverseId,
		UseSelectorResult1,
		UseSelectorResult,
		UseDispatchResult,
		UseRoactServiceResult
	})
	
	return UseSelectorResult1 and UseSelectorResult1.creator and UseSelectorResult1.creator.name or nil, UseSelectorResult
end

local function _(EighteenPlusNonPersonalized): string
	-- upvalues: SponsoredUserCohortModule (copy)
	return if EighteenPlusNonPersonalized == SponsoredUserCohortModule.UnderEighteen then "Feature.GameDetails.Message.SponsoredDisclosure.U18" elseif EighteenPlusNonPersonalized == SponsoredUserCohortModule.EighteenPlusPersonalized then "Feature.GameDetails.Message.SponsoredDisclosure.O18PersonalizedNoLink" elseif EighteenPlusNonPersonalized == SponsoredUserCohortModule.EighteenPlusNonPersonalized then "Feature.GameDetails.Message.SponsoredDisclosure.O18NonPersonalizedNoLink" else "Feature.GameDetails.Message.SponsoredDisclosure.U18"
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), useCreatorName (copy), UseLocalizationFunction (copy), SponsoredUserCohortModule (copy), ReactModule (copy), CloseCentralOverlayFunction (copy), AppPage (copy), FStringLuaAppAdPreferencesUrl (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), RetrievalStatus (copy), FlaggedMutedErrorFunction (copy), Dialog (copy), View (copy), Button (copy), ButtonVariant (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseCreatorNameResult, UseCreatorNameResult2 = useCreatorName(p1.universeId)
	local SponsoredUserCohort = p1.sponsoredUserCohort
	local UseLocalizationResult = UseLocalizationFunction({
		sponsoredDisclosureError = "Feature.GameDetails.Message.SponsoredDisclosure.Error",
		whyThisAd = "Feature.GameDetails.Label.WhyThisAd",
		adPreferences = "Feature.GameDetails.Message.AdPreferences",
		sponsoredDisclosure = {
			if SponsoredUserCohort == SponsoredUserCohortModule.UnderEighteen then "Feature.GameDetails.Message.SponsoredDisclosure.U18" elseif SponsoredUserCohort == SponsoredUserCohortModule.EighteenPlusPersonalized then "Feature.GameDetails.Message.SponsoredDisclosure.O18PersonalizedNoLink" elseif SponsoredUserCohort == SponsoredUserCohortModule.EighteenPlusNonPersonalized then "Feature.GameDetails.Message.SponsoredDisclosure.O18NonPersonalizedNoLink" else "Feature.GameDetails.Message.SponsoredDisclosure.U18",
			CreatorName = UseCreatorNameResult,
			PayerName = p1.payerName
		}
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayFunction (upval)
		UseDispatchResult(CloseCentralOverlayFunction())
	end, { UseDispatchResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayFunction (upval), AppPage (upval), FStringLuaAppAdPreferencesUrl (upval), UseLocalizationResult (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
		UseDispatchResult(CloseCentralOverlayFunction())
		local config = {
			name = AppPage.GenericWebPage,
			detail = FStringLuaAppAdPreferencesUrl,
			extraProps = { title = UseLocalizationResult.adPreferences }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, { UseDispatchResult, UseLocalizationResult.adPreferences })
	
	if UseCreatorNameResult2 == RetrievalStatus.NotStarted or UseCreatorNameResult2 == RetrievalStatus.Fetching then
		return nil
	end
	local IsSponsoredUserCohortMatch: boolean? = nil
	local SponsoredDisclosureError = nil
	
	if UseCreatorNameResult and p1.payerName then
		SponsoredDisclosureError = UseLocalizationResult.sponsoredDisclosure
		IsSponsoredUserCohortMatch = p1.sponsoredUserCohort == SponsoredUserCohortModule.EighteenPlusPersonalized or p1.sponsoredUserCohort == SponsoredUserCohortModule.EighteenPlusNonPersonalized
	else
		FlaggedMutedErrorFunction("WhyThisAdDisclosureError", "Missing creatorName or payerName in WhyThisAdModal")
		SponsoredDisclosureError = UseLocalizationResult.sponsoredDisclosureError
	end
	return ReactModule.createElement(Dialog.Root, { hasBackdrop = true, onClose = UseResult }, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.whyThisAd }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 1 }, {
			ContentView = ReactModule.createElement(View, { tag = "col auto-xy gap-small" }, {
				DialogText = ReactModule.createElement(Dialog.Text, { LayoutOrder = 1, Text = SponsoredDisclosureError }),
				AdPreferences = if IsSponsoredUserCohortMatch then ReactModule.createElement(Button, {
					LayoutOrder = 2,
					text = UseLocalizationResult.adPreferences,
					variant = ButtonVariant.Text,
					onActivated = UseResult1
				}) else nil
			})
		})
	})
end