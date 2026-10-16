local VersionModule = require(script:FindFirstAncestor("ExpChatShared").Version)
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/version", "/v" },
	clientRun = function() --[[ Line: 8 ]]
		-- upvalues: VersionModule (copy)
		return {
			key = "CoreScripts.TextChat.Version.Success",
			metadata = "Roblox.Version.Info.Success",
			args = {
				RBX_VERSION = string.format("%s (%s)", VersionModule[1], VersionModule[2])
			}
		}
	end
}