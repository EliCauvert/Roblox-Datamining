local CrossPlay = script:FindFirstAncestor("CrossPlay")
local Parent = CrossPlay.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseCrossPlayApiModule = require(CrossPlay.Hooks.useCrossPlayApi)
local NetworkStatus = require(CrossPlay.Networking).roduxNetworking.Enum.NetworkStatus
local GetCrossPlayIsEnabledModule = require(CrossPlay.Selectors.getCrossPlayIsEnabled)

return function()
	-- upvalues: UseCrossPlayApiModule (copy), UseSelectorFunction (copy), GetCrossPlayIsEnabledModule (copy), CryoModule (copy), NetworkStatus (copy), ReactModule (copy)
	local UseCrossPlayApiModuleResult = UseCrossPlayApiModule()
	local UseSelectorResult = UseSelectorFunction(GetCrossPlayIsEnabledModule)
	local UseSelectorResult1 = UseSelectorFunction(function(p1): boolean
		-- upvalues: CryoModule (upval), NetworkStatus (upval)
		return CryoModule.List.find(CryoModule.Dictionary.values(p1.CrossPlaySettings.NetworkStatus), NetworkStatus.Fetching) ~= nil
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p1)
		return p1.CrossPlaySettings.HttpError
	end)
	local UseSelectorResult3 = UseSelectorFunction(function(p1)
		return p1.CrossPlaySettings.DispatchError
	end)
	local UseSelectorResult4 = UseSelectorFunction(function(p1)
		return p1.CrossPlaySettings.SystemError
	end)
	local UseSelectorResult2_1 = UseSelectorResult2 or (UseSelectorResult3 or UseSelectorResult4)
	
	return {
		isEnabled = UseSelectorResult,
		systemPrivileges = UseSelectorFunction(function(p1)
			return p1.CrossPlaySettings.SystemPrivileges
		end),
		hasError = UseSelectorResult2_1 ~= nil,
		isLoading = UseSelectorResult1 and not UseSelectorResult2_1,
		toggle = ReactModule.useCallback(function()
			-- upvalues: UseCrossPlayApiModuleResult (copy), UseSelectorResult (copy)
			return UseCrossPlayApiModuleResult.update(not UseSelectorResult)
		end, { UseCrossPlayApiModuleResult.update, UseSelectorResult }),
		reload = UseCrossPlayApiModuleResult.fetch,
		invokeSystemUi = UseCrossPlayApiModuleResult.invokeSystemUi
	}
end