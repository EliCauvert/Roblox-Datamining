local expChatShared = script:FindFirstAncestor("ExpChatShared")
local parent = expChatShared.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local none = require(parent.llama).None
local var2 = require(expChatShared.Logger):new("ExpChat/Reducers/" .. script.Name)
local getFFlagTextChatEnableUniverseChatTabsModule = require(expChatShared.Flags.GetFFlagTextChatEnableUniverseChatTabs)
local actions = expChatShared.Actions

local function _(p0, p1) --[[ line: 37 | named "getTeamTextChannelFromTeam" ]]
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
	[require(actions.ClientAppLoaded).name] = function(p2, p3) --[[ line: 49 ]]
		-- upvalues: dictionary (ref), none (ref)
		return dictionary.join(p2, { currentTeam = if p3.team == nil then none else p3.team })
	end,
	[require(actions.TextChannelCreated).name] = function(p4, p5) --[[ line: 55 ]]
		-- upvalues: var2 (ref), dictionary (ref)
		var2:trace("TextChannelCreated: {}", p5.textChannel.Name)
		
		return dictionary.join(p4, {
			allTextChannels = dictionary.join(p4.allTextChannels, { [p5.textChannel.Name] = p5.textChannel })
		})
	end,
	[require(actions.TextChannelRemoved).name] = function(p6, p7) --[[ line: 64 ]]
		-- upvalues: dictionary (ref), none (ref)
		local var5 = dictionary.removeKey(p6.allTextChannels, p7.textChannel.Name)
		
		return dictionary.join(p6, {
			allTextChannels = var5,
			targetTextChannel = if p7.textChannel == p6.targetTextChannel then var5.RBXGeneral or none else p6.targetTextChannel
		})
	end,
	[require(actions.LocalTextChannelParticipantRemoved).name] = function(p8, p9) --[[ line: 76 ]]
		-- upvalues: dictionary (ref), none (ref)
		return dictionary.join(p8, {
			targetTextChannel = if p9.textChannel == p8.targetTextChannel then if p9.textChannel == p8.allTextChannels.RBXGeneral then none else p8.allTextChannels.RBXGeneral or none else p8.targetTextChannel
		})
	end,
	[require(actions.TargetTextChannelPropertyChanged).name] = function(p10, p11) --[[ line: 89 ]]
		-- upvalues: var2 (ref), getFFlagTextChatEnableUniverseChatTabsModule (ref), dictionary (ref), none (ref)
		var2:trace("TargetTextChannelPropertyChanged dispatched")
		
		return if p11.textChannel == nil then p10 elseif getFFlagTextChatEnableUniverseChatTabsModule() then dictionary.join(p10, {
			targetTextChannel = p11.textChannel,
			selectedChannelName = p11.textChannel.Name
		}) else dictionary.join(p10, {
			targetTextChannel = if p11.textChannel == nil then none else p11.textChannel
		})
	end,
	[require(actions.LocalTeamChanged).name] = function(p12, p13) --[[ line: 108 ]]
		-- upvalues: var2 (ref), dictionary (ref), none (ref)
		if not p13.team then
			var2:trace("LocalTeamChanged dispatched with no team")
			
			return dictionary.join(p12, {
				currentTeam = none,
				targetTextChannel = p12.allTextChannels.RBXGeneral or p12.targetTextChannel
			})
		end
		var2:trace("LocalTeamChanged dispatched with team: {}", p13.team.Name)
		
		if not p12.targetTextChannel or not string.find(p12.targetTextChannel.Name, "^RBXTeam") then
			return dictionary.join(p12, { currentTeam = p13.team })
		end
		local var7
		local text = "RBXTeam" .. p13.team.TeamColor.Name
		
		for i, v in pairs(p12.allTextChannels) do
			if i == text then
				var7 = v
				return dictionary.join(p12, {
					currentTeam = p13.team,
					targetTextChannel = if var7 == nil then p12.allTextChannels.RBXGeneral else var7
				})
			end
		end
		var7 = nil
	end,
	[require(actions.ChatInputBarActivatedTeamMode).name] = function(p14, _) --[[ line: 134 ]]
		-- upvalues: var2 (ref), dictionary (ref), none (ref)
		if p14.currentTeam == nil then
			var2:trace("ChatInputBarActivatedTeamMode but not on a team")
			
			return p14
		end
		local var9
		assert(p14.currentTeam, "This should be unreachable")
		local text = "RBXTeam" .. p14.currentTeam.TeamColor.Name
		
		for i, v in pairs(p14.allTextChannels) do
			if i == text then
				var9 = v
				var2:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", if var9 then var9.Name else "nil")
				
				return if var9 == nil then p14 else dictionary.join(p14, { targetTextChannel = if var9 == nil then none else var9 })
			end
		end
		var9 = nil
	end,
	[require(actions.ChatInputBarResetTargetChannel).name] = function(p15, _) --[[ line: 157 ]]
		-- upvalues: dictionary (ref)
		return dictionary.join(p15, {
			targetTextChannel = p15.allTextChannels.RBXGeneral or p15.targetTextChannel
		})
	end,
	[require(actions.ChatInputBarActivatedWhisperMode).name] = function(p16, p17) --[[ line: 163 ]]
		-- upvalues: var2 (ref), dictionary (ref)
		var2:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", if p17.textChannel then p17.textChannel.Name else "nil")
		
		return if p17.textChannel == nil then p16 else dictionary.join(p16, {
			allTextChannels = dictionary.join(p16.allTextChannels, { [p17.textChannel.Name] = p17.textChannel }),
			targetTextChannel = p17.textChannel
		})
	end,
	[require(actions.PlayerRemoved).name] = function(p18, p19) --[[ line: 181 ]]
		-- upvalues: dictionary (ref)
		local function _(p20) --[[ line: 182 | named "isRemovedPlayerInWhisperChannel" ]]
			-- upvalues: p19 (ref)
			return string.find(p20, "RBXWhisper:") and string.find(p20, p19.userId)
		end
		
		local targetTextChannel = p18.targetTextChannel
		
		if targetTextChannel then
			local name = targetTextChannel.Name
			
			if string.find(name, "RBXWhisper:") and string.find(name, p19.userId) then
				targetTextChannel = p18.allTextChannels.RBXGeneral
			end
		end
		return dictionary.join(p18, {
			targetTextChannel = targetTextChannel,
			allTextChannels = dictionary.filter(p18.allTextChannels, function(_, p21) --[[ line: 191 ]]
				-- upvalues: p19 (ref)
				return not (string.find(p21, "RBXWhisper:") and string.find(p21, p19.userId))
			end)
		})
	end,
	[require(actions.UniverseChatChannelSelected).name] = function(p22, p23) --[[ line: 204 ]]
		-- upvalues: var2 (ref), dictionary (ref), none (ref)
		var2:trace("UniverseChatChannelSelected dispatched: {}", p23.channelName)
		
		return dictionary.join(p22, {
			targetTextChannel = none,
			selectedChannelName = p23.channelName
		})
	end
})