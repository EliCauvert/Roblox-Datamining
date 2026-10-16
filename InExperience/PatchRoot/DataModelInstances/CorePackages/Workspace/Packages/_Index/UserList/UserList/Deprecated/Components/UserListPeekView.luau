local Parent = script:FindFirstAncestor("UserList").Parent
local ReactModule = require(Parent.React)
local PeekViewModule = require(Parent.PeekView)
local PeekViewWithTopBar = PeekViewModule.PeekViewWithTopBar
local PeekViewState = PeekViewModule.PeekViewState
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UserListModule = require(script.Parent.UserList)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local UseTopBarHeightFunction = require(Parent.RobloxAppHooks).useTopBarHeight
local UserListPeekViewTopBarModule = require(script.Parent.UserListPeekViewTopBar)
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1) --[[ Line: 34 ]]
	-- upvalues: UseTopBarHeightFunction (copy), UseDispatchFunction (copy), ReactModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), PeekViewState (copy), UseLocalizationFunction (copy), PeekViewWithTopBar (copy), UserListPeekViewTopBarModule (copy), View (copy), Text (copy), UserListModule (copy), Button (copy)
	local UseTopBarHeightResult = UseTopBarHeightFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function() --[[ Line: 39 ]]
		-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval)
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.back(true)
			
			return
		else
			UseDispatchResult(NavigateBackFunction(true))
		end
	end, { UseDispatchResult })
	local UseResult1 = ReactModule.useCallback(function(Closed, _, _) --[[ Line: 47 ]]
		-- upvalues: PeekViewState (upval), UseResult (copy)
		if Closed == PeekViewState.Closed then
			UseResult()
		end
	end, { UseResult })
	local UseLocalizationResult = UseLocalizationFunction({ showMore = "Feature.Friends.Action.ShowMore" })
	
	return ReactModule.createElement(PeekViewWithTopBar, {
		briefViewContentHeight = UDim.new(0.55, 0),
		fullViewContentHeight = UDim.new(1, -UseTopBarHeightResult),
		onViewStateChanged = UseResult1,
		topBarHeight = UseTopBarHeightResult,
		topBarSlot = ReactModule.createElement(UserListPeekViewTopBarModule, { navigateBack = UseResult }),
		contentSlot = ReactModule.createElement(View, {
			tag = "auto-y align-x-center col padding-top-xlarge padding-x-xlarge padding-bottom-large gap-large",
			Size = UDim2.new(1, 0, 1, -UseTopBarHeightResult)
		}, {
			Title = if p1.title then ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "text-heading-small size-full-0 text-align-x-left content-emphasis auto-y",
				Text = p1.title
			}) else nil,
			UserList = ReactModule.createElement(UserListModule, {
				layoutOrder = 2,
				userIds = p1.users,
				onUserSelected = p1.onUserSelected
			}),
			ButtonContainer = ReactModule.createElement(View, {
				LayoutOrder = 3,
				tag = "size-full-0 auto-y align-x-center col padding-top-xlarge padding-x-xlarge padding-bottom-large gap-large"
			}, {
				ShowMoreButton = if p1.hasMore and p1.onLoadMore then ReactModule.createElement(Button, {
					onActivated = p1.onLoadMore,
					text = UseLocalizationResult.showMore
				}) else nil
			})
		})
	})
end