local parent = script:FindFirstAncestor("FriendsChat").Parent
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal
local getConversationStoreModule = require(parent.AppChat.GetConversationStore)
local getFFlagAppChatEnableRootedNavigationModule = require(parent.AppChat.getFFlagAppChatEnableRootedNavigation)

return function()
	-- upvalues: createSignal (ref), getFFlagAppChatEnableRootedNavigationModule (ref), signalsModule (ref), getConversationStoreModule (ref)
	local var1, var2 = createSignal(nil)
	local var3, var4 = createSignal(nil)
	local var5, var6 = createSignal(false)
	local var7 = var1
	
	local var8 = function() end
	
	if getFFlagAppChatEnableRootedNavigationModule() then
		var7 = signalsModule.createComputed(function(p1)
			-- upvalues: var1 (ref), getConversationStoreModule (copy)
			local var9 = var1(p1)
			
			return if var9 == nil then nil elseif getConversationStoreModule(p1).getConversation(var9, p1) == nil then nil else var9
		end)
		local var9 = nil
		var8 = signalsModule.createEffect(function(p1)
			-- upvalues: var1 (ref), var7 (write), var9 (write), var2 (ref)
			local var10 = var1(p1)
			local var11 = var7(p1)
			
			if var11 ~= nil then
				var9 = var11
				
				return
			elseif var10 == nil or var10 ~= var9 then
				var9 = nil
				
				return
			end
			var9 = nil
			var2(nil)
		end)
	end
	return {
		getSelectedConversationId = var1,
		getEffectiveConversationId = var7,
		setSelectedConversationId = var2,
		getFocusInputBarRequestTime = var3,
		requestFocusInputBar = function(p1)
			-- upvalues: var4 (ref)
			var4(p1 or os.clock())
		end,
		clearFocusInputBarRequest = function()
			-- upvalues: var4 (ref)
			var4(nil)
		end,
		getIsInputBarFocused = var5,
		setInputBarFocused = var6,
		cleanup = var8
	}
end