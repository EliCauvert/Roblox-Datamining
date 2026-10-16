local Players = game:GetService("Players")
local ChatSettingsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local CommandErrorCodes = { ChattingToSelf = 1, NoMatches = 2, MultipleMatches = 3 }

return {
	CommandErrorCodes = CommandErrorCodes,
	getUserNameFromChattedName = function(Text: string, Name, p1) --[[ Line: 14 ]]
		-- upvalues: CommandErrorCodes (copy), Players (copy), ChatSettingsModule (copy)
		if Name == Text then
			return Name, CommandErrorCodes.ChattingToSelf
		end
		local Players1 = Players:GetPlayers()
		
		for _, value in pairs(Players1) do
			if string.lower(value.Name) == string.lower(Text) then
				return value.Name, nil
			end
		end
		local Count = 0
		local Name1 = nil
		
		if ChatSettingsModule.PlayerDisplayNamesEnabled then
			for _, Player in pairs(Players1) do
				if Player.Name ~= Name and string.lower(Player.DisplayName) == string.lower(Text) then
					Count += 1
					Name1 = Player.Name
				end
			end
		end
		if Count == 1 then
			return Name1, nil
		elseif Count == 0 then
			if p1 == Text then
				return p1, CommandErrorCodes.ChattingToSelf
			else
				return Text, CommandErrorCodes.NoMatches
			end
		elseif Count < 2 then return end
		return Text, CommandErrorCodes.MultipleMatches
	end,
	getUsersWithDisplayNameString = function(Text: string, Name): string --[[ Line: 56 ]]
		-- upvalues: Players (copy)
		local List = {}
		local Text1 = ""
		
		for _, player in pairs((Players:GetPlayers())) do
			if player.Name ~= Name and string.lower(player.DisplayName) == string.lower(Text) then
				table.insert(List, player.Name)
			end
		end
		for i, value in pairs(List) do
			if i == #List then
				Text1 ..= "@" .. value
			else
				Text1 ..= "@" .. value .. ", "
			end
		end
		return Text1
	end
}