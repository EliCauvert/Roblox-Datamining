local devStore = script:FindFirstAncestor("DevStore")
local parent = devStore.Parent
local _ = require(parent.Navigation)
local reactModule = require(parent.React)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local sduiPageEntryPoint = sduiSharedUtilitiesModule.SduiPageEntryPoint
local compositionTags = require(parent.AppComposition).CompositionTags
local fetchDevStoreSeeAllPageIfNeededModule = require(devStore.DevStoreSeeAllPage.fetchDevStoreSeeAllPageIfNeeded)
local getDevStoreSeeAllPageKeyModule = require(devStore.DevStoreSeeAllPage.getDevStoreSeeAllPageKey)

local function _(p0, p1)
	return p0[p1] or p0.navigation and p0.navigation.getParam(p1)
end

return reactModule.memo(function(p2)
	-- upvalues: getDevStoreSeeAllPageKeyModule (ref), useLocalization (ref), reactModule (ref), sduiLoadTimer (ref), fetchDevStoreSeeAllPageIfNeededModule (ref), sduiPageEntryPoint (ref), compositionTags (ref)
	local universeId = p2.universeId or p2.navigation and p2.navigation.getParam("universeId")
	local var6 = getDevStoreSeeAllPageKeyModule(universeId)
	local var7 = useLocalization({ pageTitle = "Feature.GameDetails.Label.Store" })
	local pageTimer = p2.pageTimer or p2.navigation and p2.navigation.getParam("pageTimer")
	local var9 = reactModule.useMemo(function()
		-- upvalues: pageTimer (ref), sduiLoadTimer (copy)
		return pageTimer or sduiLoadTimer.createLoadTimer("DevStoreSeeAll")
	end, { var6, pageTimer })
	reactModule.useEffect(function()
		-- upvalues: universeId (ref), fetchDevStoreSeeAllPageIfNeededModule (copy), var9 (ref)
		if universeId then
			fetchDevStoreSeeAllPageIfNeededModule(universeId, var9)
		end
	end, { universeId, var9 })
	
	return if universeId == nil then nil else reactModule.createElement(sduiPageEntryPoint, {
		appPage = "DevStoreSeeAll",
		includeNavigationHeaderBar = true,
		configKey = var6,
		pageTimer = var9,
		pageTitle = var7.pageTitle,
		refresh = reactModule.useCallback(function()
			-- upvalues: universeId (ref), sduiLoadTimer (copy), fetchDevStoreSeeAllPageIfNeededModule (copy)
			if universeId then
				local devStoreSeeAll = sduiLoadTimer.createLoadTimer("DevStoreSeeAll")
				devStoreSeeAll.start("refresh")
				fetchDevStoreSeeAllPageIfNeededModule(universeId, devStoreSeeAll, true)
			end
		end, { universeId }),
		contentTag = compositionTags.ContentRegion.Body,
		layoutTag = compositionTags.Layout.Detail
	})
end)