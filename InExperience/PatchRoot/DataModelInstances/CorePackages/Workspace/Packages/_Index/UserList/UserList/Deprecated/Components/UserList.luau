local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local networkingPresenceModule = require(userList.Networking.NetworkingPresence)
local fFlagUserListPresenceStoreMigrationModule = require(userList.Flags.FFlagUserListPresenceStoreMigration)
local view = require(parent.Foundation).View
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var4 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appPage = require(parent.RobloxAppEnums).AppPage
local constantsModule = require(userList.Common.Constants)
local userRowWrapperModule = require(script.Parent.UserRowWrapper)

return function(p0)
	-- upvalues: useDispatch (ref), reactModule (ref), appPage (ref), constantsModule (ref), fFlagSignalsNavP3Dispatch (ref), var4 (ref), navigateDown (ref), fFlagUserListPresenceStoreMigrationModule (ref), networkingPresenceModule (ref), view (ref), userRowWrapperModule (ref)
	local var7 = useDispatch()
	local var8 = reactModule.useCallback(function(p1)
		-- upvalues: p0 (ref), appPage (copy), constantsModule (copy), fFlagSignalsNavP3Dispatch (copy), var4 (copy), var7 (ref), navigateDown (copy)
		if p0.onUserSelected then
			p0.onUserSelected(p1)
			
			return
		end
		local t = {
			name = appPage.ProfilePlatform,
			detail = p1,
			extraProps = { profileType = constantsModule.PROFILE_TYPE }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var4.down(var4.fromLegacyPage(t))
			
			return
		end
		var7(navigateDown(t))
	end, { p0.onUserSelected, var7 })
	reactModule.useEffect(function()
		-- upvalues: fFlagUserListPresenceStoreMigrationModule (copy), p0 (ref), var7 (ref), networkingPresenceModule (copy)
		if not fFlagUserListPresenceStoreMigrationModule and #p0.userIds > 0 then
			var7(networkingPresenceModule.GetPresencesFromUserIds.API(p0.userIds))
		end
	end, { p0.userIds })
	
	return if #p0.userIds == 0 then nil else reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-large",
		LayoutOrder = p0.layoutOrder or 0
	}, {
		UserRows = reactModule.createElement(reactModule.Fragment, {}, unpack(reactModule.useMemo(function()
			-- upvalues: p0 (ref), reactModule (copy), userRowWrapperModule (copy), var8 (ref)
			local t = {}
			
			for i, v in ipairs(p0.userIds) do
				t[i] = reactModule.createElement(userRowWrapperModule, { userId = v, LayoutOrder = i, onActivated = var8 })
			end
			return t
		end, { p0.userIds })))
	})
end