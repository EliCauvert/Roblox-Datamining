local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local foundationModule = require(parent.Foundation)
local coachmark = foundationModule.Coachmark
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local fFlagExpChatUseUnifiedTooltipStore = require(parent.ExpChatShared).Flags.FFlagExpChatUseUnifiedTooltipStore
local fFlagExpChatUseChannelTabsStore = require(parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local localizationModule = require(expChat.Localization)
local configModule = require(expChat.Config)
local isUserChatEnabledModule = require(expChat.isUserChatEnabled)
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local getGlobalChatTooltipStoreModule = require(expChat.Stores.GetGlobalChatTooltipStore)
local getChatTooltipStoreModule = require(expChat.Stores.GetChatTooltipStore)
local var1 = if fFlagExpChatUseChannelTabsStore then require(expChat.Stores.GetChannelTabsStore) else nil
local useChatTooltipLifecycleModule = require(script.Parent.Parent.useChatTooltipLifecycle)
local fFlagExpChatGlobalTabDefaultModule = require(expChat.Flags.FFlagExpChatGlobalTabDefault)
local minTabWidth = configModule.ChannelTabsSettings.MinTabWidth
local dropdownIconContainerWidth = configModule.ChannelTabsSettings.DropdownIconContainerWidth

local function useGlobalTabIndex()
	-- upvalues: fFlagExpChatUseChannelTabsStore (ref), reactModule (ref), signalsModule (ref), var1 (ref), signalsReactModule (ref), useSelector (ref)
	return if fFlagExpChatUseChannelTabsStore then signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (copy)
		return signalsModule.createComputed(function(p1)
			-- upvalues: var1 (copy)
			local RBXGlobal = var1(false).getChannelTabsState(p1).allChannelTabs.RBXGlobal
			
			return if RBXGlobal then RBXGlobal.tabIndex else 2
		end)
	end, {})) else useSelector(function(p1)
		local allChannelTabs = p1.ChannelTabs and p1.ChannelTabs.allChannelTabs
		local RBXGlobal = allChannelTabs and allChannelTabs.RBXGlobal
		
		return if RBXGlobal then RBXGlobal.TabIndex else 2
	end)
end

local function useTabCount()
	-- upvalues: fFlagExpChatUseChannelTabsStore (ref), reactModule (ref), signalsModule (ref), var1 (ref), signalsReactModule (ref), useSelector (ref)
	return if fFlagExpChatUseChannelTabsStore then signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (copy)
		return signalsModule.createComputed(function(p1)
			-- upvalues: var1 (copy)
			local var2 = 0
			
			for i in var1(false).getChannelTabsState(p1).allChannelTabs do
				var2 += 1
			end
			return var2
		end)
	end, {})) else useSelector(function(p1)
		local allChannelTabs = p1.ChannelTabs and p1.ChannelTabs.allChannelTabs
		
		if allChannelTabs == nil then
			return 0
		end
		local var2 = 0
		
		for i in allChannelTabs do
			var2 += 1
		end
		return var2
	end)
end

