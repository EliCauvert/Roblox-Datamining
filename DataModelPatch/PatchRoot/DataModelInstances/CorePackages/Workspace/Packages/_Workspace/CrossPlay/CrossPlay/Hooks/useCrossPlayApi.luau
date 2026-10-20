local CrossPlay = script:FindFirstAncestor("CrossPlay")
local Parent = CrossPlay.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local LinkingProtocol = require(Parent.LinkingProtocol).LinkingProtocol
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local GetUserSettingsPlatform = require(CrossPlay.Networking).thunks.GetUserSettingsPlatform
local UpdateUserSettingsPlatform = require(CrossPlay.Networking).thunks.UpdateUserSettingsPlatform
local CrossPlayFetchFailedModule = require(CrossPlay.Actions.CrossPlayFetchFailed)
local CrossPlaySettingsResetModule = require(CrossPlay.Actions.CrossPlaySettingsReset)
local CrossPlayUpdateFailedModule = require(CrossPlay.Actions.CrossPlayUpdateFailed)
local CrossPlaySetValueModule = require(CrossPlay.Actions.CrossPlaySetValue)
local CrossPlaySetPrivilegesModule = require(CrossPlay.Actions.CrossPlaySetPrivileges)
local CrossPlayGetPrivilegesFailedModule = require(CrossPlay.Actions.CrossPlayGetPrivilegesFailed)
local CrossPlayStubSystemPrivilegesModule = require(CrossPlay.Actions.CrossPlayStubSystemPrivileges)
local CrossPlayResetPrivilegesModule = require(CrossPlay.Actions.CrossPlayResetPrivileges)
local GetPlatformPrivilegeSettingsModule = require(script.Parent.getPlatformPrivilegeSettings)

