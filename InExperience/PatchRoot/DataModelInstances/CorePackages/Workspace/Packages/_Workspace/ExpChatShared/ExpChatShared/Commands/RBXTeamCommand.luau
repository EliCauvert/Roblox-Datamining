local ExpChatShared = script:FindFirstAncestor("ExpChatShared")
local Team = require(ExpChatShared.Logger):new("ExpChat/Command/Team")
local ChatInputBarActivatedTeamModeModule = require(ExpChatShared.Actions.ChatInputBarActivatedTeamMode)
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/team", "/t", "%%" },
	clientRun = function(p1, _, _)
		-- upvalues: ChatInputBarActivatedTeamModeModule (copy), Team (copy)
		if p1:getState().LocalTeam then
			p1:dispatch(ChatInputBarActivatedTeamModeModule())
			
			return { key = "", metadata = "Roblox.Team.Info.Success" }
		else
			Team:debug("Could not team chat because not in team")
			
			return {
				key = "CoreScripts.TextChat.TeamChat.Error.NotOnTeam",
				metadata = "Roblox.Team.Error.CannotTeamChatIfNotInTeam"
			}
		end
	end
}