local function GlobalChatTooltipNew(p1)
	-- upvalues: getChatTooltipStoreModule (ref), signalsReactModule (ref), useTabCount (ref), reactModule (ref), fFlagExpChatGlobalTabDefaultModule (ref), useGlobalTabIndex (ref), minTabWidth (ref), dropdownIconContainerWidth (ref), useSelector (ref), useChatTooltipLifecycleModule (ref), localizationModule (ref), coachmark (ref), popoverSide (ref), popoverAlign (ref), configModule (ref)
	local var2
	local var3 = signalsReactModule.useSignalState(getChatTooltipStoreModule(false).getShouldShow("GlobalChatTooltip"))
	local var4 = useTabCount()
	local var5, var6 = reactModule.useState(0)
	local var7 = if fFlagExpChatGlobalTabDefaultModule then useGlobalTabIndex() else 2
	local var8 = var5 > 0 and var5 < var4 * minTabWidth
	local _ = nil
	
	if var4 < var7 then
		var2 = 1
	elseif var8 then
		local var9 = var5 - dropdownIconContainerWidth
		local floored = math.floor(var9 / minTabWidth)
		var2 = if var7 <= floored then var7 * var9 / (floored * var5) else 1
	else
		var2 = var7 / var4
	end
	local var10 = useSelector(function(p2)
		local alignment = p2.ChatLayout and p2.ChatLayout.Alignment
		
		return alignment ~= nil and (alignment.AnchorPoint.X == 0 and alignment.AnchorPoint.Y == 0)
	end)
	local var11 = useChatTooltipLifecycleModule({
		tooltipKey = "GlobalChatTooltip",
		targetTextChannel = p1.targetTextChannel
	})
	local var12 = localizationModule.useLocalization({
		headerText = "CoreScripts.TextChat.Tooltip.Global.Header",
		bodyText = "CoreScripts.TextChat.Tooltip.Global.Body"
	})
	
	if p1.visible and var3 and var10 then
		local function onAnchorChanged(p2)
			-- upvalues: var6 (ref)
			local parent = p2.Parent
			
			if parent and parent:IsA("GuiObject") then
				var6(parent.AbsoluteSize.X)
			end
		end
		
		return reactModule.createElement(coachmark, {
			title = var12.headerText,
			text = var12.bodyText,
			isOpen = var11.isActive,
			onClose = var11.onDismiss,
			side = popoverSide.Right,
			align = popoverAlign.Start,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(var2, -13, 0, -48),
			onAbsoluteSizeChanged = onAnchorChanged,
			onAbsolutePositionChanged = onAnchorChanged
		}, {
			AnchorSizer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0, 1, 0, configModule.ChannelTabsSettings.HorizontalBarHeight)
			})
		})
	end
	return nil
end

