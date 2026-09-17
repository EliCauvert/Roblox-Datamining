local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(chatUIPrimitives.Components.ExpressionTray.ExpressionTrayView)
local useExpressionTrayControllerModule = require(chatUIPrimitives.Hooks.useExpressionTrayController)
local useLayoutModeModule = require(chatUIPrimitives.Hooks.useLayoutMode)
local expressionCooldownStoreModule = require(chatUIPrimitives.expressionCooldownStore)
local expressionCatalogStoreModule = require(chatUIPrimitives.expressionCatalogStore)
local _ = require(chatUIPrimitives.UniversalMessage.Types)
local var1 = game:DefineFastInt("PresetChatCooldownLuaMs", 10000) / 1000
local disabled = signalsModule.createSignal("disabled")
local var2 = signalsModule.createSignal({})

return function(p1)
	-- upvalues: useLayoutModeModule (ref), signalsReactModule (ref), expressionCatalogStoreModule (ref), disabled (ref), var2 (ref), expressionCooldownStoreModule (ref), useExpressionTrayControllerModule (ref), reactModule (ref), var1 (ref)
	local var3 = useLayoutModeModule()
	local var4 = signalsReactModule.useSignalState(if p1 then expressionCatalogStoreModule.getStatus else disabled)
	local var5 = signalsReactModule.useSignalState(if p1 then expressionCatalogStoreModule.getCategoryGroups else var2)
	local var6 = signalsReactModule.useSignalState(expressionCooldownStoreModule.getCooldownEndsAtByKey)
	local var7 = useExpressionTrayControllerModule({ categoryGroups = var5 })
	local close = var7.close
	local var8 = reactModule.useRef(false)
	local var9 = if p1 then p1.canSend else false
	local var10 = if p1 then expressionCatalogStoreModule else nil
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var10 (ref), close (ref)
		if var9 and var10 ~= nil then
			var10.acquire()
			
			return function()
				-- upvalues: var10 (copy)
				var10.release()
			end
		end
		close()
	end, { var9, var10, close })
	local var11 = if p1 then p1.onKeyboardActivated else nil
	local var12 = reactModule.useCallback(function()
		-- upvalues: close (ref), var11 (ref)
		close()
		
		if var11 then
			var11()
		end
	end, { close, var11 })
	local var13 = if p1 then p1.sendExpression else nil
	local var14 = if p1 then p1.cooldownKeyForContent else nil
	local var15 = if p1 and p1.cooldownDurationSeconds ~= nil then p1.cooldownDurationSeconds else var1
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: var13 (ref), var14 (ref), expressionCooldownStoreModule (copy), var8 (ref), var15 (ref), close (ref)
		if var13 == nil then return end
		local var17 = if var14 ~= nil then p2.kind else var14(p2)
		
		if var17 ~= nil then
			local cooldownEndsAt = expressionCooldownStoreModule.getCooldownEndsAt(var17)
			
			if cooldownEndsAt ~= nil and os.clock() < cooldownEndsAt then return end
		end
		if var8.current then return end
		var8.current = true
		
		if var17 ~= nil then
			expressionCooldownStoreModule.startCooldown(var17, os.clock() + var15)
		end
		close()
		task.spawn(function()
			-- upvalues: var13 (copy), p2 (ref), var8 (copy), var17 (ref), expressionCooldownStoreModule (copy)
			local var18 = var13(p2)
			var8.current = false
			
			if not var18 and var17 ~= nil then
				expressionCooldownStoreModule.clearCooldown(var17)
			end
		end)
	end, { var13, var14, var15, close })
	local var17 = if p1 then p1.onOpenChanged else nil
	local var18 = var9 and (var4 == "enabled" and #var5 > 0)
	local var19 = var7.isOpen and var18
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var19 (ref)
		if var17 then
			var17(var19)
		end
	end, { var19, var17 })
	
	return if p1 == nil then nil else {
		isVisible = var18,
		isOpen = var7.isOpen,
		layoutMode = var3,
		focusNavEnabled = p1.focusNavEnabled,
		canLocalUserChat = p1.canLocalUserChat,
		footerText = p1.footerText,
		categoryGroups = var5,
		activeGroupId = var7.activeGroupId,
		cooldownDurationSeconds = var15,
		cooldownEndsAtByKey = var6,
		cooldownKeyForContent = var14,
		onEntryActivated = var7.onEntryActivated,
		onPressedOutside = close,
		onGroupActivated = var7.onGroupActivated,
		onExpressionActivated = var16,
		onKeyboardActivated = var12
	}
end