local TextChatService = game:GetService("TextChatService")
local Online = require(script:FindFirstAncestor("ExpChatShared").Logger):new("ExpChat/GlobalCommand/Online")
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/online" },
	clientRun = function(_, UserId, _, _)
		-- upvalues: TextChatService (copy), Online (copy)
		local Success, Result = pcall(function()
			-- upvalues: TextChatService (upval), UserId (copy)
			return TextChatService:GetChatableUserCountAsync(UserId, "global")
		end)
		
		if Success then
			return {
				metadata = "Roblox.GlobalOnline.Info",
				key = if Result == 1 then "CoreScripts.TextChat.Online.Success.Singular" else "CoreScripts.TextChat.Online.Success.Plural",
				args = { RBX_COUNT = Result }
			}
		else
			Online:warning("GetChatableUserCountAsync ({}) failed: {}", "global", (tostring(Result)))
			
			return nil
		end
	end
}