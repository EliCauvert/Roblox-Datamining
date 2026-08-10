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
local fStringLuaAppAdPreferencesUrl = require(parent.SharedFlags).FStringLuaAppAdPreferencesUrl

local function useCreatorName(p0) --[[ line: 46 ]]
	-- upvalues: useDispatch (ref), useRoactService (ref), roactNetworking (ref), useSelector (ref), apiFetchGameDetails (ref), reactModule (ref), retrievalStatus (ref)
	local var16 = useDispatch()
	local var17 = useRoactService(roactNetworking)
	local var18 = useSelector(function(p1) --[[ line: 50 ]]
		-- upvalues: p0 (ref), apiFetchGameDetails (copy)
		return p0 and apiFetchGameDetails.GetFetchingStatus(p1, p0) or nil
	end)
	local var19 = useSelector(function(p2) --[[ line: 54 ]]
		-- upvalues: p0 (ref)
		return if p0 then p2.GameDetails[p0] else nil
	end)
	reactModule.useEffect(function() --[[ line: 58 ]]
		-- upvalues: p0 (ref), var19 (ref), var18 (ref), retrievalStatus (copy), var16 (ref), apiFetchGameDetails (copy), var17 (ref)
		if p0 and not var19 and var18 ~= retrievalStatus.Fetching then
			var16(apiFetchGameDetails.Fetch(var17, { p0 }))
		end
	end, {
		p0,
		var19,
		var18,
		var16,
		var17
	})
	
	return var19 and (var19.creator and (var19.creator.name or nil)), var18
end

local function _(p3) --[[ line: 68 | named "getSponsoredDisclosureTranslationKey" ]]
	-- upvalues: sponsoredUserCohortModule (ref)
	return if p3 == sponsoredUserCohortModule.UnderEighteen then "Feature.GameDetails.Message.SponsoredDisclosure.U18" elseif p3 == sponsoredUserCohortModule.EighteenPlusPersonalized then "Feature.GameDetails.Message.SponsoredDisclosure.O18PersonalizedNoLink" elseif p3 == sponsoredUserCohortModule.EighteenPlusNonPersonalized then "Feature.GameDetails.Message.SponsoredDisclosure.O18NonPersonalizedNoLink" else "Feature.GameDetails.Message.SponsoredDisclosure.U18"
end

return function(p4) --[[ line: 80 | named "WhyThisAdModal" ]]
	-- upvalues: useDispatch (ref), useCreatorName (ref), useLocalization (ref), sponsoredUserCohortModule (ref), reactModule (ref), closeCentralOverlay (ref), appPage (ref), fStringLuaAppAdPreferencesUrl (ref), fFlagSignalsNavP3Dispatch (ref), var13 (ref), navigateDown (ref), retrievalStatus (ref), flaggedMutedError (ref), dialog (ref), view (ref), button (ref), buttonVariant (ref)
	local var20 = useDispatch()
	local var21, var22 = useCreatorName(p4.universeId)
	local t = {
		sponsoredDisclosureError = "Feature.GameDetails.Message.SponsoredDisclosure.Error",
		whyThisAd = "Feature.GameDetails.Label.WhyThisAd",
		adPreferences = "Feature.GameDetails.Message.AdPreferences"
	}
	local t_1 = {}
	local sponsoredUserCohort = p4.sponsoredUserCohort
	-- Unknown statement at pc 5: <SetList>
	t_1.CreatorName = var21
	t_1.PayerName = p4.payerName
	t.sponsoredDisclosure = t_1
	local var25 = useLocalization(t)
	local var26 = reactModule.useCallback(function() --[[ line: 95 ]]
		-- upvalues: var20 (ref), closeCentralOverlay (copy)
		var20(closeCentralOverlay())
	end, { var20 })
	local var27 = reactModule.useCallback(function() --[[ line: 99 ]]
		-- upvalues: var20 (ref), closeCentralOverlay (copy), appPage (copy), fStringLuaAppAdPreferencesUrl (copy), var25 (ref), fFlagSignalsNavP3Dispatch (copy), var13 (copy), navigateDown (copy)
		var20(closeCentralOverlay())
		local t = {
			name = appPage.GenericWebPage,
			detail = fStringLuaAppAdPreferencesUrl,
			extraProps = { title = var25.adPreferences }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var13.down(var13.fromLegacyPage(t))
			
			return
		end
		var20(navigateDown(t))
	end, { var20, var25.adPreferences })
	
	if var22 == retrievalStatus.NotStarted or var22 == retrievalStatus.Fetching then
		return nil
	end
	local sponsoredDisclosureError
	local var28 = nil
	local _ = nil
	
	if var21 and p4.payerName then
		sponsoredDisclosureError = var25.sponsoredDisclosure
		var28 = if p4.sponsoredUserCohort ~= sponsoredUserCohortModule.EighteenPlusPersonalized then p4.sponsoredUserCohort == sponsoredUserCohortModule.EighteenPlusNonPersonalized else true
	else
		flaggedMutedError("WhyThisAdDisclosureError", "Missing creatorName or payerName in WhyThisAdModal")
		sponsoredDisclosureError = var25.sponsoredDisclosureError
	end
	return reactModule.createElement(dialog.Root, { hasBackdrop = true, onClose = var26 }, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var25.whyThisAd }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 1 }, {
			ContentView = reactModule.createElement(view, { tag = "col auto-xy gap-small" }, {
				DialogText = reactModule.createElement(dialog.Text, { LayoutOrder = 1, Text = sponsoredDisclosureError }),
				AdPreferences = if var28 then reactModule.createElement(button, {
					LayoutOrder = 2,
					text = var25.adPreferences,
					variant = buttonVariant.Text,
					onActivated = var27
				}) else nil
			})
		})
	})
end