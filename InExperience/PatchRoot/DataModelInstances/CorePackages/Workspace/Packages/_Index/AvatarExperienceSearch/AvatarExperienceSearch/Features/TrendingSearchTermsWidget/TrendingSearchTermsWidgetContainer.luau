local ReactModule = require(script:FindFirstAncestor("AvatarExperienceSearch").Parent.React)
local TrendingSearchTermsWidgetModule = require(script.Parent.TrendingSearchTermsWidget)
local UseTrendingSearchTermsWidgetPropsModule = require(script.Parent.useTrendingSearchTermsWidgetProps)

return function(Frame)
	-- upvalues: UseTrendingSearchTermsWidgetPropsModule (copy), ReactModule (copy), TrendingSearchTermsWidgetModule (copy)
	return ReactModule.createElement(TrendingSearchTermsWidgetModule, {
		chips = UseTrendingSearchTermsWidgetPropsModule({ onSubmitSearch = Frame.onSubmitSearch }).chips,
		LayoutOrder = Frame.LayoutOrder
	})
end