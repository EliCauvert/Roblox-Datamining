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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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

local function useCreatorName(p1)
	-- upvalues: useDispatch (ref), useRoactService (ref), roactNetworking (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), useSelector (ref), apiFetchGameDetails (ref), reactModule (ref), retrievalStatus (ref)
	local var2 = useDispatch()
	local var3 = useRoactService(roactNetworking)
	
	if not fFlagLuaAppEnableHomepageOneByTwoTile then
		local var4 = useSelector(function(p2)
			-- upvalues: p1 (ref), apiFetchGameDetails (copy)
			return p1 and apiFetchGameDetails.GetFetchingStatus(p2, p1) or nil
		end)
		local var5 = useSelector(function(p2)
			-- upvalues: p1 (ref)
			return if p1 then p2.GameDetails[p1] else nil
		end)
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var5 (ref), var4 (ref), retrievalStatus (copy), var2 (ref), apiFetchGameDetails (copy), var3 (ref)
			if p1 and not var5 and var4 ~= retrievalStatus.Fetching then
				var2(apiFetchGameDetails.Fetch(var3, { p1 }))
			end
		end, {
			p1,
			var5,
			var4,
			var2,
			var3
		})
		
		return var5 and (var5.creator and (var5.creator.name or nil)), var4
	end
	local var6 = p1 ~= nil and p1 ~= ""
	local var7 = useSelector(function(p2)
		-- upvalues: var6 (ref), apiFetchGameDetails (copy), p1 (ref)
		return var6 and apiFetchGameDetails.GetFetchingStatus(p2, p1) or nil
	end)
	local var8 = useSelector(function(p2)
		-- upvalues: var6 (ref), p1 (ref)
		return if var6 then p2.GameDetails[p1] else nil
	end)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var8 (ref), var7 (ref), retrievalStatus (copy), var2 (ref), apiFetchGameDetails (copy), var3 (ref), p1 (ref)
		if var6 and not var8 and var7 ~= retrievalStatus.Fetching then
			var2(apiFetchGameDetails.Fetch(var3, { p1 }))
		end
	end, {
		var6, p1, var8, var7, var2, var3
	})
	
	return var8 and (var8.creator and (var8.creator.name or nil)), var7
end

local function _(p1)
	-- upvalues: sponsoredUserCohortModule (ref)
	return if p1 == sponsoredUserCohortModule.UnderEighteen then "Feature.GameDetails.Message.SponsoredDisclosure.U18" elseif p1 == sponsoredUserCohortModule.EighteenPlusPersonalized then "Feature.GameDetails.Message.SponsoredDisclosure.O18PersonalizedNoLink" elseif p1 == sponsoredUserCohortModule.EighteenPlusNonPersonalized then "Feature.GameDetails.Message.SponsoredDisclosure.O18NonPersonalizedNoLink" else "Feature.GameDetails.Message.SponsoredDisclosure.U18"
end

local _ = function(value)
	-- upvalues: sponsoredUserCohortModule (ref)
	return if value == sponsoredUserCohortModule.UnderEighteen then "Feature.GameDetails.Message.SponsoredDisclosureNoUniverse.U18" elseif value == sponsoredUserCohortModule.EighteenPlusPersonalized then "Feature.GameDetails.Message.SponsoredDisclosureNoUniverse.O18PersonalizedNoLink" elseif value == sponsoredUserCohortModule.EighteenPlusNonPersonalized then "Feature.GameDetails.Message.SponsoredDisclosureNoUniverse.O18NonPersonalNoLink" else "Feature.GameDetails.Message.SponsoredDisclosureNoUniverse.U18"
end

local function resolveSponsoredDisclosure(p1, p2, p3, p4, p5, p6)
	-- upvalues: flaggedMutedError (ref), sponsoredUserCohortModule (ref)
	if not (p1 ~= nil and p1 ~= "") then
		flaggedMutedError("WhyThisAdDisclosureError", "Missing payerName in WhyThisAdModal")
		
		return p6.sponsoredDisclosureError, false
	end
	local var2 = if p5 ~= sponsoredUserCohortModule.EighteenPlusPersonalized then p5 == sponsoredUserCohortModule.EighteenPlusNonPersonalized else true
	
	if p2 then
		if p3 then
			flaggedMutedError("WhyThisAdDisclosureError", "Unexpected universeId for AdLink in WhyThisAdModal")
		end
		return p6.sponsoredDisclosureNoUniverse, var2
	elseif not p3 then
		flaggedMutedError("WhyThisAdDisclosureError", "Missing universeId in WhyThisAdModal")
		
		return p6.sponsoredDisclosureError, var2
	elseif p4 then
		return p6.sponsoredDisclosure, var2
	end
	flaggedMutedError("WhyThisAdDisclosureError", "Missing creatorName in WhyThisAdModal")
	
	return p6.sponsoredDisclosureError, var2
