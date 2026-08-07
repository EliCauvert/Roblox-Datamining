local appStorageService = game:GetService("AppStorageService")
local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local dashModule = require(parent.Parent.Dash)
local constantsModule = require(parent.Constants)
local eventNamesModule = require(parent.Analytics.EventNames)
local getLocalUserIdModule = require(parent.Utils.getLocalUserId)
local getUserIdsFromStringModule = require(parent.Utils.getUserIdsFromString)

return function(p0) --[[ line: 14 ]]
	-- upvalues: appStorageService (ref), constantsModule (ref), getUserIdsFromStringModule (ref), getLocalUserIdModule (ref), playersService (ref), dashModule (ref), eventNamesModule (ref)
	local ok, status = pcall(function() --[[ line: 15 ]]
		-- upvalues: appStorageService (copy), constantsModule (copy)
		return appStorageService:GetItem(constantsModule.DeleteWarningModalOptOutStorageKey)
	end)
	
	if not ok then return end
	local var7 = getUserIdsFromStringModule(status)
	var7[getLocalUserIdModule(playersService) or ""] = true
	local joined = table.concat(dashModule.keys(var7), ",")
	local ok_1, _ = pcall(function() --[[ line: 28 ]]
		-- upvalues: appStorageService (copy), constantsModule (copy), joined (ref)
		appStorageService:SetItem(constantsModule.DeleteWarningModalOptOutStorageKey, joined)
		appStorageService:Flush()
	end)
	
	if ok_1 then
		p0.fireEvent(eventNamesModule.CapturesDeleteWarningModalOptedOut)
		
		return
	end
end