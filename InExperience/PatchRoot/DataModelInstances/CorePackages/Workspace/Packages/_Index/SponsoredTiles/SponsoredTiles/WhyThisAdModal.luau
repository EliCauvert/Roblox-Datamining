local sponsoredTiles = script:FindFirstAncestor("SponsoredTiles")
local parent = sponsoredTiles.Parent
local centralOverlayModule = require(parent.CentralOverlay)
local foundationModule = require(parent.Foundation)
local gameDetailRoduxModule = require(parent.GameDetailRodux)
local httpModule = require(parent.Http)
local loggersModule = require(parent.Loggers)
local localizationModule = require(parent.Localization)
local navigationRoduxModule = require(parent.NavigationRodux)
local reactModule = require(parent.React)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local roactServiceTagsModule = require(parent.RoactServiceTags)
local roactUtilsModule = require(parent.RoactUtils)
local appPage = robloxAppEnumsModule.AppPage
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local dialog = foundationModule.Dialog
local view = foundationModule.View
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var13 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useLocalization = localizationModule.Hooks.useLocalization
local useRoactService = robloxAppHooksModule.useRoactService
local flaggedMutedError = loggersModule.flaggedMutedError
local roactNetworking = roactServiceTagsModule.RoactNetworking
local apiFetchGameDetails = gameDetailRoduxModule.GameDetails.ApiFetchGameDetails
local retrievalStatus = httpModule.Enum.RetrievalStatus
local sponsoredUserCohortModule = require(sponsoredTiles.Enums.SponsoredUserCohort)
local omniRecommendationsContentType = require(parent.DiscoveryTypes).OmniRecommendationsContentType
local fStringLuaAppAdPreferencesUrl = require(parent.SharedFlags).FStringLuaAppAdPreferencesUrl
local fFlagLuaAppEnableHomepageOneByTwoTile = require(parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile

local function useCreatorName(p0) --[[ line: 49 ]]
	-- upvalues: useDispatch (ref), useRoactService (ref), roactNetworking (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), useSelector (ref), apiFetchGameDetails (ref), reactModule (ref), retrievalStatus (ref)
	local var17 = useDispatch()
	local var18 = useRoactService(roactNetworking)
	
	if not fFlagLuaAppEnableHomepageOneByTwoTile then
		local var22 = useSelector(function(p1) --[[ line: 74 ]]
			-- upvalues: p0 (ref), apiFetchGameDetails (copy)
			return p0 and apiFetchGameDetails.GetFetchingStatus(p1, p0) or nil
		end)
		local var23 = useSelector(function(p2) --[[ line: 78 ]]
			-- upvalues: p0 (ref)
			return if p0 then p2.GameDetails[p0] else nil
		end)
		reactModule.useEffect(function() --[[ line: 82 ]]
			-- upvalues: p0 (ref), var23 (ref), var22 (ref), retrievalStatus (copy), var17 (ref), apiFetchGameDetails (copy), var18 (ref)
			if p0 and not var23 and var22 ~= retrievalStatus.Fetching then
				var17(apiFetchGameDetails.Fetch(var18, { p0 }))
			end
		end, {
			p0,
			var23,
			var22,
			var17,
			var18
		})
		
		return var23 and (var23.creator and (var23.creator.name or nil)), var22
	end
	local var19 = p0 ~= nil and p0 ~= ""
	local var20 = useSelector(function(p3) --[[ line: 56 ]]
		-- upvalues: var19 (ref), apiFetchGameDetails (copy), p0 (ref)
		return var19 and apiFetchGameDetails.GetFetchingStatus(p3, p0) or nil
	end)
	local var21 = useSelector(function(p4) --[[ line: 60 ]]
		-- upvalues: var19 (ref), p0 (ref)
		return if var19 then p4.GameDetails[p0] else nil
	end)
	reactModule.useEffect(function() --[[ line: 64 ]]
		-- upvalues: var19 (ref), var21 (ref), var20 (ref), retrievalStatus (copy), var17 (ref), apiFetchGameDetails (copy), var18 (ref), p0 (ref)
		if var19 and not var21 and var20 ~= retrievalStatus.Fetching then
			var17(apiFetchGameDetails.Fetch(var18, { p0 }))
		end
	end, {
		var19, p0, var21, var20, var17, var18
	})
	
	return var21 and (var21.creator and (var21.creator.name or nil)), var20
end

local function _(p5) --[[ line: 92 | named "getSponsoredDisclosureTranslationKey" ]]
	-- upvalues: sponsoredUserCohortModule (ref)
	return if p5 == sponsoredUserCohortModule.UnderEighteen then "Feature.GameDetails.Message.SponsoredDisclosure.U18" elseif p5 == sponsoredUserCohortModule.EighteenPlusPersonalized then "Feature.GameDetails.Message.SponsoredDisclosure.O18PersonalizedNoLink" elseif p5 == sponsoredUserCohortModule.EighteenPlusNonPersonalized then "Feature.GameDetails.Message.SponsoredDisclosure.O18NonPersonalizedNoLink" else "Feature.GameDetails.Message.SponsoredDisclosure.U18"
end

local _ = function(value) --[[ line: 104 | named "getSponsoredDisclosureNoUniverseTranslationKey" ]]
	-- upvalues: sponsoredUserCohortModule (ref)
	return if value == sponsoredUserCohortModule.UnderEighteen then "Feature.GameDetails.Message.SponsoredDisclosureNoUniverse.U18" elseif value == sponsoredUserCohortModule.EighteenPlusPersonalized then "Feature.GameDetails.Message.SponsoredDisclosureNoUniverse.O18PersonalizedNoLink" elseif value == sponsoredUserCohortModule.EighteenPlusNonPersonalized then "Feature.GameDetails.Message.SponsoredDisclosureNoUniverse.O18NonPersonalNoLink" else "Feature.GameDetails.Message.SponsoredDisclosureNoUniverse.U18"
end

local function resolveSponsoredDisclosure(p6, p7, p8, p9, p10, p11) --[[ line: 123 ]]
	-- upvalues: flaggedMutedError (ref), sponsoredUserCohortModule (ref)
	if not (p6 ~= nil and p6 ~= "") then
		flaggedMutedError("WhyThisAdDisclosureError", "Missing payerName in WhyThisAdModal")
		
		return p11.sponsoredDisclosureError, false
	end
	local var24 = if p10 ~= sponsoredUserCohortModule.EighteenPlusPersonalized then p10 == sponsoredUserCohortModule.EighteenPlusNonPersonalized else true
	
	if p7 then
		if p8 then
			flaggedMutedError("WhyThisAdDisclosureError", "Unexpected universeId for AdLink in WhyThisAdModal")
		end
		return p11.sponsoredDisclosureNoUniverse, var24
	elseif not p8 then
		flaggedMutedError("WhyThisAdDisclosureError", "Missing universeId in WhyThisAdModal")
		
		return p11.sponsoredDisclosureError, var24
	elseif p9 then
		return p11.sponsoredDisclosure, var24
	end
	flaggedMutedError("WhyThisAdDisclosureError", "Missing creatorName in WhyThisAdModal")
	
	return p11.sponsoredDisclosureError, var24
end

return function(p12) --[[ line: 161 | named "WhyThisAdModal" ]]
	-- upvalues: useDispatch (ref), useCreatorName (ref), useLocalization (ref), sponsoredUserCohortModule (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), reactModule (ref), closeCentralOverlay (ref), appPage (ref), fStringLuaAppAdPreferencesUrl (ref), fFlagSignalsNavP3Dispatch (ref), var13 (ref), navigateDown (ref), retrievalStatus (ref), omniRecommendationsContentType (ref), resolveSponsoredDisclosure (ref), flaggedMutedError (ref), dialog (ref), view (ref), button (ref), buttonVariant (ref)
	local t_2
	local var25 = useDispatch()
	local var26, var27 = useCreatorName(p12.universeId)
	local t = {
		sponsoredDisclosureError = "Feature.GameDetails.Message.SponsoredDisclosure.Error",
		whyThisAd = "Feature.GameDetails.Label.WhyThisAd",
		adPreferences = "Feature.GameDetails.Message.AdPreferences"
	}
	local t_1 = {}
	local sponsoredUserCohort = p12.sponsoredUserCohort
	-- Unknown statement at pc 5: <SetList>
	t_1.CreatorName = var26
	t_1.PayerName = p12.payerName
	t.sponsoredDisclosure = t_1
	
	if fFlagLuaAppEnableHomepageOneByTwoTile then
		t_2 = {}
		local sponsoredUserCohort_1 = p12.sponsoredUserCohort
		-- Unknown statement at pc 2: <SetList>
		t_2.PayerName = p12.payerName
	else
		t_2 = nil
	end
	t.sponsoredDisclosureNoUniverse = t_2
	local var31 = useLocalization(t)
	local var32 = reactModule.useCallback(function() --[[ line: 182 ]]
		-- upvalues: var25 (ref), closeCentralOverlay (copy)
		var25(closeCentralOverlay())
	end, { var25 })
	local var33 = reactModule.useCallback(function() --[[ line: 186 ]]
		-- upvalues: var25 (ref), closeCentralOverlay (copy), appPage (copy), fStringLuaAppAdPreferencesUrl (copy), var31 (ref), fFlagSignalsNavP3Dispatch (copy), var13 (copy), navigateDown (copy)
		var25(closeCentralOverlay())
		local t = {
			name = appPage.GenericWebPage,
			detail = fStringLuaAppAdPreferencesUrl,
			extraProps = { title = var31.adPreferences }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var13.down(var13.fromLegacyPage(t))
			
			return
		end
		var25(navigateDown(t))
	end, { var25, var31.adPreferences })
	
	if var27 == retrievalStatus.NotStarted or var27 == retrievalStatus.Fetching then
		return nil
	end
	local var37
	local var34 = nil
	local _ = nil
	
	if fFlagLuaAppEnableHomepageOneByTwoTile then
		local var35, var36 = resolveSponsoredDisclosure(p12.payerName, p12.contentType == omniRecommendationsContentType.AdLink, p12.universeId ~= nil and p12.universeId ~= "", var26, p12.sponsoredUserCohort, var31)
		var37 = var35
		var34 = var36
	elseif var26 and p12.payerName then
		var37 = var31.sponsoredDisclosure
		var34 = if p12.sponsoredUserCohort ~= sponsoredUserCohortModule.EighteenPlusPersonalized then p12.sponsoredUserCohort == sponsoredUserCohortModule.EighteenPlusNonPersonalized else true
	else
		flaggedMutedError("WhyThisAdDisclosureError", "Missing creatorName or payerName in WhyThisAdModal")
		var37 = var31.sponsoredDisclosureError
	end
	return reactModule.createElement(dialog.Root, { hasBackdrop = true, onClose = var32 }, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var31.whyThisAd }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 1 }, {
			ContentView = reactModule.createElement(view, { tag = "col auto-xy gap-small" }, {
				DialogText = reactModule.createElement(dialog.Text, { LayoutOrder = 1, Text = var37 }),
				AdPreferences = if var34 then reactModule.createElement(button, {
					LayoutOrder = 2,
					text = var31.adPreferences,
					variant = buttonVariant.Text,
					onActivated = var33
				}) else nil
			})
		})
	})
end