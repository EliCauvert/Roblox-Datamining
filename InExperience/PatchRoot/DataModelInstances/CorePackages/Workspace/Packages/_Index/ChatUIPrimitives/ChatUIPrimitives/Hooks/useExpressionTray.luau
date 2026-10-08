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
local fFlagExpChatExpressionTrayHostFetchModule = require(chatUIPrimitives.Flags.FFlagExpChatExpressionTrayHostFetch)
local disabled = signalsModule.createSignal("disabled")
local var2 = signalsModule.createSignal({})
local t = {}

return function(p1)
	-- upvalues: useLayoutModeModule (ref), fFlagExpChatExpressionTrayHostFetchModule (ref), expressionCatalogStoreModule (ref), signalsReactModule (ref), disabled (ref), var2 (ref), reactModule (ref), t (ref), expressionCooldownStoreModule (ref), useExpressionTrayControllerModule (ref), var1 (ref)
	local var3 = useLayoutModeModule()
	local var4 = if fFlagExpChatExpressionTrayHostFetchModule and p1 then p1.fetchExpressionItems else nil
	local var5 = if p1 and var4 == nil then expressionCatalogStoreModule else nil
	local var6 = signalsReactModule.useSignalState(if var5 then var5.getStatus else disabled)
	local var7 = signalsReactModule.useSignalState(if var5 then var5.getCategoryGroups else var2)
	local var8 = nil
	local var9 = nil
	
	if fFlagExpChatExpressionTrayHostFetchModule then
		local var10, var11 = reactModule.useState(nil)
		var8 = var10
		var9 = var11
	end
	if var4 ~= nil then
		var6 = if var8 then var8.status else "disabled"
		var7 = if var8 then var8.categoryGroups or t else t
	end
	local var12 = signalsReactModule.useSignalState(expressionCooldownStoreModule.getCooldownEndsAtByKey)
	local var13 = useExpressionTrayControllerModule({ categoryGroups = var7 })
	local close = var13.close
	local var14 = reactModule.useRef(false)
	local var15 = if p1 then p1.canSend else false
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var5 (ref), close (ref)
		if var15 and var5 ~= nil then
			var5.acquire()
			
			return function()
				-- upvalues: var5 (copy)
				var5.release()
			end
		end
		close()
	end, { var15, var5, close })
	
	if fFlagExpChatExpressionTrayHostFetchModule then
		reactModule.useEffect(function()
			-- upvalues: var15 (ref), var4 (ref), var9 (write)
			if var15 and var4 ~= nil then
				local var16 = true
				var9(nil)
				task.spawn(function()
					-- upvalues: var4 (copy), var16 (write), var9 (copy)
					local ok, status = pcall(var4)
					
					if var16 then
						var9(if ok then status else nil)
						
						return
					end
				end)
				
				return function()
					-- upvalues: var16 (write)
					var16 = false
				end
			end
			var9(nil)
		end, { var15, var4 })
	end
	local var16 = if p1 then p1.onKeyboardActivated else nil
	local var17 = reactModule.useCallback(function()
		-- upvalues: close (ref), var16 (ref)
		close()
		
		if var16 then
			var16()
		end
	end, { close, var16 })
	local var18 = if p1 then p1.sendExpression else nil
	local var19 = if p1 then p1.cooldownKeyForContent else nil
	local var20 = if p1 and p1.cooldownDurationSeconds ~= nil then p1.cooldownDurationSeconds else var1
	local var21 = reactModule.useCallback(function(p2)
		-- upvalues: var18 (ref), var19 (ref), expressionCooldownStoreModule (copy), var14 (ref), var20 (ref), close (ref)
		if var18 == nil then return end
		local var22 = if var19 ~= nil then p2.kind else var19(p2)
		
		if var22 ~= nil then
			local cooldownEndsAt = expressionCooldownStoreModule.getCooldownEndsAt(var22)
			
			if cooldownEndsAt ~= nil and os.clock() < cooldownEndsAt then return end
		end
		if var14.current then return end
		var14.current = true
		
		if var22 ~= nil then
			expressionCooldownStoreModule.startCooldown(var22, os.clock() + var20)
		end
		close()
		task.spawn(function()
			-- upvalues: var18 (copy), p2 (ref), var14 (copy), var22 (ref), expressionCooldownStoreModule (copy)
			local var23 = var18(p2)
			var14.current = false
			
			if not var23 and var22 ~= nil then
				expressionCooldownStoreModule.clearCooldown(var22)
			end
		end)
	end, { var18, var19, var20, close })
	local var22 = if p1 then p1.onOpenChanged else nil
	local var23 = var15 and (var6 == "enabled" and #var7 > 0)
	local var24 = var13.isOpen and var23
	reactModule.useEffect(function()
		-- upvalues: var22 (ref), var24 (ref)
		if var22 then
			var22(var24)
		end
	end, { var24, var22 })
	
	return if p1 == nil then nil else {
		isVisible = var23,
		isOpen = var13.isOpen,
		layoutMode = var3,
		focusNavEnabled = p1.focusNavEnabled,
		canLocalUserChat = p1.canLocalUserChat,
		footerText = p1.footerText,
		categoryGroups = var7,
		activeGroupId = var13.activeGroupId,
		cooldownDurationSeconds = var20,
		cooldownEndsAtByKey = var12,
		cooldownKeyForContent = var19,
		onEntryActivated = var13.onEntryActivated,
		onPressedOutside = close,
		onGroupActivated = var13.onGroupActivated,
		onExpressionActivated = var21,
		onKeyboardActivated = var17
	}
end