local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local VerticalPagerModule = require(Moments.Components.VerticalPager)
local UseMomentsSessionFunction = require(Moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local MakeJoinImpressionFieldsModule = require(Moments.Analytics.makeJoinImpressionFields)
local MomentImpressionMemoryModule = require(Moments.Components.Feed.Items.Moment.MomentImpressionMemory)
local FFlagMomentsFixOverlayRemountImpressionsModule = require(Moments.Flags.FFlagMomentsFixOverlayRemountImpressions)
local Analytics = require(Parent.MomentsCommon).Analytics
local EventNames = Analytics.EventNames
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseVerticalPagerFunction = VerticalPagerModule.useVerticalPager
local UsePagerItemFunction = VerticalPagerModule.usePagerItem

return function(p1, p2) --[[ Line: 51 | Named "useJoinCtaImpression" ]]
	-- upvalues: UseVerticalPagerFunction (copy), UsePagerItemFunction (copy), UseMomentsSessionFunction (copy), ReactModule (copy), SignalsModule (copy), UseSignalStateFunction (copy), FFlagMomentsFixOverlayRemountImpressionsModule (copy), MomentImpressionMemoryModule (copy), MakeJoinImpressionFieldsModule (copy), Analytics (copy), EventNames (copy)
	local UseVerticalPagerResult = UseVerticalPagerFunction()
	local UsePagerItemResult = UsePagerItemFunction()
	local UseMomentsSessionResult = UseMomentsSessionFunction()
	local Item = UsePagerItemResult.item
	local UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function() --[[ Line: 58 ]]
		-- upvalues: SignalsModule (upval), Item (copy), UseVerticalPagerResult (copy)
		return SignalsModule.createComputed(function(p3): boolean --[[ Line: 59 ]]
			-- upvalues: Item (upval), UseVerticalPagerResult (upval)
			return Item ~= nil and UseVerticalPagerResult.store.getCurrentItem(p3) == Item
		end)
	end, { UseVerticalPagerResult, Item })))
	local JoinCta = if FFlagMomentsFixOverlayRemountImpressionsModule then MomentImpressionMemoryModule.useImpressionRef("joinCta") else ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 77 ]]
		-- upvalues: JoinCta (copy), UseSignalStateResult (copy), p2 (copy), p1 (copy), Item (copy), MakeJoinImpressionFieldsModule (upval), UseMomentsSessionResult (copy), Analytics (upval), EventNames (upval)
		local Current = JoinCta.current
		JoinCta.current = UseSignalStateResult
		
		if not p2 or p1 then return end
		if not UseSignalStateResult or Current then return end
		if Item == nil or Item.kind ~= "moment" then return end
		local JoinImpressionFieldsModule = MakeJoinImpressionFieldsModule(Item.moment, UseMomentsSessionResult.getSessionSource(false))
		
		if JoinImpressionFieldsModule ~= nil then
			Analytics.fireAnalyticsEvent(EventNames.FeedExperienceJoinImpression, JoinImpressionFieldsModule)
		end
	end, {
		UseSignalStateResult,
		p2,
		p1,
		Item,
		UseMomentsSessionResult
	})
end