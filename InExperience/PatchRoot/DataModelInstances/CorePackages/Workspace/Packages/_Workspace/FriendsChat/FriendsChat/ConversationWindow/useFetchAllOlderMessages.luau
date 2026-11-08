local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local PromiseModule = require(Parent.Promise)
local FetchOlderMessagesModule = require(Parent.AppChat.fetchOlderMessages)
local FIntAppChatGetAllMessagesDepthModule = require(Parent.AppChat.FIntAppChatGetAllMessagesDepth)
local NewResult = require(Parent.ExpChatShared).Logger:new(script.Name)

return function(p1, p2): boolean
	-- upvalues: ReactModule (copy), FIntAppChatGetAllMessagesDepthModule (copy), PromiseModule (copy), FetchOlderMessagesModule (copy), NewResult (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), FIntAppChatGetAllMessagesDepthModule (upval), PromiseModule (upval), FetchOlderMessagesModule (upval), p1 (copy), NewResult (upval), UseStateResult2 (copy)
		if not p2 then return end
		local Flag = false
		
		local function fetchFrom(p3)
			-- upvalues: Flag (ref), FIntAppChatGetAllMessagesDepthModule (upval), PromiseModule (upval), FetchOlderMessagesModule (upval), p1 (upval), fetchFrom (copy)
			return if Flag or FIntAppChatGetAllMessagesDepthModule <= p3 then PromiseModule.resolve() else FetchOlderMessagesModule(p1):andThen(function(Result)
				-- upvalues: fetchFrom (upval), p3 (copy)
				return if Result.response == nil then nil else fetchFrom(p3 + 1)
			end)
		end
		local ResolveResult = nil
		
		if Flag or FIntAppChatGetAllMessagesDepthModule <= 0 then
			ResolveResult = PromiseModule.resolve()
		else
			local v1 = 0
			ResolveResult = FetchOlderMessagesModule(p1):andThen(function(Result)
				-- upvalues: fetchFrom (copy), v1 (copy)
				return if Result.response == nil then nil else fetchFrom(v1 + 1)
			end)
		end
		ResolveResult:catch(function(Err)
			-- upvalues: Flag (ref), NewResult (upval), p1 (upval)
			if not Flag then
				NewResult:warning(`Failed to fetch older messages for {p1}: {tostring(Err)}`)
			end
		end):finally(function()
			-- upvalues: Flag (ref), UseStateResult2 (upval), p1 (upval)
			if not Flag then
				UseStateResult2(p1)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { p1, p2 })
	
	return not p2 or UseStateResult == p1
end