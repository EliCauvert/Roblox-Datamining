local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local _ = require(NotApprovedPage.Common.Types)
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local ScrollView = FoundationModule.ScrollView
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local RenderPageItemsFromListFunction = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils).renderPageItemsFromList
local UsePageNavigationFunction = require(NotApprovedPage.Contexts.PageNavigationContext).usePageNavigation

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRefFunction (copy), UsePageNavigationFunction (copy), RenderPageItemsFromListFunction (copy), UseEffectFunction (copy), ReactModule (copy), ScrollView (copy), ScrollBarVisibility (copy), View (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = UseRefFunction(nil)
	local ModerationDetail = p1.moderationDetail
	local UsePageNavigationResult = UsePageNavigationFunction()
	local CurrentPage = UsePageNavigationResult.currentPage
	local RenderPageItemsFromListResult = RenderPageItemsFromListFunction(UsePageNavigationResult.currentPageConfigs, ModerationDetail, UseDispatchResult, UsePageNavigationResult.currentPage, UsePageNavigationResult.hasEducationalPages, UsePageNavigationResult.isFirstPage, UsePageNavigationResult.currentPageName, p1.commutationEligibility)
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			local ScrollingFrame = UseRefResult.current:FindFirstChildWhichIsA("ScrollingFrame", true)
			
			if ScrollingFrame then
				ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
			end
		end
	end, { CurrentPage })
	
	return ReactModule.createElement(ScrollView, {
		tag = "size-full",
		ref = UseRefResult,
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(1, 0, 1, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			VerticalScrollBarInset = Enum.ScrollBarInset.None,
			scrollBarVisibility = ScrollBarVisibility.Always
		}
	}, {
		Content = ReactModule.createElement(View, { tag = "size-full-0 auto-y col" }, {
			PageItemsContent = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y col gap-xlarge padding-x-xxlarge",
				LayoutOrder = 2
			}, unpack(RenderPageItemsFromListResult))
		})
	})
end)