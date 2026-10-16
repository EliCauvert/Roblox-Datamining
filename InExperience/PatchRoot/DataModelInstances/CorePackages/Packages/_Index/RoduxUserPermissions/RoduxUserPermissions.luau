local Parent = script.Parent
local DashModule = require(Parent.Dash)
local RoduxNetworkingModule = require(Parent.RoduxNetworking)
local NetworkingUserSettingsModule = require(Parent.NetworkingUserSettings)
local NetworkingAccountInformationModule = require(Parent.NetworkingAccountInformation)
local UserPermissionsReducerModule = require(script.Reducers.UserPermissionsReducer)

return {
	config = function(p1) --[[ Line: 9 ]]
		-- upvalues: DashModule (copy), NetworkingUserSettingsModule (copy), RoduxNetworkingModule (copy), NetworkingAccountInformationModule (copy), UserPermissionsReducerModule (copy)
		local JoinResult = DashModule.join(p1, {
			networkingUserSettings = NetworkingUserSettingsModule.config({ roduxNetworking = RoduxNetworkingModule.mock() }),
			networkingAccountInformation = NetworkingAccountInformationModule.config({ roduxNetworking = RoduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function() --[[ Line: 20 ]]
				-- upvalues: UserPermissionsReducerModule (upval), JoinResult (ref)
				return UserPermissionsReducerModule(JoinResult)
			end
		}
	end
}