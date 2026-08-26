local badges = script:FindFirstAncestor("Badges")
local parent = badges.Parent
local _ = require(parent.Navigation)
local reactModule = require(parent.React)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local sduiPageEntryPoint = sduiSharedUtilitiesModule.SduiPageEntryPoint
local compositionTags = require(parent.AppComposition).CompositionTags
local fetchBadgesSeeAllPageIfNeededModule = require(badges.BadgesSeeAllPage.fetchBadgesSeeAllPageIfNeeded)
local getBadgesSeeAllPageKeyModule = require(badges.BadgesSeeAllPage.getBadgesSeeAllPageKey)

local function _(p1, p2)
	return p1[p2] or p1.navigation and p1.navigation.getParam(p2)
end

return reactModule.memo(function(p1)
	-- upvalues: getBadgesSeeAllPageKeyModule (ref), useLocalization (ref), reactModule (ref), sduiLoadTimer (ref), fetchBadgesSeeAllPageIfNeededModule (ref), sduiPageEntryPoint (ref), compositionTags (ref)
	local universeId = p1.universeId or p1.navigation and p1.navigation.getParam("universeId")
	local var1 = getBadgesSeeAllPageKeyModule(universeId)
	local var2 = useLocalization({ pageTitle = "CommonUI.Features.Label.Badges" })
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), sduiLoadTimer (copy)
		local var4 = p1
		
		return var4.pageTimer or var4.navigation and var4.navigation.getParam("pageTimer") or sduiLoadTimer.createLoadTimer("BadgesSeeAll")
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: universeId (ref), fetchBadgesSeeAllPageIfNeededModule (copy), var3 (ref)
		if universeId then
			fetchBadgesSeeAllPageIfNeededModule(universeId, var3)
		end
	end, { universeId, var3 })
	
	return if universeId == nil then nil else reactModule.createElement(sduiPageEntryPoint, {
		appPage = "BadgesSeeAll",
		includeNavigationHeaderBar = true,
		configKey = var1,
		pageTimer = var3,
		pageTitle = var2.pageTitle,
		refresh = reactModule.useCallback(function()
			-- upvalues: universeId (ref), sduiLoadTimer (copy), fetchBadgesSeeAllPageIfNeededModule (copy)
			if universeId then
				local badgesSeeAll = sduiLoadTimer.createLoadTimer("BadgesSeeAll")
				badgesSeeAll.start("refresh")
				fetchBadgesSeeAllPageIfNeededModule(universeId, badgesSeeAll, true)
			end
		end, { universeId }),
		contentTag = compositionTags.ContentRegion.Body
	})
end)