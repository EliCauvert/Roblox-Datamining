local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local TextChatService = game:GetService("TextChatService")
local ExpChatServer = script:FindFirstAncestor("ExpChatServer")
local Parent = ExpChatServer.Parent
local List = require(Parent.llama).List
local ExpChatSharedModule = require(Parent.ExpChatShared)
local CreateDispatchRemoteFunctionModule = require(ExpChatServer.createDispatchRemoteFunction)
local CreateStoreModule = require(script.createStore)
local WatchForErrorsFunction = ExpChatSharedModule.watchForErrors
local CountParticipantsInTextChannelFunction = ExpChatSharedModule.countParticipantsInTextChannel
local Actions = ExpChatSharedModule.Actions
local PlayerAddedFunction = Actions.PlayerAdded
local PlayerRemovedFunction = Actions.PlayerRemoved
local Commands = ExpChatSharedModule.Commands
local Config = ExpChatSharedModule.Config
local Analytics = ExpChatSharedModule.Analytics
local NewResult = ExpChatSharedModule.Logger:new("ExpChat/" .. script.Name)
local GetFFlagExpChatAlwaysRunTCSFunction = require(Parent.SharedFlags).getFFlagExpChatAlwaysRunTCS
local FFlagExpChatAddUserAsyncNilCheck = ExpChatSharedModule.Flags.FFlagExpChatAddUserAsyncNilCheck
local ExpChatBackfillTeamChannels = game:DefineFastFlag("ExpChatBackfillTeamChannels", false)
local ExpChatBackfillTeamChannelsParentCheck = game:DefineFastFlag("ExpChatBackfillTeamChannelsParentCheck", false)

local function _(): number
	-- upvalues: List (copy), TextChatService (copy)
	return #List.filter(TextChatService:GetDescendants(), function(TextChannel)
		return TextChannel:IsA("TextChannel")
	end)
end

local _ = function(): number
	-- upvalues: List (copy), TextChatService (copy)
	return #List.filter(TextChatService:GetDescendants(), function(TextChatCommand)
		return TextChatCommand:IsA("TextChatCommand")
	end)
end

