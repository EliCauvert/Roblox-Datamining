local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appPage = require(parent.RobloxAppEnums).AppPage
local enumsModule = require(userList.Common.Enums)

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), appPage (ref), enumsModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	local var2 = useDispatch()
	
	return reactModule.useCallback(function(p2, p3)
		-- upvalues: p1 (ref), appPage (copy), enumsModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy)
		if p1 then
			p1(p2, p3)
			
			return
		end
		local t = {
			name = appPage.ProfilePlatform,
			detail = p2,
			extraProps = {
				profileType = if p3 == enumsModule.EntityType.Contact then enumsModule.EntityType.Contact else enumsModule.EntityType.User
			}
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var2(navigateDown(t))
	end, { p1, var2 })
end