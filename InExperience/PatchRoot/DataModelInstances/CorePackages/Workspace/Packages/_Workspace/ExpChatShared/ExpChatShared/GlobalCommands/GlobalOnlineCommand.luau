local TextChatService = game:GetService("TextChatService")
local ExpChatShared = script:FindFirstAncestor("ExpChatShared")
local Online = require(ExpChatShared.Logger):new("ExpChat/GlobalCommand/Online")
local _ = require(script.Parent.types)
local FFlagExpChatUseUpdatedUserCountStringsModule = require(ExpChatShared.Flags.FFlagExpChatUseUpdatedUserCountStrings)

return {
	name = script.Name,
	alias = { "/online" },
	clientRun = function(_, UserId, _, _) --[[ Line: 15 ]]
		-- upvalues: TextChatService (copy), Online (copy), FFlagExpChatUseUpdatedUserCountStringsModule (copy)
		local Success, Result = pcall(function() --[[ Line: 16 ]]
			-- upvalues: TextChatService (upval), UserId (copy)
			return TextChatService:GetChatableUserCountAsync(UserId, "global")
		end)
		
		if Success then
			return {
				metadata = "Roblox.GlobalOnline.Info",
				key = if FFlagExpChatUseUpdatedUserCountStringsModule then if Result == 1 then "CoreScripts.TextChat.Online.Success.Singular3" else "CoreScripts.TextChat.Online.Success.Plural2" elseif Result == 1 then "CoreScripts.TextChat.Online.Success.Singular" else "CoreScripts.TextChat.Online.Success.Plural",
				args = { RBX_COUNT = Result }
			}
		else
			Online:warning("GetChatableUserCountAsync ({}) failed: {}", "global", (tostring(Result)))
			
			return nil
		end
	end
}