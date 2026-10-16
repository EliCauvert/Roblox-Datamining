local AuthLocalStorageKeysModule = require(script:FindFirstAncestor("AuthCommon").Enums.AuthLocalStorageKeys)
local AppStorageService = game:GetService("AppStorageService")

return function(): boolean --[[ Line: 7 | Named "isIosAuthServiceEnabled" ]]
	-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
	return AppStorageService:GetItem(AuthLocalStorageKeysModule.IosAuthServiceEnabled) == "true"
end