local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local momentsLocalStorageModule = require(momentsCommon.Storage.MomentsLocalStorage)
local playersService = game:GetService("Players")
local coachmarkImpressions = require(momentsCommon.Storage.MomentsLocalStorageKeys).CoachmarkImpressions

return function(p1)
	-- upvalues: playersService (ref), momentsLocalStorageModule (ref), coachmarkImpressions (ref)
	local dismissedValue = p1.dismissedValue
	local coachmarkId = p1.coachmarkId
	local playersService_1 = p1.PlayersService or playersService
	local localStorage = p1.localStorage or momentsLocalStorageModule
	
	local function _()
		-- upvalues: playersService_1 (ref)
		local localPlayer = playersService_1.LocalPlayer
		
		return if localPlayer and localPlayer.UserId and localPlayer.UserId > 0 then tostring(localPlayer.UserId) else nil
	end
	
	local _ = function()
		-- upvalues: localStorage (ref), coachmarkImpressions (copy)
		local field = localStorage.getField(coachmarkImpressions)
		
		return if type(field) == "table" then field else {}
	end
	
	local function setValue(value)
		-- upvalues: playersService_1 (ref), localStorage (ref), coachmarkImpressions (copy), coachmarkId (ref)
		local localPlayer = playersService_1.LocalPlayer
		local var1 = if localPlayer and localPlayer.UserId and localPlayer.UserId > 0 then tostring(localPlayer.UserId) else nil
		
		if not var1 then return end
		local field = localStorage.getField(coachmarkImpressions)
		localPlayer = if type(field) == "table" then field else {}
		local var2 = localPlayer[var1]
		
		if type(var2) ~= "table" then
			var2 = {}
			localPlayer[var1] = var2
		end
		var2[coachmarkId] = value
		localStorage.setField(coachmarkImpressions, localPlayer)
	end
	
	return {
		getValue = function()
			-- upvalues: playersService_1 (ref), dismissedValue (ref), localStorage (ref), coachmarkImpressions (copy), coachmarkId (ref)
			local localPlayer = playersService_1.LocalPlayer
			local var1 = if localPlayer and localPlayer.UserId and localPlayer.UserId > 0 then tostring(localPlayer.UserId) else nil
			
			if not var1 then
				return dismissedValue
			end
			local field = localStorage.getField(coachmarkImpressions)
			localPlayer = (if type(field) == "table" then field else {})[var1]
			
			return if type(localPlayer) == "table" then tonumber(localPlayer[coachmarkId]) or 0 else 0
		end,
		incrementValue = function()
			-- upvalues: setValue (ref), playersService_1 (ref), dismissedValue (ref), localStorage (ref), coachmarkImpressions (copy), coachmarkId (ref)
			local var1
			local localPlayer = playersService_1.LocalPlayer
			local var2 = if localPlayer and localPlayer.UserId and localPlayer.UserId > 0 then tostring(localPlayer.UserId) else nil
			
			if var2 then
				local field = localStorage.getField(coachmarkImpressions)
				localPlayer = (if type(field) == "table" then field else {})[var2]
				var1 = if type(localPlayer) ~= "table" then tonumber(localPlayer[coachmarkId]) or 0 else 0
			else
				var1 = dismissedValue
			end
			setValue(var1 + 1)
		end,
		dismissValue = function()
			-- upvalues: setValue (ref), dismissedValue (ref)
			setValue(dismissedValue)
		end
	}
end