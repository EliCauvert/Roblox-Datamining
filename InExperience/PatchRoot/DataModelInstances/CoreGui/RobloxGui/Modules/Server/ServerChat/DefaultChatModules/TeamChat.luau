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
	function t.FormatMessageToSend(_, _, p0)
		return p0
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
		local var11 = p1:GetSpeaker(p2)
		local var12 = p1:GetChannel(p4)
		
		if var11 and var12 then
			local player = var11:GetPlayer()
			
			if player then
				for i, v in pairs(var12:GetSpeakerList()) do
					local var14 = p1:GetSpeaker(v)
					
					if var14 then
						local player_1 = var14:GetPlayer()
						
						if player_1 and player.Team == player_1.Team then
							var14:SendMessage(p3, p4, p2, {
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
		local var16 = p1:GetSpeaker(vectorA)
		
		if var16 then
			local player = var16:GetPlayer()
			
			if player then
				if player.Team == nil then
					var16:SendSystemMessage(t:FormatMessageToSend("GameChat_TeamChat_CannotTeamChatIfNotInTeam", "You cannot team chat if you are not on a team!"), p5, t_1)
					
					return
				end
				local teamChannel = p1:GetChannel("Team")
				
				if teamChannel then
					if not var16:IsInChannel(teamChannel.Name) then
						var16:JoinChannel(teamChannel.Name)
					end
					if vectorB and string.len(vectorB) > 0 then
						var16:SayMessage(vectorB, teamChannel.Name)
					end
					var16:SetMainChannel(teamChannel.Name)
				end
			end
		end
	end
	
	p1:RegisterProcessCommandsFunction("team_commands", function(p6, p7, p8)
		-- upvalues: DoTeamCommand (ref)
		local var19 = false
		
		if p7 == nil then
			error("Message is nil")
		end
		if p8 == "Team" then
			return false
		elseif string.sub(p7, 1, 6):lower() == "/team " or p7:lower() == "/team" then
			DoTeamCommand(p6, string.sub(p7, 7), p8)
			var19 = true
			
			return var19
		elseif string.sub(p7, 1, 3):lower() == "/t " or p7:lower() == "/t" then
			DoTeamCommand(p6, string.sub(p7, 4), p8)
			var19 = true
			
			return var19
		elseif string.sub(p7, 1, 2):lower() == "% " or p7:lower() == "%" then
			DoTeamCommand(p6, string.sub(p7, 3), p8)
			var19 = true
		end
		return var19
	end, chatConstantsModule.StandardPriority)
	
	local function GetDefaultChannelNameColor()
		-- upvalues: chatSettingsModule (copy)
		return if chatSettingsModule.DefaultChannelNameColor then chatSettingsModule.DefaultChannelNameColor else Color3.fromRGB(35, 76, 142)
	end
	
	local function PutSpeakerInCorrectTeamChatState(p9, p10)
		-- upvalues: team (ref), GetDefaultChannelNameColor (ref)
		if p10.Neutral or p10.Team == nil then
			p9:UpdateChannelNameColor(team.Name, GetDefaultChannelNameColor())
			
			if p9:IsInChannel(team.Name) then
				p9:LeaveChannel(team.Name)
				
				return
			end
		elseif not p10.Neutral and p10.Team then
			p9:UpdateChannelNameColor(team.Name, p10.Team.TeamColor.Color)
			
			if not p9:IsInChannel(team.Name) then
				p9:JoinChannel(team.Name)
			end
		end
	end
	
	p1.SpeakerAdded:connect(function(p11)
		-- upvalues: p1 (ref), PutSpeakerInCorrectTeamChatState (ref)
		local var20 = p1:GetSpeaker(p11)
		
		if var20 then
			local player = var20:GetPlayer()
			
			if player then
				PutSpeakerInCorrectTeamChatState(var20, player)
			end
		end
	end)
	local t_2 = {}
	playersService.PlayerAdded:connect(function(p12)
		-- upvalues: p1 (ref), PutSpeakerInCorrectTeamChatState (ref), team (ref), t (copy), t_2 (ref)
		t_2[p12] = p12.Changed:connect(function(p13)
			-- upvalues: p1 (copy), p12 (ref), PutSpeakerInCorrectTeamChatState (copy), team (copy), t (copy)
			local nameSpeaker = p1:GetSpeaker(p12.Name)
			
			if nameSpeaker then
				if p13 == "Neutral" then
					PutSpeakerInCorrectTeamChatState(nameSpeaker, p12)
					
					return
				elseif p13 == "Team" then
					PutSpeakerInCorrectTeamChatState(nameSpeaker, p12)
					
					if nameSpeaker:IsInChannel(team.Name) then
						nameSpeaker:SendSystemMessage(t:FormatMessageToSend("GameChat_TeamChat_NowInTeam", string.format("You are now on the '%s' team.", p12.Team.Name), "RBX_NAME", p12.Team.Name), team.Name)
					end
				end
			end
		end)
	end)
	playersService.PlayerRemoving:connect(function(p14)
		-- upvalues: t_2 (ref)
		local var23 = t_2[p14]
		
		if var23 then
			var23:Disconnect()
		end
		t_2[p14] = nil
	end)
end