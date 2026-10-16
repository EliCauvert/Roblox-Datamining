local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local SharedFlagsModule = require(Parent.SharedFlags)
local _ = require(Parent.ExpChatShared)
local ChatTabNavigationSignal = require(Parent.ChatUIPrimitives).chatTabNavigationSignal
local ConfigModule = require(ExpChat.Config)
local FocusChatHotKeyActivatedModule = require(ExpChat.Actions.FocusChatHotKeyActivated)
local GetTabShortcutBehaviorModule = require(script.Parent.getTabShortcutBehavior)
local ChatFocusRequestSignalModule = require(script.Parent.chatFocusRequestSignal)
local FocusNavigationExperimentModule = require(script.Parent.FocusNavigationExperiment)
local FFlagExpChatGenericChatFocusModule = require(ExpChat.Flags.FFlagExpChatGenericChatFocus)
local UseSelectedTabTypeModule = require(ExpChat.useSelectedTabType)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local GetFocusNavigationStoreModule = require(ExpChat.Stores.GetFocusNavigationStore)
local GetAdjacentTabNameModule = require(ExpChat.TabNavigation.getAdjacentTabName)
local SelectTabByTypeModule = require(ExpChat.TabNavigation.selectTabByType)
local ShouldNavigateTabsModule = require(ExpChat.TabNavigation.shouldNavigateTabs)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseStoreFunction = RoactUtilsModule.Hooks.RoactRodux.useStore
local FFlagExpChatTabShortcutNav = SharedFlagsModule.FFlagExpChatTabShortcutNav
local FFlagExpChatUseChannelTabsStore = SharedFlagsModule.FFlagExpChatUseChannelTabsStore

local function getActiveTabState(p1) --[[ Line: 56 ]]
	-- upvalues: FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy)
	if FFlagExpChatUseChannelTabsStore then
		local ChannelTabsState = GetChannelTabsStoreModule(false).getChannelTabsState(false)
		
		return ChannelTabsState.selectedTabName, ChannelTabsState.allChannelTabs
	end
	local ChannelTabs = p1:getState().ChannelTabs
	
	if ChannelTabs == nil or ChannelTabs.allChannelTabs == nil then
		return nil, {}
	end
	local t = {}
	
	for Name, allChannelTab in ChannelTabs.allChannelTabs do
		t[Name] = {
			name = Name,
			tabIndex = allChannelTab.TabIndex,
			type = allChannelTab.Type
		}
	end
	return ChannelTabs.selectedTabName, t
end

local Tab = Enum.KeyCode.Tab
local config = {
	[Enum.KeyCode.ButtonR1] = 1,
	[Enum.KeyCode.ButtonL1] = -1
}
local Value = Enum.ContextActionPriority.High.Value

local function selectIsChatHotkeyEnabled(p2) --[[ Line: 90 ]]
	return p2.ChatVisibility.isChatHotkeyEnabled.value
end

local function selectDevDefinedFocusKeyCode(p2) --[[ Line: 94 ]]
	return p2.ChatLayout.ChatInputBarSettings.KeyboardKeyCode
end

