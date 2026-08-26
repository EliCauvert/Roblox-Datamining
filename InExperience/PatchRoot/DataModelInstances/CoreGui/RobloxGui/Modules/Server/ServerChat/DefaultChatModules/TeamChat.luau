local clientChatModules = game:GetService("Chat"):WaitForChild("ClientChatModules")
local chatSettingsModule = require(clientChatModules:WaitForChild("ChatSettings"))
local chatConstantsModule = require(clientChatModules:WaitForChild("ChatConstants"))
local t = nil
pcall(function()
	-- upvalues: t (write)
	t = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if t == nil then
	t = {}
end
if not t.FormatMessageToSend or not t.LocalizeFormattedMessage then
	function t.FormatMessageToSend(_, _, p1)
		return p1
	end
end
local t_1 = {
	ChatColor = chatSettingsModule.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}

return function(p1)
	-- upvalues: t (write), chatConstantsModule (ref), t_1 (ref), chatSettingsModule (ref)
	local playersService = game:GetService("Players")
	local team = p1:AddChannel("Team")
	team.WelcomeMessage = t:FormatMessageToSend("GameChat_TeamChat_WelcomeMessage", "This is a private channel between you and your team members.")
	team.Joinable = false
	team.Leavable = false
	team.AutoJoin = false
	team.Private = true
	team:RegisterProcessCommandsFunction("replication_function", function(p2, p3, p4)
		-- upvalues: p1 (ref)
		local var1 = p1:GetSpeaker(p2)
		local var2 = p1:GetChannel(p4)
		
		if var1 and var2 then
			local player = var1:GetPlayer()
			
			if player then
				for i, v in pairs(var2:GetSpeakerList()) do
					local var3 = p1:GetSpeaker(v)
					
					if var3 then
						local player_1 = var3:GetPlayer()
						
						if player_1 and player.Team == player_1.Team then
							var3:SendMessage(p3, p4, p2, {
								NameColor = player.TeamColor.Color,
								ChatColor = player.TeamColor.Color,
								ChannelColor = player.TeamColor.Color
							})
						end
					end
				end
			end
		end
		return true
	end, chatConstantsModule.LowPriority)
	
	local function DoTeamCommand(vectorA, vectorB, p5)
		-- upvalues: p1 (ref), t (copy), t_1 (copy)
		if vectorB == nil then
			vectorB = ""
		end
		local var4 = p1:GetSpeaker(vectorA)
		
		if var4 then
			local player = var4:GetPlayer()
			
			if player then
				if player.Team == nil then
					var4:SendSystemMessage(t:FormatMessageToSend("GameChat_TeamChat_CannotTeamChatIfNotInTeam", "You cannot team chat if you are not on a team!"), p5, t_1)
					
					return
				end
				local teamChannel = p1:GetChannel("Team")
				
				if teamChannel then
					if not var4:IsInChannel(teamChannel.Name) then
						var4:JoinChannel(teamChannel.Name)
					end
					if vectorB and string.len(vectorB) > 0 then
						var4:SayMessage(vectorB, teamChannel.Name)
					end
					var4:SetMainChannel(teamChannel.Name)
				end
			end
		end
	end
	
	p1:RegisterProcessCommandsFunction("team_commands", function(p5, p6, p7)
		-- upvalues: DoTeamCommand (ref)
		local var4 = false
		
		if p6 == nil then
			error("Message is nil")
		end
		if p7 == "Team" then
			return false
		elseif string.sub(p6, 1, 6):lower() == "/team " or p6:lower() == "/team" then
			DoTeamCommand(p5, string.sub(p6, 7), p7)
			var4 = true
			
			return var4
		elseif string.sub(p6, 1, 3):lower() == "/t " or p6:lower() == "/t" then
			DoTeamCommand(p5, string.sub(p6, 4), p7)
			var4 = true
			
			return var4
		elseif string.sub(p6, 1, 2):lower() == "% " or p6:lower() == "%" then
			DoTeamCommand(p5, string.sub(p6, 3), p7)
			var4 = true
		end
		return var4
	end, chatConstantsModule.StandardPriority)
	
	local function GetDefaultChannelNameColor()
		-- upvalues: chatSettingsModule (copy)
		return if chatSettingsModule.DefaultChannelNameColor then chatSettingsModule.DefaultChannelNameColor else Color3.fromRGB(35, 76, 142)
	end
	
	local function PutSpeakerInCorrectTeamChatState(p5, p6)
		-- upvalues: team (ref), GetDefaultChannelNameColor (ref)
		if p6.Neutral or p6.Team == nil then
			p5:UpdateChannelNameColor(team.Name, GetDefaultChannelNameColor())
			
			if p5:IsInChannel(team.Name) then
				p5:LeaveChannel(team.Name)
				
				return
			end
		elseif not p6.Neutral and p6.Team then
			p5:UpdateChannelNameColor(team.Name, p6.Team.TeamColor.Color)
			
			if not p5:IsInChannel(team.Name) then
				p5:JoinChannel(team.Name)
			end
		end
	end
	
	p1.SpeakerAdded:connect(function(p5)
		-- upvalues: p1 (ref), PutSpeakerInCorrectTeamChatState (ref)
		local var4 = p1:GetSpeaker(p5)
		
		if var4 then
			local player = var4:GetPlayer()
			
			if player then
				PutSpeakerInCorrectTeamChatState(var4, player)
			end
		end
	end)
	local t_2 = {}
	playersService.PlayerAdded:connect(function(p5)
		-- upvalues: p1 (ref), PutSpeakerInCorrectTeamChatState (ref), team (ref), t (copy), t_2 (ref)
		t_2[p5] = p5.Changed:connect(function(p6)
			-- upvalues: p1 (copy), p5 (ref), PutSpeakerInCorrectTeamChatState (copy), team (copy), t (copy)
			local nameSpeaker = p1:GetSpeaker(p5.Name)
			
			if nameSpeaker then
				if p6 == "Neutral" then
					PutSpeakerInCorrectTeamChatState(nameSpeaker, p5)
					
					return
				elseif p6 == "Team" then
					PutSpeakerInCorrectTeamChatState(nameSpeaker, p5)
					
					if nameSpeaker:IsInChannel(team.Name) then
						nameSpeaker:SendSystemMessage(t:FormatMessageToSend("GameChat_TeamChat_NowInTeam", string.format("You are now on the '%s' team.", p5.Team.Name), "RBX_NAME", p5.Team.Name), team.Name)
					end
				end
			end
		end)
	end)
	playersService.PlayerRemoving:connect(function(p5)
		-- upvalues: t_2 (ref)
		local var4 = t_2[p5]
		
		if var4 then
			var4:Disconnect()
		end
		t_2[p5] = nil
	end)
end