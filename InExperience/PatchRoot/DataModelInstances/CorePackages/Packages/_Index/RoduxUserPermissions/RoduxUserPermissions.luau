local parent = script.Parent
local dashModule = require(parent.Dash)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local networkingUserSettingsModule = require(parent.NetworkingUserSettings)
local networkingAccountInformationModule = require(parent.NetworkingAccountInformation)
local userPermissionsReducerModule = require(script.Reducers.UserPermissionsReducer)

return {
	config = function(p0)
		-- upvalues: dashModule (ref), networkingUserSettingsModule (ref), roduxNetworkingModule (ref), networkingAccountInformationModule (ref), userPermissionsReducerModule (ref)
		p0 = dashModule.join(p0, {
			networkingUserSettings = networkingUserSettingsModule.config({ roduxNetworking = roduxNetworkingModule.mock() }),
			networkingAccountInformation = networkingAccountInformationModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: userPermissionsReducerModule (copy), p0 (write)
				return userPermissionsReducerModule(p0)
			end
		}
	end
}