local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local EventNamesModule = require(Parent.Analytics.EventNames)
local FeedContextModule = require(Parent.App.FeedContext)
local SharePostModule = require(Parent.Thunks.SharePost)
local UseAnalyticsModule = require(Parent.Hooks.useAnalytics)
local UseDispatchFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _UDim2 = UDim2.fromOffset(1, 1)

return function(p1)
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseTokensFunction (copy), ReactModule (copy), FeedContextModule (copy), View (copy), EventNamesModule (copy), SharePostModule (copy), Icon (copy), _UDim2 (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "radius-medium auto-xy padding-small bg-action-subtle",
		isDisabled = ReactModule.useContext(FeedContextModule).isZooming,
		LayoutOrder = p1.layoutOrder,
		onActivated = function()
			-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), p1 (copy), UseDispatchResult (copy), SharePostModule (upval)
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.ContentFeedShareCtaPressed, { postId = p1.postId })
			UseDispatchResult(SharePostModule(p1.creatorUserId, p1.postId))
		end
	}, {
		ShareIcon = ReactModule.createElement(Icon, {
			name = "icons/actions/shareArrowOn",
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			style = UseTokensResult.Color.ActionEmphasis.Foreground
		}),
		ShareIconShadow = ReactModule.createElement(Icon, {
			name = "icons/actions/shareArrowOn",
			ZIndex = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5) + _UDim2,
			style = UseTokensResult.Color.Common.Shadow
		})
	})
end