local Parent = script:FindFirstAncestor("SocialProof").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UserListModule = require(Parent.UserList)
local VerticalUserList = UserListModule.VerticalUserList.VerticalUserList
local EntityType = UserListModule.Enums.EntityType
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Sheet = FoundationModule.Sheet
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps
local DashModule = require(Parent.Dash)
local SnapPoints = { 0.7 }

return function()
	-- upvalues: UseDispatchFunction (copy), UseNavigationPropsFunction (copy), UseTokensFunction (copy), ReactModule (copy), DashModule (copy), EntityType (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), NavigateDownFunction (copy), Sheet (copy), SnapPoints (copy), View (copy), Text (copy), VerticalUserList (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p1)
		return { userIds = p1.userIds, title = p1.title }
	end)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		onClose = ReactModule.useCallback(function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.back(p1)
				
				return
			else
				UseDispatchResult(NavigateBackFunction(p1))
			end
		end, { UseDispatchResult, NavigateBackFunction }),
		snapPoints = SnapPoints
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
			Title = ReactModule.createElement(View, { tag = "size-full auto-xy align-x-center" }, {
				TitleText = ReactModule.createElement(Text, {
					tag = "auto-xy text-align-x-left",
					RichText = true,
					Text = UseNavigationPropsResult.title,
					fontStyle = UseTokensResult.Typography.HeadingSmall,
					textStyle = UseTokensResult.Color.Content.Emphasis
				})
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			UserListContainer = ReactModule.createElement(View, { tag = "size-full auto-y" }, {
				UserList = ReactModule.createElement(VerticalUserList, {
					entities = ReactModule.useMemo(function()
						-- upvalues: DashModule (upval), UseNavigationPropsResult (copy), EntityType (upval)
						return DashModule.map(UseNavigationPropsResult.userIds, function(p1)
							-- upvalues: EntityType (upval)
							return { id = tostring(p1), type = EntityType.User }
						end)
					end, { UseNavigationPropsResult.userIds }),
					onRowSelected = ReactModule.useCallback(function(Detail, _)
						-- upvalues: AppPage (upval), EntityType (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval), NavigateDownFunction (upval)
						local config = {
							name = AppPage.ProfilePlatform,
							detail = Detail,
							extraProps = { profileType = EntityType.User }
						}
						
						if FFlagSignalsNavP3Dispatch then
							NavigationCommands.back(true)
							NavigationCommands.down(NavigationCommands.fromLegacyPage(config), true)
							
							return
						else
							UseDispatchResult(NavigateBackFunction(true))
							UseDispatchResult(NavigateDownFunction(config, true))
						end
					end, {
						UseDispatchResult,
						NavigateBackFunction,
						NavigateDownFunction
					}),
					initialRowCount = #UseNavigationPropsResult.userIds
				})
			})
		})
	})
end