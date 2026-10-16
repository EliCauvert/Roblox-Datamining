local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local LuauPolyfillModule = require(AppChatNetworking.Parent.LuauPolyfill)
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local _ = require(AppChatNetworking.responses.SharedTypes)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(Callback, p1, p2, Name) --[[ Line: 15 ]]
	-- upvalues: LuauPolyfillModule (copy), CHATPLATFORMBASEURLModule (copy)
	return Callback(CHATPLATFORMBASEURLModule):path("v1"):path("create-conversations"):body({
		conversations = {
			{
				type = p1,
				name = Name,
				participant_user_ids = LuauPolyfillModule.Array.map(p2, function(p3): number --[[ Line: 21 ]]
					return (tonumber(p3))
				end)
			}
		}
	}):setStatusIds(p2)
end)