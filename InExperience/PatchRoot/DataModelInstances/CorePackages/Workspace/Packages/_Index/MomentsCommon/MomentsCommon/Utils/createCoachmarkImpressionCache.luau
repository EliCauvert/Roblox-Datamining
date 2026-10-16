local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local MomentsLocalStorageModule = require(MomentsCommon.Storage.MomentsLocalStorage)
local Players = game:GetService("Players")
local CoachmarkImpressions = require(MomentsCommon.Storage.MomentsLocalStorageKeys).CoachmarkImpressions

return function(p1) --[[ Line: 54 | Named "createCoachmarkImpressionCache" ]]
	-- upvalues: Players (copy), MomentsLocalStorageModule (copy), CoachmarkImpressions (copy)
	local DismissedValue = p1.dismissedValue
	local CoachmarkId = p1.coachmarkId
	local PlayersService = p1.PlayersService or Players
	local LocalStorage = p1.localStorage or MomentsLocalStorageModule
	
	local function _() --[[ Line: 61 | Named "getLocalUserId" ]]
		-- upvalues: PlayersService (copy)
		local LocalPlayer = PlayersService.LocalPlayer
		
		return if LocalPlayer and LocalPlayer.UserId and LocalPlayer.UserId > 0 then tostring(LocalPlayer.UserId) else nil
	end
	
	local _ = function() --[[ Line: 69 | Named "getStoredObject" ]]
		-- upvalues: LocalStorage (copy), CoachmarkImpressions (upval)
		local Field = LocalStorage.getField(CoachmarkImpressions)
		
		return if type(Field) == "table" then Field else {}
	end
	
	local function setValue(DismissedValue) --[[ Line: 74 ]]
		-- upvalues: PlayersService (copy), LocalStorage (copy), CoachmarkImpressions (upval), CoachmarkId (copy)
		local LocalPlayer = PlayersService.LocalPlayer
		local Text = if LocalPlayer and LocalPlayer.UserId and LocalPlayer.UserId > 0 then tostring(LocalPlayer.UserId) else nil
		
		if not Text then return end
		local Field = LocalStorage.getField(CoachmarkImpressions)
		local Field1 = if type(Field) == "table" then Field else {}
		local FieldEntry = Field1[Text]
		
		if type(FieldEntry) ~= "table" then
			FieldEntry = {}
			Field1[Text] = FieldEntry
		end
		FieldEntry[CoachmarkId] = DismissedValue
		LocalStorage.setField(CoachmarkImpressions, Field1)
	end
	
	return {
		getValue = function() --[[ Line: 90 ]]
			-- upvalues: PlayersService (copy), DismissedValue (copy), LocalStorage (copy), CoachmarkImpressions (upval), CoachmarkId (copy)
			local LocalPlayer = PlayersService.LocalPlayer
			local Text = if LocalPlayer and LocalPlayer.UserId and LocalPlayer.UserId > 0 then tostring(LocalPlayer.UserId) else nil
			
			if Text then
				local Field = LocalStorage.getField(CoachmarkImpressions)
				local FieldEntry = (if type(Field) == "table" then Field else {})[Text]
				
				return type(FieldEntry) == "table" and tonumber(FieldEntry[CoachmarkId]) or 0
			else
				return DismissedValue
			end
		end,
		incrementValue = function() --[[ Line: 104 ]]
			-- upvalues: setValue (copy), PlayersService (copy), DismissedValue (copy), LocalStorage (copy), CoachmarkImpressions (upval), CoachmarkId (copy)
			local LocalPlayer = PlayersService.LocalPlayer
			local Text = if LocalPlayer and LocalPlayer.UserId and LocalPlayer.UserId > 0 then tostring(LocalPlayer.UserId) else nil
			local Number = nil
			
			if Text then
				local Field = LocalStorage.getField(CoachmarkImpressions)
				local FieldEntry = (if type(Field) == "table" then Field else {})[Text]
				Number = type(FieldEntry) == "table" and tonumber(FieldEntry[CoachmarkId]) or 0
			else
				Number = DismissedValue
			end
			setValue(Number + 1)
		end,
		dismissValue = function() --[[ Line: 108 ]]
			-- upvalues: setValue (copy), DismissedValue (copy)
			setValue(DismissedValue)
		end
	}
end