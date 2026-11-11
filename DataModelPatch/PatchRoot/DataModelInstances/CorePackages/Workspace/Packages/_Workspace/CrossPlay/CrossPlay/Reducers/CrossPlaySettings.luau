local CrossPlay = script:FindFirstAncestor("CrossPlay")
local Parent = CrossPlay.Parent
local CryoModule = require(Parent.Cryo)
local RoduxModule = require(Parent.Rodux)
local CrossPlayCapabilities = require(Parent.UniversalAppPolicy).Enum.CrossPlayCapabilities
local GetUserSettingsPlatform = require(CrossPlay.Networking).thunks.GetUserSettingsPlatform
local NetworkingModule = require(CrossPlay.Networking)
local UpdateUserSettingsPlatform = NetworkingModule.thunks.UpdateUserSettingsPlatform
local CrossPlayActuallyResetErrorStates = game:DefineFastFlag("CrossPlayActuallyResetErrorStates", false)
local PrivilegeCheckResults = require(CrossPlay.Hooks.Constants).PrivilegeCheckResults
local config = {
	LuaError = nil,
	HttpError = nil,
	SystemError = nil,
	Status = {},
	SystemPrivileges = {},
	NetworkStatus = {}
}
local Reducer = RoduxModule.createReducer(config, {
	[GetUserSettingsPlatform.Succeeded.name] = function(p1, p2)
		-- upvalues: CryoModule (copy), CrossPlayActuallyResetErrorStates (copy)
		return CryoModule.Dictionary.join(p1, {
			Status = CryoModule.Dictionary.join(p1.Status, p2.responseBody[p2.additionalData.crossPlaySettingsKey] or {}),
			LuaError = if CrossPlayActuallyResetErrorStates then CryoModule.None else nil,
			HttpError = if CrossPlayActuallyResetErrorStates then CryoModule.None else nil
		})
	end,
	[GetUserSettingsPlatform.Failed.name] = function(p1, p2)
		-- upvalues: CryoModule (copy), CrossPlayActuallyResetErrorStates (copy)
		return CryoModule.Dictionary.join(p1, {
			Status = {},
			HttpError = p2.error,
			LuaError = if CrossPlayActuallyResetErrorStates then CryoModule.None else nil
		})
	end,
	[UpdateUserSettingsPlatform.Succeeded.name] = function(p1, p2)
		-- upvalues: CryoModule (copy), CrossPlayActuallyResetErrorStates (copy)
		return CryoModule.Dictionary.join(p1, {
			Status = CryoModule.Dictionary.join(p1.Status, { isEnabled = p2.additionalData.crossPlayValue }),
			LuaError = if CrossPlayActuallyResetErrorStates then CryoModule.None else nil,
			HttpError = if CrossPlayActuallyResetErrorStates then CryoModule.None else nil
		})
	end,
	[UpdateUserSettingsPlatform.Failed.name] = function(p1, p2)
		-- upvalues: CryoModule (copy), CrossPlayActuallyResetErrorStates (copy)
		return CryoModule.Dictionary.join(p1, {
			HttpError = p2.error,
			LuaError = if CrossPlayActuallyResetErrorStates then CryoModule.None else nil
		})
	end,
	[require(CrossPlay.Actions.CrossPlaySetPrivileges).name] = function(p1, p2)
		-- upvalues: CrossPlayCapabilities (copy), PrivilegeCheckResults (copy), CryoModule (copy), CrossPlayActuallyResetErrorStates (copy)
		local Privilege = p2.privileges[CrossPlayCapabilities.CrossPlatform] or {}
		
		return CryoModule.Dictionary.join(p1, {
			Status = CryoModule.Dictionary.join(p1.Status, {
				isSystemPrivilegeEnabled = Privilege.Success and (Privilege.CanJoinGame and Privilege.PrivilegeCheckResult == PrivilegeCheckResults.NO_ISSUE)
			}),
			SystemPrivileges = CryoModule.Dictionary.join(p1.SystemPrivileges, p2.privileges),
			SystemError = if CrossPlayActuallyResetErrorStates then CryoModule.None else nil
		})
	end,
	[require(CrossPlay.Actions.CrossPlayGetPrivilegesFailed).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			Status = CryoModule.Dictionary.join(p1.Status, { isSystemPrivilegeEnabled = false }),
			SystemPrivileges = {},
			SystemError = p2.error
		})
	end,
	[require(CrossPlay.Actions.CrossPlayResetPrivileges).name] = function(p1)
		-- upvalues: CryoModule (copy), CrossPlayActuallyResetErrorStates (copy)
		return CryoModule.Dictionary.join(p1, {
			Status = CryoModule.Dictionary.join(p1.Status, { isSystemPrivilegeEnabled = false }),
			SystemPrivileges = {},
			SystemError = if CrossPlayActuallyResetErrorStates then CryoModule.None else nil
		})
	end,
	[require(CrossPlay.Actions.CrossPlaySetValue).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local CrossPlayValue = p2.crossPlayValue
		
		return CryoModule.Dictionary.join(p1, {
			Status = CryoModule.Dictionary.join(p1.Status, {
				isEnabled = CrossPlayValue,
				isSystemPrivilegeEnabled = CrossPlayValue
			})
		})
	end,
	[require(CrossPlay.Actions.CrossPlayFetchFailed).name] = function(p1, p2)
		-- upvalues: CryoModule (copy), CrossPlayActuallyResetErrorStates (copy)
		return CryoModule.Dictionary.join(p1, {
			Status = {},
			LuaError = p2.error,
			HttpError = if CrossPlayActuallyResetErrorStates then CryoModule.None else nil
		})
	end,
	[require(CrossPlay.Actions.CrossPlayUpdateFailed).name] = function(p1, p2)
		-- upvalues: CryoModule (copy), CrossPlayActuallyResetErrorStates (copy)
		return CryoModule.Dictionary.join(p1, {
			Status = {},
			LuaError = p2.error,
			HttpError = if CrossPlayActuallyResetErrorStates then CryoModule.None else nil
		})
	end,
	[require(CrossPlay.Actions.CrossPlaySettingsReset).name] = function()
		-- upvalues: config (copy)
		return config
	end
})
local CombineReducersResult = RoduxModule.combineReducers({
	NetworkStatus = NetworkingModule.roduxNetworking.installReducer()
})

return function(p1, p2)
	-- upvalues: Reducer (copy), CryoModule (copy), CombineReducersResult (copy)
	local ReducerResult = Reducer(p1, p2)
	
	return CryoModule.Dictionary.join(ReducerResult, CombineReducersResult(ReducerResult, p2))
end