local ExpChatShared = script:FindFirstAncestor("ExpChatShared")
local Parent = ExpChatShared.Parent
local Dictionary = require(Parent.llama).Dictionary
local Commands = ExpChatShared.Commands
local RBXWhisperCommandModule = require(Commands.Whisper.RBXWhisperCommand)
local RBXTeamCommandModule = require(Commands.RBXTeamCommand)

return require(Parent.Rodux).createReducer({
	RBXWhisperCommand = {
		primaryAlias = RBXWhisperCommandModule.alias[1],
		secondaryAlias = RBXWhisperCommandModule.alias[2]
	},
	RBXTeamCommand = {
		primaryAlias = RBXTeamCommandModule.alias[1],
		secondaryAlias = RBXTeamCommandModule.alias[2]
	}
}, {
	[require(ExpChatShared.Actions.CommandAliasChanged).name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.join(p1, {
			[p2.name] = {
				primaryAlias = p2.primaryAlias,
				secondaryAlias = p2.secondaryAlias
			}
		})
	end
})