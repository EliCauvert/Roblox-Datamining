local HttpService = game:GetService("HttpService")
local GetLocalizedToastStringFromHttpErrorModule = require(script.Parent.getLocalizedToastStringFromHttpError)
local Parent = script:FindFirstAncestor("RobloxAppToastsRodux").Parent
local MutedErrorFunction = require(Parent.Loggers).mutedError
local ToastRoduxModule = require(Parent.ToastRodux)
local ToastType = ToastRoduxModule.Enums.ToastType
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local TutilsModule = require(Parent.tutils)
local LuaAppMutedSetNetworkingErrorToast = game:DefineFastFlag("LuaAppMutedSetNetworkingErrorToast", false)

local function getUserFacingMessage(p1)
	-- upvalues: HttpService (copy), LuaAppMutedSetNetworkingErrorToast (copy), MutedErrorFunction (copy), TutilsModule (copy)
	local Success, Result = pcall(HttpService.JSONDecode, HttpService, p1.Body)
	
	if not Success then
		return nil
	end
	local Errors = Result.errors
	
	if Errors then
		local UserFacingMessage = nil
		for _, _error in ipairs(Errors) do
			UserFacingMessage = _error.userFacingMessage
			
			if UserFacingMessage ~= nil then
				return UserFacingMessage
			end
		end
	elseif LuaAppMutedSetNetworkingErrorToast then
		MutedErrorFunction("No errors given in err.Body, err = " .. TutilsModule.toString(p1))
	end
	return nil
end

return function(p2)
	-- upvalues: getUserFacingMessage (copy), SetCurrentToastMessageFunction (copy), ToastType (copy), GetLocalizedToastStringFromHttpErrorModule (copy)
	local P1 = p2 or {}
	assert(P1, "not nil")
	
	return function(p3)
		-- upvalues: getUserFacingMessage (upval), P1 (ref), SetCurrentToastMessageFunction (upval), ToastType (upval), GetLocalizedToastStringFromHttpErrorModule (upval)
		local UserFacingMessage = getUserFacingMessage(P1)
		
		if UserFacingMessage then
			p3:dispatch(SetCurrentToastMessageFunction({
				isLocalized = true,
				toastType = ToastType.InformationMessage,
				toastMessage = UserFacingMessage
			}))
			
			return
		end
		local LocalizedToastStringFromHttpErrorModule = GetLocalizedToastStringFromHttpErrorModule(P1.HttpError, P1.StatusCode)
		
		if LocalizedToastStringFromHttpErrorModule ~= nil then
			p3:dispatch(SetCurrentToastMessageFunction({
				toastType = ToastType.NetworkingError,
				toastMessage = LocalizedToastStringFromHttpErrorModule
			}))
		end
	end
end