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
local var1 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)
local getFFlagExpChatAlwaysRunTCS = sharedFlagsModule.getFFlagExpChatAlwaysRunTCS
local fFlagExpChatAddUserAsyncNilCheck = expChatSharedModule.Flags.FFlagExpChatAddUserAsyncNilCheck
local expChatBackfillTeamChannels = game:DefineFastFlag("ExpChatBackfillTeamChannels", false)
local expChatBackfillTeamChannelsParentCheck = game:DefineFastFlag("ExpChatBackfillTeamChannelsParentCheck", false)

local _ = function()
	-- upvalues: list (ref), textChatService (ref)
	return #list.filter(textChatService:GetDescendants(), function(p1)
		return p1:IsA("TextChannel")
	end)
end

local _ = function()
	-- upvalues: list (ref), textChatService (ref)
	return #list.filter(textChatService:GetDescendants(), function(p1)
		return p1:IsA("TextChatCommand")
	end)
end

return function(p1)
	-- upvalues: var1 (ref), createStoreModule (ref), createDispatchRemoteFunctionModule (ref), analytics (ref), watchForErrors (ref), textChatService (ref), fFlagExpChatAddUserAsyncNilCheck (ref), expChatBackfillTeamChannels (ref), expChatBackfillTeamChannelsParentCheck (ref), teamsService (ref), config (ref), playersService (ref), commands (ref), list (ref), getFFlagExpChatAlwaysRunTCS (ref), countParticipantsInTextChannel (ref), playerAdded (ref), playerRemoved (ref)
	var1:trace("mountServerApp started")
	local var2 = createStoreModule()
	createDispatchRemoteFunctionModule()
	
	if p1 and p1.analytics then
		analytics.with(p1.analytics)
	end
	watchForErrors(game:GetService("ScriptContext"), p1.script, true)
	local t = {}
	
	if textChatService.CreateDefaultTextChannels then
		var1:trace("Creating default TextChannels")
		local textChannels = Instance.new("Folder")
		textChannels.Name = "TextChannels"
		textChannels.Parent = textChatService
		
		local function findChannel(p2)
			-- upvalues: textChatService (copy)
			for i, v in pairs(textChatService:GetDescendants()) do
				if v:IsA("TextChannel") and v.Name == p2 then
					return v
				end
			end
			return nil
		end
		
		local function _(p3)
			-- upvalues: findChannel (ref), textChannels (ref)
			local var3 = findChannel(p3)
			
			if not var3 then
				var3 = Instance.new("TextChannel")
				var3.Name = p3
				var3.Parent = textChannels
			end
			return var3
		end
		
		local function findTextSourceFromChannelWithUserId(p3, p4)
			for i, v in pairs(p3:GetChildren()) do
				if v:IsA("TextSource") and v.UserId == p4 then
					return v
				end
			end
			return nil
		end
		
		local function createTeamChannel(p5)
			-- upvalues: findChannel (ref), textChannels (ref), var1 (copy), fFlagExpChatAddUserAsyncNilCheck (copy), findTextSourceFromChannelWithUserId (ref), expChatBackfillTeamChannels (copy), expChatBackfillTeamChannelsParentCheck (copy), teamsService (copy)
			local text = "RBXTeam" .. tostring(p5.TeamColor.Name)
			local var3 = findChannel(text)
			
			if not var3 then
				var3 = Instance.new("TextChannel")
				var3.Name = text
				var3.Parent = textChannels
			end
			var1:debug("Creating team TextChannel: {}", var3.Name)
			p5.PlayerAdded:Connect(function(p6)
				-- upvalues: p5 (ref), findChannel (copy), textChannels (copy), fFlagExpChatAddUserAsyncNilCheck (copy)
				local text = "RBXTeam" .. tostring(p5.TeamColor.Name)
				local var4 = findChannel(text)
				
				if not var4 then
					var4 = Instance.new("TextChannel")
					var4.Name = text
					var4.Parent = textChannels
				end
				local userId = var4:AddUserAsync(p6.UserId)
				
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
			p5.PlayerRemoved:Connect(function(p6)
				-- upvalues: p5 (ref), findChannel (copy), textChannels (copy), findTextSourceFromChannelWithUserId (copy)
				local text = "RBXTeam" .. tostring(p5.TeamColor.Name)
				local var4 = findChannel(text)
				
				if not var4 then
					var4 = Instance.new("TextChannel")
					var4.Name = text
					var4.Parent = textChannels
				end
				local var5 = findTextSourceFromChannelWithUserId(var4, p6.UserId)
				
				if var5 then
					var5:Destroy()
				end
			end)
			local var4 = expChatBackfillTeamChannels
			
			if var4 and expChatBackfillTeamChannelsParentCheck then
				var4 = p5.Parent == teamsService
			end
			if var4 then
				for i, v in pairs(p5:GetPlayers()) do
					local text_1 = "RBXTeam" .. tostring(p5.TeamColor.Name)
					local var5 = findChannel(text_1)
					
					if not var5 then
						var5 = Instance.new("TextChannel")
						var5.Name = text_1
						var5.Parent = textChannels
					end
					local userId = var5:AddUserAsync(v.UserId)
					
					if not fFlagExpChatAddUserAsyncNilCheck then
						userId.CanSend = true
					elseif userId ~= nil then
						userId.CanSend = true
					end
				end
			end
			p5:GetPropertyChangedSignal("TeamColor"):Connect(function()
				-- upvalues: p5 (ref), findChannel (copy), textChannels (copy)
				local text = "RBXTeam" .. tostring(p5.TeamColor.Name)
				local var6 = findChannel(text)
				
				if not var6 then
					var6 = Instance.new("TextChannel")
					var6.Name = text
					var6.Parent = textChannels
				end
				var6.Name = "RBXTeam" .. tostring(p5.TeamColor.Name)
			end)
		end
		
		for i, v in pairs(teamsService:GetTeams()) do
			if v:IsA("Team") then
				createTeamChannel(v)
			end
		end
		teamsService.ChildAdded:Connect(function(p6)
			-- upvalues: createTeamChannel (ref)
			if p6:IsA("Team") then
				createTeamChannel(p6)
			end
		end)
		teamsService.ChildRemoved:Connect(function(p6)
			-- upvalues: findChannel (ref), var1 (copy)
			if p6:IsA("Team") then
				local var6 = findChannel("RBXTeam" .. tostring(p6.TeamColor.Name))
				
				if var6 then
					var1:debug("Destroying team TextChannel: {}", var6.Name)
					var6:Destroy()
				end
			end
		end)
		
		for i_1, v_1 in pairs(config.DefaultChannelNames) do
			var1:trace("Creating default channel: {}", i_1)
			local var6 = findChannel(i_1)
			
			if not var6 then
				var6 = Instance.new("TextChannel")
				var6.Name = i_1
				var6.Parent = textChannels
			end
			table.insert(t, var6)
		end
		local function addPlayerTextSourceToDefaultChannels(p6)
			-- upvalues: t (ref), var1 (copy), fFlagExpChatAddUserAsyncNilCheck (copy)
			for i, v in ipairs(t) do
				var1:trace("Adding user {} to TextChannel: {}", tostring(p6.UserId), v.Name)
				local userId = v:AddUserAsync(p6.UserId)
				
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
		var1:trace("Creating default TextChatCommands")
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
		loadedChannels = #list.filter(textChatService:GetDescendants(), function(p7)
			return p7:IsA("TextChannel")
		end),
		loadedCommands = #list.filter(textChatService:GetDescendants(), function(p7)
			return p7:IsA("TextChatCommand")
		end)
	})
	
	if getFFlagExpChatAlwaysRunTCS() then
		analytics.FireRccAnalyticsDeferred("AutomigratedToTCS", { universeId = game.GameId })
	end
	var1:debug("Start watching for new channels and commands")
	textChatService.DescendantAdded:Connect(function(p7)
		-- upvalues: analytics (copy), list (copy), textChatService (copy), countParticipantsInTextChannel (copy)
		if p7:IsA("TextChannel") then
			analytics.FireRccAnalyticsWithEventName("ChannelCreated", {
				channelName = p7.Name,
				totalChannels = #list.filter(textChatService:GetDescendants(), function(p8)
					return p8:IsA("TextChannel")
				end)
			})
			
			return
		elseif p7:IsA("TextChatCommand") then
			analytics.FireRccAnalyticsWithEventName("CommandCreated", { commandName = p7.Name })
			
			return
		elseif p7:IsA("TextSource") then
			local parent = p7.Parent
			
			if parent and parent:IsA("TextChannel") then
				analytics.FireRccAnalyticsWithEventName("ChannelJoined", {
					channelName = parent.Name,
					totalParticipants = countParticipantsInTextChannel(parent)
				})
			end
		end
	end)
	textChatService.DescendantRemoving:Connect(function(p7)
		-- upvalues: analytics (copy), list (copy), textChatService (copy), countParticipantsInTextChannel (copy)
		if p7:IsA("TextChannel") then
			analytics.FireRccAnalyticsWithEventName("ChannelRemoved", {
				channelName = p7.Name,
				totalChannels = #list.filter(textChatService:GetDescendants(), function(p8)
					return p8:IsA("TextChannel")
				end) - 1
			})
			
			return
		elseif p7:IsA("TextChatCommand") then
			analytics.FireRccAnalyticsWithEventName("CommandRemoved", { commandName = p7.Name })
			
			return
		elseif p7:IsA("TextSource") then
			local parent = p7.Parent
			
			if parent and parent:IsA("TextChannel") then
				analytics.FireRccAnalyticsWithEventName("ChannelLeft", {
					channelName = parent.Name,
					totalParticipants = countParticipantsInTextChannel(parent)
				})
			end
		end
	end)
	
	for i, v in pairs(playersService:GetPlayers()) do
		var2:dispatch(playerAdded(v.UserId, v.Name, v.DisplayName))
	end
	playersService.PlayerAdded:Connect(function(p7)
		-- upvalues: var2 (ref), playerAdded (copy)
		var2:dispatch(playerAdded(p7.UserId, p7.Name, p7.DisplayName))
	end)
	playersService.PlayerRemoving:Connect(function(p7)
		-- upvalues: var2 (ref), playerRemoved (copy)
		var2:dispatch(playerRemoved(p7.UserId))
	end)
end