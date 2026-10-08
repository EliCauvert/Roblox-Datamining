local contextActionService = game:GetService("ContextActionService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(parent.ExpChatShared)
local configModule = require(expChat.Config)
local focusChatHotKeyActivatedModule = require(expChat.Actions.FocusChatHotKeyActivated)
local getTabShortcutBehaviorModule = require(script.Parent.getTabShortcutBehavior)
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
local value = Enum.ContextActionPriority.High.Value

local function selectIsChatHotkeyEnabled(p1)
	return p1.ChatVisibility.isChatHotkeyEnabled.value
end

local function selectDevDefinedFocusKeyCode(p1)
	return p1.ChatLayout.ChatInputBarSettings.KeyboardKeyCode
end

return function(p1)
	-- upvalues: contextActionService (ref), useSelector (ref), selectIsChatHotkeyEnabled (ref), useSelectedTabTypeModule (ref), selectDevDefinedFocusKeyCode (ref), useDispatch (ref), useStore (ref), reactModule (ref), configModule (ref), getTabShortcutBehaviorModule (ref), focusChatHotKeyActivatedModule (ref), fFlagExpChatTabShortcutNav (ref), getActiveTabState (ref), getFocusNavigationStoreModule (ref), shouldNavigateTabsModule (ref), getAdjacentTabNameModule (ref), selectTabByTypeModule (ref), tab (ref), value (ref)
	local contextActionService_1 = p1.contextActionService or contextActionService
	local var1 = useSelector(selectIsChatHotkeyEnabled)
	local var2 = useSelectedTabTypeModule()
	local var3 = useSelector(selectDevDefinedFocusKeyCode)
	local var4 = useDispatch()
	local var5 = useStore()
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
			local var6 = getTabShortcutBehaviorModule(var2)
			
			if var6.canOpenChat() then
				var4(focusChatHotKeyActivatedModule())
				
				return var6.focus({ keyCode = keyCode }) or Enum.ContextActionResult.Sink
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
		-- upvalues: fFlagExpChatTabShortcutNav (copy), getActiveTabState (copy), var5 (ref), getFocusNavigationStoreModule (copy), shouldNavigateTabsModule (copy), getAdjacentTabNameModule (copy), selectTabByTypeModule (copy), var4 (ref), getTabShortcutBehaviorModule (copy), tab (copy), contextActionService_1 (ref), value (copy)
		if fFlagExpChatTabShortcutNav then
			local function tryNavigateTabs(value)
				-- upvalues: getActiveTabState (copy), var5 (copy), getFocusNavigationStoreModule (copy), shouldNavigateTabsModule (copy), getAdjacentTabNameModule (copy), selectTabByTypeModule (copy), var4 (copy), getTabShortcutBehaviorModule (copy), tab (copy)
				local var6, var7 = getActiveTabState(var5)
				
				if var6 == nil then
					return false
				elseif var7[var6] == nil then
					return false
				end
				local var8 = getFocusNavigationStoreModule(false)
				local t = {}
				
				for i, v in var7 do
					table.insert(t, { name = v.name, tabIndex = v.tabIndex })
				end
				if not shouldNavigateTabsModule({
					isTabBarVisible = var8.getIsTabBarVisible(false),
					tabCount = #t,
					isChatFocused = var8.getIsChatFocused()
				}) then
					return false
				end
				local var9 = getAdjacentTabNameModule(t, var6, value)
				
				if var9 == nil then
					return false
				end
				local var10 = var7[var9]
				selectTabByTypeModule(var4, {
					shouldReorderTabs = false,
					channelName = var9,
					tabType = var10.type
				})
				var8.clearChatInputBarFocusRequest()
				getTabShortcutBehaviorModule(var10.type).focus({ keyCode = tab })
				var8.requestTabNavFocus(var9)
				
				return true
			end
			
			contextActionService_1:BindCoreActionAtPriority("ExpChatTabShortcutNav", function(_, p2, p3)
				-- upvalues: tab (copy), tryNavigateTabs (ref)
				return if not (p2 ~= Enum.UserInputState.Begin or p3 == nil) then if p3.KeyCode == tab then if tryNavigateTabs(if p3:IsModifierKeyDown(Enum.ModifierKey.Shift) then -1 else 1) then Enum.ContextActionResult.Sink else Enum.ContextActionResult.Pass else Enum.ContextActionResult.Pass else Enum.ContextActionResult.Pass
			end, false, value, tab)
			
			return function()
				-- upvalues: contextActionService_1 (copy)
				contextActionService_1:UnbindCoreAction("ExpChatTabShortcutNav")
			end
		end
	end, { contextActionService_1, var4, var5 })
	
	return nil
end