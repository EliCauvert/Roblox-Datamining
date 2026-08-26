local playersService = game:GetService("Players")
local chatSettingsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local t = { ChattingToSelf = 1, NoMatches = 2, MultipleMatches = 3 }

return {
	CommandErrorCodes = t,
	getUserNameFromChattedName = function(p1, p2, p3)
		-- upvalues: t (ref), playersService (ref), chatSettingsModule (ref)
		if p2 == p1 then
			return p2, t.ChattingToSelf
		end
		local players = playersService:GetPlayers()
		
		for i, v in pairs(players) do
			if string.lower(v.Name) == string.lower(p1) then
				return v.Name, nil
			end
		end
		local var1 = 0
		local name = nil
		
		if chatSettingsModule.PlayerDisplayNamesEnabled then
			for i_1, v_1 in pairs(players) do
				if v_1.Name ~= p2 and string.lower(v_1.DisplayName) == string.lower(p1) then
					var1 += 1
					name = v_1.Name
				end
			end
		end
		if var1 == 1 then
			return name, nil
		elseif var1 == 0 then
			if p3 == p1 then
				return p3, t.ChattingToSelf
			end
			return p1, t.NoMatches
		elseif var1 >= 2 then
			return p1, t.MultipleMatches
		end
	end,
	getUsersWithDisplayNameString = function(p4, p5)
		-- upvalues: playersService (ref)
		local t = {}
		local var2 = ""
		
		for i, v in pairs(playersService:GetPlayers()) do
			if v.Name ~= p5 and string.lower(v.DisplayName) == string.lower(p4) then
				table.insert(t, v.Name)
			end
		end
		for i_1, v_1 in pairs(t) do
			var2 = if i_1 ~= #t then var2 .. "@" .. v_1 else var2 .. "@" .. v_1 .. ", "
		end
		return var2
	end
}