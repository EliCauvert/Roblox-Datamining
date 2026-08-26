local parent = script:FindFirstAncestor("UserList").Parent
local reactModule = require(parent.React)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local peekViewModule = require(parent.PeekView)
local peekViewWithTopBar = peekViewModule.PeekViewWithTopBar
local peekViewState = peekViewModule.PeekViewState
local roactUtilsModule = require(parent.RoactUtils)
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local userListModule = require(script.Parent.UserList)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local useTopBarHeight = robloxAppHooksModule.useTopBarHeight
local userListPeekViewTopBarModule = require(script.Parent.UserListPeekViewTopBar)
local view = foundationModule.View
local text = foundationModule.Text
local useLocalization = require(parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: useTopBarHeight (ref), useDispatch (ref), reactModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateBack (ref), peekViewState (ref), useLocalization (ref), peekViewWithTopBar (ref), userListPeekViewTopBarModule (ref), view (ref), text (ref), userListModule (ref), button (ref)
	local uDim = UDim.new(0.55, 0)
	local var2 = useTopBarHeight()
	local var3 = useDispatch()
	local var4 = reactModule.useCallback(function()
		-- upvalues: fFlagSignalsNavP3Dispatch (copy), var1 (copy), var3 (ref), navigateBack (copy)
		if fFlagSignalsNavP3Dispatch then
			var1.back(true)
			
			return
		end
		var3(navigateBack(true))
	end, { var3 })
	
	return reactModule.createElement(peekViewWithTopBar, {
		briefViewContentHeight = uDim,
		fullViewContentHeight = UDim.new(1, -var2),
		onViewStateChanged = reactModule.useCallback(function(p2, _, _)
			-- upvalues: peekViewState (copy), var4 (ref)
			if p2 == peekViewState.Closed then
				var4()
			end
		end, { var4 }),
		topBarHeight = var2,
		topBarSlot = reactModule.createElement(userListPeekViewTopBarModule, { navigateBack = var4 }),
		contentSlot = reactModule.createElement(view, {
			tag = "auto-y align-x-center col padding-top-xlarge padding-x-xlarge padding-bottom-large gap-large",
			Size = UDim2.new(1, 0, 1, -var2)
		}, {
			Title = if p1.title then reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "text-heading-small size-full-0 text-align-x-left content-emphasis auto-y",
				Text = p1.title
			}) else nil,
			UserList = reactModule.createElement(userListModule, {
				layoutOrder = 2,
				userIds = p1.users,
				onUserSelected = p1.onUserSelected
			}),
			ButtonContainer = reactModule.createElement(view, {
				LayoutOrder = 3,
				tag = "size-full-0 auto-y align-x-center col padding-top-xlarge padding-x-xlarge padding-bottom-large gap-large"
			}, {
				ShowMoreButton = if p1.hasMore and p1.onLoadMore then reactModule.createElement(button, {
					onActivated = p1.onLoadMore,
					text = useLocalization({ showMore = "Feature.Friends.Action.ShowMore" }).showMore
				}) else nil
			})
		})
	})
end