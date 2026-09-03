local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local momentsCommonModule = require(parent.MomentsCommon)
local verticalPagerModule = require(moments.Components.VerticalPager)
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local makeJoinImpressionFieldsModule = require(moments.Analytics.makeJoinImpressionFields)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local useSignalState = signalsReactModule.useSignalState
local useVerticalPager = verticalPagerModule.useVerticalPager
local usePagerItem = verticalPagerModule.usePagerItem

return function(p1, p2)
	-- upvalues: useVerticalPager (ref), usePagerItem (ref), useMomentsSession (ref), reactModule (ref), signalsModule (ref), useSignalState (ref), makeJoinImpressionFieldsModule (ref), analytics (ref), eventNames (ref)
	local var1 = useVerticalPager()
	local var2 = useMomentsSession()
	local item = usePagerItem().item
	local var3 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), item (ref), var1 (ref)
		return signalsModule.createComputed(function(p3)
			-- upvalues: item (copy), var1 (copy)
			return if item == nil then false else var1.store.getCurrentItem(p3) == item
		end)
	end, { var1, item }))
	local var4 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var3 (ref), p2 (ref), p1 (ref), item (ref), makeJoinImpressionFieldsModule (copy), var2 (ref), analytics (copy), eventNames (copy)
		local current = var4.current
		var4.current = var3
		
		if not p2 or p1 then return end
		if not var3 or current then return end
		if item == nil or item.kind ~= "moment" then return end
		local var5 = makeJoinImpressionFieldsModule(item.moment, var2.getSessionSource(false))
		
		if var5 ~= nil then
			analytics.fireAnalyticsEvent(eventNames.FeedExperienceJoinImpression, var5)
		end
	end, {
		var3,
		p2,
		p1,
		item,
		var2
	})
end