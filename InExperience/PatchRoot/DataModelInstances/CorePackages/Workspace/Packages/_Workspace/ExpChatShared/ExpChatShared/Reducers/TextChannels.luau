local expChatShared = script:FindFirstAncestor("ExpChatShared")
local parent = expChatShared.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local none = require(parent.llama).None
local var2 = require(expChatShared.Logger):new("ExpChat/Reducers/" .. script.Name)
local getFFlagTextChatEnableUniverseChatTabsModule = require(expChatShared.Flags.GetFFlagTextChatEnableUniverseChatTabs)
local fFlagExpChatFixBackspaceNilTargetChannelModule = require(expChatShared.Flags.FFlagExpChatFixBackspaceNilTargetChannel)
local fFlagExpChatFixTeamChangeOverwriteChannelModule = require(expChatShared.Flags.FFlagExpChatFixTeamChangeOverwriteChannel)
local actions = expChatShared.Actions

local function _(p0, p1)
	local text = "RBXTeam" .. p1.TeamColor.Name
	
	for i, v in pairs(p0) do
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
	[require(actions.ClientAppLoaded).name] = function(p2, p3)
		-- upvalues: dictionary (ref), none (ref)
		return dictionary.join(p2, { currentTeam = if p3.team == nil then none else p3.team })
	end,
	[require(actions.TextChannelCreated).name] = function(p4, p5)
		-- upvalues: var2 (ref), dictionary (ref)
		var2:trace("TextChannelCreated: {}", p5.textChannel.Name)
		
		return dictionary.join(p4, {
			allTextChannels = dictionary.join(p4.allTextChannels, { [p5.textChannel.Name] = p5.textChannel })
		})
	end,
	[require(actions.TextChannelRemoved).name] = function(p6, p7)
		-- upvalues: dictionary (ref), none (ref)
		local var7 = dictionary.removeKey(p6.allTextChannels, p7.textChannel.Name)
		
		return dictionary.join(p6, {
			allTextChannels = var7,
			targetTextChannel = if p7.textChannel == p6.targetTextChannel then var7.RBXGeneral or none else p6.targetTextChannel
		})
	end,
	[require(actions.LocalTextChannelParticipantRemoved).name] = function(p8, p9)
		-- upvalues: dictionary (ref), none (ref)
		return dictionary.join(p8, {
			targetTextChannel = if p9.textChannel == p8.targetTextChannel then if p9.textChannel == p8.allTextChannels.RBXGeneral then none else p8.allTextChannels.RBXGeneral or none else p8.targetTextChannel
		})
	end,
	[require(actions.TargetTextChannelPropertyChanged).name] = function(p10, p11)
		-- upvalues: var2 (ref), getFFlagTextChatEnableUniverseChatTabsModule (ref), dictionary (ref), none (ref)
		var2:trace("TargetTextChannelPropertyChanged dispatched")
		
		return if p11.textChannel == nil then p10 elseif getFFlagTextChatEnableUniverseChatTabsModule() then dictionary.join(p10, {
			targetTextChannel = p11.textChannel,
			selectedChannelName = p11.textChannel.Name
		}) else dictionary.join(p10, {
			targetTextChannel = if p11.textChannel == nil then none else p11.textChannel
		})
	end,
	[require(actions.TextChatChannelSelected).name] = function(p12, p13)
		-- upvalues: var2 (ref), dictionary (ref)
		var2:trace("TextChatChannelSelected dispatched: {}", p13.channelName)
		local channelName = p12.allTextChannels[p13.channelName]
		
		return if channelName == nil then p12 else dictionary.join(p12, {
			targetTextChannel = channelName,
			selectedChannelName = p13.channelName
		})
	end,
	[require(actions.LocalTeamChanged).name] = function(p14, p15)
		-- upvalues: var2 (ref), dictionary (ref), fFlagExpChatFixTeamChangeOverwriteChannelModule (ref), none (ref)
		if p15.team then
			var2:trace("LocalTeamChanged dispatched with team: {}", p15.team.Name)
			
			if not p14.targetTextChannel or not string.find(p14.targetTextChannel.Name, "^RBXTeam") then
				return dictionary.join(p14, { currentTeam = p15.team })
			end
			local var9
			local text = "RBXTeam" .. p15.team.TeamColor.Name
			
			for i, v in pairs(p14.allTextChannels) do
				if i == text then
					var9 = v
					return dictionary.join(p14, {
						currentTeam = p15.team,
						targetTextChannel = if var9 == nil then p14.allTextChannels.RBXGeneral else var9
					})
				end
			end
			var9 = nil
		else
			var2:trace("LocalTeamChanged dispatched with no team")
			
			return if fFlagExpChatFixTeamChangeOverwriteChannelModule then if p14.targetTextChannel and string.find(p14.targetTextChannel.Name, "^RBXTeam") then dictionary.join(p14, {
				currentTeam = none,
				targetTextChannel = p14.allTextChannels.RBXGeneral or p14.targetTextChannel
			}) else dictionary.join(p14, { currentTeam = none }) else dictionary.join(p14, {
				currentTeam = none,
				targetTextChannel = p14.allTextChannels.RBXGeneral or p14.targetTextChannel
			})
		end
	end,
	[require(actions.ChatInputBarActivatedTeamMode).name] = function(p16, _)
		-- upvalues: var2 (ref), dictionary (ref), none (ref)
		if p16.currentTeam == nil then
			var2:trace("ChatInputBarActivatedTeamMode but not on a team")
			
			return p16
		end
		local var11
		assert(p16.currentTeam, "This should be unreachable")
		local text = "RBXTeam" .. p16.currentTeam.TeamColor.Name
		
		for i, v in pairs(p16.allTextChannels) do
			if i == text then
				var11 = v
				var2:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", if var11 then var11.Name else "nil")
				
				return if var11 == nil then p16 else dictionary.join(p16, { targetTextChannel = if var11 == nil then none else var11 })
			end
		end
		var11 = nil
	end,
	[require(actions.ChatInputBarResetTargetChannel).name] = function(p17, p18)
		-- upvalues: fFlagExpChatFixBackspaceNilTargetChannelModule (ref), dictionary (ref), none (ref)
		return if fFlagExpChatFixBackspaceNilTargetChannelModule and p18.isGlobalTabActive then dictionary.join(p17, { targetTextChannel = none }) else dictionary.join(p17, {
			targetTextChannel = p17.allTextChannels.RBXGeneral or p17.targetTextChannel
		})
	end,
	[require(actions.ChatInputBarActivatedWhisperMode).name] = function(p19, p20)
		-- upvalues: var2 (ref), dictionary (ref)
		var2:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", if p20.textChannel then p20.textChannel.Name else "nil")
		
		return if p20.textChannel == nil then p19 else dictionary.join(p19, {
			allTextChannels = dictionary.join(p19.allTextChannels, { [p20.textChannel.Name] = p20.textChannel }),
			targetTextChannel = p20.textChannel
		})
	end,
	[require(actions.PlayerRemoved).name] = function(p21, p22)
		-- upvalues: dictionary (ref)
		local function _(p23)
			-- upvalues: p22 (ref)
			return string.find(p23, "RBXWhisper:") and string.find(p23, p22.userId)
		end
		
		local targetTextChannel = p21.targetTextChannel
		
		if targetTextChannel then
			local name = targetTextChannel.Name
			
			if string.find(name, "RBXWhisper:") and string.find(name, p22.userId) then
				targetTextChannel = p21.allTextChannels.RBXGeneral
			end
		end
		return dictionary.join(p21, {
			targetTextChannel = targetTextChannel,
			allTextChannels = dictionary.filter(p21.allTextChannels, function(_, p24)
				-- upvalues: p22 (ref)
				return not (string.find(p24, "RBXWhisper:") and string.find(p24, p22.userId))
			end)
		})
	end,
	[require(actions.UniverseChatChannelSelected).name] = function(p25, p26)
		-- upvalues: var2 (ref), dictionary (ref), none (ref)
		var2:trace("UniverseChatChannelSelected dispatched: {}", p26.channelName)
		
		return dictionary.join(p25, {
			targetTextChannel = none,
			selectedChannelName = p26.channelName
		})
	end
})