return function()
	-- upvalues: UseAppPolicyFunction (copy), UseDispatchFunction (copy), ReactModule (copy), GetUserSettingsPlatform (copy), UpdateUserSettingsPlatform (copy), CrossPlayResetPrivilegesModule (copy), GetPlatformPrivilegeSettingsModule (copy), CrossPlaySetPrivilegesModule (copy), CrossPlayUpdateFailedModule (copy), CrossPlayGetPrivilegesFailedModule (copy), CrossPlayStubSystemPrivilegesModule (copy), CrossPlayFetchFailedModule (copy), LinkingProtocol (copy), CrossPlaySetValueModule (copy), CrossPlaySettingsResetModule (copy)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.useLegacyCrossPlayApi()
	end)
	local UseAppPolicyResult1 = UseAppPolicyFunction(function(p1)
		return p1.useCrossPlaySystemUi()
	end)
	local UseAppPolicyResult2 = UseAppPolicyFunction(function(p1)
		return p1.getCrossPlayUri()
	end)
	local UseAppPolicyResult3 = UseAppPolicyFunction(function(p1)
		return p1.getCrossPlayCapabilities()
	end)
	local UseAppPolicyResult4 = UseAppPolicyFunction(function(p1)
		return p1.getCrossPlaySettingsKey()
	end)
	local UseAppPolicyResult5 = UseAppPolicyFunction(function(p1)
		return p1.getCrossPlayQueryParam()
	end)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), GetUserSettingsPlatform (upval), UseAppPolicyResult5 (copy), UseAppPolicyResult4 (copy), UseAppPolicyResult (copy)
		return UseDispatchResult(GetUserSettingsPlatform.API(UseAppPolicyResult5, UseAppPolicyResult4, UseAppPolicyResult))
	end, {
		UseDispatchResult,
		UseAppPolicyResult5,
		UseAppPolicyResult4,
		UseAppPolicyResult
	})
	local UseResult1 = ReactModule.useCallback(function(p1)
		-- upvalues: UseDispatchResult (copy), UpdateUserSettingsPlatform (upval), UseAppPolicyResult5 (copy), UseAppPolicyResult4 (copy), UseAppPolicyResult (copy)
		return UseDispatchResult(UpdateUserSettingsPlatform.API(UseAppPolicyResult5, UseAppPolicyResult4, p1, UseAppPolicyResult))
	end, {
		UseDispatchResult,
		UseAppPolicyResult5,
		UseAppPolicyResult4,
		UseAppPolicyResult
	})
	local UseResult2 = ReactModule.useCallback(function(CanJoinGame)
		-- upvalues: UseDispatchResult (copy), CrossPlayResetPrivilegesModule (upval), GetPlatformPrivilegeSettingsModule (upval), UseAppPolicyResult3 (copy), CrossPlaySetPrivilegesModule (upval), UseResult1 (copy), CrossPlayUpdateFailedModule (upval), CrossPlayGetPrivilegesFailedModule (upval)
		UseDispatchResult(CrossPlayResetPrivilegesModule())
		
		return GetPlatformPrivilegeSettingsModule(UseAppPolicyResult3):andThen(function(Result)
			-- upvalues: UseDispatchResult (upval), CrossPlaySetPrivilegesModule (upval), CanJoinGame (copy), UseResult1 (upval), CrossPlayUpdateFailedModule (upval)
			UseDispatchResult(CrossPlaySetPrivilegesModule(Result))
			
			if Result.CrossPlatform.CanJoinGame == CanJoinGame then return end
			return UseResult1(Result.CrossPlatform.CanJoinGame):catch(function(Err)
				-- upvalues: UseDispatchResult (upval), CrossPlayUpdateFailedModule (upval)
				UseDispatchResult(CrossPlayUpdateFailedModule(Err))
			end)
		end):catch(function(Err)
			-- upvalues: UseDispatchResult (upval), CrossPlayGetPrivilegesFailedModule (upval)
			UseDispatchResult(CrossPlayGetPrivilegesFailedModule(Err))
		end)
	end, { UseDispatchResult, UseAppPolicyResult3, UseResult1 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), UseAppPolicyResult1 (copy), UseResult2 (copy), UseAppPolicyResult4 (copy), GetPlatformPrivilegeSettingsModule (upval), UseAppPolicyResult3 (copy), UseDispatchResult (copy), CrossPlayStubSystemPrivilegesModule (upval), CrossPlayFetchFailedModule (upval)
		return UseResult():andThen(function(Result)
			-- upvalues: UseAppPolicyResult1 (upval), UseResult2 (upval), UseAppPolicyResult4 (upval), GetPlatformPrivilegeSettingsModule (upval), UseAppPolicyResult3 (upval), UseDispatchResult (upval), CrossPlayStubSystemPrivilegesModule (upval)
			if UseAppPolicyResult1 then
				return UseResult2(Result.responseBody[UseAppPolicyResult4].isEnabled)
			else
				GetPlatformPrivilegeSettingsModule(UseAppPolicyResult3):andThen(function(Result)
					-- upvalues: UseDispatchResult (upval), CrossPlayStubSystemPrivilegesModule (upval)
					UseDispatchResult(CrossPlayStubSystemPrivilegesModule(Result))
				end)
			end
		end):catch(function(Err)
			-- upvalues: UseDispatchResult (upval), CrossPlayFetchFailedModule (upval)
			UseDispatchResult(CrossPlayFetchFailedModule(Err))
		end)
	end, {
		UseDispatchResult,
		UseAppPolicyResult4,
		UseResult2,
		UseResult,
		UseAppPolicyResult1
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseAppPolicyResult1 (copy), UseAppPolicyResult2 (copy), LinkingProtocol (upval)
		if UseAppPolicyResult1 and UseAppPolicyResult2 then
			LinkingProtocol.default:openURL(UseAppPolicyResult2)
		end
	end, { UseAppPolicyResult1, UseAppPolicyResult2 })
	local UseResult5 = ReactModule.useCallback(function(p1)
		-- upvalues: UseAppPolicyResult1 (copy), UseResult4 (copy), UseDispatchResult (copy), CrossPlaySetValueModule (upval), UseResult1 (copy), UseResult3 (copy), CrossPlayUpdateFailedModule (upval)
		if UseAppPolicyResult1 then
			UseResult4()
			
			return
		end
		UseDispatchResult(CrossPlaySetValueModule(p1))
		
		return UseResult1(p1):andThen(function()
			-- upvalues: UseResult3 (upval)
			UseResult3()
		end):catch(function(Err)
			-- upvalues: UseDispatchResult (upval), CrossPlayUpdateFailedModule (upval)
			UseDispatchResult(CrossPlayUpdateFailedModule(Err))
		end)
	end, { UseDispatchResult, UseResult1, UseResult3, UseResult4 })
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CrossPlaySettingsResetModule (upval)
		UseDispatchResult(CrossPlaySettingsResetModule())
	end, { UseDispatchResult })
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseResult3 (copy), UseResult6 (copy), UseResult5 (copy), UseResult4 (copy)
		return {
			fetch = UseResult3,
			reset = UseResult6,
			update = UseResult5,
			invokeSystemUi = UseResult4
		}
	end, { UseResult3, UseResult6, UseResult5, UseResult4 }))
end