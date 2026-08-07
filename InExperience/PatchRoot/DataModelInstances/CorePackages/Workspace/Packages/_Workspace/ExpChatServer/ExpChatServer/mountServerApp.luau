local playersService = game:GetService("Players")
local teamsService = game:GetService("Teams")
local textChatService = game:GetService("TextChatService")
local expChatServer = script:FindFirstAncestor("ExpChatServer")
local parent = expChatServer.Parent
local list = require(parent.llama).List
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local createDispatchRemoteFunctionModule = require(expChatServer.createDispatchRemoteFunction)
local createStoreModule = require(script.createStore)
local watchForErrors = expChatSharedModule.watchForErrors
local countParticipantsInTextChannel = expChatSharedModule.countParticipantsInTextChannel
local actions = expChatSharedModule.Actions
local playerAdded = actions.PlayerAdded
local playerRemoved = actions.PlayerRemoved
local commands = expChatSharedModule.Commands
local config = expChatSharedModule.Config
local analytics = expChatSharedModule.Analytics
local var8 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)
local getFFlagExpChatAlwaysRunTCS = sharedFlagsModule.getFFlagExpChatAlwaysRunTCS
local fFlagExpChatAddUserAsyncNilCheck = expChatSharedModule.Flags.FFlagExpChatAddUserAsyncNilCheck
local expChatBackfillTeamChannels = game:DefineFastFlag("ExpChatBackfillTeamChannels", false)
local expChatBackfillTeamChannelsParentCheck = game:DefineFastFlag("ExpChatBackfillTeamChannelsParentCheck", false)

local _ = function() --[[ line: 38 ]]
	-- upvalues: list (ref), textChatService (ref)
	return #list.filter(textChatService:GetDescendants(), function(p0) --[[ line: 39 ]]
		return p0:IsA("TextChannel")
	end)
end

local _ = function() --[[ line: 46 ]]
	-- upvalues: list (ref), textChatService (ref)
	return #list.filter(textChatService:GetDescendants(), function(p1) --[[ line: 47 ]]
		return p1:IsA("TextChatCommand")
	end)
end

