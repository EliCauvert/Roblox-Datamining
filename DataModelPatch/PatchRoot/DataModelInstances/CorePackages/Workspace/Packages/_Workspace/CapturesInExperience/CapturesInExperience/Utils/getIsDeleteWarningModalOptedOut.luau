local AppStorageService = game:GetService("AppStorageService")
local Players = game:GetService("Players")
local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local GetLocalUserIdModule = require(Parent.Utils.getLocalUserId)
local GetUserIdsFromStringModule = require(Parent.Utils.getUserIdsFromString)

return function(): boolean
	-- upvalues: AppStorageService (copy), ConstantsModule (copy), GetUserIdsFromStringModule (copy), GetLocalUserIdModule (copy), Players (copy)
	local Success, Result = pcall(function()
		-- upvalues: AppStorageService (upval), ConstantsModule (upval)
		return AppStorageService:GetItem(ConstantsModule.DeleteWarningModalOptOutStorageKey)
	end)
	
	return if Success and Result ~= "" and GetUserIdsFromStringModule(Result)[GetLocalUserIdModule(Players) or ""] then true else false
end