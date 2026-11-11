local AuthLocalStorageKeysModule = require(script:FindFirstAncestor("AuthCommon").Enums.AuthLocalStorageKeys)
local AppStorageService = game:GetService("AppStorageService")

return function(): boolean
	-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
	return AppStorageService:GetItem(AuthLocalStorageKeysModule.IosAuthServiceEnabled) == "true"
end