return function(p2) --[[ line: 54 ]]
	-- upvalues: var8 (ref), createStoreModule (ref), createDispatchRemoteFunctionModule (ref), analytics (ref), watchForErrors (ref), textChatService (ref), fFlagExpChatAddUserAsyncNilCheck (ref), expChatBackfillTeamChannels (ref), expChatBackfillTeamChannelsParentCheck (ref), teamsService (ref), config (ref), playersService (ref), commands (ref), list (ref), getFFlagExpChatAlwaysRunTCS (ref), countParticipantsInTextChannel (ref), playerAdded (ref), playerRemoved (ref)
	var8:trace("mountServerApp started")
	local var11 = createStoreModule()
	createDispatchRemoteFunctionModule()
	
	if p2 and p2.analytics then
		analytics.with(p2.analytics)
	end
	watchForErrors(game:GetService("ScriptContext"), p2.script, true)
	local t = {}
	
	if textChatService.CreateDefaultTextChannels then
		var8:trace("Creating default TextChannels")
		local textChannels = Instance.new("Folder")
		textChannels.Name = "TextChannels"
		textChannels.Parent = textChatService
		
		local function findChannel(p3) --[[ line: 75 ]]
			-- upvalues: textChatService (copy)
			for i, v in pairs(textChatService:GetDescendants()) do
				if v:IsA("TextChannel") and v.Name == p3 then
					return v
				end
			end
			return nil
		end
		
		local function _(p4) --[[ line: 85 | named "addChannel" ]]
			-- upvalues: findChannel (ref), textChannels (ref)
			local var21 = findChannel(p4)
			
			if not var21 then
				var21 = Instance.new("TextChannel")
				var21.Name = p4
				var21.Parent = textChannels
			end
			return var21
		end
		
		local function findTextSourceFromChannelWithUserId(p5, p6) --[[ line: 97 ]]
			for i, v in pairs(p5:GetChildren()) do
				if v:IsA("TextSource") and v.UserId == p6 then
					return v
				end
			end
			return nil
		end
		
		local function createTeamChannel(p7) --[[ line: 107 ]]
			-- upvalues: findChannel (ref), textChannels (ref), var8 (copy), fFlagExpChatAddUserAsyncNilCheck (copy), findTextSourceFromChannelWithUserId (ref), expChatBackfillTeamChannels (copy), expChatBackfillTeamChannelsParentCheck (copy), teamsService (copy)
			local text = "RBXTeam" .. tostring(p7.TeamColor.Name)
			local var23 = findChannel(text)
			
			if not var23 then
				var23 = Instance.new("TextChannel")
				var23.Name = text
				var23.Parent = textChannels
			end
			var8:debug("Creating team TextChannel: {}", var23.Name)
			p7.PlayerAdded:Connect(function(p8) --[[ line: 111 ]]
				-- upvalues: p7 (ref), findChannel (copy), textChannels (copy), fFlagExpChatAddUserAsyncNilCheck (copy)
				local text = "RBXTeam" .. tostring(p7.TeamColor.Name)
				local var29 = findChannel(text)
				
				if not var29 then
					var29 = Instance.new("TextChannel")
					var29.Name = text
					var29.Parent = textChannels
				end
				local userId = var29:AddUserAsync(p8.UserId)
				
				if fFlagExpChatAddUserAsyncNilCheck then
					if userId == nil then
						return
					else
						userId.CanSend = true
						
						return
					end
				else
					userId.CanSend = true
				end
			end)
			p7.PlayerRemoved:Connect(function(p9) --[[ line: 124 ]]
				-- upvalues: p7 (ref), findChannel (copy), textChannels (copy), findTextSourceFromChannelWithUserId (copy)
				local text = "RBXTeam" .. tostring(p7.TeamColor.Name)
				local var32 = findChannel(text)
				
				if not var32 then
					var32 = Instance.new("TextChannel")
					var32.Name = text
					var32.Parent = textChannels
				end
				local var33 = findTextSourceFromChannelWithUserId(var32, p9.UserId)
				
				if var33 then
					var33:Destroy()
				end
			end)
			local var24 = expChatBackfillTeamChannels
			
			if var24 and expChatBackfillTeamChannelsParentCheck then
				var24 = p7.Parent == teamsService
			end
			if var24 then
				for i, v in pairs(p7:GetPlayers()) do
					local text_1 = "RBXTeam" .. tostring(p7.TeamColor.Name)
					local var26 = findChannel(text_1)
					
					if not var26 then
						var26 = Instance.new("TextChannel")
						var26.Name = text_1
						var26.Parent = textChannels
					end
					local userId = var26:AddUserAsync(v.UserId)
					
					if not fFlagExpChatAddUserAsyncNilCheck then
						userId.CanSend = true
					elseif userId ~= nil then
						userId.CanSend = true
					end
				end
			end
			p7:GetPropertyChangedSignal("TeamColor"):Connect(function() --[[ line: 154 ]]
				-- upvalues: p7 (ref), findChannel (copy), textChannels (copy)
				local text = "RBXTeam" .. tostring(p7.TeamColor.Name)
				local var35 = findChannel(text)
				
				if not var35 then
					var35 = Instance.new("TextChannel")
					var35.Name = text
					var35.Parent = textChannels
				end
				var35.Name = "RBXTeam" .. tostring(p7.TeamColor.Name)
			end)
		end
		
		for i, v in pairs(teamsService:GetTeams()) do
			if v:IsA("Team") then
				createTeamChannel(v)
			end
		end
		teamsService.ChildAdded:Connect(function(p10) --[[ line: 166 ]]
			-- upvalues: createTeamChannel (ref)
			if p10:IsA("Team") then
				createTeamChannel(p10)
			end
		end)
		teamsService.ChildRemoved:Connect(function(p11) --[[ line: 172 ]]
			-- upvalues: findChannel (ref), var8 (copy)
			if p11:IsA("Team") then
				local var36 = findChannel("RBXTeam" .. tostring(p11.TeamColor.Name))
				
				if var36 then
					var8:debug("Destroying team TextChannel: {}", var36.Name)
					var36:Destroy()
				end
			end
		end)
		
		for i_1, v_1 in pairs(config.DefaultChannelNames) do
			var8:trace("Creating default channel: {}", i_1)
			local var18 = findChannel(i_1)
			
			if not var18 then
				var18 = Instance.new("TextChannel")
				var18.Name = i_1
				var18.Parent = textChannels
			end
			table.insert(t, var18)
		end
		local function addPlayerTextSourceToDefaultChannels(p12) --[[ line: 187 ]]
			-- upvalues: t (ref), var8 (copy), fFlagExpChatAddUserAsyncNilCheck (copy)
			for i, v in ipairs(t) do
				var8:trace("Adding user {} to TextChannel: {}", tostring(p12.UserId), v.Name)
				local userId = v:AddUserAsync(p12.UserId)
				
				if fFlagExpChatAddUserAsyncNilCheck then
					if userId ~= nil and v.Name == "RBXGeneral" then
						userId.CanSend = true
					elseif userId ~= nil and v.Name == "RBXSystem" then
						userId.CanSend = false
					end
				elseif v.Name == "RBXGeneral" then
					userId.CanSend = true
				elseif v.Name == "RBXSystem" then
					userId.CanSend = false
				end
			end
		end
		
		for i_2, v_2 in pairs(playersService:GetPlayers()) do
			if v_2:IsA("Player") then
				addPlayerTextSourceToDefaultChannels(v_2)
			end
		end
		playersService.PlayerAdded:Connect(addPlayerTextSourceToDefaultChannels)
		analytics.FireRccAnalyticsWithEventName("DefaultChannelsCreated")
	end
	if textChatService.CreateDefaultCommands then
		var8:trace("Creating default TextChatCommands")
		local textChatCommands = Instance.new("Folder")
		textChatCommands.Name = "TextChatCommands"
		textChatCommands.Parent = textChatService
		
		for i, v in ipairs(commands.enabledCommands) do
			local textChatCommand = Instance.new("TextChatCommand")
			textChatCommand.Name = v.name
			textChatCommand.PrimaryAlias = v.alias[1]
			textChatCommand.SecondaryAlias = v.alias[2] or ""
			textChatCommand.Parent = textChatCommands
		end
		analytics.FireRccAnalyticsWithEventName("DefaultCommandsCreated")
	end
	analytics.FireRccAnalyticsWithEventName("ExperienceChatLoaded", {
		loadedChannels = #list.filter(textChatService:GetDescendants(), function(p13) --[[ line: 39 ]]
			return p13:IsA("TextChannel")
		end),
		loadedCommands = #list.filter(textChatService:GetDescendants(), function(p14) --[[ line: 47 ]]
			return p14:IsA("TextChatCommand")
		end)
	})
	
	if getFFlagExpChatAlwaysRunTCS() then
		analytics.FireRccAnalyticsDeferred("AutomigratedToTCS", { universeId = game.GameId })
	end
	var8:debug("Start watching for new channels and commands")
	textChatService.DescendantAdded:Connect(function(p15) --[[ line: 252 ]]
		-- upvalues: analytics (copy), list (copy), textChatService (copy), countParticipantsInTextChannel (copy)
		if p15:IsA("TextChannel") then
			analytics.FireRccAnalyticsWithEventName("ChannelCreated", {
				channelName = p15.Name,
				totalChannels = #list.filter(textChatService:GetDescendants(), function(p16) --[[ line: 39 ]]
					return p16:IsA("TextChannel")
				end)
			})
			
			return
		elseif p15:IsA("TextChatCommand") then
			analytics.FireRccAnalyticsWithEventName("CommandCreated", { commandName = p15.Name })
			
			return
		elseif p15:IsA("TextSource") then
			local parent = p15.Parent
			
			if parent and parent:IsA("TextChannel") then
				analytics.FireRccAnalyticsWithEventName("ChannelJoined", {
					channelName = parent.Name,
					totalParticipants = countParticipantsInTextChannel(parent)
				})
			end
		end
	end)
	textChatService.DescendantRemoving:Connect(function(p17) --[[ line: 273 ]]
		-- upvalues: analytics (copy), list (copy), textChatService (copy), countParticipantsInTextChannel (copy)
		if p17:IsA("TextChannel") then
			analytics.FireRccAnalyticsWithEventName("ChannelRemoved", {
				channelName = p17.Name,
				totalChannels = #list.filter(textChatService:GetDescendants(), function(p18) --[[ line: 39 ]]
					return p18:IsA("TextChannel")
				end) - 1
			})
			
			return
		elseif p17:IsA("TextChatCommand") then
			analytics.FireRccAnalyticsWithEventName("CommandRemoved", { commandName = p17.Name })
			
			return
		elseif p17:IsA("TextSource") then
			local parent = p17.Parent
			
			if parent and parent:IsA("TextChannel") then
				analytics.FireRccAnalyticsWithEventName("ChannelLeft", {
					channelName = parent.Name,
					totalParticipants = countParticipantsInTextChannel(parent)
				})
			end
		end
	end)
	
	for i, v in pairs(playersService:GetPlayers()) do
		var11:dispatch(playerAdded(v.UserId, v.Name, v.DisplayName))
	end
	playersService.PlayerAdded:Connect(function(p19) --[[ line: 297 ]]
		-- upvalues: var11 (ref), playerAdded (copy)
		var11:dispatch(playerAdded(p19.UserId, p19.Name, p19.DisplayName))
	end)
	playersService.PlayerRemoving:Connect(function(p20) --[[ line: 301 ]]
		-- upvalues: var11 (ref), playerRemoved (copy)
		var11:dispatch(playerRemoved(p20.UserId))
	end)
end