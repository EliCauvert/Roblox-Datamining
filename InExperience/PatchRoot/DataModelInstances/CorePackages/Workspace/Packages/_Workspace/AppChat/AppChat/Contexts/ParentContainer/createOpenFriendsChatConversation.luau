local appChat = script:FindFirstAncestor("AppChat")
local promiseModule = require(appChat.Parent.Promise)
local chatSessionRefCountModule = require(appChat.Hooks.ChatSessionRefCount)

return function(p1)
	-- upvalues: chatSessionRefCountModule (ref), promiseModule (ref)
	local var1 = nil
	local var2 = 0
	
	return function(p2)
		-- upvalues: chatSessionRefCountModule (copy), var1 (write), var2 (write), promiseModule (copy), p1 (ref)
		chatSessionRefCountModule.reserve()
		
		if var1 ~= nil then
			var1:cancel()
		end
		var2 += 1
		local var3 = var2
		local var4 = true
		
		local function _()
			-- upvalues: var4 (write), chatSessionRefCountModule (copy)
			if var4 then
				var4 = false
				chatSessionRefCountModule.acquire()
				chatSessionRefCountModule.release()
				
				return
			end
		end
		
		local var5 = promiseModule.resolve():andThen(function()
			-- upvalues: p1 (copy), p2 (ref)
			return if p1.isChatAvailable() then p1.openConversation(p2) else false
		end):andThen(function(p3)
			-- upvalues: p1 (copy)
			return if p3 then p1.requestSelectFriendsTab() else false
		end):andThen(function(p3)
			-- upvalues: p1 (copy), var3 (ref), var2 (copy), var4 (write)
			if p3 then
				p1.ensureOpenChat(function()
					-- upvalues: var3 (copy), var2 (copy)
					return var3 == var2
				end)
				var4 = false
				
				return true
			end
			return false
		end):catch(function()
			return false
		end):andThen(function(p3)
			-- upvalues: var4 (write), chatSessionRefCountModule (copy)
			if not p3 then
				if not var4 then
					return p3
				end
				var4 = false
				chatSessionRefCountModule.acquire()
				chatSessionRefCountModule.release()
			end
			return p3
		end)
		local var6 = promiseModule.new(function(p3, p4, p5)
			-- upvalues: var4 (write), chatSessionRefCountModule (copy), var5 (ref)
			p5(function()
				-- upvalues: var4 (copy), chatSessionRefCountModule (copy), var5 (copy)
				if var4 then
					var4 = false
					chatSessionRefCountModule.acquire()
					chatSessionRefCountModule.release()
				end
				var5:cancel()
			end)
			var5:andThen(p3, p4)
		end)
		var5:finally(function()
			-- upvalues: var5 (ref), promiseModule (copy), var6 (ref)
			if var5:getStatus() == promiseModule.Status.Cancelled then
				var6:cancel()
			end
		end)
		var1 = var6
		
		return var6
	end
end