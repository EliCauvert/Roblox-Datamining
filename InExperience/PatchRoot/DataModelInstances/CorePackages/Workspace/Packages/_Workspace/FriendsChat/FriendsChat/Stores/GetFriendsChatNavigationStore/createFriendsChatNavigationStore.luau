local parent = script:FindFirstAncestor("FriendsChat").Parent
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal
local getConversationStoreModule = require(parent.AppChat.GetConversationStore)
local getFFlagAppChatEnableRootedNavigationModule = require(parent.AppChat.getFFlagAppChatEnableRootedNavigation)

return function()
	-- upvalues: createSignal (ref), getFFlagAppChatEnableRootedNavigationModule (ref), signalsModule (ref), getConversationStoreModule (ref)
	local var3, var4 = createSignal(nil)
	local var5, var6 = createSignal(nil)
	local var7, var8 = createSignal(false)
	local var9 = var3
	
	local var10 = function() end
	
	if getFFlagAppChatEnableRootedNavigationModule() then
		var9 = signalsModule.createComputed(function(p0)
			-- upvalues: var3 (ref), getConversationStoreModule (copy)
			local var12 = var3(p0)
			
			return if var12 == nil then nil elseif getConversationStoreModule(p0).getConversation(var12, p0) == nil then nil else var12
		end)
		local var11 = nil
		var10 = signalsModule.createEffect(function(p1)
			-- upvalues: var3 (ref), var9 (write), var11 (write), var4 (ref)
			local var13 = var3(p1)
			local var14 = var9(p1)
			
			if var14 ~= nil then
				var11 = var14
				
				return
			elseif var13 == nil or var13 ~= var11 then
				var11 = nil
				
				return
			end
			var11 = nil
			var4(nil)
		end)
	end
	return {
		getSelectedConversationId = var3,
		getEffectiveConversationId = var9,
		setSelectedConversationId = var4,
		getFocusInputBarRequestTime = var5,
		requestFocusInputBar = function(p2)
			-- upvalues: var6 (ref)
			var6(p2 or os.clock())
		end,
		clearFocusInputBarRequest = function()
			-- upvalues: var6 (ref)
			var6(nil)
		end,
		getIsInputBarFocused = var7,
		setInputBarFocused = var8,
		cleanup = var10
	}
end