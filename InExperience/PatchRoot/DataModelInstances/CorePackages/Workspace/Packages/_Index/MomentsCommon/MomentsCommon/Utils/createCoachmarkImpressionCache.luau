local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local MomentsLocalStorageModule = require(MomentsCommon.Storage.MomentsLocalStorage)
local Players = game:GetService("Players")
local CoachmarkImpressions = require(MomentsCommon.Storage.MomentsLocalStorageKeys).CoachmarkImpressions

return function(p1)
	-- upvalues: Players (copy), MomentsLocalStorageModule (copy), CoachmarkImpressions (copy)
	local DismissedValue = p1.dismissedValue
	local CoachmarkId = p1.coachmarkId
	local PlayersService = p1.PlayersService or Players
	local LocalStorage = p1.localStorage or MomentsLocalStorageModule
	
	local function _()
		-- upvalues: PlayersService (copy)
		local LocalPlayer = PlayersService.LocalPlayer
		
		return if LocalPlayer and LocalPlayer.UserId and LocalPlayer.UserId > 0 then tostring(LocalPlayer.UserId) else nil
	end
	
	local _ = function()
		-- upvalues: LocalStorage (copy), CoachmarkImpressions (upval)
		local Field = LocalStorage.getField(CoachmarkImpressions)
		
		return if type(Field) == "table" then Field else {}
	end
	
	local function setValue(DismissedValue)
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
		getValue = function()
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
		incrementValue = function()
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
		dismissValue = function()
			-- upvalues: setValue (copy), DismissedValue (copy)
			setValue(DismissedValue)
		end
	}
end