end

return function(p1)
	-- upvalues: useDispatch (ref), useCreatorName (ref), useLocalization (ref), sponsoredUserCohortModule (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), reactModule (ref), closeCentralOverlay (ref), appPage (ref), fStringLuaAppAdPreferencesUrl (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), retrievalStatus (ref), omniRecommendationsContentType (ref), resolveSponsoredDisclosure (ref), flaggedMutedError (ref), dialog (ref), view (ref), button (ref), buttonVariant (ref)
	local t_2
	local var2 = useDispatch()
	local var3, var4 = useCreatorName(p1.universeId)
	local t = {
		sponsoredDisclosureError = "Feature.GameDetails.Message.SponsoredDisclosure.Error",
		whyThisAd = "Feature.GameDetails.Label.WhyThisAd",
		adPreferences = "Feature.GameDetails.Message.AdPreferences"
	}
	local t_1 = {}
	local sponsoredUserCohort = p1.sponsoredUserCohort
	-- Unknown statement at pc 5: <SetList>
	t_1.CreatorName = var3
	t_1.PayerName = p1.payerName
	t.sponsoredDisclosure = t_1
	
	if fFlagLuaAppEnableHomepageOneByTwoTile then
		t_2 = {}
		local sponsoredUserCohort_1 = p1.sponsoredUserCohort
		-- Unknown statement at pc 2: <SetList>
		t_2.PayerName = p1.payerName
	else
		t_2 = nil
	end
	t.sponsoredDisclosureNoUniverse = t_2
	local var5 = useLocalization(t)
	local var6 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), closeCentralOverlay (copy)
		var2(closeCentralOverlay())
	end, { var2 })
	local var7 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), closeCentralOverlay (copy), appPage (copy), fStringLuaAppAdPreferencesUrl (copy), var5 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
		var2(closeCentralOverlay())
		local t = {
			name = appPage.GenericWebPage,
			detail = fStringLuaAppAdPreferencesUrl,
			extraProps = { title = var5.adPreferences }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var2(navigateDown(t))
	end, { var2, var5.adPreferences })
	
	if var4 == retrievalStatus.NotStarted or var4 == retrievalStatus.Fetching then
		return nil
	end
	local var8
	local var9 = nil
	local _ = nil
	
	if fFlagLuaAppEnableHomepageOneByTwoTile then
		local var10, var11 = resolveSponsoredDisclosure(p1.payerName, p1.contentType == omniRecommendationsContentType.AdLink, p1.universeId ~= nil and p1.universeId ~= "", var3, p1.sponsoredUserCohort, var5)
		var8 = var10
		var9 = var11
	elseif var3 and p1.payerName then
		var8 = var5.sponsoredDisclosure
		var9 = if p1.sponsoredUserCohort ~= sponsoredUserCohortModule.EighteenPlusPersonalized then p1.sponsoredUserCohort == sponsoredUserCohortModule.EighteenPlusNonPersonalized else true
	else
		flaggedMutedError("WhyThisAdDisclosureError", "Missing creatorName or payerName in WhyThisAdModal")
		var8 = var5.sponsoredDisclosureError
	end
	return reactModule.createElement(dialog.Root, { hasBackdrop = true, onClose = var6 }, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var5.whyThisAd }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 1 }, {
			ContentView = reactModule.createElement(view, { tag = "col auto-xy gap-small" }, {
				DialogText = reactModule.createElement(dialog.Text, { LayoutOrder = 1, Text = var8 }),
				AdPreferences = if var9 then reactModule.createElement(button, {
					LayoutOrder = 2,
					text = var5.adPreferences,
					variant = buttonVariant.Text,
					onActivated = var7
				}) else nil
			})
		})
	})
end