local expChatShared = script:FindFirstAncestor("ExpChatShared")
local parent = expChatShared.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local commands = expChatShared.Commands
local RBXWhisperCommandModule = require(commands.Whisper.RBXWhisperCommand)
local RBXTeamCommandModule = require(commands.RBXTeamCommand)

return roduxModule.createReducer({
	RBXWhisperCommand = {
		primaryAlias = RBXWhisperCommandModule.alias[1],
		secondaryAlias = RBXWhisperCommandModule.alias[2]
	},
	RBXTeamCommand = {
		primaryAlias = RBXTeamCommandModule.alias[1],
		secondaryAlias = RBXTeamCommandModule.alias[2]
	}
}, {
	[require(expChatShared.Actions.CommandAliasChanged).name] = function(p0, p1)
		-- upvalues: dictionary (ref)
		return dictionary.join(p0, {
			[p1.name] = {
				primaryAlias = p1.primaryAlias,
				secondaryAlias = p1.secondaryAlias
			}
		})
	end
})