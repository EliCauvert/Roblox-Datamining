local appChat = script:FindFirstAncestor("AppChat")
local promiseModule = require(appChat.Parent.Promise)
local chatSessionRefCountModule = require(appChat.Hooks.ChatSessionRefCount)

return function(p0) --[[ line: 16 | named "createOpenFriendsChatConversation" ]]
	-- upvalues: chatSessionRefCountModule (ref), promiseModule (ref)
	local var3 = nil
	local var4 = 0
	
	return function(p1) --[[ line: 23 ]]
		-- upvalues: chatSessionRefCountModule (copy), var3 (write), var4 (write), promiseModule (copy), p0 (ref)
		chatSessionRefCountModule.reserve()
		
		if var3 ~= nil then
			var3:cancel()
		end
		var4 += 1
		local var5 = var4
		local var6 = true
		
		local function _() --[[ line: 35 | named "cancelReservation" ]]
			-- upvalues: var6 (write), chatSessionRefCountModule (copy)
			if var6 then
				var6 = false
				chatSessionRefCountModule.acquire()
				chatSessionRefCountModule.release()
				
				return
			end
		end
		
		local var7 = promiseModule.resolve():andThen(function() --[[ line: 48 ]]
			-- upvalues: p0 (copy), p1 (ref)
			return if p0.isChatAvailable() then p0.openConversation(p1) else false
		end):andThen(function(p4) --[[ line: 54 ]]
			-- upvalues: p0 (copy)
			return if p4 then p0.requestSelectTab("FriendsChat") else false
		end):andThen(function(p3) --[[ line: 60 ]]
			-- upvalues: p0 (copy), var5 (ref), var4 (copy), var6 (write)
			if p3 then
				p0.ensureOpenChat(function() --[[ line: 64 ]]
					-- upvalues: var5 (copy), var4 (copy)
					return var5 == var4
				end)
				var6 = false
				
				return true
			end
			return false
		end):catch(function() --[[ line: 70 ]]
			return false
		end):andThen(function(p2) --[[ line: 73 ]]
			-- upvalues: var6 (write), chatSessionRefCountModule (copy)
			if not p2 then
				if not var6 then
					return p2
				end
				var6 = false
				chatSessionRefCountModule.acquire()
				chatSessionRefCountModule.release()
			end
			return p2
		end)
		local var8 = promiseModule.new(function(p5, p6, p7) --[[ line: 80 ]]
			-- upvalues: var6 (write), chatSessionRefCountModule (copy), var7 (ref)
			p7(function() --[[ line: 81 ]]
				-- upvalues: var6 (copy), chatSessionRefCountModule (copy), var7 (copy)
				if var6 then
					var6 = false
					chatSessionRefCountModule.acquire()
					chatSessionRefCountModule.release()
				end
				var7:cancel()
			end)
			var7:andThen(p5, p6)
		end)
		var7:finally(function() --[[ line: 87 ]]
			-- upvalues: var7 (ref), promiseModule (copy), var8 (ref)
			if var7:getStatus() == promiseModule.Status.Cancelled then
				var8:cancel()
			end
		end)
		var3 = var8
		
		return var8
	end
end