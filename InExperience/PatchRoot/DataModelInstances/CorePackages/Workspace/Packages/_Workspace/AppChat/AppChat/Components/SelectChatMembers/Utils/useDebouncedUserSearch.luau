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

return function(p0)
	-- upvalues: useDispatch (ref), useLocalUserId (ref), reactModule (ref), setTimeout (ref), networkingFriendsModule (ref), list (ref), cryoModule (ref), isUserInConversationModule (ref), loggerModule (ref), clearTimeout (ref)
	local var7 = useDispatch()
	local var8 = useLocalUserId()
	local var9 = reactModule.useRef(setTimeout(function() end, 250))
	local var10 = reactModule.useRef("")
	local var11, var12 = reactModule.useState({})
	local var13 = reactModule.useCallback(function(p1)
		-- upvalues: var7 (ref), networkingFriendsModule (copy), var8 (ref), list (copy), p0 (ref), var12 (ref), cryoModule (copy), isUserInConversationModule (copy), loggerModule (copy)
		var7(networkingFriendsModule.SearchFriendsByQuery.API(var8, { limit = 20, query = p1 })):andThen(function(p3)
			-- upvalues: list (copy), p0 (copy), var12 (copy), cryoModule (copy), isUserInConversationModule (copy)
			local p0_1 = p0 or { participants = {} }
			var12(cryoModule.List.filter(list.map(p3.responseBody.PageItems, function(p4)
				return tostring(p4.id)
			end), function(p5)
				-- upvalues: isUserInConversationModule (copy), p0_1 (ref)
				return not isUserInConversationModule(p5, p0_1)
			end))
		end):catch(function(p2)
			-- upvalues: loggerModule (copy), var12 (copy)
			loggerModule:error("Error searching friends:", p2)
			var12({})
		end)
	end, { var7, var8, p0 })
	local var14 = reactModule.useCallback(function(p6)
		-- upvalues: clearTimeout (copy), var9 (ref), var10 (ref), setTimeout (copy), var13 (ref), var12 (ref)
		clearTimeout(var9.current)
		var10.current = p6
		var9.current = setTimeout(function()
			-- upvalues: p6 (ref), var13 (copy), var12 (copy)
			if p6 == "" then
				var12({})
				
				return
			end
			var13(p6)
		end, 250)
	end, { var13 })
	reactModule.useEffect(function()
		-- upvalues: clearTimeout (copy), var9 (ref)
		return function()
			-- upvalues: clearTimeout (copy), var9 (copy)
			clearTimeout(var9.current)
		end
	end, {})
	
	return var11, var14, var10.current
end