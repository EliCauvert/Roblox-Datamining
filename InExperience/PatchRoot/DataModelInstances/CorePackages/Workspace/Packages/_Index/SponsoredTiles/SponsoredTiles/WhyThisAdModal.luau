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
local OmniRecommendationsContentType = require(Parent.DiscoveryTypes).OmniRecommendationsContentType
local FStringLuaAppAdPreferencesUrl = require(Parent.SharedFlags).FStringLuaAppAdPreferencesUrl
local FFlagLuaAppEnableHomepageOneByTwoTile = require(Parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile

local function useCreatorName(UniverseId)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), FFlagLuaAppEnableHomepageOneByTwoTile (copy), UseSelectorFunction (copy), ApiFetchGameDetails (copy), ReactModule (copy), RetrievalStatus (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	
	if FFlagLuaAppEnableHomepageOneByTwoTile then
		local IsNotUniverseIdMatch: boolean = UniverseId ~= nil and UniverseId ~= ""
		local UseSelectorResult = UseSelectorFunction(function(p1)
			-- upvalues: IsNotUniverseIdMatch (copy), ApiFetchGameDetails (upval), UniverseId (copy)
			return IsNotUniverseIdMatch and ApiFetchGameDetails.GetFetchingStatus(p1, UniverseId) or nil
		end)
		local UseSelectorResult1 = UseSelectorFunction(function(p1)
			-- upvalues: IsNotUniverseIdMatch (copy), UniverseId (copy)
			return IsNotUniverseIdMatch and p1.GameDetails[UniverseId] or nil
		end)
		ReactModule.useEffect(function()
			-- upvalues: IsNotUniverseIdMatch (copy), UseSelectorResult1 (copy), UseSelectorResult (copy), RetrievalStatus (upval), UseDispatchResult (copy), ApiFetchGameDetails (upval), UseRoactServiceResult (copy), UniverseId (copy)
			if IsNotUniverseIdMatch and not UseSelectorResult1 and UseSelectorResult ~= RetrievalStatus.Fetching then
				UseDispatchResult(ApiFetchGameDetails.Fetch(UseRoactServiceResult, { UniverseId }))
			end
		end, {
			IsNotUniverseIdMatch, UniverseId, UseSelectorResult1, UseSelectorResult,
			UseDispatchResult, UseRoactServiceResult
		})
		
		return UseSelectorResult1 and UseSelectorResult1.creator and UseSelectorResult1.creator.name or nil, UseSelectorResult
	else
		local UseSelectorResult2 = UseSelectorFunction(function(p1)
			-- upvalues: UniverseId (copy), ApiFetchGameDetails (upval)
			return UniverseId and ApiFetchGameDetails.GetFetchingStatus(p1, UniverseId) or nil
		end)
		local UseSelectorResult3 = UseSelectorFunction(function(p1)
			-- upvalues: UniverseId (copy)
			return UniverseId and p1.GameDetails[UniverseId] or nil
		end)
		ReactModule.useEffect(function()
			-- upvalues: UniverseId (copy), UseSelectorResult3 (copy), UseSelectorResult2 (copy), RetrievalStatus (upval), UseDispatchResult (copy), ApiFetchGameDetails (upval), UseRoactServiceResult (copy)
			if UniverseId and not UseSelectorResult3 and UseSelectorResult2 ~= RetrievalStatus.Fetching then
				UseDispatchResult(ApiFetchGameDetails.Fetch(UseRoactServiceResult, { UniverseId }))
			end
		end, {
			UniverseId,
			UseSelectorResult3,
			UseSelectorResult2,
			UseDispatchResult,
			UseRoactServiceResult
		})
		
		return UseSelectorResult3 and UseSelectorResult3.creator and UseSelectorResult3.creator.name or nil, UseSelectorResult2
	end
end

local function _(EighteenPlusNonPersonalized): string
	-- upvalues: SponsoredUserCohortModule (copy)
	return if EighteenPlusNonPersonalized == SponsoredUserCohortModule.UnderEighteen then "Feature.GameDetails.Message.SponsoredDisclosure.U18" elseif EighteenPlusNonPersonalized == SponsoredUserCohortModule.EighteenPlusPersonalized then "Feature.GameDetails.Message.SponsoredDisclosure.O18PersonalizedNoLink" elseif EighteenPlusNonPersonalized == SponsoredUserCohortModule.EighteenPlusNonPersonalized then "Feature.GameDetails.Message.SponsoredDisclosure.O18NonPersonalizedNoLink" else "Feature.GameDetails.Message.SponsoredDisclosure.U18"
end

local _ = function(EighteenPlusNonPersonalized): string
	-- upvalues: SponsoredUserCohortModule (copy)
	return if EighteenPlusNonPersonalized == SponsoredUserCohortModule.UnderEighteen then "Feature.GameDetails.Message.SponsoredDisclosureNoUniverse.U18" elseif EighteenPlusNonPersonalized == SponsoredUserCohortModule.EighteenPlusPersonalized then "Feature.GameDetails.Message.SponsoredDisclosureNoUniverse.O18PersonalizedNoLink" elseif EighteenPlusNonPersonalized == SponsoredUserCohortModule.EighteenPlusNonPersonalized then "Feature.GameDetails.Message.SponsoredDisclosureNoUniverse.O18NonPersonalNoLink" else "Feature.GameDetails.Message.SponsoredDisclosureNoUniverse.U18"
end

local function resolveSponsoredDisclosure(PayerName, IsContentTypeMatch, IsNotUniverseIdMatch, CreatorName, SponsoredUserCohort, p1)
	-- upvalues: FlaggedMutedErrorFunction (copy), SponsoredUserCohortModule (copy)
	if PayerName == nil or PayerName == "" then
		FlaggedMutedErrorFunction("WhyThisAdDisclosureError", "Missing payerName in WhyThisAdModal")
		
		return p1.sponsoredDisclosureError, false
	end
	local IsSponsoredUserCohortMatch: boolean = SponsoredUserCohort == SponsoredUserCohortModule.EighteenPlusPersonalized or SponsoredUserCohort == SponsoredUserCohortModule.EighteenPlusNonPersonalized
	
	if IsContentTypeMatch then
		if IsNotUniverseIdMatch then
			FlaggedMutedErrorFunction("WhyThisAdDisclosureError", "Unexpected universeId for AdLink in WhyThisAdModal")
		end
		return p1.sponsoredDisclosureNoUniverse, IsSponsoredUserCohortMatch
	elseif not IsNotUniverseIdMatch then
		FlaggedMutedErrorFunction("WhyThisAdDisclosureError", "Missing universeId in WhyThisAdModal")
		
		return p1.sponsoredDisclosureError, IsSponsoredUserCohortMatch
	elseif CreatorName then
		return p1.sponsoredDisclosure, IsSponsoredUserCohortMatch
	else
		FlaggedMutedErrorFunction("WhyThisAdDisclosureError", "Missing creatorName in WhyThisAdModal")
		
		return p1.sponsoredDisclosureError, IsSponsoredUserCohortMatch
	end
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), useCreatorName (copy), UseLocalizationFunction (copy), SponsoredUserCohortModule (copy), FFlagLuaAppEnableHomepageOneByTwoTile (copy), ReactModule (copy), CloseCentralOverlayFunction (copy), AppPage (copy), FStringLuaAppAdPreferencesUrl (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), RetrievalStatus (copy), OmniRecommendationsContentType (copy), resolveSponsoredDisclosure (copy), FlaggedMutedErrorFunction (copy), Dialog (copy), View (copy), Button (copy), ButtonVariant (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseCreatorNameResult, UseCreatorNameResult2 = useCreatorName(p1.universeId)
	local SponsoredUserCohort = p1.sponsoredUserCohort
	local config = {
		sponsoredDisclosureError = "Feature.GameDetails.Message.SponsoredDisclosure.Error",
		whyThisAd = "Feature.GameDetails.Label.WhyThisAd",
		adPreferences = "Feature.GameDetails.Message.AdPreferences",
		sponsoredDisclosure = {
			if SponsoredUserCohort == SponsoredUserCohortModule.UnderEighteen then "Feature.GameDetails.Message.SponsoredDisclosure.U18" elseif SponsoredUserCohort == SponsoredUserCohortModule.EighteenPlusPersonalized then "Feature.GameDetails.Message.SponsoredDisclosure.O18PersonalizedNoLink" elseif SponsoredUserCohort == SponsoredUserCohortModule.EighteenPlusNonPersonalized then "Feature.GameDetails.Message.SponsoredDisclosure.O18NonPersonalizedNoLink" else "Feature.GameDetails.Message.SponsoredDisclosure.U18",
			CreatorName = UseCreatorNameResult,
			PayerName = p1.payerName
		}
	}
	local SponsoredDisclosureNoUniverse = nil
	
	if FFlagLuaAppEnableHomepageOneByTwoTile then
		local SponsoredUserCohort1 = p1.sponsoredUserCohort
		SponsoredDisclosureNoUniverse = {
			if SponsoredUserCohort1 == SponsoredUserCohortModule.UnderEighteen then "Feature.GameDetails.Message.SponsoredDisclosureNoUniverse.U18" elseif SponsoredUserCohort1 == SponsoredUserCohortModule.EighteenPlusPersonalized then "Feature.GameDetails.Message.SponsoredDisclosureNoUniverse.O18PersonalizedNoLink" elseif SponsoredUserCohort1 == SponsoredUserCohortModule.EighteenPlusNonPersonalized then "Feature.GameDetails.Message.SponsoredDisclosureNoUniverse.O18NonPersonalNoLink" else "Feature.GameDetails.Message.SponsoredDisclosureNoUniverse.U18",
			PayerName = p1.payerName
		}
	else
		SponsoredDisclosureNoUniverse = nil
	end
	config.sponsoredDisclosureNoUniverse = SponsoredDisclosureNoUniverse
	local UseLocalizationResult = UseLocalizationFunction(config)
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
	local ResolveSponsoredDisclosureResult = nil
	
	if FFlagLuaAppEnableHomepageOneByTwoTile then
		ResolveSponsoredDisclosureResult, IsSponsoredUserCohortMatch = resolveSponsoredDisclosure(p1.payerName, p1.contentType == OmniRecommendationsContentType.AdLink, p1.universeId ~= nil and p1.universeId ~= "", UseCreatorNameResult, p1.sponsoredUserCohort, UseLocalizationResult)
	elseif UseCreatorNameResult and p1.payerName then
		ResolveSponsoredDisclosureResult = UseLocalizationResult.sponsoredDisclosure
		IsSponsoredUserCohortMatch = p1.sponsoredUserCohort == SponsoredUserCohortModule.EighteenPlusPersonalized or p1.sponsoredUserCohort == SponsoredUserCohortModule.EighteenPlusNonPersonalized
	else
		FlaggedMutedErrorFunction("WhyThisAdDisclosureError", "Missing creatorName or payerName in WhyThisAdModal")
		ResolveSponsoredDisclosureResult = UseLocalizationResult.sponsoredDisclosureError
	end
	return ReactModule.createElement(Dialog.Root, { hasBackdrop = true, onClose = UseResult }, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.whyThisAd }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 1 }, {
			ContentView = ReactModule.createElement(View, { tag = "col auto-xy gap-small" }, {
				DialogText = ReactModule.createElement(Dialog.Text, { LayoutOrder = 1, Text = ResolveSponsoredDisclosureResult }),
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