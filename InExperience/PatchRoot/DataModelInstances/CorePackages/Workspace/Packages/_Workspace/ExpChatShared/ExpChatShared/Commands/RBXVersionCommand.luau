local versionModule = require(script:FindFirstAncestor("ExpChatShared").Version)
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/version", "/v" },
	clientRun = function() --[[ line: 8 ]]
		-- upvalues: versionModule (ref)
		return {
			key = "CoreScripts.TextChat.Version.Success",
			metadata = "Roblox.Version.Info.Success",
			args = {
				RBX_VERSION = string.format("%s (%s)", versionModule[1], versionModule[2])
			}
		}
	end
}