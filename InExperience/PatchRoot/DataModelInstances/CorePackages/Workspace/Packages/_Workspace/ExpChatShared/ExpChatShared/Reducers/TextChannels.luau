local expChatShared = script:FindFirstAncestor("ExpChatShared")
local parent = expChatShared.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local none = require(parent.llama).None
local var1 = require(expChatShared.Logger):new("ExpChat/Reducers/" .. script.Name)
local getFFlagTextChatEnableUniverseChatTabsModule = require(expChatShared.Flags.GetFFlagTextChatEnableUniverseChatTabs)
local fFlagExpChatFixBackspaceNilTargetChannelModule = require(expChatShared.Flags.FFlagExpChatFixBackspaceNilTargetChannel)
local fFlagExpChatFixTeamChangeOverwriteChannelModule = require(expChatShared.Flags.FFlagExpChatFixTeamChangeOverwriteChannel)
local actions = expChatShared.Actions

local function _(p1, p2)
	local text = "RBXTeam" .. p1.TeamColor.Name
	
	for i, v in pairs(p1) do
		if i == text then
			return v
		end
	end
	return nil
end

return roduxModule.createReducer({
	targetTextChannel = nil,
	selectedChannelName = nil,
	currentTeam = nil,
	allTextChannels = {}
}, {
	[require(actions.ClientAppLoaded).name] = function(p3, p4)
		-- upvalues: dictionary (ref), none (ref)
		return dictionary.join(p3, { currentTeam = if p4.team == nil then none else p4.team })
	end,
	[require(actions.TextChannelCreated).name] = function(p3, p4)
		-- upvalues: var1 (ref), dictionary (ref)
		var1:trace("TextChannelCreated: {}", p4.textChannel.Name)
		
		return dictionary.join(p3, {
			allTextChannels = dictionary.join(p3.allTextChannels, { [p4.textChannel.Name] = p4.textChannel })
		})
	end,
	[require(actions.TextChannelRemoved).name] = function(p3, p4)
		-- upvalues: dictionary (ref), none (ref)
		local var2 = dictionary.removeKey(p3.allTextChannels, p4.textChannel.Name)
		
		return dictionary.join(p3, {
			allTextChannels = var2,
			targetTextChannel = if p4.textChannel == p3.targetTextChannel then var2.RBXGeneral or none else p3.targetTextChannel
		})
	end,
	[require(actions.LocalTextChannelParticipantRemoved).name] = function(p3, p4)
		-- upvalues: dictionary (ref), none (ref)
		return dictionary.join(p3, {
			targetTextChannel = if p4.textChannel == p3.targetTextChannel then if p4.textChannel == p3.allTextChannels.RBXGeneral then none else p3.allTextChannels.RBXGeneral or none else p3.targetTextChannel
		})
	end,
	[require(actions.TargetTextChannelPropertyChanged).name] = function(p3, p4)
		-- upvalues: var1 (ref), getFFlagTextChatEnableUniverseChatTabsModule (ref), dictionary (ref), none (ref)
		var1:trace("TargetTextChannelPropertyChanged dispatched")
		
		return if p4.textChannel == nil then p3 elseif getFFlagTextChatEnableUniverseChatTabsModule() then dictionary.join(p3, {
			targetTextChannel = p4.textChannel,
			selectedChannelName = p4.textChannel.Name
		}) else dictionary.join(p3, {
			targetTextChannel = if p4.textChannel == nil then none else p4.textChannel
		})
	end,
	[require(actions.TextChatChannelSelected).name] = function(p3, p4)
		-- upvalues: var1 (ref), dictionary (ref)
		var1:trace("TextChatChannelSelected dispatched: {}", p4.channelName)
		local channelName = p3.allTextChannels[p4.channelName]
		
		return if channelName == nil then p3 else dictionary.join(p3, {
			targetTextChannel = channelName,
			selectedChannelName = p4.channelName
		})
	end,
	[require(actions.LocalTeamChanged).name] = function(p3, p4)
		-- upvalues: var1 (ref), dictionary (ref), fFlagExpChatFixTeamChangeOverwriteChannelModule (ref), none (ref)
		if p4.team then
			var1:trace("LocalTeamChanged dispatched with team: {}", p4.team.Name)
			
			if not p3.targetTextChannel or not string.find(p3.targetTextChannel.Name, "^RBXTeam") then
				return dictionary.join(p3, { currentTeam = p4.team })
			end
			local var2
			local text = "RBXTeam" .. p15.team.TeamColor.Name
			
			for i, v in pairs(p3.allTextChannels) do
				if i == text then
					var2 = v
					return dictionary.join(p3, {
						currentTeam = p4.team,
						targetTextChannel = if var2 == nil then p3.allTextChannels.RBXGeneral else var2
					})
				end
			end
			var2 = nil
		else
			var1:trace("LocalTeamChanged dispatched with no team")
			
			return if fFlagExpChatFixTeamChangeOverwriteChannelModule then if p3.targetTextChannel and string.find(p3.targetTextChannel.Name, "^RBXTeam") then dictionary.join(p3, {
				currentTeam = none,
				targetTextChannel = p3.allTextChannels.RBXGeneral or p3.targetTextChannel
			}) else dictionary.join(p3, { currentTeam = none }) else dictionary.join(p3, {
				currentTeam = none,
				targetTextChannel = p3.allTextChannels.RBXGeneral or p3.targetTextChannel
			})
		end
	end,
	[require(actions.ChatInputBarActivatedTeamMode).name] = function(p5, _)
		-- upvalues: var1 (ref), dictionary (ref), none (ref)
		if p5.currentTeam == nil then
			var1:trace("ChatInputBarActivatedTeamMode but not on a team")
			
			return p5
		end
		local var3
		assert(p5.currentTeam, "This should be unreachable")
		local text = "RBXTeam" .. p16.currentTeam.TeamColor.Name
		
		for i, v in pairs(p5.allTextChannels) do
			if i == text then
				var3 = v
				var1:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", if var3 then var3.Name else "nil")
				
				return if var3 == nil then p5 else dictionary.join(p5, { targetTextChannel = if var3 == nil then none else var3 })
			end
		end
		var3 = nil
	end,
	[require(actions.ChatInputBarResetTargetChannel).name] = function(p6, p7)
		-- upvalues: fFlagExpChatFixBackspaceNilTargetChannelModule (ref), dictionary (ref), none (ref)
		return if fFlagExpChatFixBackspaceNilTargetChannelModule and p7.isGlobalTabActive then dictionary.join(p6, { targetTextChannel = none }) else dictionary.join(p6, {
			targetTextChannel = p6.allTextChannels.RBXGeneral or p6.targetTextChannel
		})
	end,
	[require(actions.ChatInputBarActivatedWhisperMode).name] = function(p6, p7)
		-- upvalues: var1 (ref), dictionary (ref)
		var1:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", if p7.textChannel then p7.textChannel.Name else "nil")
		
		return if p7.textChannel == nil then p6 else dictionary.join(p6, {
			allTextChannels = dictionary.join(p6.allTextChannels, { [p7.textChannel.Name] = p7.textChannel }),
			targetTextChannel = p7.textChannel
		})
	end,
	[require(actions.PlayerRemoved).name] = function(p6, p7)
		-- upvalues: dictionary (ref)
		local function _(p8)
			-- upvalues: p7 (ref)
			return string.find(p8, "RBXWhisper:") and string.find(p8, p7.userId)
		end
		
		local targetTextChannel = p6.targetTextChannel
		
		if targetTextChannel then
			local name = targetTextChannel.Name
			
			if string.find(name, "RBXWhisper:") and string.find(name, p7.userId) then
				targetTextChannel = p6.allTextChannels.RBXGeneral
			end
		end
		return dictionary.join(p6, {
			targetTextChannel = targetTextChannel,
			allTextChannels = dictionary.filter(p6.allTextChannels, function(_, p8)
				-- upvalues: p7 (ref)
				return not (string.find(p8, "RBXWhisper:") and string.find(p8, p7.userId))
			end)
		})
	end,
	[require(actions.UniverseChatChannelSelected).name] = function(p6, p7)
		-- upvalues: var1 (ref), dictionary (ref), none (ref)
		var1:trace("UniverseChatChannelSelected dispatched: {}", p7.channelName)
		
		return dictionary.join(p6, {
			targetTextChannel = none,
			selectedChannelName = p7.channelName
		})
	end
})