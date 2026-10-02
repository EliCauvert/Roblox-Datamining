local parent = script:FindFirstAncestor("FriendsChat").Parent
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal
local getConversationStoreModule = require(parent.AppChat.GetConversationStore)
local getFFlagAppChatEnableRootedNavigationModule = require(parent.AppChat.getFFlagAppChatEnableRootedNavigation)

return function()
	-- upvalues: createSignal (ref), getFFlagAppChatEnableRootedNavigationModule (ref), signalsModule (ref), getConversationStoreModule (ref)
	local var1, var2 = createSignal(nil)
	local var3, var4 = createSignal(nil)
	local var5, var6 = createSignal(nil)
	local var7, var8 = createSignal(false)
	local var9 = var1
	
	local var10 = function() end
	
	if getFFlagAppChatEnableRootedNavigationModule() then
		var9 = signalsModule.createComputed(function(p1)
			-- upvalues: var1 (ref), getConversationStoreModule (copy)
			local var11 = var1(p1)
			
			return if var11 == nil then nil elseif getConversationStoreModule(p1).getConversation(var11, p1) == nil then nil else var11
		end)
		local var11 = nil
		var10 = signalsModule.createEffect(function(p1)
			-- upvalues: var1 (ref), var9 (write), var11 (write), var2 (ref)
			local var12 = var1(p1)
			local var13 = var9(p1)
			
			if var13 ~= nil then
				var11 = var13
				
				return
			elseif var12 == nil or var12 ~= var11 then
				var11 = nil
				
				return
			end
			var11 = nil
			var2(nil)
		end)
	end
	return {
		getSelectedConversationId = var1,
		getEffectiveConversationId = var9,
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
		getConversationListFocusRequestTime = var5,
		requestFocusConversationList = function(p1)
			-- upvalues: var6 (ref)
			var6(p1 or os.clock())
		end,
		clearConversationListFocusRequest = function()
			-- upvalues: var6 (ref)
			var6(nil)
		end,
		getIsInputBarFocused = var7,
		setInputBarFocused = var8,
		cleanup = var10
	}
end