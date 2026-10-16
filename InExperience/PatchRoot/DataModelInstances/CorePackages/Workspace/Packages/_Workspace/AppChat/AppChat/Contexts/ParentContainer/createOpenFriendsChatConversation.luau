local AppChat = script:FindFirstAncestor("AppChat")
local PromiseModule = require(AppChat.Parent.Promise)
local ChatSessionRefCountModule = require(AppChat.Hooks.ChatSessionRefCount)

return function(p1) --[[ Line: 16 | Named "createOpenFriendsChatConversation" ]]
	-- upvalues: ChatSessionRefCountModule (copy), PromiseModule (copy)
	local v1 = nil
	local Count = 0
	
	return function(p2) --[[ Line: 23 ]]
		-- upvalues: ChatSessionRefCountModule (upval), v1 (ref), Count (ref), PromiseModule (upval), p1 (copy)
		ChatSessionRefCountModule.reserve()
		
		if v1 ~= nil then
			v1:cancel()
		end
		Count += 1
		local Count1: number = Count
		local Flag = true
		
		local function _() --[[ Line: 35 | Named "cancelReservation" ]]
			-- upvalues: Flag (ref), ChatSessionRefCountModule (upval)
			if Flag then
				Flag = false
				ChatSessionRefCountModule.acquire()
				ChatSessionRefCountModule.release()
				
				return
			end
		end
		
		local Promise = PromiseModule.resolve():andThen(function() --[[ Line: 48 ]]
			-- upvalues: p1 (upval), p2 (copy)
			return if p1.isChatAvailable() then p1.openConversation(p2) else false
		end):andThen(function(Result) --[[ Line: 54 ]]
			-- upvalues: p1 (upval)
			return if Result then p1.requestSelectFriendsTab() else false
		end):andThen(function(Result): boolean --[[ Line: 60 ]]
			-- upvalues: p1 (upval), Count1 (copy), Count (upval), Flag (ref)
			if Result then
				p1.ensureOpenChat(function(): boolean --[[ Line: 64 ]]
					-- upvalues: Count1 (upval), Count (upval)
					return Count1 == Count
				end)
				Flag = false
				
				return true
			else
				return false
			end
		end):catch(function(): boolean --[[ Line: 70 ]]
			return false
		end):andThen(function(Result) --[[ Line: 73 ]]
			-- upvalues: Flag (ref), ChatSessionRefCountModule (upval)
			if not Result then
				if not Flag then
					return Result
				end
				Flag = false
				ChatSessionRefCountModule.acquire()
				ChatSessionRefCountModule.release()
			end
			return Result
		end)
		local NewPromise = PromiseModule.new(function(p3, p4, Callback: (any) -> ()) --[[ Line: 80 ]]
			-- upvalues: Flag (ref), ChatSessionRefCountModule (upval), Promise (copy)
			Callback(function() --[[ Line: 81 ]]
				-- upvalues: Flag (upval), ChatSessionRefCountModule (upval), Promise (upval)
				if Flag then
					Flag = false
					ChatSessionRefCountModule.acquire()
					ChatSessionRefCountModule.release()
				end
				Promise:cancel()
			end)
			Promise:andThen(p3, p4)
		end)
		Promise:finally(function() --[[ Line: 87 ]]
			-- upvalues: Promise (copy), PromiseModule (upval), NewPromise (copy)
			if Promise:getStatus() == PromiseModule.Status.Cancelled then
				NewPromise:cancel()
			end
		end)
		v1 = NewPromise
		
		return NewPromise
	end
end