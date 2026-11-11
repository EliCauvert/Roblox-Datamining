local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.Models.ConversationChannels)
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local List = require(Parent.Cryo).List
local NetworkingFriendsModule = require(AppChat.Http.NetworkingFriends)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local IsUserInConversationModule = require(script.Parent.isUserInConversation)
local LoggerModule = require(script.Parent.Parent.Logger)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseLocalUserIdFunction (copy), ReactModule (copy), SetTimeoutFunction (copy), NetworkingFriendsModule (copy), List (copy), CryoModule (copy), IsUserInConversationModule (copy), LoggerModule (copy), ClearTimeoutFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseRefResult = ReactModule.useRef(SetTimeoutFunction(function() end, 250))
	local UseRefResult1 = ReactModule.useRef("")
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseResult = ReactModule.useCallback(function(Query)
		-- upvalues: UseDispatchResult (copy), NetworkingFriendsModule (upval), UseLocalUserIdResult (copy), List (upval), p1 (copy), UseStateResult2 (copy), CryoModule (upval), IsUserInConversationModule (upval), LoggerModule (upval)
		UseDispatchResult(NetworkingFriendsModule.SearchFriendsByQuery.API(UseLocalUserIdResult, { limit = 20, query = Query })):andThen(function(Result)
			-- upvalues: List (upval), p1 (upval), UseStateResult2 (upval), CryoModule (upval), IsUserInConversationModule (upval)
			local P0 = p1 or { participants = {} }
			UseStateResult2(CryoModule.List.filter(List.map(Result.responseBody.PageItems, function(p2): string
				return (tostring(p2.id))
			end), function(p2): boolean
				-- upvalues: IsUserInConversationModule (upval), P0 (copy)
				return not IsUserInConversationModule(p2, P0)
			end))
		end):catch(function(Err)
			-- upvalues: LoggerModule (upval), UseStateResult2 (upval)
			LoggerModule:error("Error searching friends:", Err)
			UseStateResult2({})
		end)
	end, { UseDispatchResult, UseLocalUserIdResult, p1 })
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: ClearTimeoutFunction (upval), UseRefResult (copy), UseRefResult1 (copy), SetTimeoutFunction (upval), UseResult (copy), UseStateResult2 (copy)
		ClearTimeoutFunction(UseRefResult.current)
		UseRefResult1.current = Current
		UseRefResult.current = SetTimeoutFunction(function()
			-- upvalues: Current (copy), UseResult (upval), UseStateResult2 (upval)
			if Current == "" then
				UseStateResult2({})
				
				return
			else
				UseResult(Current)
			end
		end, 250)
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: ClearTimeoutFunction (upval), UseRefResult (copy)
		return function()
			-- upvalues: ClearTimeoutFunction (upval), UseRefResult (upval)
			ClearTimeoutFunction(UseRefResult.current)
		end
	end, {})
	
	return UseStateResult, UseResult1, UseRefResult1.current
end