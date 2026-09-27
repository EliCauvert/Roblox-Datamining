local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local foundationModule = require(parent.Foundation)
local coachmark = foundationModule.Coachmark
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local fFlagExpChatUseUnifiedTooltipStore = require(parent.ExpChatShared).Flags.FFlagExpChatUseUnifiedTooltipStore
local localizationModule = require(expChat.Localization)
local configModule = require(expChat.Config)
local isUserChatEnabledModule = require(expChat.isUserChatEnabled)
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local getGlobalChatTooltipStoreModule = require(expChat.Stores.GetGlobalChatTooltipStore)
local getChatTooltipStoreModule = require(expChat.Stores.GetChatTooltipStore)
local useChatTooltipLifecycleModule = require(script.Parent.Parent.useChatTooltipLifecycle)
local fFlagExpChatGlobalTabDefaultModule = require(expChat.Flags.FFlagExpChatGlobalTabDefault)
local minTabWidth = configModule.ChannelTabsSettings.MinTabWidth
local dropdownIconContainerWidth = configModule.ChannelTabsSettings.DropdownIconContainerWidth

local function _()
	-- upvalues: useSelector (ref)
	return useSelector(function(p1)
		local allChannelTabs = p1.ChannelTabs and p1.ChannelTabs.allChannelTabs
		local RBXGlobal = allChannelTabs and allChannelTabs.RBXGlobal
		
		return if RBXGlobal then RBXGlobal.TabIndex else 2
	end)
end

