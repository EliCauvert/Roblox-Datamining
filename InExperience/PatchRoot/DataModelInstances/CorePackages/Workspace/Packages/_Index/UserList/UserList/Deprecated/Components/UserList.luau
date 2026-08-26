local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local networkingPresenceModule = require(userList.Networking.NetworkingPresence)
local fFlagUserListPresenceStoreMigrationModule = require(userList.Flags.FFlagUserListPresenceStoreMigration)
local view = require(parent.Foundation).View
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appPage = require(parent.RobloxAppEnums).AppPage
local constantsModule = require(userList.Common.Constants)
local userRowWrapperModule = require(script.Parent.UserRowWrapper)

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), appPage (ref), constantsModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), fFlagUserListPresenceStoreMigrationModule (ref), networkingPresenceModule (ref), view (ref), userRowWrapperModule (ref)
	local var2 = useDispatch()
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), appPage (copy), constantsModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy)
		if p1.onUserSelected then
			p1.onUserSelected(p2)
			
			return
		end
		local t = {
			name = appPage.ProfilePlatform,
			detail = p2,
			extraProps = { profileType = constantsModule.PROFILE_TYPE }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var2(navigateDown(t))
	end, { p1.onUserSelected, var2 })
	reactModule.useEffect(function()
		-- upvalues: fFlagUserListPresenceStoreMigrationModule (copy), p1 (ref), var2 (ref), networkingPresenceModule (copy)
		if not fFlagUserListPresenceStoreMigrationModule and #p1.userIds > 0 then
			var2(networkingPresenceModule.GetPresencesFromUserIds.API(p1.userIds))
		end
	end, { p1.userIds })
	
	return if #p1.userIds == 0 then nil else reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-large",
		LayoutOrder = p1.layoutOrder or 0
	}, {
		UserRows = reactModule.createElement(reactModule.Fragment, {}, unpack(reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), userRowWrapperModule (copy), var3 (ref)
			local t = {}
			
			for i, v in ipairs(p1.userIds) do
				t[i] = reactModule.createElement(userRowWrapperModule, { userId = v, LayoutOrder = i, onActivated = var3 })
			end
			return t
		end, { p1.userIds })))
	})
end