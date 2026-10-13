local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(parent.ExpChatShared)
local chatTabNavigationSignal = require(parent.ChatUIPrimitives).chatTabNavigationSignal
local configModule = require(expChat.Config)
local focusChatHotKeyActivatedModule = require(expChat.Actions.FocusChatHotKeyActivated)
local getTabShortcutBehaviorModule = require(script.Parent.getTabShortcutBehavior)
local chatFocusRequestSignalModule = require(script.Parent.chatFocusRequestSignal)
local focusNavigationExperimentModule = require(script.Parent.FocusNavigationExperiment)
local fFlagExpChatGenericChatFocusModule = require(expChat.Flags.FFlagExpChatGenericChatFocus)
local useSelectedTabTypeModule = require(expChat.useSelectedTabType)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local getFocusNavigationStoreModule = require(expChat.Stores.GetFocusNavigationStore)
local getAdjacentTabNameModule = require(expChat.TabNavigation.getAdjacentTabName)
local selectTabByTypeModule = require(expChat.TabNavigation.selectTabByType)
local shouldNavigateTabsModule = require(expChat.TabNavigation.shouldNavigateTabs)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useStore = roactUtilsModule.Hooks.RoactRodux.useStore
local fFlagExpChatTabShortcutNav = sharedFlagsModule.FFlagExpChatTabShortcutNav
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore

local function getActiveTabState(value)
	-- upvalues: fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref)
	if fFlagExpChatUseChannelTabsStore then
		local channelTabsState = getChannelTabsStoreModule(false).getChannelTabsState(false)
		
		return channelTabsState.selectedTabName, channelTabsState.allChannelTabs
	end
	local channelTabs = value:getState().ChannelTabs
	
	if channelTabs == nil or channelTabs.allChannelTabs == nil then
		return nil, {}
	end
	local t = {}
	
	for i, v in channelTabs.allChannelTabs do
		t[i] = { name = i, tabIndex = v.TabIndex, type = v.Type }
	end
	return channelTabs.selectedTabName, t
end

local tab = Enum.KeyCode.Tab
local t = {
	[Enum.KeyCode.ButtonR1] = 1,
	[Enum.KeyCode.ButtonL1] = -1
}
local value = Enum.ContextActionPriority.High.Value

local function selectIsChatHotkeyEnabled(p1)
	return p1.ChatVisibility.isChatHotkeyEnabled.value
end

local function selectDevDefinedFocusKeyCode(p1)
	return p1.ChatLayout.ChatInputBarSettings.KeyboardKeyCode
end