return function(p1)
	-- upvalues: NewResult (copy), CreateStoreModule (copy), CreateDispatchRemoteFunctionModule (copy), Analytics (copy), WatchForErrorsFunction (copy), TextChatService (copy), FFlagExpChatAddUserAsyncNilCheck (copy), ExpChatBackfillTeamChannels (copy), ExpChatBackfillTeamChannelsParentCheck (copy), Teams (copy), Config (copy), Players (copy), Commands (copy), List (copy), GetFFlagExpChatAlwaysRunTCSFunction (copy), CountParticipantsInTextChannelFunction (copy), PlayerAddedFunction (copy), PlayerRemovedFunction (copy)
	NewResult:trace("mountServerApp started")
	local StoreModule = CreateStoreModule()
	CreateDispatchRemoteFunctionModule()
	
	if p1 and p1.analytics then
		Analytics.with(p1.analytics)
	end
	WatchForErrorsFunction(game:GetService("ScriptContext"), p1.script, true)
	local TextChannels = {}
	
	if TextChatService.CreateDefaultTextChannels then
		NewResult:trace("Creating default TextChannels")
		local TextChannels1 = Instance.new("Folder")
		TextChannels1.Name = "TextChannels"
		TextChannels1.Parent = TextChatService
		
		local function findChannel(Name)
			-- upvalues: TextChatService (upval)
			for _, TextChannel in pairs(TextChatService:GetDescendants()) do
				if TextChannel:IsA("TextChannel") and TextChannel.Name == Name then
					return TextChannel
				end
			end
			return nil
		end
		
		local function _(Name)
			-- upvalues: findChannel (copy), TextChannels1 (copy)
			local Channel = findChannel(Name)
			
			if not Channel then
				Channel = Instance.new("TextChannel")
				Channel.Name = Name
				Channel.Parent = TextChannels1
			end
			return Channel
		end
		
		local function findTextSourceFromChannelWithUserId(TextChannel, UserId)
			for _, TextSource in pairs(TextChannel:GetChildren()) do
				if TextSource:IsA("TextSource") and TextSource.UserId == UserId then
					return TextSource
				end
			end
			return nil
		end
		
		local function createTeamChannel(Players)
			-- upvalues: findChannel (copy), TextChannels1 (copy), NewResult (upval), FFlagExpChatAddUserAsyncNilCheck (upval), findTextSourceFromChannelWithUserId (copy), ExpChatBackfillTeamChannels (upval), ExpChatBackfillTeamChannelsParentCheck (upval), Teams (upval)
			local Text = "RBXTeam" .. tostring(Players.TeamColor.Name)
			local Channel = findChannel(Text)
			
			if not Channel then
				Channel = Instance.new("TextChannel")
				Channel.Name = Text
				Channel.Parent = TextChannels1
			end
			NewResult:debug("Creating team TextChannel: {}", Channel.Name)
			Players.PlayerAdded:Connect(function(Player)
				-- upvalues: Players (copy), findChannel (upval), TextChannels1 (upval), FFlagExpChatAddUserAsyncNilCheck (upval)
				local Text = "RBXTeam" .. tostring(Players.TeamColor.Name)
				local Channel = findChannel(Text)
				
				if not Channel then
					Channel = Instance.new("TextChannel")
					Channel.Name = Text
					Channel.Parent = TextChannels1
				end
				local AddUserAsyncResult = Channel:AddUserAsync(Player.UserId)
				
				if not FFlagExpChatAddUserAsyncNilCheck then
					AddUserAsyncResult.CanSend = true
				elseif AddUserAsyncResult ~= nil then
					AddUserAsyncResult.CanSend = true
					
					return
				end
			end)
			Players.PlayerRemoved:Connect(function(Player)
				-- upvalues: Players (copy), findChannel (upval), TextChannels1 (upval), findTextSourceFromChannelWithUserId (upval)
				local Text = "RBXTeam" .. tostring(Players.TeamColor.Name)
				local Channel = findChannel(Text)
				
				if not Channel then
					Channel = Instance.new("TextChannel")
					Channel.Name = Text
					Channel.Parent = TextChannels1
				end
				local TextSourceFromChannelWithUserId = findTextSourceFromChannelWithUserId(Channel, Player.UserId)
				
				if TextSourceFromChannelWithUserId then
					TextSourceFromChannelWithUserId:Destroy()
				end
			end)
			local IsParentMatch: boolean = ExpChatBackfillTeamChannels
			
			if IsParentMatch and ExpChatBackfillTeamChannelsParentCheck then
				IsParentMatch = Players.Parent == Teams
			end
			if IsParentMatch then
				for _, player in pairs(Players:GetPlayers()) do
					local Text1 = "RBXTeam" .. tostring(Players.TeamColor.Name)
					local Channel1 = findChannel(Text1)
					
					if not Channel1 then
						Channel1 = Instance.new("TextChannel")
						Channel1.Name = Text1
						Channel1.Parent = TextChannels1
					end
					local AddUserAsyncResult = Channel1:AddUserAsync(player.UserId)
					
					if not FFlagExpChatAddUserAsyncNilCheck then
						AddUserAsyncResult.CanSend = true
					elseif AddUserAsyncResult ~= nil then
						AddUserAsyncResult.CanSend = true
					end
				end
			end
			Players:GetPropertyChangedSignal("TeamColor"):Connect(function()
				-- upvalues: Players (copy), findChannel (upval), TextChannels1 (upval)
				local Text = "RBXTeam" .. tostring(Players.TeamColor.Name)
				local Channel = findChannel(Text)
				
				if not Channel then
					Channel = Instance.new("TextChannel")
					Channel.Name = Text
					Channel.Parent = TextChannels1
				end
				Channel.Name = "RBXTeam" .. tostring(Players.TeamColor.Name)
			end)
		end
		
		for _, team in pairs(Teams:GetTeams()) do
			if team:IsA("Team") then
				createTeamChannel(team)
			end
		end
		Teams.ChildAdded:Connect(function(Child)
			-- upvalues: createTeamChannel (copy)
			if Child:IsA("Team") then
				createTeamChannel(Child)
			end
		end)
		Teams.ChildRemoved:Connect(function(Child)
			-- upvalues: findChannel (copy), NewResult (upval)
			if Child:IsA("Team") then
				local Channel = findChannel("RBXTeam" .. tostring(Child.TeamColor.Name))
				
				if Channel then
					NewResult:debug("Destroying team TextChannel: {}", Channel.Name)
					Channel:Destroy()
				end
			end
		end)
		
		for Name, _ in pairs(Config.DefaultChannelNames) do
			NewResult:trace("Creating default channel: {}", Name)
			local Channel = findChannel(Name)
			
			if not Channel then
				Channel = Instance.new("TextChannel")
				Channel.Name = Name
				Channel.Parent = TextChannels1
			end
			table.insert(TextChannels, Channel)
		end
		local function addPlayerTextSourceToDefaultChannels(Player: Player)
			-- upvalues: TextChannels (copy), NewResult (upval), FFlagExpChatAddUserAsyncNilCheck (upval)
			for _, textChannel in ipairs(TextChannels) do
				NewResult:trace("Adding user {} to TextChannel: {}", tostring(Player.UserId), textChannel.Name)
				local AddUserAsyncResult = textChannel:AddUserAsync(Player.UserId)
				
				if FFlagExpChatAddUserAsyncNilCheck then
					if AddUserAsyncResult ~= nil and textChannel.Name == "RBXGeneral" then
						AddUserAsyncResult.CanSend = true
					elseif AddUserAsyncResult ~= nil and textChannel.Name == "RBXSystem" then
						AddUserAsyncResult.CanSend = false
					end
				elseif textChannel.Name == "RBXGeneral" then
					AddUserAsyncResult.CanSend = true
				elseif textChannel.Name == "RBXSystem" then
					AddUserAsyncResult.CanSend = false
				end
			end
		end
		
		for _, player in pairs(Players:GetPlayers()) do
			if player:IsA("Player") then
				addPlayerTextSourceToDefaultChannels(player)
			end
		end
		Players.PlayerAdded:Connect(addPlayerTextSourceToDefaultChannels)
		Analytics.FireRccAnalyticsWithEventName("DefaultChannelsCreated")
	end
	if TextChatService.CreateDefaultCommands then
		NewResult:trace("Creating default TextChatCommands")
		local TextChatCommands = Instance.new("Folder")
		TextChatCommands.Name = "TextChatCommands"
		TextChatCommands.Parent = TextChatService
		
		for _, enabledCommand in ipairs(Commands.enabledCommands) do
			local TextChatCommand = Instance.new("TextChatCommand")
			TextChatCommand.Name = enabledCommand.name
			TextChatCommand.PrimaryAlias = enabledCommand.alias[1]
			TextChatCommand.SecondaryAlias = enabledCommand.alias[2] or ""
			TextChatCommand.Parent = TextChatCommands
		end
		Analytics.FireRccAnalyticsWithEventName("DefaultCommandsCreated")
	end
	Analytics.FireRccAnalyticsWithEventName("ExperienceChatLoaded", {
		loadedChannels = #List.filter(TextChatService:GetDescendants(), function(TextChannel)
			return TextChannel:IsA("TextChannel")
		end),
		loadedCommands = #List.filter(TextChatService:GetDescendants(), function(TextChatCommand)
			return TextChatCommand:IsA("TextChatCommand")
		end)
	})
	
	if GetFFlagExpChatAlwaysRunTCSFunction() then
		Analytics.FireRccAnalyticsDeferred("AutomigratedToTCS", { universeId = game.GameId })
	end
	NewResult:debug("Start watching for new channels and commands")
	TextChatService.DescendantAdded:Connect(function(Descendant)
		-- upvalues: Analytics (upval), List (upval), TextChatService (upval), CountParticipantsInTextChannelFunction (upval)
		if Descendant:IsA("TextChannel") then
			Analytics.FireRccAnalyticsWithEventName("ChannelCreated", {
				channelName = Descendant.Name,
				totalChannels = #List.filter(TextChatService:GetDescendants(), function(TextChannel)
					return TextChannel:IsA("TextChannel")
				end)
			})
			
			return
		end
		if Descendant:IsA("TextChatCommand") then
			Analytics.FireRccAnalyticsWithEventName("CommandCreated", { commandName = Descendant.Name })
			
			return
		end
		if Descendant:IsA("TextSource") then
			local Parent = Descendant.Parent
			
			if Parent and Parent:IsA("TextChannel") then
				Analytics.FireRccAnalyticsWithEventName("ChannelJoined", {
					channelName = Parent.Name,
					totalParticipants = CountParticipantsInTextChannelFunction(Parent)
				})
			end
		end
	end)
	TextChatService.DescendantRemoving:Connect(function(Descendant)
		-- upvalues: Analytics (upval), List (upval), TextChatService (upval), CountParticipantsInTextChannelFunction (upval)
		if Descendant:IsA("TextChannel") then
			Analytics.FireRccAnalyticsWithEventName("ChannelRemoved", {
				channelName = Descendant.Name,
				totalChannels = #List.filter(TextChatService:GetDescendants(), function(TextChannel)
					return TextChannel:IsA("TextChannel")
				end) - 1
			})
			
			return
		end
		if Descendant:IsA("TextChatCommand") then
			Analytics.FireRccAnalyticsWithEventName("CommandRemoved", { commandName = Descendant.Name })
			
			return
		end
		if Descendant:IsA("TextSource") then
			local Parent = Descendant.Parent
			
			if Parent and Parent:IsA("TextChannel") then
				Analytics.FireRccAnalyticsWithEventName("ChannelLeft", {
					channelName = Parent.Name,
					totalParticipants = CountParticipantsInTextChannelFunction(Parent)
				})
			end
		end
	end)
	
	for _, player1 in pairs(Players:GetPlayers()) do
		StoreModule:dispatch(PlayerAddedFunction(player1.UserId, player1.Name, player1.DisplayName))
	end
	Players.PlayerAdded:Connect(function(Player: Player)
		-- upvalues: StoreModule (copy), PlayerAddedFunction (upval)
		StoreModule:dispatch(PlayerAddedFunction(Player.UserId, Player.Name, Player.DisplayName))
	end)
	Players.PlayerRemoving:Connect(function(Player)
		-- upvalues: StoreModule (copy), PlayerRemovedFunction (upval)
		StoreModule:dispatch(PlayerRemovedFunction(Player.UserId))
	end)
end