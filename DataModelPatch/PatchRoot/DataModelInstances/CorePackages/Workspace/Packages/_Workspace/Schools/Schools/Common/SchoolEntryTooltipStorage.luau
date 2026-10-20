local AppStorageService = game:GetService("AppStorageService")
local ConstantsModule = require(script:FindFirstAncestor("Schools").Common.Constants)

return {
	isShown = function(p1): boolean
		-- upvalues: AppStorageService (copy), ConstantsModule (copy)
		local Success, Result = pcall(AppStorageService.GetItem, AppStorageService, p1)
		
		return Success and Result == ConstantsModule.APP_STORAGE_VALUE
	end,
	markShown = function(Key)
		-- upvalues: AppStorageService (copy), ConstantsModule (copy)
		pcall(function()
			-- upvalues: AppStorageService (upval), Key (copy), ConstantsModule (upval)
			AppStorageService:SetItem(Key, ConstantsModule.APP_STORAGE_VALUE)
			AppStorageService:Flush()
		end)
	end
}