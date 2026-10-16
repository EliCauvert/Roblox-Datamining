local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(ChatUIPrimitives.Components.ExpressionTray.ExpressionTrayView)
local UseExpressionTrayControllerModule = require(ChatUIPrimitives.Hooks.useExpressionTrayController)
local UseLayoutModeModule = require(ChatUIPrimitives.Hooks.useLayoutMode)
local ExpressionCooldownStoreModule = require(ChatUIPrimitives.expressionCooldownStore)
local ExpressionCatalogStoreModule = require(ChatUIPrimitives.expressionCatalogStore)
local _ = require(ChatUIPrimitives.UniversalMessage.Types)
local PresetChatCooldownLuaMsRatio = game:DefineFastInt("PresetChatCooldownLuaMs", 10000) / 1000
local FFlagExpChatExpressionTrayHostFetchModule = require(ChatUIPrimitives.Flags.FFlagExpChatExpressionTrayHostFetch)
local Disabled = SignalsModule.createSignal("disabled")
local Signal = SignalsModule.createSignal({})
local t = {}

return function(p1) --[[ Line: 63 | Named "useExpressionTray" ]]
	-- upvalues: UseLayoutModeModule (copy), FFlagExpChatExpressionTrayHostFetchModule (copy), ExpressionCatalogStoreModule (copy), SignalsReactModule (copy), Disabled (copy), Signal (copy), ReactModule (copy), t (copy), ExpressionCooldownStoreModule (copy), UseExpressionTrayControllerModule (copy), PresetChatCooldownLuaMsRatio (copy)
	local UseLayoutModeModuleResult = UseLayoutModeModule()
	local FetchExpressionItems = if FFlagExpChatExpressionTrayHostFetchModule and p1 then p1.fetchExpressionItems else nil
	local ExpressionCatalogStoreModule1 = if p1 and FetchExpressionItems == nil then ExpressionCatalogStoreModule else nil
	local UseSignalStateResult = SignalsReactModule.useSignalState(if ExpressionCatalogStoreModule1 then ExpressionCatalogStoreModule1.getStatus else Disabled)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(if ExpressionCatalogStoreModule1 then ExpressionCatalogStoreModule1.getCategoryGroups else Signal)
	local v1 = nil
	local Callback = nil
	
	if FFlagExpChatExpressionTrayHostFetchModule then
		v1, Callback = ReactModule.useState(nil)
	end
	if FetchExpressionItems ~= nil then
		UseSignalStateResult = if v1 then v1.status else "disabled"
		UseSignalStateResult1 = v1 and v1.categoryGroups or t
	end
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(ExpressionCooldownStoreModule.getCooldownEndsAtByKey)
	local UseExpressionTrayControllerModuleResult = UseExpressionTrayControllerModule({ categoryGroups = UseSignalStateResult1 })
	local CloseFunction = UseExpressionTrayControllerModuleResult.close
	local UseRefResult = ReactModule.useRef(false)
	local CanSend = if p1 then p1.canSend else false
	ReactModule.useEffect(function() --[[ Line: 96 ]]
		-- upvalues: CanSend (copy), ExpressionCatalogStoreModule1 (copy), CloseFunction (copy)
		if not CanSend or ExpressionCatalogStoreModule1 == nil then
			CloseFunction()
			
			return
		end
		ExpressionCatalogStoreModule1.acquire()
		
		return function() --[[ Line: 102 ]]
			-- upvalues: ExpressionCatalogStoreModule1 (upval)
			ExpressionCatalogStoreModule1.release()
		end
	end, { CanSend, ExpressionCatalogStoreModule1, CloseFunction })
	
	if FFlagExpChatExpressionTrayHostFetchModule then
		ReactModule.useEffect(function() --[[ Line: 111 ]]
			-- upvalues: CanSend (copy), FetchExpressionItems (copy), Callback (ref)
			if not CanSend or FetchExpressionItems == nil then
				Callback(nil)
				
				return
			end
			local Flag = true
			Callback(nil)
			task.spawn(function() --[[ Line: 118 ]]
				-- upvalues: FetchExpressionItems (upval), Flag (ref), Callback (upval)
				local Success, Result = pcall(FetchExpressionItems)
				
				if Flag then
					Callback(if Success then Result else nil)
					
					return
				end
			end)
			
			return function() --[[ Line: 125 ]]
				-- upvalues: Flag (ref)
				Flag = false
			end
		end, { CanSend, FetchExpressionItems })
	end
	local OnKeyboardActivated = if p1 then p1.onKeyboardActivated else nil
	local UseResult = ReactModule.useCallback(function() --[[ Line: 132 ]]
		-- upvalues: CloseFunction (copy), OnKeyboardActivated (copy)
		CloseFunction()
		
		if OnKeyboardActivated then
			OnKeyboardActivated()
		end
	end, { CloseFunction, OnKeyboardActivated })
	local SendExpression = if p1 then p1.sendExpression else nil
	local CooldownKeyForContent = if p1 then p1.cooldownKeyForContent else nil
	local CooldownDurationSeconds = if p1 and p1.cooldownDurationSeconds ~= nil then p1.cooldownDurationSeconds else PresetChatCooldownLuaMsRatio
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 144 ]]
		-- upvalues: SendExpression (copy), CooldownKeyForContent (copy), ExpressionCooldownStoreModule (upval), UseRefResult (copy), CooldownDurationSeconds (copy), CloseFunction (copy)
		if SendExpression == nil then return end
		local Kind = if CooldownKeyForContent == nil then p2.kind else CooldownKeyForContent(p2)
		
		if Kind ~= nil then
			local CooldownEndsAt = ExpressionCooldownStoreModule.getCooldownEndsAt(Kind)
			
			if CooldownEndsAt ~= nil and os.clock() < CooldownEndsAt then return end
		end
		if UseRefResult.current then return end
		UseRefResult.current = true
		
		if Kind ~= nil then
			ExpressionCooldownStoreModule.startCooldown(Kind, os.clock() + CooldownDurationSeconds)
		end
		CloseFunction()
		task.spawn(function() --[[ Line: 166 ]]
			-- upvalues: SendExpression (upval), p2 (copy), UseRefResult (upval), Kind (copy), ExpressionCooldownStoreModule (upval)
			UseRefResult.current = false
			
			if not SendExpression(p2) and Kind ~= nil then
				ExpressionCooldownStoreModule.clearCooldown(Kind)
			end
		end)
	end, {
		SendExpression,
		CooldownKeyForContent,
		CooldownDurationSeconds,
		CloseFunction
	})
	local OnOpenChanged = if p1 then p1.onOpenChanged else nil
	local IsVisible: boolean = CanSend and (UseSignalStateResult == "enabled" and #UseSignalStateResult1 > 0)
	local IsVisible1: boolean = UseExpressionTrayControllerModuleResult.isOpen and IsVisible
	ReactModule.useEffect(function() --[[ Line: 180 ]]
		-- upvalues: OnOpenChanged (copy), IsVisible1 (copy)
		if OnOpenChanged then
			OnOpenChanged(IsVisible1)
		end
	end, { IsVisible1, OnOpenChanged })
	
	return if p1 == nil then nil else {
		isVisible = IsVisible,
		isOpen = UseExpressionTrayControllerModuleResult.isOpen,
		layoutMode = UseLayoutModeModuleResult,
		focusNavEnabled = p1.focusNavEnabled,
		canLocalUserChat = p1.canLocalUserChat,
		footerText = p1.footerText,
		categoryGroups = UseSignalStateResult1,
		activeGroupId = UseExpressionTrayControllerModuleResult.activeGroupId,
		cooldownDurationSeconds = CooldownDurationSeconds,
		cooldownEndsAtByKey = UseSignalStateResult2,
		cooldownKeyForContent = CooldownKeyForContent,
		onEntryActivated = UseExpressionTrayControllerModuleResult.onEntryActivated,
		onPressedOutside = CloseFunction,
		onGroupActivated = UseExpressionTrayControllerModuleResult.onGroupActivated,
		onExpressionActivated = UseResult1,
		onKeyboardActivated = UseResult
	}
end