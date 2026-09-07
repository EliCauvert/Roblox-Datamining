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

local function _(p1, p2)
	return p1[p2] or p1.navigation and p1.navigation.getParam(p2)
end

return reactModule.memo(function(p1)
	-- upvalues: getDevStoreSeeAllPageKeyModule (ref), useLocalization (ref), reactModule (ref), sduiLoadTimer (ref), fetchDevStoreSeeAllPageIfNeededModule (ref), sduiPageEntryPoint (ref), compositionTags (ref)
	local universeId = p1.universeId or p1.navigation and p1.navigation.getParam("universeId")
	local var1 = getDevStoreSeeAllPageKeyModule(universeId)
	local var2 = useLocalization({ pageTitle = "Feature.GameDetails.Label.Store" })
	local pageTimer = p1.pageTimer or p1.navigation and p1.navigation.getParam("pageTimer")
	local var3 = reactModule.useMemo(function()
		-- upvalues: pageTimer (ref), sduiLoadTimer (copy)
		return pageTimer or sduiLoadTimer.createLoadTimer("DevStoreSeeAll")
	end, { var1, pageTimer })
	reactModule.useEffect(function()
		-- upvalues: universeId (ref), fetchDevStoreSeeAllPageIfNeededModule (copy), var3 (ref)
		if universeId then
			fetchDevStoreSeeAllPageIfNeededModule(universeId, var3)
		end
	end, { universeId, var3 })
	
	return if universeId == nil then nil else reactModule.createElement(sduiPageEntryPoint, {
		appPage = "DevStoreSeeAll",
		includeNavigationHeaderBar = true,
		configKey = var1,
		pageTimer = var3,
		pageTitle = var2.pageTitle,
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