local function GlobalChatTooltipNew(p1)
	-- upvalues: getChatTooltipStoreModule (ref), signalsReactModule (ref), useSelector (ref), reactModule (ref), fFlagExpChatGlobalTabDefaultModule (ref), minTabWidth (ref), dropdownIconContainerWidth (ref), useChatTooltipLifecycleModule (ref), localizationModule (ref), coachmark (ref), popoverSide (ref), popoverAlign (ref), configModule (ref)
	local var1
	local var2 = signalsReactModule.useSignalState(getChatTooltipStoreModule(false).getShouldShow("GlobalChatTooltip"))
	local var3 = useSelector(function(p2)
		local allChannelTabs = p2.ChannelTabs and p2.ChannelTabs.allChannelTabs
		
		if allChannelTabs == nil then
			return 0
		end
		local var4 = 0
		
		for i in allChannelTabs do
			var4 += 1
		end
		return var4
	end)
	local var5, var6 = reactModule.useState(0)
	local var7 = if fFlagExpChatGlobalTabDefaultModule then useSelector(function(p3)
		local allChannelTabs = p3.ChannelTabs and p3.ChannelTabs.allChannelTabs
		local RBXGlobal = allChannelTabs and allChannelTabs.RBXGlobal
		
		return if RBXGlobal then RBXGlobal.TabIndex else 2
	end) else 2
	local var8 = var5 > 0 and var5 < var3 * minTabWidth
	local _ = nil
	
	if var3 < var7 then
		var1 = 1
	elseif var8 then
		local var9 = var5 - dropdownIconContainerWidth
		local floored = math.floor(var9 / minTabWidth)
		var1 = if var7 <= floored then var7 * var9 / (floored * var5) else 1
	else
		var1 = var7 / var3
	end
	local var10 = useSelector(function(p3)
		local alignment = p3.ChatLayout and p3.ChatLayout.Alignment
		
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
	
	if p1.visible and var2 and var10 then
		local function onAnchorChanged(p3)
			-- upvalues: var6 (ref)
			local parent = p3.Parent
			
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
			Position = UDim2.new(var1, -13, 0, -48),
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

local function GlobalChatTooltipLegacy(p2)
	-- upvalues: getGlobalChatTooltipStoreModule (ref), getTransparencyStoreModule (ref), signalsReactModule (ref), useSelector (ref), reactModule (ref), fFlagExpChatGlobalTabDefaultModule (ref), minTabWidth (ref), dropdownIconContainerWidth (ref), isUserChatEnabledModule (ref), configModule (ref), localizationModule (ref), coachmark (ref), popoverSide (ref), popoverAlign (ref)
	local var4
	local var5 = getGlobalChatTooltipStoreModule(false)
	local var6 = getTransparencyStoreModule(false)
	local var7 = signalsReactModule.useSignalState(var5.getShouldShowGlobalChatTooltip)
	local var8 = signalsReactModule.useSignalState(var5.getIsScreenWideEnough)
	local var9 = signalsReactModule.useSignalState(var6.getLastActivity)
	local var10 = signalsReactModule.useSignalState(var6.getIsFocused or var6.getIsTextBoxFocused)
	local var11 = useSelector(function(p3)
		local allChannelTabs = p3.ChannelTabs and p3.ChannelTabs.allChannelTabs
		
		if allChannelTabs == nil then
			return 0
		end
		local var12 = 0
		
		for i in allChannelTabs do
			var12 += 1
		end
		return var12
	end)
	local var13, var14 = reactModule.useState(0)
	local var15 = if fFlagExpChatGlobalTabDefaultModule then useSelector(function(p4)
		local allChannelTabs = p4.ChannelTabs and p4.ChannelTabs.allChannelTabs
		local RBXGlobal = allChannelTabs and allChannelTabs.RBXGlobal
		
		return if RBXGlobal then RBXGlobal.TabIndex else 2
	end) else 2
	local var16 = var13 > 0 and var13 < var11 * minTabWidth
	local _ = nil
	
	if var11 < var15 then
		var4 = 1
	elseif var16 then
		local var17 = var13 - dropdownIconContainerWidth
		local floored = math.floor(var17 / minTabWidth)
		var4 = if var15 <= floored then var15 * var17 / (floored * var13) else 1
	else
		var4 = var15 / var11
	end
	local var18 = useSelector(function(p4)
		local alignment = p4.ChatLayout and p4.ChatLayout.Alignment
		
		return alignment ~= nil and (alignment.AnchorPoint.X == 0 and alignment.AnchorPoint.Y == 0)
	end)
	local var19 = if p2.chatStatus ~= nil then isUserChatEnabledModule(p2.chatStatus) else true
	local var20, var21 = reactModule.useState(true)
	local var22, var23 = reactModule.useState(false)
	local var24 = reactModule.useRef(false)
	local var25 = reactModule.useRef(0)
	local var26 = reactModule.useRef(p2.targetTextChannel)
	local var27 = reactModule.useCallback(function()
		-- upvalues: var24 (ref), var5 (ref)
		if not var24.current then
			var24.current = true
			var5.reportImpression()
		end
		var5.setIsGlobalChatTooltipDismissed(true)
	end, {
		var5.setIsGlobalChatTooltipDismissed,
		var5.reportImpression
	})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), p2 (ref)
		var5.setIsChatWindowOpen(p2.visible)
		
		return function()
			-- upvalues: var5 (copy)
			var5.setIsChatWindowOpen(false)
		end
	end, { p2.visible })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var21 (ref), configModule (copy), var9 (ref)
		if var10 then
			var21(true)
			
			return nil
		end
		local var28 = configModule.ChatWindowBackgroundFadeOutTime - (os.clock() - var9)
		
		if var28 <= 0 then
			var21(false)
			
			return nil
		end
		var21(true)
		local delayedThread = task.delay(var28, function()
			-- upvalues: var21 (copy)
			var21(false)
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var9, var10 })
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), var8 (ref), var22 (ref), var7 (ref), var19 (ref), var25 (ref), var23 (ref)
		if var20 and var8 and not var22 and (var7 and var19) then
			local processTime = os.clock()
			local delayedThread = task.delay(math.max(0, 10 - var25.current), function()
				-- upvalues: var23 (copy)
				var23(true)
			end)
			
			return function()
				-- upvalues: var25 (copy), processTime (ref), delayedThread (ref)
				var25.current += os.clock() - processTime
				task.cancel(delayedThread)
			end
		end
		return nil
	end, {
		var20,
		var8,
		var22,
		var7,
		var19
	})
	reactModule.useEffect(function()
		-- upvalues: var22 (ref), var27 (ref)
		if var22 then
			local delayedThread = task.delay(1, function()
				-- upvalues: var27 (copy)
				var27()
			end)
			
			return function()
				-- upvalues: delayedThread (ref)
				task.cancel(delayedThread)
			end
		end
		return nil
	end, { var22, var27 })
	reactModule.useEffect(function()
		-- upvalues: var26 (ref), p2 (ref), var7 (ref), var19 (ref), var22 (ref), var23 (ref)
		local current = var26.current
		var26.current = p2.targetTextChannel
		
		if current and current ~= p2.targetTextChannel and (var7 and var19) and not var22 then
			var23(true)
		end
	end, { p2.targetTextChannel, var7, var19, var22 })
	local var28 = localizationModule.useLocalization({
		headerText = "CoreScripts.TextChat.Tooltip.Global.Header",
		bodyText = "CoreScripts.TextChat.Tooltip.Global.Body"
	})
	
	if p2.visible and var7 and var18 then
		local function onAnchorChanged(p4)
			-- upvalues: var14 (ref)
			local parent = p4.Parent
			
			if parent and parent:IsA("GuiObject") then
				var14(parent.AbsoluteSize.X)
			end
		end
		
		return reactModule.createElement(coachmark, {
			title = var28.headerText,
			text = var28.bodyText,
			isOpen = var20 and (var8 and not var22),
			onClose = var27,
			side = popoverSide.Right,
			align = popoverAlign.Start,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(var4, -13, 0, -48),
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

return function(p3)
	-- upvalues: fFlagExpChatUseUnifiedTooltipStore (ref), GlobalChatTooltipNew (ref), GlobalChatTooltipLegacy (ref)
	return if fFlagExpChatUseUnifiedTooltipStore then GlobalChatTooltipNew(p3) else GlobalChatTooltipLegacy(p3)
end