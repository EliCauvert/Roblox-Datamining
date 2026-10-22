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
local _ = require(ChatUIPrimitives.createExpressionCatalogResource)
local _ = require(ChatUIPrimitives.UniversalMessage.Types)
local PresetChatCooldownLuaMsRatio = game:DefineFastInt("PresetChatCooldownLuaMs", 10000) / 1000
local Disabled = SignalsModule.createSignal("disabled")
local Signal = SignalsModule.createSignal({})
local Signal1 = SignalsModule.createSignal(nil)
local t = {}

return function(p1)
	-- upvalues: UseLayoutModeModule (copy), ExpressionCatalogStoreModule (copy), SignalsReactModule (copy), Disabled (copy), Signal (copy), Signal1 (copy), t (copy), ExpressionCooldownStoreModule (copy), UseExpressionTrayControllerModule (copy), ReactModule (copy), PresetChatCooldownLuaMsRatio (copy)
	local UseLayoutModeModuleResult = UseLayoutModeModule()
	local CatalogResource = if p1 then p1.catalogResource else nil
	local ExpressionCatalogStoreModule1 = if p1 == nil or CatalogResource ~= nil then nil else ExpressionCatalogStoreModule
	local UseSignalStateResult = SignalsReactModule.useSignalState(if ExpressionCatalogStoreModule1 == nil then Disabled else ExpressionCatalogStoreModule1.getStatus)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(if ExpressionCatalogStoreModule1 == nil then Signal else ExpressionCatalogStoreModule1.getCategoryGroups)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(if CatalogResource == nil then Signal1 else CatalogResource.getCatalog)
	local Disabled1 = nil
	local T = nil
	
	if CatalogResource == nil then
		Disabled1 = UseSignalStateResult
		T = UseSignalStateResult1
	else
		Disabled1 = if UseSignalStateResult2 == nil then "disabled" else UseSignalStateResult2.status
		local CategoryGroups = if UseSignalStateResult2 == nil then nil else UseSignalStateResult2.categoryGroups
		T = if CategoryGroups == nil then t else CategoryGroups
	end
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(ExpressionCooldownStoreModule.getCooldownEndsAtByKey)
	local UseExpressionTrayControllerModuleResult = UseExpressionTrayControllerModule({ categoryGroups = T })
	local CloseFunction = UseExpressionTrayControllerModuleResult.close
	local UseRefResult = ReactModule.useRef(false)
	local CanSend = if p1 then p1.canSend else false
	ReactModule.useEffect(function()
		-- upvalues: CatalogResource (copy), CanSend (copy), CloseFunction (copy), ExpressionCatalogStoreModule1 (copy)
		if CatalogResource == nil then
			if not CanSend or ExpressionCatalogStoreModule1 == nil then
				CloseFunction()
				
				return
			end
			ExpressionCatalogStoreModule1.acquire()
			
			return function()
				-- upvalues: ExpressionCatalogStoreModule1 (upval)
				ExpressionCatalogStoreModule1.release()
			end
		elseif not CanSend then
			CloseFunction()
			
			return
		else
			CatalogResource.acquire()
			
			return function()
				-- upvalues: CatalogResource (copy)
				CatalogResource.release()
			end
		end
	end, {
		CanSend,
		CatalogResource,
		ExpressionCatalogStoreModule1,
		CloseFunction
	})
	local OnKeyboardActivated = if p1 then p1.onKeyboardActivated else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: CloseFunction (copy), OnKeyboardActivated (copy)
		CloseFunction()
		
		if OnKeyboardActivated then
			OnKeyboardActivated()
		end
	end, { CloseFunction, OnKeyboardActivated })
	local SendExpression = if p1 then p1.sendExpression else nil
	local CooldownKeyForContent = if p1 then p1.cooldownKeyForContent else nil
	local CooldownDurationSeconds = if p1 and p1.cooldownDurationSeconds ~= nil then p1.cooldownDurationSeconds else PresetChatCooldownLuaMsRatio
	local UseResult1 = ReactModule.useCallback(function(p2)
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
		task.spawn(function()
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
	local IsVisible: boolean = CanSend and (Disabled1 == "enabled" and #T > 0)
	local IsVisible1: boolean = UseExpressionTrayControllerModuleResult.isOpen and IsVisible
	ReactModule.useEffect(function()
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
		categoryGroups = T,
		activeGroupId = UseExpressionTrayControllerModuleResult.activeGroupId,
		cooldownDurationSeconds = CooldownDurationSeconds,
		cooldownEndsAtByKey = UseSignalStateResult3,
		cooldownKeyForContent = CooldownKeyForContent,
		onEntryActivated = UseExpressionTrayControllerModuleResult.onEntryActivated,
		onPressedOutside = CloseFunction,
		onGroupActivated = UseExpressionTrayControllerModuleResult.onGroupActivated,
		onExpressionActivated = UseResult1,
		onKeyboardActivated = UseResult
	}
end