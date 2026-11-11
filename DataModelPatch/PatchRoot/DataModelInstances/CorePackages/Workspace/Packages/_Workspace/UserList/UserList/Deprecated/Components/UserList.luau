local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NetworkingPresenceModule = require(UserList.Networking.NetworkingPresence)
local FFlagUserListPresenceStoreMigrationModule = require(UserList.Flags.FFlagUserListPresenceStoreMigration)
local View = require(Parent.Foundation).View
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ConstantsModule = require(UserList.Common.Constants)
local UserRowWrapperModule = require(script.Parent.UserRowWrapper)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), AppPage (copy), ConstantsModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), FFlagUserListPresenceStoreMigrationModule (copy), NetworkingPresenceModule (copy), View (copy), UserRowWrapperModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function(Detail)
		-- upvalues: p1 (copy), AppPage (upval), ConstantsModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		if p1.onUserSelected then
			p1.onUserSelected(Detail)
			
			return
		end
		local config = {
			name = AppPage.ProfilePlatform,
			detail = Detail,
			extraProps = { profileType = ConstantsModule.PROFILE_TYPE }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, { p1.onUserSelected, UseDispatchResult })
	ReactModule.useEffect(function()
		-- upvalues: FFlagUserListPresenceStoreMigrationModule (upval), p1 (copy), UseDispatchResult (copy), NetworkingPresenceModule (upval)
		if not FFlagUserListPresenceStoreMigrationModule and #p1.userIds > 0 then
			UseDispatchResult(NetworkingPresenceModule.GetPresencesFromUserIds.API(p1.userIds))
		end
	end, { p1.userIds })
	
	return if #p1.userIds == 0 then nil else ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col gap-large",
		LayoutOrder = p1.layoutOrder or 0
	}, {
		UserRows = ReactModule.createElement(ReactModule.Fragment, {}, unpack(ReactModule.useMemo(function()
			-- upvalues: p1 (copy), ReactModule (upval), UserRowWrapperModule (upval), UseResult (copy)
			local Elements = {}
			
			for LayoutOrder, userId in ipairs(p1.userIds) do
				Elements[LayoutOrder] = ReactModule.createElement(UserRowWrapperModule, {
					userId = userId,
					LayoutOrder = LayoutOrder,
					onActivated = UseResult
				})
			end
			return Elements
		end, { p1.userIds })))
	})
end