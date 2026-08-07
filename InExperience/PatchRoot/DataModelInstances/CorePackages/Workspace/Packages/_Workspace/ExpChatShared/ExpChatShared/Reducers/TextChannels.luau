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

local function _(p0, p1) --[[ line: 40 | named "getTeamTextChannelFromTeam" ]]
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
	[require(actions.ClientAppLoaded).name] = function(p2, p3) --[[ line: 52 ]]
		-- upvalues: dictionary (ref), none (ref)
		return dictionary.join(p2, { currentTeam = if p3.team == nil then none else p3.team })
	end,
	[require(actions.TextChannelCreated).name] = function(p4, p5) --[[ line: 58 ]]
		-- upvalues: var2 (ref), dictionary (ref)
		var2:trace("TextChannelCreated: {}", p5.textChannel.Name)
		
		return dictionary.join(p4, {
			allTextChannels = dictionary.join(p4.allTextChannels, { [p5.textChannel.Name] = p5.textChannel })
		})
	end,
	[require(actions.TextChannelRemoved).name] = function(p6, p7) --[[ line: 67 ]]
		-- upvalues: dictionary (ref), none (ref)
		local var7 = dictionary.removeKey(p6.allTextChannels, p7.textChannel.Name)
		
		return dictionary.join(p6, {
			allTextChannels = var7,
			targetTextChannel = if p7.textChannel == p6.targetTextChannel then var7.RBXGeneral or none else p6.targetTextChannel
		})
	end,
	[require(actions.LocalTextChannelParticipantRemoved).name] = function(p8, p9) --[[ line: 79 ]]
		-- upvalues: dictionary (ref), none (ref)
		return dictionary.join(p8, {
			targetTextChannel = if p9.textChannel == p8.targetTextChannel then if p9.textChannel == p8.allTextChannels.RBXGeneral then none else p8.allTextChannels.RBXGeneral or none else p8.targetTextChannel
		})
	end,
	[require(actions.TargetTextChannelPropertyChanged).name] = function(p10, p11) --[[ line: 92 ]]
		-- upvalues: var2 (ref), getFFlagTextChatEnableUniverseChatTabsModule (ref), dictionary (ref), none (ref)
		var2:trace("TargetTextChannelPropertyChanged dispatched")
		
		return if p11.textChannel == nil then p10 elseif getFFlagTextChatEnableUniverseChatTabsModule() then dictionary.join(p10, {
			targetTextChannel = p11.textChannel,
			selectedChannelName = p11.textChannel.Name
		}) else dictionary.join(p10, {
			targetTextChannel = if p11.textChannel == nil then none else p11.textChannel
		})
	end,
	[require(actions.LocalTeamChanged).name] = function(p12, p13) --[[ line: 111 ]]
		-- upvalues: var2 (ref), dictionary (ref), fFlagExpChatFixTeamChangeOverwriteChannelModule (ref), none (ref)
		if p13.team then
			var2:trace("LocalTeamChanged dispatched with team: {}", p13.team.Name)
			
			if not p12.targetTextChannel or not string.find(p12.targetTextChannel.Name, "^RBXTeam") then
				return dictionary.join(p12, { currentTeam = p13.team })
			end
			local var9
			local text = "RBXTeam" .. p13.team.TeamColor.Name
			
			for i, v in pairs(p12.allTextChannels) do
				if i == text then
					var9 = v
					return dictionary.join(p12, {
						currentTeam = p13.team,
						targetTextChannel = if var9 == nil then p12.allTextChannels.RBXGeneral else var9
					})
				end
			end
			var9 = nil
		else
			var2:trace("LocalTeamChanged dispatched with no team")
			
			return if fFlagExpChatFixTeamChangeOverwriteChannelModule then if p12.targetTextChannel and string.find(p12.targetTextChannel.Name, "^RBXTeam") then dictionary.join(p12, {
				currentTeam = none,
				targetTextChannel = p12.allTextChannels.RBXGeneral or p12.targetTextChannel
			}) else dictionary.join(p12, { currentTeam = none }) else dictionary.join(p12, {
				currentTeam = none,
				targetTextChannel = p12.allTextChannels.RBXGeneral or p12.targetTextChannel
			})
		end
	end,
	[require(actions.ChatInputBarActivatedTeamMode).name] = function(p14, _) --[[ line: 148 ]]
		-- upvalues: var2 (ref), dictionary (ref), none (ref)
		if p14.currentTeam == nil then
			var2:trace("ChatInputBarActivatedTeamMode but not on a team")
			
			return p14
		end
		local var11
		assert(p14.currentTeam, "This should be unreachable")
		local text = "RBXTeam" .. p14.currentTeam.TeamColor.Name
		
		for i, v in pairs(p14.allTextChannels) do
			if i == text then
				var11 = v
				var2:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", if var11 then var11.Name else "nil")
				
				return if var11 == nil then p14 else dictionary.join(p14, { targetTextChannel = if var11 == nil then none else var11 })
			end
		end
		var11 = nil
	end,
	[require(actions.ChatInputBarResetTargetChannel).name] = function(p15, p16) --[[ line: 171 ]]
		-- upvalues: fFlagExpChatFixBackspaceNilTargetChannelModule (ref), dictionary (ref), none (ref)
		return if fFlagExpChatFixBackspaceNilTargetChannelModule and p16.isGlobalTabActive then dictionary.join(p15, { targetTextChannel = none }) else dictionary.join(p15, {
			targetTextChannel = p15.allTextChannels.RBXGeneral or p15.targetTextChannel
		})
	end,
	[require(actions.ChatInputBarActivatedWhisperMode).name] = function(p17, p18) --[[ line: 182 ]]
		-- upvalues: var2 (ref), dictionary (ref)
		var2:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", if p18.textChannel then p18.textChannel.Name else "nil")
		
		return if p18.textChannel == nil then p17 else dictionary.join(p17, {
			allTextChannels = dictionary.join(p17.allTextChannels, { [p18.textChannel.Name] = p18.textChannel }),
			targetTextChannel = p18.textChannel
		})
	end,
	[require(actions.PlayerRemoved).name] = function(p19, p20) --[[ line: 200 ]]
		-- upvalues: dictionary (ref)
		local function _(p21) --[[ line: 201 | named "isRemovedPlayerInWhisperChannel" ]]
			-- upvalues: p20 (ref)
			return string.find(p21, "RBXWhisper:") and string.find(p21, p20.userId)
		end
		
		local targetTextChannel = p19.targetTextChannel
		
		if targetTextChannel then
			local name = targetTextChannel.Name
			
			if string.find(name, "RBXWhisper:") and string.find(name, p20.userId) then
				targetTextChannel = p19.allTextChannels.RBXGeneral
			end
		end
		return dictionary.join(p19, {
			targetTextChannel = targetTextChannel,
			allTextChannels = dictionary.filter(p19.allTextChannels, function(_, p22) --[[ line: 210 ]]
				-- upvalues: p20 (ref)
				return not (string.find(p22, "RBXWhisper:") and string.find(p22, p20.userId))
			end)
		})
	end,
	[require(actions.UniverseChatChannelSelected).name] = function(p23, p24) --[[ line: 223 ]]
		-- upvalues: var2 (ref), dictionary (ref), none (ref)
		var2:trace("UniverseChatChannelSelected dispatched: {}", p24.channelName)
		
		return dictionary.join(p23, {
			targetTextChannel = none,
			selectedChannelName = p24.channelName
		})
	end
})