return function(p1)
	-- upvalues: contextActionService (ref), useSelector (ref), selectIsChatHotkeyEnabled (ref), useSelectedTabTypeModule (ref), selectDevDefinedFocusKeyCode (ref), useDispatch (ref), useStore (ref), focusNavigationExperimentModule (ref), reactModule (ref), configModule (ref), getTabShortcutBehaviorModule (ref), focusChatHotKeyActivatedModule (ref), fFlagExpChatGenericChatFocusModule (ref), chatFocusRequestSignalModule (ref), fFlagExpChatTabShortcutNav (ref), getActiveTabState (ref), getFocusNavigationStoreModule (ref), shouldNavigateTabsModule (ref), getAdjacentTabNameModule (ref), selectTabByTypeModule (ref), tab (ref), t (ref), value (ref), chatTabNavigationSignal (ref), guiService (ref)
	local contextActionService_1 = p1.contextActionService or contextActionService
	local var1 = useSelector(selectIsChatHotkeyEnabled)
	local var2 = useSelectedTabTypeModule()
	local var3 = useSelector(selectDevDefinedFocusKeyCode)
	local var4 = useDispatch()
	local var5 = useStore()
	local var6 = if focusNavigationExperimentModule.isExposureLoggingEnabled then reactModule.useRef(false) else nil
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), configModule (copy), var3 (ref), var2 (ref), getTabShortcutBehaviorModule (copy), var4 (ref), focusChatHotKeyActivatedModule (copy), contextActionService_1 (ref)
		contextActionService_1:BindCoreAction("ExpChatFocusHotKey", function(_, p2, p3)
			-- upvalues: var1 (copy), configModule (copy), var3 (copy), var2 (copy), getTabShortcutBehaviorModule (copy), var4 (copy), focusChatHotKeyActivatedModule (copy)
			if not var1 then
				return Enum.ContextActionResult.Pass
			elseif p2 ~= Enum.UserInputState.Begin or p3 == nil then
				return Enum.ContextActionResult.Pass
			end
			local keyCode = p3.KeyCode
			
			if keyCode ~= configModule.ChatInputBarDefaultFocusKeyCode and keyCode ~= var3 then
				return Enum.ContextActionResult.Pass
			elseif var2 == nil then
				return Enum.ContextActionResult.Pass
			end
			local var7 = getTabShortcutBehaviorModule(var2)
			
			if var7.canOpenChat() then
				var4(focusChatHotKeyActivatedModule())
				
				return var7.focus({ keyCode = keyCode }) or Enum.ContextActionResult.Sink
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.UserInputType.Keyboard)
		
		return function()
			-- upvalues: contextActionService_1 (copy)
			contextActionService_1:UnbindCoreAction("ExpChatFocusHotKey")
		end
	end, {
		var1,
		var2,
		var3,
		contextActionService_1,
		var4
	})
	reactModule.useEffect(function()
		-- upvalues: fFlagExpChatGenericChatFocusModule (copy), var2 (ref), getTabShortcutBehaviorModule (copy), chatFocusRequestSignalModule (copy)
		if fFlagExpChatGenericChatFocusModule and var2 ~= nil then
			local var7 = getTabShortcutBehaviorModule(var2)
			local var8 = chatFocusRequestSignalModule:connect(function()
				-- upvalues: var7 (ref)
				if var7.focus ~= nil and var7.canOpenChat() then
					var7.focus({ keyCode = Enum.KeyCode.None })
				end
			end)
			
			return function()
				-- upvalues: var8 (ref)
				var8.disconnect()
			end
		end
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: fFlagExpChatTabShortcutNav (copy), getActiveTabState (copy), var5 (ref), getFocusNavigationStoreModule (copy), shouldNavigateTabsModule (copy), getAdjacentTabNameModule (copy), var6 (write), focusNavigationExperimentModule (copy), selectTabByTypeModule (copy), var4 (ref), getTabShortcutBehaviorModule (copy), tab (copy), t (copy), contextActionService_1 (ref), value (copy), chatTabNavigationSignal (copy)
		if fFlagExpChatTabShortcutNav then
			local function tryNavigateTabs(value, p2)
				-- upvalues: getActiveTabState (copy), var5 (copy), getFocusNavigationStoreModule (copy), shouldNavigateTabsModule (copy), getAdjacentTabNameModule (copy), var6 (copy), focusNavigationExperimentModule (copy), selectTabByTypeModule (copy), var4 (copy), getTabShortcutBehaviorModule (copy), tab (copy)
				local var7, var8 = getActiveTabState(var5)
				
				if var7 == nil then
					return false
				elseif var8[var7] == nil then
					return false
				end
				local var9 = getFocusNavigationStoreModule(false)
				local t = {}
				
				for i, v in var8 do
					table.insert(t, { name = v.name, tabIndex = v.tabIndex })
				end
				if not shouldNavigateTabsModule({
					isTabBarVisible = var9.getIsTabBarVisible(false),
					tabCount = #t,
					isChatFocused = if p2 ~= true then var9.getIsChatFocused() else true
				}) then
					return false
				end
				local var10 = getAdjacentTabNameModule(t, var7, value)
				
				if var10 == nil then
					return false
				end
				local var11 = var8[var10]
				
				if var6 and not var6.current then
					var6.current = true
					focusNavigationExperimentModule.logExposure()
				end
				if focusNavigationExperimentModule.isTabNavEnabled then
					selectTabByTypeModule(var4, {
						shouldReorderTabs = false,
						channelName = var10,
						tabType = var11.type
					})
					var9.clearChatInputBarFocusRequest()
					getTabShortcutBehaviorModule(var11.type).focus({ keyCode = tab })
					var9.requestTabNavFocus(var10)
					
					return true
				end
				return false
			end
			
			contextActionService_1:BindCoreActionAtPriority("ExpChatTabShortcutNav", function(_, p3, p4)
				-- upvalues: t (copy), tab (copy), tryNavigateTabs (ref)
				if p3 ~= Enum.UserInputState.Begin or p4 == nil then
					return Enum.ContextActionResult.Pass
				end
				local var12 = if p4.KeyCode == tab then if p4:IsModifierKeyDown(Enum.ModifierKey.Shift) then -1 else 1 else t[p4.KeyCode]
				
				return if var12 == nil then Enum.ContextActionResult.Pass elseif tryNavigateTabs(var12) then Enum.ContextActionResult.Sink else Enum.ContextActionResult.Pass
			end, false, value, tab, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1)
			local var12 = chatTabNavigationSignal:connect(function(p3)
				-- upvalues: tryNavigateTabs (ref)
				tryNavigateTabs(p3, true)
			end)
			
			return function()
				-- upvalues: contextActionService_1 (copy), var12 (ref)
				contextActionService_1:UnbindCoreAction("ExpChatTabShortcutNav")
				var12.disconnect()
			end
		end
	end, { contextActionService_1, var4, var5 })
	reactModule.useEffect(function()
		-- upvalues: fFlagExpChatTabShortcutNav (copy), getFocusNavigationStoreModule (copy), guiService (copy), contextActionService_1 (ref), value (copy)
		if fFlagExpChatTabShortcutNav then
			contextActionService_1:BindCoreActionAtPriority("ExpChatShortcutNavEscape", function(_, p2, _)
				-- upvalues: getFocusNavigationStoreModule (copy), guiService (copy)
				if p2 ~= Enum.UserInputState.Begin then
					return Enum.ContextActionResult.Pass
				elseif getFocusNavigationStoreModule(false).getIsChatFocused() then
					guiService.SelectedCoreObject = nil
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, value, Enum.KeyCode.Escape)
			
			return function()
				-- upvalues: contextActionService_1 (copy)
				contextActionService_1:UnbindCoreAction("ExpChatShortcutNavEscape")
			end
		end
	end, { contextActionService_1 })
	
	return nil
end