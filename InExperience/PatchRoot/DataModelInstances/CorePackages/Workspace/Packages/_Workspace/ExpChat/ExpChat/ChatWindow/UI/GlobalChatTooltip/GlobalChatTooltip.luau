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
local minTabWidth = configModule.ChannelTabsSettings.MinTabWidth
local dropdownIconContainerWidth = configModule.ChannelTabsSettings.DropdownIconContainerWidth

local function GlobalChatTooltipNew(p1)
	-- upvalues: getChatTooltipStoreModule (ref), signalsReactModule (ref), useSelector (ref), reactModule (ref), minTabWidth (ref), dropdownIconContainerWidth (ref), useChatTooltipLifecycleModule (ref), localizationModule (ref), coachmark (ref), popoverSide (ref), popoverAlign (ref), configModule (ref)
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
	local var7 = var5 > 0 and var5 < var3 * minTabWidth
	local _ = nil
	
	if var3 < 2 then
		var1 = 1
	elseif var7 then
		local var8 = var5 - dropdownIconContainerWidth
		local floored = math.floor(var8 / minTabWidth)
		var1 = if floored >= 2 then 2 * var8 / (floored * var5) else 1
	else
		var1 = 2 / var3
	end
	local var9 = useSelector(function(p3)
		local alignment = p3.ChatLayout and p3.ChatLayout.Alignment
		
		return alignment ~= nil and (alignment.AnchorPoint.X == 0 and alignment.AnchorPoint.Y == 0)
	end)
	local var10 = useChatTooltipLifecycleModule({
		tooltipKey = "GlobalChatTooltip",
		targetTextChannel = p1.targetTextChannel
	})
	local var11 = localizationModule.useLocalization({
		headerText = "CoreScripts.TextChat.Tooltip.Global.Header",
		bodyText = "CoreScripts.TextChat.Tooltip.Global.Body"
	})
	
	if p1.visible and var2 and var9 then
		local function onAnchorChanged(p3)
			-- upvalues: var6 (ref)
			local parent = p3.Parent
			
			if parent and parent:IsA("GuiObject") then
				var6(parent.AbsoluteSize.X)
			end
		end
		
		return reactModule.createElement(coachmark, {
			title = var11.headerText,
			text = var11.bodyText,
			isOpen = var10.isActive,
			onClose = var10.onDismiss,
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
	-- upvalues: getGlobalChatTooltipStoreModule (ref), getTransparencyStoreModule (ref), signalsReactModule (ref), useSelector (ref), reactModule (ref), minTabWidth (ref), dropdownIconContainerWidth (ref), isUserChatEnabledModule (ref), configModule (ref), localizationModule (ref), coachmark (ref), popoverSide (ref), popoverAlign (ref)
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
	local var15 = var13 > 0 and var13 < var11 * minTabWidth
	local _ = nil
	
	if var11 < 2 then
		var4 = 1
	elseif var15 then
		local var16 = var13 - dropdownIconContainerWidth
		local floored = math.floor(var16 / minTabWidth)
		var4 = if floored >= 2 then 2 * var16 / (floored * var13) else 1
	else
		var4 = 2 / var11
	end
	local var17 = useSelector(function(p4)
		local alignment = p4.ChatLayout and p4.ChatLayout.Alignment
		
		return alignment ~= nil and (alignment.AnchorPoint.X == 0 and alignment.AnchorPoint.Y == 0)
	end)
	local var18 = if p2.chatStatus ~= nil then isUserChatEnabledModule(p2.chatStatus) else true
	local var19, var20 = reactModule.useState(true)
	local var21, var22 = reactModule.useState(false)
	local var23 = reactModule.useRef(false)
	local var24 = reactModule.useRef(0)
	local var25 = reactModule.useRef(p2.targetTextChannel)
	local var26 = reactModule.useCallback(function()
		-- upvalues: var23 (ref), var5 (ref)
		if not var23.current then
			var23.current = true
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
		-- upvalues: var10 (ref), var20 (ref), configModule (copy), var9 (ref)
		if var10 then
			var20(true)
			
			return nil
		end
		local var27 = configModule.ChatWindowBackgroundFadeOutTime - (os.clock() - var9)
		
		if var27 <= 0 then
			var20(false)
			
			return nil
		end
		var20(true)
		local delayedThread = task.delay(var27, function()
			-- upvalues: var20 (copy)
			var20(false)
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var9, var10 })
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var8 (ref), var21 (ref), var7 (ref), var18 (ref), var24 (ref), var22 (ref)
		if var19 and var8 and not var21 and (var7 and var18) then
			local processTime = os.clock()
			local delayedThread = task.delay(math.max(0, 10 - var24.current), function()
				-- upvalues: var22 (copy)
				var22(true)
			end)
			
			return function()
				-- upvalues: var24 (copy), processTime (ref), delayedThread (ref)
				var24.current += os.clock() - processTime
				task.cancel(delayedThread)
			end
		end
		return nil
	end, {
		var19,
		var8,
		var21,
		var7,
		var18
	})
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), var26 (ref)
		if var21 then
			local delayedThread = task.delay(1, function()
				-- upvalues: var26 (copy)
				var26()
			end)
			
			return function()
				-- upvalues: delayedThread (ref)
				task.cancel(delayedThread)
			end
		end
		return nil
	end, { var21, var26 })
	reactModule.useEffect(function()
		-- upvalues: var25 (ref), p2 (ref), var7 (ref), var18 (ref), var21 (ref), var22 (ref)
		local current = var25.current
		var25.current = p2.targetTextChannel
		
		if current and current ~= p2.targetTextChannel and (var7 and var18) and not var21 then
			var22(true)
		end
	end, { p2.targetTextChannel, var7, var18, var21 })
	local var27 = localizationModule.useLocalization({
		headerText = "CoreScripts.TextChat.Tooltip.Global.Header",
		bodyText = "CoreScripts.TextChat.Tooltip.Global.Body"
	})
	
	if p2.visible and var7 and var17 then
		local function onAnchorChanged(p4)
			-- upvalues: var14 (ref)
			local parent = p4.Parent
			
			if parent and parent:IsA("GuiObject") then
				var14(parent.AbsoluteSize.X)
			end
		end
		
		return reactModule.createElement(coachmark, {
			title = var27.headerText,
			text = var27.bodyText,
			isOpen = var19 and (var8 and not var21),
			onClose = var26,
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