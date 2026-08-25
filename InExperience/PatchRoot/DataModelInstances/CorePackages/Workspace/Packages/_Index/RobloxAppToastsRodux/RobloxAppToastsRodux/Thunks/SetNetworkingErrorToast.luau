local httpService = game:GetService("HttpService")
local getLocalizedToastStringFromHttpErrorModule = require(script.Parent.getLocalizedToastStringFromHttpError)
local parent = script:FindFirstAncestor("RobloxAppToastsRodux").Parent
local mutedError = require(parent.Loggers).mutedError
local toastRoduxModule = require(parent.ToastRodux)
local toastType = toastRoduxModule.Enums.ToastType
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage
local tutilsModule = require(parent.tutils)
local luaAppMutedSetNetworkingErrorToast = game:DefineFastFlag("LuaAppMutedSetNetworkingErrorToast", false)

local function getUserFacingMessage(p0)
	-- upvalues: httpService (ref), luaAppMutedSetNetworkingErrorToast (ref), mutedError (ref), tutilsModule (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, p0.Body)
	
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
		mutedError("No errors given in err.Body, err = " .. tutilsModule.toString(p0))
	end
	return nil
end

return function(p1)
	-- upvalues: getUserFacingMessage (ref), setCurrentToastMessage (ref), toastType (ref), getLocalizedToastStringFromHttpErrorModule (ref)
	p1 = p1 or {}
	assert(p1, "not nil")
	
	return function(p2)
		-- upvalues: getUserFacingMessage (copy), p1 (write), setCurrentToastMessage (copy), toastType (copy), getLocalizedToastStringFromHttpErrorModule (copy)
		local var6 = getUserFacingMessage(p1)
		
		if var6 then
			p2:dispatch(setCurrentToastMessage({
				isLocalized = true,
				toastType = toastType.InformationMessage,
				toastMessage = var6
			}))
			
			return
		end
		local var7 = getLocalizedToastStringFromHttpErrorModule(p1.HttpError, p1.StatusCode)
		
		if var7 ~= nil then
			p2:dispatch(setCurrentToastMessage({
				toastType = toastType.NetworkingError,
				toastMessage = var7
			}))
		end
	end
end