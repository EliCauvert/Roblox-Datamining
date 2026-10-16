local ClientChatModules = game:GetService("Chat"):WaitForChild("ClientChatModules")
local ChatSettingsModule = require(ClientChatModules:WaitForChild("ChatSettings"))
local ChatConstantsModule = require(ClientChatModules:WaitForChild("ChatConstants"))
local ChatLocalizationModule = nil
pcall(function() --[[ Line: 13 ]]
	-- upvalues: ChatLocalizationModule (ref)
	ChatLocalizationModule = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if ChatLocalizationModule == nil then
	ChatLocalizationModule = {}
end
if not ChatLocalizationModule.FormatMessageToSend or not ChatLocalizationModule.LocalizeFormattedMessage then
	function ChatLocalizationModule:FormatMessageToSend(_, Formatted) --[[ Line: 16 ]]
		return Formatted
	end
end
local config = {
	ChatColor = ChatSettingsModule.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}

return function(p1) --[[ Line: 22 | Named "Run" ]]
	-- upvalues: ChatLocalizationModule (ref), ChatConstantsModule (copy), config (copy), ChatSettingsModule (copy)
	local Players = game:GetService("Players")
	local Team = p1:AddChannel("Team")
	Team.WelcomeMessage = ChatLocalizationModule:FormatMessageToSend("GameChat_TeamChat_WelcomeMessage", "This is a private channel between you and your team members.")
	Team.Joinable = false
	Team.Leavable = false
	Team.AutoJoin = false
	Team.Private = true
	Team:RegisterProcessCommandsFunction("replication_function", function(p2, p3, p4): boolean --[[ Line: 33 | Named "TeamChatReplicationFunction" ]]
		-- upvalues: p1 (copy)
		local Speaker = p1:GetSpeaker(p2)
		local Channel = p1:GetChannel(p4)
		
		if Speaker and Channel then
			local Player = Speaker:GetPlayer()
			
			if Player then
				for _, value in pairs(Channel:GetSpeakerList()) do
					local Speaker1 = p1:GetSpeaker(value)
					
					if Speaker1 then
						local Player1 = Speaker1:GetPlayer()
						
						if Player1 and Player.Team == Player1.Team then
							Speaker1:SendMessage(p3, p4, p2, {
								NameColor = Player.TeamColor.Color,
								ChatColor = Player.TeamColor.Color,
								ChannelColor = Player.TeamColor.Color
							})
						end
					end
				end
			end
		end
		return true
	end, ChatConstantsModule.LowPriority)
	
	local function DoTeamCommand(p5, Text: string, p6) --[[ Line: 70 ]]
		-- upvalues: p1 (copy), ChatLocalizationModule (upval), config (upval)
		if Text == nil then
			Text = ""
		end
		local Speaker = p1:GetSpeaker(p5)
		
		if Speaker then
			local Player = Speaker:GetPlayer()
			
			if Player then
				if Player.Team == nil then
					Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_TeamChat_CannotTeamChatIfNotInTeam", "You cannot team chat if you are not on a team!"), p6, config)
					
					return
				end
				local TeamChannel = p1:GetChannel("Team")
				
				if TeamChannel then
					if not Speaker:IsInChannel(TeamChannel.Name) then
						Speaker:JoinChannel(TeamChannel.Name)
					end
					if Text and string.len(Text) > 0 then
						Speaker:SayMessage(Text, TeamChannel.Name)
					end
					Speaker:SetMainChannel(TeamChannel.Name)
				end
			end
		end
	end
	
	p1:RegisterProcessCommandsFunction("team_commands", function(p5, Text: string, p6): boolean --[[ Line: 99 | Named "TeamCommandsFunction" ]]
		-- upvalues: DoTeamCommand (copy)
		local Flag = false
		
		if Text == nil then
			error("Message is nil")
		end
		if p6 == "Team" then
			return false
		end
		if string.sub(Text, 1, 6):lower() == "/team " or Text:lower() == "/team" then
			DoTeamCommand(p5, string.sub(Text, 7), p6)
			Flag = true
			
			return Flag
		end
		if string.sub(Text, 1, 3):lower() == "/t " or Text:lower() == "/t" then
			DoTeamCommand(p5, string.sub(Text, 4), p6)
			Flag = true
			
			return Flag
		end
		if string.sub(Text, 1, 2):lower() == "% " or Text:lower() == "%" then
			DoTeamCommand(p5, string.sub(Text, 3), p6)
			Flag = true
		end
		return Flag
	end, ChatConstantsModule.StandardPriority)
	
	local function GetDefaultChannelNameColor() --[[ Line: 126 ]]
		-- upvalues: ChatSettingsModule (upval)
		return if ChatSettingsModule.DefaultChannelNameColor then ChatSettingsModule.DefaultChannelNameColor else Color3.fromRGB(35, 76, 142)
	end
	
	local function PutSpeakerInCorrectTeamChatState(Speaker, Player: Player) --[[ Line: 133 ]]
		-- upvalues: Team (copy), GetDefaultChannelNameColor (copy)
		if Player.Neutral or Player.Team == nil then
			Speaker:UpdateChannelNameColor(Team.Name, GetDefaultChannelNameColor())
			
			if Speaker:IsInChannel(Team.Name) then
				Speaker:LeaveChannel(Team.Name)
				
				return
			end
		elseif not Player.Neutral and Player.Team then
			Speaker:UpdateChannelNameColor(Team.Name, Player.Team.TeamColor.Color)
			
			if not Speaker:IsInChannel(Team.Name) then
				Speaker:JoinChannel(Team.Name)
			end
		end
	end
	
	p1.SpeakerAdded:connect(function(p5) --[[ Line: 149 ]]
		-- upvalues: p1 (copy), PutSpeakerInCorrectTeamChatState (copy)
		local Speaker = p1:GetSpeaker(p5)
		
		if Speaker then
			local Player = Speaker:GetPlayer()
			
			if Player then
				PutSpeakerInCorrectTeamChatState(Speaker, Player)
			end
		end
	end)
	local ChangedConnections = {}
	Players.PlayerAdded:connect(function(Player: Player) --[[ Line: 160 ]]
		-- upvalues: p1 (copy), PutSpeakerInCorrectTeamChatState (copy), Team (copy), ChatLocalizationModule (upval), ChangedConnections (copy)
		ChangedConnections[Player] = Player.Changed:connect(function(p5) --[[ Line: 161 ]]
			-- upvalues: p1 (upval), Player (copy), PutSpeakerInCorrectTeamChatState (upval), Team (upval), ChatLocalizationModule (upval)
			local Speaker = p1:GetSpeaker(Player.Name)
			
			if Speaker then
				if p5 == "Neutral" then
					PutSpeakerInCorrectTeamChatState(Speaker, Player)
					
					return
				end
				if p5 == "Team" then
					PutSpeakerInCorrectTeamChatState(Speaker, Player)
					
					if Speaker:IsInChannel(Team.Name) then
						Speaker:SendSystemMessage(ChatLocalizationModule:FormatMessageToSend("GameChat_TeamChat_NowInTeam", string.format("You are now on the '%s' team.", Player.Team.Name), "RBX_NAME", Player.Team.Name), Team.Name)
					end
				end
			end
		end)
	end)
	Players.PlayerRemoving:connect(function(Player) --[[ Line: 182 ]]
		-- upvalues: ChangedConnections (copy)
		local ChangedConnection = ChangedConnections[Player]
		
		if ChangedConnection then
			ChangedConnection:Disconnect()
		end
		ChangedConnections[Player] = nil
	end)
end