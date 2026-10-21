local Parent = script:FindFirstAncestor("SocialProof").Parent
local ReactModule = require(Parent.React)
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UserListModule = require(Parent.UserList)
local VerticalUserList = UserListModule.VerticalUserList.VerticalUserList
local EntityType = UserListModule.Enums.EntityType
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local View = FoundationModule.View
local Text = FoundationModule.Text
local Sheet = FoundationModule.Sheet
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SnapPoints = { 0.55, 1 }

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), UseLocalizationFunction (copy), EntityType (copy), Sheet (copy), SnapPoints (copy), View (copy), Text (copy), VerticalUserList (copy), Button (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval)
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.back(true)
			
			return
		else
			UseDispatchResult(NavigateBackFunction(true))
		end
	end, { UseDispatchResult })
	local UseLocalizationResult = UseLocalizationFunction({ showMore = "Feature.Friends.Action.ShowMore" })
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		onClose = UseResult,
		snapPoints = SnapPoints
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
			Title = if p1.title then ReactModule.createElement(View, { tag = "align-x-left size-full auto-y" }, {
				TitleText = ReactModule.createElement(Text, {
					tag = "auto-xy text-heading-small text-align-x-left content-emphasis",
					Text = p1.title
				})
			}) else nil
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			ListContainer = ReactModule.createElement(View, { tag = "size-full auto-y padding-y-large" }, {
				UserList = ReactModule.createElement(VerticalUserList, {
					layoutOrder = 1,
					entities = ReactModule.useMemo(function()
						-- upvalues: p1 (copy), EntityType (upval)
						local List = {}
						
						for _, user in ipairs(p1.users) do
							table.insert(List, { id = tostring(user), type = EntityType.User })
						end
						return List
					end, { p1.users }),
					onRowSelected = ReactModule.useCallback(function(p2)
						-- upvalues: p1 (copy)
						if p1.onUserSelected then
							p1.onUserSelected(p2)
						end
					end, { p1.onUserSelected }),
					initialRowCount = #p1.users
				}),
				ShowMoreButton = if p1.hasMore and p1.onLoadMore then ReactModule.createElement(Button, {
					LayoutOrder = 2,
					onActivated = p1.onLoadMore,
					text = UseLocalizationResult.showMore
				}) else nil
			})
		})
	})
end