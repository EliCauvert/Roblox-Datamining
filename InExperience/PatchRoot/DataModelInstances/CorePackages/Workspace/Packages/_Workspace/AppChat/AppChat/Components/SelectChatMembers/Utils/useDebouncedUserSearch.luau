local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.Models.ConversationChannels)
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local list = require(parent.Cryo).List
local networkingFriendsModule = require(appChat.Http.NetworkingFriends)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local luauPolyfillModule = require(parent.LuauPolyfill)
local clearTimeout = luauPolyfillModule.clearTimeout
local setTimeout = luauPolyfillModule.setTimeout
local isUserInConversationModule = require(script.Parent.isUserInConversation)
local loggerModule = require(script.Parent.Parent.Logger)

return function(p1)
	-- upvalues: useDispatch (ref), useLocalUserId (ref), reactModule (ref), setTimeout (ref), networkingFriendsModule (ref), list (ref), cryoModule (ref), isUserInConversationModule (ref), loggerModule (ref), clearTimeout (ref)
	local var1 = useDispatch()
	local var2 = useLocalUserId()
	local var3 = reactModule.useRef(setTimeout(function() end, 250))
	local var4 = reactModule.useRef("")
	local var5, var6 = reactModule.useState({})
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), networkingFriendsModule (copy), var2 (ref), list (copy), p1 (ref), var6 (ref), cryoModule (copy), isUserInConversationModule (copy), loggerModule (copy)
		var1(networkingFriendsModule.SearchFriendsByQuery.API(var2, { limit = 20, query = p2 })):andThen(function(p3)
			-- upvalues: list (copy), p1 (copy), var6 (copy), cryoModule (copy), isUserInConversationModule (copy)
			local p4 = p1 or { participants = {} }
			var6(cryoModule.List.filter(list.map(p3.responseBody.PageItems, function(p5)
				return tostring(p5.id)
			end), function(p5)
				-- upvalues: isUserInConversationModule (copy), p4 (ref)
				return not isUserInConversationModule(p5, p4)
			end))
		end):catch(function(p3)
			-- upvalues: loggerModule (copy), var6 (copy)
			loggerModule:error("Error searching friends:", p3)
			var6({})
		end)
	end, { var1, var2, p1 })
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: clearTimeout (copy), var3 (ref), var4 (ref), setTimeout (copy), var7 (ref), var6 (ref)
		clearTimeout(var3.current)
		var4.current = p2
		var3.current = setTimeout(function()
			-- upvalues: p2 (ref), var7 (copy), var6 (copy)
			if p2 == "" then
				var6({})
				
				return
			end
			var7(p2)
		end, 250)
	end, { var7 })
	reactModule.useEffect(function()
		-- upvalues: clearTimeout (copy), var3 (ref)
		return function()
			-- upvalues: clearTimeout (copy), var3 (copy)
			clearTimeout(var3.current)
		end
	end, {})
	
	return var5, var8, var4.current
end