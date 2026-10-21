local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AppPage = require(Parent.RobloxAppEnums).AppPage
local EnumsModule = require(UserList.Common.Enums)
local _ = require(UserList.Common.Types)
local FFlagUserListRowSelectionOriginSourceModule = require(UserList.Flags.FFlagUserListRowSelectionOriginSource)

return function(Callback, p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), AppPage (copy), EnumsModule (copy), FFlagUserListRowSelectionOriginSourceModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return (ReactModule.useCallback(function(Detail, Contact)
		-- upvalues: Callback (copy), AppPage (upval), EnumsModule (upval), FFlagUserListRowSelectionOriginSourceModule (upval), p1 (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		if Callback then
			Callback(Detail, Contact)
			
			return
		end
		local config = {
			name = AppPage.ProfilePlatform,
			detail = Detail,
			extraProps = {
				profileType = if Contact == EnumsModule.EntityType.Contact then EnumsModule.EntityType.Contact else EnumsModule.EntityType.User,
				friendshipOriginSourceType = if FFlagUserListRowSelectionOriginSourceModule and p1 then p1.friendshipOriginSourceType else nil
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, { Callback, UseDispatchResult, p1 or false }))
end