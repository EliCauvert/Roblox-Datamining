local httpService = game:GetService("HttpService")
local getLocalizedToastStringFromHttpErrorModule = require(script.Parent.getLocalizedToastStringFromHttpError)
local parent = script:FindFirstAncestor("RobloxAppToastsRodux").Parent
local mutedError = require(parent.Loggers).mutedError
local toastRoduxModule = require(parent.ToastRodux)
local toastType = toastRoduxModule.Enums.ToastType
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage
local tutilsModule = require(parent.tutils)
local luaAppMutedSetNetworkingErrorToast = game:DefineFastFlag("LuaAppMutedSetNetworkingErrorToast", false)

local function getUserFacingMessage(p1)
	-- upvalues: httpService (ref), luaAppMutedSetNetworkingErrorToast (ref), mutedError (ref), tutilsModule (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, p1.Body)
	
	if not ok then
		return nil
	end
	local errors = status.errors
	
	if errors then
		for i, v in ipairs(errors) do
			local userFacingMessage = v.userFacingMessage
			
			if userFacingMessage ~= nil then
				return userFacingMessage
			end
		end
	elseif luaAppMutedSetNetworkingErrorToast then
		mutedError("No errors given in err.Body, err = " .. tutilsModule.toString(p1))
	end
	return nil
end

return function(p2)
	-- upvalues: getUserFacingMessage (ref), setCurrentToastMessage (ref), toastType (ref), getLocalizedToastStringFromHttpErrorModule (ref)
	p2 = p2 or {}
	assert(p2, "not nil")
	
	return function(p3)
		-- upvalues: getUserFacingMessage (copy), p2 (write), setCurrentToastMessage (copy), toastType (copy), getLocalizedToastStringFromHttpErrorModule (copy)
		local var1 = getUserFacingMessage(p2)
		
		if var1 then
			p3:dispatch(setCurrentToastMessage({
				isLocalized = true,
				toastType = toastType.InformationMessage,
				toastMessage = var1
			}))
			
			return
		end
		local var2 = getLocalizedToastStringFromHttpErrorModule(p2.HttpError, p2.StatusCode)
		
		if var2 ~= nil then
			p3:dispatch(setCurrentToastMessage({
				toastType = toastType.NetworkingError,
				toastMessage = var2
			}))
		end
	end
end