local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var2 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appPage = require(parent.RobloxAppEnums).AppPage
local enumsModule = require(userList.Common.Enums)

return function(p0) --[[ line: 21 | named "useEntitySelectionHandler" ]]
	-- upvalues: useDispatch (ref), reactModule (ref), appPage (ref), enumsModule (ref), fFlagSignalsNavP3Dispatch (ref), var2 (ref), navigateDown (ref)
	local var4 = useDispatch()
	
	return reactModule.useCallback(function(p1, p2) --[[ line: 26 ]]
		-- upvalues: p0 (ref), appPage (copy), enumsModule (copy), fFlagSignalsNavP3Dispatch (copy), var2 (copy), var4 (ref), navigateDown (copy)
		if p0 then
			p0(p1, p2)
			
			return
		end
		local t = {
			name = appPage.ProfilePlatform,
			detail = p1,
			extraProps = {
				profileType = if p2 == enumsModule.EntityType.Contact then enumsModule.EntityType.Contact else enumsModule.EntityType.User
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var2.down(var2.fromLegacyPage(t))
			
			return
		end
		var4(navigateDown(t))
	end, { p0, var4 })
end