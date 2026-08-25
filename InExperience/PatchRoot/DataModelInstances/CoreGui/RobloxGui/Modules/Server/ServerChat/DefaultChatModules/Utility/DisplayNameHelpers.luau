local playersService = game:GetService("Players")
local chatSettingsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local t = { ChattingToSelf = 1, NoMatches = 2, MultipleMatches = 3 }

return {
	CommandErrorCodes = t,
	getUserNameFromChattedName = function(p0, p1, p2)
		-- upvalues: t (ref), playersService (ref), chatSettingsModule (ref)
		if p1 == p0 then
			return p1, t.ChattingToSelf
		end
		local players = playersService:GetPlayers()
		
		for i, v in pairs(players) do
			if string.lower(v.Name) == string.lower(p0) then
				return v.Name, nil
			end
		end
		local var4 = 0
		local name = nil
		
		if chatSettingsModule.PlayerDisplayNamesEnabled then
			for i_1, v_1 in pairs(players) do
				if v_1.Name ~= p1 and string.lower(v_1.DisplayName) == string.lower(p0) then
					var4 += 1
					name = v_1.Name
				end
			end
		end
		if var4 == 1 then
			return name, nil
		elseif var4 == 0 then
			if p2 == p0 then
				return p2, t.ChattingToSelf
			end
			return p0, t.NoMatches
		elseif var4 >= 2 then
			return p0, t.MultipleMatches
		end
	end,
	getUsersWithDisplayNameString = function(p3, p4)
		-- upvalues: playersService (ref)
		local t = {}
		local var6 = ""
		
		for i, v in pairs(playersService:GetPlayers()) do
			if v.Name ~= p4 and string.lower(v.DisplayName) == string.lower(p3) then
				table.insert(t, v.Name)
			end
		end
		for i_1, v_1 in pairs(t) do
			var6 = if i_1 ~= #t then var6 .. "@" .. v_1 else var6 .. "@" .. v_1 .. ", "
		end
		return var6
	end
}