local appStorageService = game:GetService("AppStorageService")
local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local dashModule = require(parent.Parent.Dash)
local constantsModule = require(parent.Constants)
local eventNamesModule = require(parent.Analytics.EventNames)
local getLocalUserIdModule = require(parent.Utils.getLocalUserId)
local getUserIdsFromStringModule = require(parent.Utils.getUserIdsFromString)

return function(p1)
	-- upvalues: appStorageService (ref), constantsModule (ref), getUserIdsFromStringModule (ref), getLocalUserIdModule (ref), playersService (ref), dashModule (ref), eventNamesModule (ref)
	local ok, status = pcall(function()
		-- upvalues: appStorageService (copy), constantsModule (copy)
		return appStorageService:GetItem(constantsModule.DeleteWarningModalOptOutStorageKey)
	end)
	
	if not ok then return end
	local var1 = getUserIdsFromStringModule(status)
	var1[getLocalUserIdModule(playersService) or ""] = true
	local joined = table.concat(dashModule.keys(var1), ",")
	local ok_1, _ = pcall(function()
		-- upvalues: appStorageService (copy), constantsModule (copy), joined (ref)
		appStorageService:SetItem(constantsModule.DeleteWarningModalOptOutStorageKey, joined)
		appStorageService:Flush()
	end)
	
	if ok_1 then
		p1.fireEvent(eventNamesModule.CapturesDeleteWarningModalOptedOut)
		
		return
	end
end