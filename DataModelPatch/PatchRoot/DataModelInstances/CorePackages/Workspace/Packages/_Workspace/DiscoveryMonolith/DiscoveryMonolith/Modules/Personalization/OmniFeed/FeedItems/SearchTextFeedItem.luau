local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local SearchTextBannerModule = require(DiscoveryMonolith.Modules.Personalization.Search.SearchTextBanner)
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local SignalsReactModule = require(Parent.SignalsReact)
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize
local UsePageSideMarginFunction = CollectionViewsModule.usePageSideMargin
local OmniFeedPropsModule = require(DiscoveryMonolith.Modules.Personalization.OmniFeed.OmniFeedProps)
local FFlagLuaAppLayoutParamsInContext = require(Parent.SharedFlags).FFlagLuaAppLayoutParamsInContext
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways

return function(p1)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), OmniFeedPropsModule (copy), FFlagLuaAppLayoutParamsInContext (copy), CollectionItemSize (copy), ReactModule (copy), SignalsReactModule (copy), UsePageSideMarginFunction (copy), UseSelectorFunction (copy), SearchTextBannerModule (copy)
	local AppCompositionEnabled = if FFlagLuaAppCompositionAlways then true else p1[OmniFeedPropsModule.key].appCompositionEnabled
	local UseSignalStateResult = nil
	
	if not FFlagLuaAppCompositionAlways then
		if FFlagLuaAppLayoutParamsInContext then
			local SduiContext = p1[OmniFeedPropsModule.key].sduiContext
			local Small = CollectionItemSize.Small
			UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2)
				-- upvalues: SduiContext (copy), Small (copy)
				return SduiContext.getPageLayoutConfig(Small)(p2).sideMargin
			end, { Small, SduiContext.getPageLayoutConfig })))
		else
			UseSignalStateResult = UsePageSideMarginFunction(p1[OmniFeedPropsModule.key].verticalScrollingFrameRef.current)
		end
	end
	return ReactModule.createElement(SearchTextBannerModule, {
		text = UseSelectorFunction(function(p2)
			-- upvalues: p1 (copy)
			local TextSearchResultEntry = p2.TextSearchResults[p1.searchUuid] and p2.TextSearchResults[p1.searchUuid][p1.topicId] or nil
			
			return if TextSearchResultEntry then TextSearchResultEntry.text else nil
		end),
		sidePadding = if AppCompositionEnabled then nil else UseSignalStateResult
	})
end