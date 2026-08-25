local expChatShared = script:FindFirstAncestor("ExpChatShared")
local team = require(expChatShared.Logger):new("ExpChat/Command/Team")
local chatInputBarActivatedTeamModeModule = require(expChatShared.Actions.ChatInputBarActivatedTeamMode)
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/team", "/t", "%%" },
	clientRun = function(p0, _, _)
		-- upvalues: chatInputBarActivatedTeamModeModule (ref), team (ref)
		if p0:getState().LocalTeam then
			p0:dispatch(chatInputBarActivatedTeamModeModule())
			
			return { key = "", metadata = "Roblox.Team.Info.Success" }
		end
		team:debug("Could not team chat because not in team")
		
		return {
			key = "CoreScripts.TextChat.TeamChat.Error.NotOnTeam",
			metadata = "Roblox.Team.Error.CannotTeamChatIfNotInTeam"
		}
	end
}