local function GlobalChatTooltipLegacy(p1)
	-- upvalues: getGlobalChatTooltipStoreModule (ref), getTransparencyStoreModule (ref), signalsReactModule (ref), useTabCount (ref), reactModule (ref), fFlagExpChatGlobalTabDefaultModule (ref), useGlobalTabIndex (ref), minTabWidth (ref), dropdownIconContainerWidth (ref), useSelector (ref), isUserChatEnabledModule (ref), configModule (ref), localizationModule (ref), coachmark (ref), popoverSide (ref), popoverAlign (ref)
	local var2
	local var3 = getGlobalChatTooltipStoreModule(false)
	local var4 = getTransparencyStoreModule(false)
	local var5 = signalsReactModule.useSignalState(var3.getShouldShowGlobalChatTooltip)
	local var6 = signalsReactModule.useSignalState(var3.getIsScreenWideEnough)
	local var7 = signalsReactModule.useSignalState(var4.getLastActivity)
	local var8 = signalsReactModule.useSignalState(var4.getIsFocused or var4.getIsTextBoxFocused)
	local var9 = useTabCount()
	local var10, var11 = reactModule.useState(0)
	local var12 = if fFlagExpChatGlobalTabDefaultModule then useGlobalTabIndex() else 2
	local var13 = var10 > 0 and var10 < var9 * minTabWidth
	local _ = nil
	
	if var9 < var12 then
		var2 = 1
	elseif var13 then
		local var14 = var10 - dropdownIconContainerWidth
		local floored = math.floor(var14 / minTabWidth)
		var2 = if var12 <= floored then var12 * var14 / (floored * var10) else 1
	else
		var2 = var12 / var9
	end
	local var15 = useSelector(function(p2)
		local alignment = p2.ChatLayout and p2.ChatLayout.Alignment
		
		return alignment ~= nil and (alignment.AnchorPoint.X == 0 and alignment.AnchorPoint.Y == 0)
	end)
	local var16 = if p1.chatStatus ~= nil then isUserChatEnabledModule(p1.chatStatus) else true
	local var17, var18 = reactModule.useState(true)
	local var19, var20 = reactModule.useState(false)
	local var21 = reactModule.useRef(false)
	local var22 = reactModule.useRef(0)
	local var23 = reactModule.useRef(p1.targetTextChannel)
	local var24 = reactModule.useCallback(function()
		-- upvalues: var21 (ref), var3 (ref)
		if not var21.current then
			var21.current = true
			var3.reportImpression()
		end
		var3.setIsGlobalChatTooltipDismissed(true)
	end, {
		var3.setIsGlobalChatTooltipDismissed,
		var3.reportImpression
	})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), p1 (ref)
		var3.setIsChatWindowOpen(p1.visible)
		
		return function()
			-- upvalues: var3 (copy)
			var3.setIsChatWindowOpen(false)
		end
	end, { p1.visible })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var18 (ref), configModule (copy), var7 (ref)
		if var8 then
			var18(true)
			
			return nil
		end
		local var25 = configModule.ChatWindowBackgroundFadeOutTime - (os.clock() - var7)
		
		if var25 <= 0 then
			var18(false)
			
			return nil
		end
		var18(true)
		local delayedThread = task.delay(var25, function()
			-- upvalues: var18 (copy)
			var18(false)
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var7, var8 })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var6 (ref), var19 (ref), var5 (ref), var16 (ref), var22 (ref), var20 (ref)
		if var17 and var6 and not var19 and (var5 and var16) then
			local processTime = os.clock()
			local delayedThread = task.delay(math.max(0, 10 - var22.current), function()
				-- upvalues: var20 (copy)
				var20(true)
			end)
			
			return function()
				-- upvalues: var22 (copy), processTime (ref), delayedThread (ref)
				var22.current += os.clock() - processTime
				task.cancel(delayedThread)
			end
		end
		return nil
	end, {
		var17,
		var6,
		var19,
		var5,
		var16
	})
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var24 (ref)
		if var19 then
			local delayedThread = task.delay(1, function()
				-- upvalues: var24 (copy)
				var24()
			end)
			
			return function()
				-- upvalues: delayedThread (ref)
				task.cancel(delayedThread)
			end
		end
		return nil
	end, { var19, var24 })
	reactModule.useEffect(function()
		-- upvalues: var23 (ref), p1 (ref), var5 (ref), var16 (ref), var19 (ref), var20 (ref)
		local current = var23.current
		var23.current = p1.targetTextChannel
		
		if current and current ~= p1.targetTextChannel and (var5 and var16) and not var19 then
			var20(true)
		end
	end, { p1.targetTextChannel, var5, var16, var19 })
	local var25 = localizationModule.useLocalization({
		headerText = "CoreScripts.TextChat.Tooltip.Global.Header",
		bodyText = "CoreScripts.TextChat.Tooltip.Global.Body"
	})
	
	if p1.visible and var5 and var15 then
		local function onAnchorChanged(p2)
			-- upvalues: var11 (ref)
			local parent = p2.Parent
			
			if parent and parent:IsA("GuiObject") then
				var11(parent.AbsoluteSize.X)
			end
		end
		
		return reactModule.createElement(coachmark, {
			title = var25.headerText,
			text = var25.bodyText,
			isOpen = var17 and (var6 and not var19),
			onClose = var24,
			side = popoverSide.Right,
			align = popoverAlign.Start,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(var2, -13, 0, -48),
			onAbsoluteSizeChanged = onAnchorChanged,
			onAbsolutePositionChanged = onAnchorChanged
		}, {
			AnchorSizer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0, 1, 0, configModule.ChannelTabsSettings.HorizontalBarHeight)
			})
		})
	end
	return nil
end

return function(p1)
	-- upvalues: fFlagExpChatUseUnifiedTooltipStore (ref), GlobalChatTooltipNew (ref), GlobalChatTooltipLegacy (ref)
	return if fFlagExpChatUseUnifiedTooltipStore then GlobalChatTooltipNew(p1) else GlobalChatTooltipLegacy(p1)
end