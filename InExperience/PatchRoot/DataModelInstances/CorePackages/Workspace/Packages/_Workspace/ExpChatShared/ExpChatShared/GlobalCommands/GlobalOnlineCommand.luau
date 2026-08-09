local textChatService = game:GetService("TextChatService")
local online = require(script:FindFirstAncestor("ExpChatShared").Logger):new("ExpChat/GlobalCommand/Online")
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/online" },
	clientRun = function(_, p0, _, _) --[[ line: 13 ]]
		-- upvalues: textChatService (ref), online (ref)
		local ok, status = pcall(function() --[[ line: 14 ]]
			-- upvalues: textChatService (copy), p0 (ref)
			return textChatService:GetChatableUserCountAsync(p0, "global")
		end)
		
		if ok then
			return {
				metadata = "Roblox.GlobalOnline.Info",
				key = if status == 1 then "CoreScripts.TextChat.Online.Success.Singular" else "CoreScripts.TextChat.Online.Success.Plural",
				args = { RBX_COUNT = status }
			}
		end
		online:warning("GetChatableUserCountAsync ({}) failed: {}", "global", tostring(status))
		
		return nil
	end
}