return function(p2) --[[ Line: 105 | Named "ShortcutNavReceiver" ]]
	-- upvalues: ContextActionService (copy), UseSelectorFunction (copy), selectIsChatHotkeyEnabled (copy), UseSelectedTabTypeModule (copy), selectDevDefinedFocusKeyCode (copy), UseDispatchFunction (copy), UseStoreFunction (copy), FocusNavigationExperimentModule (copy), ReactModule (copy), ConfigModule (copy), GetTabShortcutBehaviorModule (copy), FocusChatHotKeyActivatedModule (copy), FFlagExpChatGenericChatFocusModule (copy), ChatFocusRequestSignalModule (copy), FFlagExpChatTabShortcutNav (copy), getActiveTabState (copy), GetFocusNavigationStoreModule (copy), ShouldNavigateTabsModule (copy), GetAdjacentTabNameModule (copy), SelectTabByTypeModule (copy), Tab (copy), config (copy), Value (copy), ChatTabNavigationSignal (copy), GuiService (copy)
	local ContextActionService1 = p2.contextActionService or ContextActionService
	local UseSelectorResult = UseSelectorFunction(selectIsChatHotkeyEnabled)
	local UseSelectedTabTypeModuleResult = UseSelectedTabTypeModule()
	local UseSelectorResult1 = UseSelectorFunction(selectDevDefinedFocusKeyCode)
	local UseDispatchResult = UseDispatchFunction()
	local UseStoreResult = UseStoreFunction()
	local UseRefResult = if FocusNavigationExperimentModule.isExposureLoggingEnabled then ReactModule.useRef(false) else nil
	ReactModule.useEffect(function() --[[ Line: 121 ]]
		-- upvalues: UseSelectorResult (copy), ConfigModule (upval), UseSelectorResult1 (copy), UseSelectedTabTypeModuleResult (copy), GetTabShortcutBehaviorModule (upval), UseDispatchResult (copy), FocusChatHotKeyActivatedModule (upval), ContextActionService1 (copy)
		ContextActionService1:BindCoreAction("ExpChatFocusHotKey", function(_, UserInputState, Input) --[[ Line: 122 | Named "handleAction" ]]
			-- upvalues: UseSelectorResult (upval), ConfigModule (upval), UseSelectorResult1 (upval), UseSelectedTabTypeModuleResult (upval), GetTabShortcutBehaviorModule (upval), UseDispatchResult (upval), FocusChatHotKeyActivatedModule (upval)
			if not UseSelectorResult then
				return Enum.ContextActionResult.Pass
			elseif UserInputState ~= Enum.UserInputState.Begin or Input == nil then
				return Enum.ContextActionResult.Pass
			else
				local KeyCode = Input.KeyCode
				
				if KeyCode ~= ConfigModule.ChatInputBarDefaultFocusKeyCode and KeyCode ~= UseSelectorResult1 then
					return Enum.ContextActionResult.Pass
				elseif UseSelectedTabTypeModuleResult == nil then
					return Enum.ContextActionResult.Pass
				else
					local TabShortcutBehaviorModule = GetTabShortcutBehaviorModule(UseSelectedTabTypeModuleResult)
					
					if TabShortcutBehaviorModule.canOpenChat() then
						UseDispatchResult(FocusChatHotKeyActivatedModule())
						
						return TabShortcutBehaviorModule.focus({ keyCode = KeyCode }) or Enum.ContextActionResult.Sink
					else
						return Enum.ContextActionResult.Pass
					end
				end
			end
		end, false, Enum.UserInputType.Keyboard)
		
		return function() --[[ Line: 156 ]]
			-- upvalues: ContextActionService1 (upval)
			ContextActionService1:UnbindCoreAction("ExpChatFocusHotKey")
		end
	end, {
		UseSelectorResult,
		UseSelectedTabTypeModuleResult,
		UseSelectorResult1,
		ContextActionService1,
		UseDispatchResult
	})
	ReactModule.useEffect(function() --[[ Line: 163 ]]
		-- upvalues: FFlagExpChatGenericChatFocusModule (upval), UseSelectedTabTypeModuleResult (copy), GetTabShortcutBehaviorModule (upval), ChatFocusRequestSignalModule (upval)
		if not FFlagExpChatGenericChatFocusModule or UseSelectedTabTypeModuleResult == nil then return end
		local TabShortcutBehaviorModule = GetTabShortcutBehaviorModule(UseSelectedTabTypeModuleResult)
		local Connection = ChatFocusRequestSignalModule:connect(function() --[[ Line: 168 ]]
			-- upvalues: TabShortcutBehaviorModule (copy)
			if TabShortcutBehaviorModule.focus ~= nil and TabShortcutBehaviorModule.canOpenChat() then
				TabShortcutBehaviorModule.focus({ keyCode = Enum.KeyCode.None })
			end
		end)
		
		return function() --[[ Line: 174 ]]
			-- upvalues: Connection (copy)
			Connection.disconnect()
		end
	end, { UseSelectedTabTypeModuleResult })
	ReactModule.useEffect(function() --[[ Line: 183 ]]
		-- upvalues: FFlagExpChatTabShortcutNav (upval), getActiveTabState (upval), UseStoreResult (copy), GetFocusNavigationStoreModule (upval), ShouldNavigateTabsModule (upval), GetAdjacentTabNameModule (upval), UseRefResult (ref), FocusNavigationExperimentModule (upval), SelectTabByTypeModule (upval), UseDispatchResult (copy), GetTabShortcutBehaviorModule (upval), Tab (upval), config (upval), ContextActionService1 (copy), Value (upval), ChatTabNavigationSignal (upval)
		if not FFlagExpChatTabShortcutNav then return end
		local function tryNavigateTabs(p3, Enabled): boolean --[[ Line: 193 ]]
			-- upvalues: getActiveTabState (upval), UseStoreResult (upval), GetFocusNavigationStoreModule (upval), ShouldNavigateTabsModule (upval), GetAdjacentTabNameModule (upval), UseRefResult (upval), FocusNavigationExperimentModule (upval), SelectTabByTypeModule (upval), UseDispatchResult (upval), GetTabShortcutBehaviorModule (upval), Tab (upval)
			local ActiveTabState, ActiveTabState2 = getActiveTabState(UseStoreResult)
			
			if ActiveTabState == nil then
				return false
			end
			if ActiveTabState2[ActiveTabState] == nil then
				return false
			end
			local FocusNavigationStoreModule = GetFocusNavigationStoreModule(false)
			local List = {}
			
			for _, value in ActiveTabState2 do
				table.insert(List, { name = value.name, tabIndex = value.tabIndex })
			end
			if not ShouldNavigateTabsModule({
				isTabBarVisible = FocusNavigationStoreModule.getIsTabBarVisible(false),
				tabCount = #List,
				isChatFocused = Enabled == true or FocusNavigationStoreModule.getIsChatFocused()
			}) then
				return false
			end
			local AdjacentTabNameModule = GetAdjacentTabNameModule(List, ActiveTabState, p3)
			
			if AdjacentTabNameModule == nil then
				return false
			end
			local ActiveTabStateEntry = ActiveTabState2[AdjacentTabNameModule]
			
			if UseRefResult and not UseRefResult.current then
				UseRefResult.current = true
				FocusNavigationExperimentModule.logExposure()
			end
			if FocusNavigationExperimentModule.isTabNavEnabled then
				SelectTabByTypeModule(UseDispatchResult, {
					shouldReorderTabs = false,
					channelName = AdjacentTabNameModule,
					tabType = ActiveTabStateEntry.type
				})
				FocusNavigationStoreModule.clearChatInputBarFocusRequest()
				GetTabShortcutBehaviorModule(ActiveTabStateEntry.type).focus({ keyCode = Tab })
				FocusNavigationStoreModule.requestTabNavFocus(AdjacentTabNameModule)
				
				return true
			else
				return false
			end
		end
		
		ContextActionService1:BindCoreActionAtPriority("ExpChatTabShortcutNav", function(_, UserInputState, Input) --[[ Line: 247 | Named "handleTabNav" ]]
			-- upvalues: config (upval), Tab (upval), tryNavigateTabs (copy)
			if UserInputState == Enum.UserInputState.Begin and Input ~= nil then
				local Entry = if Input.KeyCode == Tab then if Input:IsModifierKeyDown(Enum.ModifierKey.Shift) then -1 else 1 else config[Input.KeyCode]
				
				return if Entry == nil then Enum.ContextActionResult.Pass elseif tryNavigateTabs(Entry) then Enum.ContextActionResult.Sink else Enum.ContextActionResult.Pass
			else
				return Enum.ContextActionResult.Pass
			end
		end, false, Value, Tab, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1)
		local Connection = ChatTabNavigationSignal:connect(function(p4) --[[ Line: 285 ]]
			-- upvalues: tryNavigateTabs (copy)
			tryNavigateTabs(p4, true)
		end)
		
		return function() --[[ Line: 289 ]]
			-- upvalues: ContextActionService1 (upval), Connection (copy)
			ContextActionService1:UnbindCoreAction("ExpChatTabShortcutNav")
			Connection.disconnect()
		end
	end, { ContextActionService1, UseDispatchResult, UseStoreResult })
	ReactModule.useEffect(function() --[[ Line: 297 ]]
		-- upvalues: FFlagExpChatTabShortcutNav (upval), GetFocusNavigationStoreModule (upval), GuiService (upval), ContextActionService1 (copy), Value (upval)
		if not FFlagExpChatTabShortcutNav then return end
		ContextActionService1:BindCoreActionAtPriority("ExpChatShortcutNavEscape", function(_, UserInputState, _) --[[ Line: 302 | Named "handleEscape" ]]
			-- upvalues: GetFocusNavigationStoreModule (upval), GuiService (upval)
			if UserInputState ~= Enum.UserInputState.Begin then
				return Enum.ContextActionResult.Pass
			elseif GetFocusNavigationStoreModule(false).getIsChatFocused() then
				GuiService.SelectedCoreObject = nil
				
				return Enum.ContextActionResult.Sink
			else
				return Enum.ContextActionResult.Pass
			end
		end, false, Value, Enum.KeyCode.Escape)
		
		return function() --[[ Line: 325 ]]
			-- upvalues: ContextActionService1 (upval)
			ContextActionService1:UnbindCoreAction("ExpChatShortcutNavEscape")
		end
	end, { ContextActionService1 })
	
	return nil
end