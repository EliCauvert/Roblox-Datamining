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

local function GlobalChatTooltipNew(p0) --[[ line: 41 ]]
	-- upvalues: getChatTooltipStoreModule (ref), signalsReactModule (ref), useSelector (ref), reactModule (ref), minTabWidth (ref), dropdownIconContainerWidth (ref), useChatTooltipLifecycleModule (ref), localizationModule (ref), coachmark (ref), popoverSide (ref), popoverAlign (ref), configModule (ref)
	local var18
	local var13 = signalsReactModule.useSignalState(getChatTooltipStoreModule(false).getShouldShow("GlobalChatTooltip"))
	local var14 = useSelector(function(p1) --[[ line: 45 ]]
		local allChannelTabs = p1.ChannelTabs and p1.ChannelTabs.allChannelTabs
		
		if allChannelTabs == nil then
			return 0
		end
		local var26 = 0
		
		for i in allChannelTabs do
			var26 += 1
		end
		return var26
	end)
	local var15, var16 = reactModule.useState(0)
	local var17 = var15 > 0 and var15 < var14 * minTabWidth
	local _ = nil
	
	if var14 < 2 then
		var18 = 1
	elseif var17 then
		local var19 = var15 - dropdownIconContainerWidth
		local floored = math.floor(var19 / minTabWidth)
		var18 = if floored >= 2 then 2 * var19 / (floored * var15) else 1
	else
		var18 = 2 / var14
	end
	local var21 = useSelector(function(p2) --[[ line: 93 ]]
		local alignment = p2.ChatLayout and p2.ChatLayout.Alignment
		
		return alignment ~= nil and (alignment.AnchorPoint.X == 0 and alignment.AnchorPoint.Y == 0)
	end)
	local var22 = useChatTooltipLifecycleModule({
		tooltipKey = "GlobalChatTooltip",
		targetTextChannel = p0.targetTextChannel
	})
	local var23 = localizationModule.useLocalization({
		headerText = "CoreScripts.TextChat.Tooltip.Global.Header",
		bodyText = "CoreScripts.TextChat.Tooltip.Global.Body"
	})
	
	if p0.visible and var13 and var21 then
		local function onAnchorChanged(p3) --[[ line: 112 ]]
			-- upvalues: var16 (ref)
			local parent = p3.Parent
			
			if parent and parent:IsA("GuiObject") then
				var16(parent.AbsoluteSize.X)
			end
		end
		
		return reactModule.createElement(coachmark, {
			title = var23.headerText,
			text = var23.bodyText,
			isOpen = var22.isActive,
			onClose = var22.onDismiss,
			side = popoverSide.Right,
			align = popoverAlign.Start,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(var18, -13, 0, -48),
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

local function GlobalChatTooltipLegacy(p4) --[[ line: 150 ]]
	-- upvalues: getGlobalChatTooltipStoreModule (ref), getTransparencyStoreModule (ref), signalsReactModule (ref), useSelector (ref), reactModule (ref), minTabWidth (ref), dropdownIconContainerWidth (ref), isUserChatEnabledModule (ref), configModule (ref), localizationModule (ref), coachmark (ref), popoverSide (ref), popoverAlign (ref)
	local var38
	local var28 = getGlobalChatTooltipStoreModule(false)
	local var29 = getTransparencyStoreModule(false)
	local var30 = signalsReactModule.useSignalState(var28.getShouldShowGlobalChatTooltip)
	local var31 = signalsReactModule.useSignalState(var28.getIsScreenWideEnough)
	local var32 = signalsReactModule.useSignalState(var29.getLastActivity)
	local var33 = signalsReactModule.useSignalState(var29.getIsFocused or var29.getIsTextBoxFocused)
	local var34 = useSelector(function(p5) --[[ line: 160 ]]
		local allChannelTabs = p5.ChannelTabs and p5.ChannelTabs.allChannelTabs
		
		if allChannelTabs == nil then
			return 0
		end
		local var54 = 0
		
		for i in allChannelTabs do
			var54 += 1
		end
		return var54
	end)
	local var35, var36 = reactModule.useState(0)
	local var37 = var35 > 0 and var35 < var34 * minTabWidth
	local _ = nil
	
	if var34 < 2 then
		var38 = 1
	elseif var37 then
		local var39 = var35 - dropdownIconContainerWidth
		local floored = math.floor(var39 / minTabWidth)
		var38 = if floored >= 2 then 2 * var39 / (floored * var35) else 1
	else
		var38 = 2 / var34
	end
	local var41 = useSelector(function(p6) --[[ line: 208 ]]
		local alignment = p6.ChatLayout and p6.ChatLayout.Alignment
		
		return alignment ~= nil and (alignment.AnchorPoint.X == 0 and alignment.AnchorPoint.Y == 0)
	end)
	local var42 = if p4.chatStatus ~= nil then isUserChatEnabledModule(p4.chatStatus) else true
	local var43, var44 = reactModule.useState(true)
	local var45, var46 = reactModule.useState(false)
	local var47 = reactModule.useRef(false)
	local var48 = reactModule.useRef(0)
	local var49 = reactModule.useRef(p4.targetTextChannel)
	local var50 = reactModule.useCallback(function() --[[ line: 222 ]]
		-- upvalues: var47 (ref), var28 (ref)
		if not var47.current then
			var47.current = true
			var28.reportImpression()
		end
		var28.setIsGlobalChatTooltipDismissed(true)
	end, {
		var28.setIsGlobalChatTooltipDismissed,
		var28.reportImpression
	})
	reactModule.useEffect(function() --[[ line: 230 ]]
		-- upvalues: var28 (ref), p4 (ref)
		var28.setIsChatWindowOpen(p4.visible)
		
		return function() --[[ line: 232 ]]
			-- upvalues: var28 (copy)
			var28.setIsChatWindowOpen(false)
		end
	end, { p4.visible })
	reactModule.useEffect(function() --[[ line: 237 ]]
		-- upvalues: var33 (ref), var44 (ref), configModule (copy), var32 (ref)
		if var33 then
			var44(true)
			
			return nil
		end
		local var56 = configModule.ChatWindowBackgroundFadeOutTime - (os.clock() - var32)
		
		if var56 <= 0 then
			var44(false)
			
			return nil
		end
		var44(true)
		local delayedThread = task.delay(var56, function() --[[ line: 251 ]]
			-- upvalues: var44 (copy)
			var44(false)
		end)
		
		return function() --[[ line: 254 ]]
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var32, var33 })
	reactModule.useEffect(function() --[[ line: 260 ]]
		-- upvalues: var43 (ref), var31 (ref), var45 (ref), var30 (ref), var42 (ref), var48 (ref), var46 (ref)
		if var43 and var31 and not var45 and (var30 and var42) then
			local processTime = os.clock()
			local delayedThread = task.delay(math.max(0, 10 - var48.current), function() --[[ line: 267 ]]
				-- upvalues: var46 (copy)
				var46(true)
			end)
			
			return function() --[[ line: 270 ]]
				-- upvalues: var48 (copy), processTime (ref), delayedThread (ref)
				var48.current += os.clock() - processTime
				task.cancel(delayedThread)
			end
		end
		return nil
	end, {
		var43,
		var31,
		var45,
		var30,
		var42
	})
	reactModule.useEffect(function() --[[ line: 277 ]]
		-- upvalues: var45 (ref), var50 (ref)
		if var45 then
			local delayedThread = task.delay(1, function() --[[ line: 281 ]]
				-- upvalues: var50 (copy)
				var50()
			end)
			
			return function() --[[ line: 284 ]]
				-- upvalues: delayedThread (ref)
				task.cancel(delayedThread)
			end
		end
		return nil
	end, { var45, var50 })
	reactModule.useEffect(function() --[[ line: 290 ]]
		-- upvalues: var49 (ref), p4 (ref), var30 (ref), var42 (ref), var45 (ref), var46 (ref)
		local current = var49.current
		var49.current = p4.targetTextChannel
		
		if current and current ~= p4.targetTextChannel and (var30 and var42) and not var45 then
			var46(true)
		end
	end, { p4.targetTextChannel, var30, var42, var45 })
	local var51 = localizationModule.useLocalization({
		headerText = "CoreScripts.TextChat.Tooltip.Global.Header",
		bodyText = "CoreScripts.TextChat.Tooltip.Global.Body"
	})
	
	if p4.visible and var30 and var41 then
		local function onAnchorChanged(p7) --[[ line: 311 ]]
			-- upvalues: var36 (ref)
			local parent = p7.Parent
			
			if parent and parent:IsA("GuiObject") then
				var36(parent.AbsoluteSize.X)
			end
		end
		
		return reactModule.createElement(coachmark, {
			title = var51.headerText,
			text = var51.bodyText,
			isOpen = var43 and (var31 and not var45),
			onClose = var50,
			side = popoverSide.Right,
			align = popoverAlign.Start,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(var38, -13, 0, -48),
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

return function(p8) --[[ line: 347 | named "GlobalChatTooltip" ]]
	-- upvalues: fFlagExpChatUseUnifiedTooltipStore (ref), GlobalChatTooltipNew (ref), GlobalChatTooltipLegacy (ref)
	return if fFlagExpChatUseUnifiedTooltipStore then GlobalChatTooltipNew(p8) else GlobalChatTooltipLegacy(p8)
end