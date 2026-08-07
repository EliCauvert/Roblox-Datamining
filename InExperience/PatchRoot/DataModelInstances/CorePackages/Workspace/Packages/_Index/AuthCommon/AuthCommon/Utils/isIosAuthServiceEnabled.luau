local authLocalStorageKeysModule = require(script:FindFirstAncestor("AuthCommon").Enums.AuthLocalStorageKeys)
local appStorageService = game:GetService("AppStorageService")

return function() --[[ line: 7 | named "isIosAuthServiceEnabled" ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	return appStorageService:GetItem(authLocalStorageKeysModule.IosAuthServiceEnabled) == "true"
end