local AppStorageService = game:GetService("AppStorageService")
local Players = game:GetService("Players")
local Parent = script.Parent.Parent
local DashModule = require(Parent.Parent.Dash)
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local GetLocalUserIdModule = require(Parent.Utils.getLocalUserId)
local GetUserIdsFromStringModule = require(Parent.Utils.getUserIdsFromString)

return function(p1) --[[ Line: 14 ]]
	-- upvalues: AppStorageService (copy), ConstantsModule (copy), GetUserIdsFromStringModule (copy), GetLocalUserIdModule (copy), Players (copy), DashModule (copy), EventNamesModule (copy)
	local Success, Result = pcall(function() --[[ Line: 15 ]]
		-- upvalues: AppStorageService (upval), ConstantsModule (upval)
		return AppStorageService:GetItem(ConstantsModule.DeleteWarningModalOptOutStorageKey)
	end)
	
	if not Success then return end
	local UserIdsFromStringModule = GetUserIdsFromStringModule(Result)
	UserIdsFromStringModule[GetLocalUserIdModule(Players) or ""] = true
	local Joined = table.concat(DashModule.keys(UserIdsFromStringModule), ",")
	local Success1, _ = pcall(function() --[[ Line: 28 ]]
		-- upvalues: AppStorageService (upval), ConstantsModule (upval), Joined (copy)
		AppStorageService:SetItem(ConstantsModule.DeleteWarningModalOptOutStorageKey, Joined)
		AppStorageService:Flush()
	end)
	
	if Success1 then
		p1.fireEvent(EventNamesModule.CapturesDeleteWarningModalOptedOut)
		
		return
	end
end