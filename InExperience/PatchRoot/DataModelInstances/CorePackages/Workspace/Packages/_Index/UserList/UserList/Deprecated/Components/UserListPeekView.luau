local parent = script:FindFirstAncestor("UserList").Parent
local reactModule = require(parent.React)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local peekViewModule = require(parent.PeekView)
local peekViewWithTopBar = peekViewModule.PeekViewWithTopBar
local peekViewState = peekViewModule.PeekViewState
local roactUtilsModule = require(parent.RoactUtils)
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var4 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local userListModule = require(script.Parent.UserList)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local useTopBarHeight = robloxAppHooksModule.useTopBarHeight
local userListPeekViewTopBarModule = require(script.Parent.UserListPeekViewTopBar)
local view = foundationModule.View
local text = foundationModule.Text
local useLocalization = require(parent.Localization).Hooks.useLocalization

return function(p0) --[[ line: 34 ]]
	-- upvalues: useTopBarHeight (ref), useDispatch (ref), reactModule (ref), fFlagSignalsNavP3Dispatch (ref), var4 (ref), navigateBack (ref), peekViewState (ref), useLocalization (ref), peekViewWithTopBar (ref), userListPeekViewTopBarModule (ref), view (ref), text (ref), userListModule (ref), button (ref)
	local uDim = UDim.new(0.55, 0)
	local var9 = useTopBarHeight()
	local var10 = useDispatch()
	local var11 = reactModule.useCallback(function() --[[ line: 39 ]]
		-- upvalues: fFlagSignalsNavP3Dispatch (copy), var4 (copy), var10 (ref), navigateBack (copy)
		if fFlagSignalsNavP3Dispatch then
			var4.back(true)
			
			return
		end
		var10(navigateBack(true))
	end, { var10 })
	
	return reactModule.createElement(peekViewWithTopBar, {
		briefViewContentHeight = uDim,
		fullViewContentHeight = UDim.new(1, -var9),
		onViewStateChanged = reactModule.useCallback(function(p1, _, _) --[[ line: 47 ]]
			-- upvalues: peekViewState (copy), var11 (ref)
			if p1 == peekViewState.Closed then
				var11()
			end
		end, { var11 }),
		topBarHeight = var9,
		topBarSlot = reactModule.createElement(userListPeekViewTopBarModule, { navigateBack = var11 }),
		contentSlot = reactModule.createElement(view, {
			tag = "auto-y align-x-center col padding-top-xlarge padding-x-xlarge padding-bottom-large gap-large",
			Size = UDim2.new(1, 0, 1, -var9)
		}, {
			Title = if p0.title then reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "text-heading-small size-full-0 text-align-x-left content-emphasis auto-y",
				Text = p0.title
			}) else nil,
			UserList = reactModule.createElement(userListModule, {
				layoutOrder = 2,
				userIds = p0.users,
				onUserSelected = p0.onUserSelected
			}),
			ButtonContainer = reactModule.createElement(view, {
				LayoutOrder = 3,
				tag = "size-full-0 auto-y align-x-center col padding-top-xlarge padding-x-xlarge padding-bottom-large gap-large"
			}, {
				ShowMoreButton = if p0.hasMore and p0.onLoadMore then reactModule.createElement(button, {
					onActivated = p0.onLoadMore,
					text = useLocalization({ showMore = "Feature.Friends.Action.ShowMore" }).showMore
				}) else nil
			})
		})
	})
end