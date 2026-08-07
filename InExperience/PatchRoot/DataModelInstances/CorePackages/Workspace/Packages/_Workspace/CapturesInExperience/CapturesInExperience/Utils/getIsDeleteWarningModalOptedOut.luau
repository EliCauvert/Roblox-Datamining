local appStorageService = game:GetService("AppStorageService")
local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local getLocalUserIdModule = require(parent.Utils.getLocalUserId)
local getUserIdsFromStringModule = require(parent.Utils.getUserIdsFromString)

return function() --[[ line: 10 ]]
	-- upvalues: appStorageService (ref), constantsModule (ref), getUserIdsFromStringModule (ref), getLocalUserIdModule (ref), playersService (ref)
	local ok, status = pcall(function() --[[ line: 11 ]]
		-- upvalues: appStorageService (copy), constantsModule (copy)
		return appStorageService:GetItem(constantsModule.DeleteWarningModalOptOutStorageKey)
	end)
	
	return ok and status ~= "" and getUserIdsFromStringModule(status)[getLocalUserIdModule(playersService) or ""]
end