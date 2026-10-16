local ExpChatShared = script:FindFirstAncestor("ExpChatShared")
local Parent = ExpChatShared.Parent
local Dictionary = require(Parent.llama).Dictionary
local None = require(Parent.llama).None
local NewResult = require(ExpChatShared.Logger):new("ExpChat/Reducers/" .. script.Name)
local GetFFlagTextChatEnableUniverseChatTabsModule = require(ExpChatShared.Flags.GetFFlagTextChatEnableUniverseChatTabs)
local FFlagExpChatFixBackspaceNilTargetChannelModule = require(ExpChatShared.Flags.FFlagExpChatFixBackspaceNilTargetChannel)
local Actions = ExpChatShared.Actions

local function _(List, p1) --[[ Line: 39 | Named "getTeamTextChannelFromTeam" ]]
	local Text = "RBXTeam" .. p1.TeamColor.Name
	
	for i, value in pairs(List) do
		if i == Text then
			return value
		end
	end
	return nil
end

return require(Parent.Rodux).createReducer({
	targetTextChannel = nil,
	selectedChannelName = nil,
	currentTeam = nil,
	allTextChannels = {}
}, {
	[require(Actions.ClientAppLoaded).name] = function(p2, p3) --[[ Line: 51 ]]
		-- upvalues: Dictionary (copy), None (copy)
		return Dictionary.join(p2, { currentTeam = if p3.team == nil then None else p3.team })
	end,
	[require(Actions.TextChannelCreated).name] = function(p2, p3) --[[ Line: 57 ]]
		-- upvalues: NewResult (copy), Dictionary (copy)
		NewResult:trace("TextChannelCreated: {}", p3.textChannel.Name)
		
		return Dictionary.join(p2, {
			allTextChannels = Dictionary.join(p2.allTextChannels, { [p3.textChannel.Name] = p3.textChannel })
		})
	end,
	[require(Actions.TextChannelRemoved).name] = function(p2, p3) --[[ Line: 66 ]]
		-- upvalues: Dictionary (copy), None (copy)
		local RemoveKeyResult = Dictionary.removeKey(p2.allTextChannels, p3.textChannel.Name)
		
		return Dictionary.join(p2, {
			allTextChannels = RemoveKeyResult,
			targetTextChannel = if p3.textChannel == p2.targetTextChannel then RemoveKeyResult.RBXGeneral or None else p2.targetTextChannel
		})
	end,
	[require(Actions.LocalTextChannelParticipantRemoved).name] = function(p2, p3) --[[ Line: 78 ]]
		-- upvalues: Dictionary (copy), None (copy)
		return Dictionary.join(p2, {
			targetTextChannel = if p3.textChannel == p2.targetTextChannel then if p3.textChannel == p2.allTextChannels.RBXGeneral then None else p2.allTextChannels.RBXGeneral or None else p2.targetTextChannel
		})
	end,
	[require(Actions.TargetTextChannelPropertyChanged).name] = function(p2, p3) --[[ Line: 91 ]]
		-- upvalues: NewResult (copy), GetFFlagTextChatEnableUniverseChatTabsModule (copy), Dictionary (copy), None (copy)
		NewResult:trace("TargetTextChannelPropertyChanged dispatched")
		
		return if p3.textChannel == nil then p2 elseif GetFFlagTextChatEnableUniverseChatTabsModule() then Dictionary.join(p2, {
			targetTextChannel = p3.textChannel,
			selectedChannelName = p3.textChannel.Name
		}) else Dictionary.join(p2, {
			targetTextChannel = if p3.textChannel == nil then None else p3.textChannel
		})
	end,
	[require(Actions.TextChatChannelSelected).name] = function(p2, p3) --[[ Line: 114 ]]
		-- upvalues: NewResult (copy), Dictionary (copy)
		NewResult:trace("TextChatChannelSelected dispatched: {}", p3.channelName)
		local AllTextChannel = p2.allTextChannels[p3.channelName]
		
		return if AllTextChannel == nil then p2 else Dictionary.join(p2, {
			targetTextChannel = AllTextChannel,
			selectedChannelName = p3.channelName
		})
	end,
	[require(Actions.LocalTeamChanged).name] = function(p2, p3) --[[ Line: 128 ]]
		-- upvalues: NewResult (copy), Dictionary (copy), None (copy)
		if not p3.team then
			NewResult:trace("LocalTeamChanged dispatched with no team")
			
			return if p2.targetTextChannel and string.find(p2.targetTextChannel.Name, "^RBXTeam") then Dictionary.join(p2, {
				currentTeam = None,
				targetTextChannel = p2.allTextChannels.RBXGeneral or p2.targetTextChannel
			}) else Dictionary.join(p2, { currentTeam = None })
		end
		NewResult:trace("LocalTeamChanged dispatched with team: {}", p3.team.Name)
		
		if not p2.targetTextChannel or not string.find(p2.targetTextChannel.Name, "^RBXTeam") then
			return Dictionary.join(p2, { currentTeam = p3.team })
		end
		local Text = "RBXTeam" .. p3.team.TeamColor.Name
		local v1 = nil
		
		for i, allTextChannel in pairs(p2.allTextChannels) do
			if i == Text then
				v1 = allTextChannel
				break
			end
		end
		return Dictionary.join(p2, {
			currentTeam = p3.team,
			targetTextChannel = if v1 == nil then p2.allTextChannels.RBXGeneral else v1
		})
	end,
	[require(Actions.ChatInputBarActivatedTeamMode).name] = function(p4, _) --[[ Line: 158 ]]
		-- upvalues: NewResult (copy), Dictionary (copy), None (copy)
		if p4.currentTeam == nil then
			NewResult:trace("ChatInputBarActivatedTeamMode but not on a team")
			
			return p4
		end
		assert(p4.currentTeam, "This should be unreachable")
		local Text = "RBXTeam" .. p4.currentTeam.TeamColor.Name
		local v2 = nil
		
		for i, allTextChannel in pairs(p4.allTextChannels) do
			if i == Text then
				v2 = allTextChannel
				break
			end
		end
		NewResult:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", v2 and v2.Name or "nil")
		
		return if v2 == nil then p4 else Dictionary.join(p4, { targetTextChannel = if v2 == nil then None else v2 })
	end,
	[require(Actions.ChatInputBarResetTargetChannel).name] = function(p5, p6) --[[ Line: 181 ]]
		-- upvalues: FFlagExpChatFixBackspaceNilTargetChannelModule (copy), Dictionary (copy), None (copy)
		return if FFlagExpChatFixBackspaceNilTargetChannelModule and p6.isGlobalTabActive then Dictionary.join(p5, { targetTextChannel = None }) else Dictionary.join(p5, {
			targetTextChannel = p5.allTextChannels.RBXGeneral or p5.targetTextChannel
		})
	end,
	[require(Actions.ChatInputBarActivatedWhisperMode).name] = function(p5, p6) --[[ Line: 192 ]]
		-- upvalues: NewResult (copy), Dictionary (copy)
		NewResult:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", p6.textChannel and p6.textChannel.Name or "nil")
		
		return if p6.textChannel == nil then p5 else Dictionary.join(p5, {
			allTextChannels = Dictionary.join(p5.allTextChannels, { [p6.textChannel.Name] = p6.textChannel }),
			targetTextChannel = p6.textChannel
		})
	end,
	[require(Actions.PlayerRemoved).name] = function(p5, p6) --[[ Line: 210 ]]
		-- upvalues: Dictionary (copy)
		local function _(Text: string): number --[[ Line: 211 | Named "isRemovedPlayerInWhisperChannel" ]]
			-- upvalues: p6 (copy)
			return string.find(Text, "RBXWhisper:") and string.find(Text, p6.userId)
		end
		
		local TargetTextChannel = p5.targetTextChannel
		
		if TargetTextChannel then
			local Name: string = TargetTextChannel.Name
			
			if string.find(Name, "RBXWhisper:") and string.find(Name, p6.userId) then
				TargetTextChannel = p5.allTextChannels.RBXGeneral
			end
		end
		return Dictionary.join(p5, {
			targetTextChannel = TargetTextChannel,
			allTextChannels = Dictionary.filter(p5.allTextChannels, function(_, Text: string): boolean --[[ Line: 220 ]]
				-- upvalues: p6 (copy)
				return not (string.find(Text, "RBXWhisper:") and string.find(Text, p6.userId))
			end)
		})
	end,
	[require(Actions.UniverseChatChannelSelected).name] = function(p5, p6) --[[ Line: 233 ]]
		-- upvalues: NewResult (copy), Dictionary (copy), None (copy)
		NewResult:trace("UniverseChatChannelSelected dispatched: {}", p6.channelName)
		
		return Dictionary.join(p5, {
			targetTextChannel = None,
			selectedChannelName = p6.channelName
		})
	end
})