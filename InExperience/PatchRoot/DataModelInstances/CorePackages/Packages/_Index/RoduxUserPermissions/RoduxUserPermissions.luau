local parent = script.Parent
local dashModule = require(parent.Dash)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local networkingUserSettingsModule = require(parent.NetworkingUserSettings)
local networkingAccountInformationModule = require(parent.NetworkingAccountInformation)
local userPermissionsReducerModule = require(script.Reducers.UserPermissionsReducer)

return {
	config = function(p1)
		-- upvalues: dashModule (ref), networkingUserSettingsModule (ref), roduxNetworkingModule (ref), networkingAccountInformationModule (ref), userPermissionsReducerModule (ref)
		p1 = dashModule.join(p1, {
			networkingUserSettings = networkingUserSettingsModule.config({ roduxNetworking = roduxNetworkingModule.mock() }),
			networkingAccountInformation = networkingAccountInformationModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: userPermissionsReducerModule (copy), p1 (write)
				return userPermissionsReducerModule(p1)
			end
		}
	end
}