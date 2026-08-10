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

local function _(p0, p1) --[[ line: 32 | named "getFromPropsOrNavigationParams" ]]
	return p0[p1] or p0.navigation and p0.navigation.getParam(p1)
end

return reactModule.memo(function(p2) --[[ line: 36 | named "BadgesSeeAllPage" ]]
	-- upvalues: getBadgesSeeAllPageKeyModule (ref), useLocalization (ref), reactModule (ref), sduiLoadTimer (ref), fetchBadgesSeeAllPageIfNeededModule (ref), sduiPageEntryPoint (ref), compositionTags (ref)
	local universeId = p2.universeId or p2.navigation and p2.navigation.getParam("universeId")
	local var6 = getBadgesSeeAllPageKeyModule(universeId)
	local var7 = useLocalization({ pageTitle = "CommonUI.Features.Label.Badges" })
	local var8 = reactModule.useMemo(function() --[[ line: 43 ]]
		-- upvalues: p2 (ref), sduiLoadTimer (copy)
		local var9 = p2
		
		return var9.pageTimer or var9.navigation and var9.navigation.getParam("pageTimer") or sduiLoadTimer.createLoadTimer("BadgesSeeAll")
	end, { var6 })
	reactModule.useEffect(function() --[[ line: 48 ]]
		-- upvalues: universeId (ref), fetchBadgesSeeAllPageIfNeededModule (copy), var8 (ref)
		if universeId then
			fetchBadgesSeeAllPageIfNeededModule(universeId, var8)
		end
	end, { universeId, var8 })
	
	return if universeId == nil then nil else reactModule.createElement(sduiPageEntryPoint, {
		appPage = "BadgesSeeAll",
		includeNavigationHeaderBar = true,
		configKey = var6,
		pageTimer = var8,
		pageTitle = var7.pageTitle,
		refresh = reactModule.useCallback(function() --[[ line: 54 ]]
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