local textChatService = game:GetService("TextChatService")
local expChatShared = script:FindFirstAncestor("ExpChatShared")
local online = require(expChatShared.Logger):new("ExpChat/Command/Online")
local _ = require(script.Parent.types)
local fFlagExpChatUseUpdatedUserCountStringsModule = require(expChatShared.Flags.FFlagExpChatUseUpdatedUserCountStrings)

return {
	name = script.Name,
	alias = { "/online" },
	clientRun = function(_, p1, _, _)
		-- upvalues: textChatService (ref), online (ref), fFlagExpChatUseUpdatedUserCountStringsModule (ref)
		local ok, status = pcall(function()
			-- upvalues: textChatService (copy), p1 (ref)
			return textChatService:GetChatableUserCountAsync(p1, "local")
		end)
		
		if ok then
			return {
				metadata = "Roblox.Online.Info",
				key = if fFlagExpChatUseUpdatedUserCountStringsModule then if status == 1 then "CoreScripts.TextChat.Online.Success.Singular3" else "CoreScripts.TextChat.Online.Success.Plural2" elseif status == 1 then "CoreScripts.TextChat.Online.Success.Singular" else "CoreScripts.TextChat.Online.Success.Plural",
				args = { RBX_COUNT = status }
			}
		end
		online:warning("GetChatableUserCountAsync ({}) failed: {}", "local", tostring(status))
		
		return nil
	end
}