local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local configModule = require(expChat.Config)
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local getChatTooltipStoreModule = require(expChat.Stores.GetChatTooltipStore)
local _ = require(expChat.Stores.GetChatTooltipStore.createChatTooltipStore)

return function(p0) --[[ line: 49 | named "useChatTooltipLifecycle" ]]
	-- upvalues: getChatTooltipStoreModule (ref), getTransparencyStoreModule (ref), signalsReactModule (ref), reactModule (ref), configModule (ref)
	local tooltipKey = p0.tooltipKey
	local targetTextChannel = p0.targetTextChannel
	local var6 = getChatTooltipStoreModule(false)
	local var7 = getTransparencyStoreModule(false)
	local var8 = signalsReactModule.useSignalState(var6.getShouldShow(tooltipKey))
	local var9 = signalsReactModule.useSignalState(var6.getIsScreenWideEnough)
	local var10 = signalsReactModule.useSignalState(var7.getLastActivity)
	local var11 = signalsReactModule.useSignalState(var7.getIsFocused or var7.getIsTextBoxFocused)
	local var12, var13 = reactModule.useState(true)
	local var14, var15 = reactModule.useState(false)
	local var16 = reactModule.useRef(false)
	local var17 = reactModule.useRef(0)
	local var18 = reactModule.useRef(targetTextChannel)
	local setIsDismissed = var6.setIsDismissed
	local reportImpression = var6.reportImpression
	local var19 = reactModule.useCallback(function() --[[ line: 71 ]]
		-- upvalues: var16 (ref), reportImpression (ref), tooltipKey (ref), setIsDismissed (ref)
		if not var16.current then
			var16.current = true
			reportImpression(tooltipKey)
		end
		setIsDismissed(tooltipKey, true)
	end, { tooltipKey, setIsDismissed, reportImpression })
	reactModule.useEffect(function() --[[ line: 79 ]]
		-- upvalues: var11 (ref), var13 (ref), configModule (copy), var10 (ref)
		if var11 then
			var13(true)
			
			return nil
		end
		local var20 = configModule.ChatWindowBackgroundFadeOutTime - (os.clock() - var10)
		
		if var20 <= 0 then
			var13(false)
			
			return nil
		end
		var13(true)
		local delayedThread = task.delay(var20, function() --[[ line: 93 ]]
			-- upvalues: var13 (copy)
			var13(false)
		end)
		
		return function() --[[ line: 96 ]]
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var10, var11 })
	reactModule.useEffect(function() --[[ line: 105 ]]
		-- upvalues: var12 (ref), var9 (ref), var14 (ref), var8 (ref), var17 (ref), var15 (ref)
		if var12 and var9 and not var14 and var8 then
			local processTime = os.clock()
			local delayedThread = task.delay(math.max(0, 10 - var17.current), function() --[[ line: 112 ]]
				-- upvalues: var15 (copy)
				var15(true)
			end)
			
			return function() --[[ line: 115 ]]
				-- upvalues: var17 (copy), processTime (ref), delayedThread (ref)
				var17.current += os.clock() - processTime
				task.cancel(delayedThread)
			end
		end
		return nil
	end, { var12, var9, var14, var8 })
	reactModule.useEffect(function() --[[ line: 122 ]]
		-- upvalues: var14 (ref), var19 (ref)
		if var14 then
			local delayedThread = task.delay(1, function() --[[ line: 126 ]]
				-- upvalues: var19 (copy)
				var19()
			end)
			
			return function() --[[ line: 129 ]]
				-- upvalues: delayedThread (ref)
				task.cancel(delayedThread)
			end
		end
		return nil
	end, { var14, var19 })
	reactModule.useEffect(function() --[[ line: 135 ]]
		-- upvalues: var18 (ref), targetTextChannel (ref), var8 (ref), var14 (ref), var15 (ref)
		local current = var18.current
		var18.current = targetTextChannel
		
		if current and current ~= targetTextChannel and (var8 and not var14) then
			var15(true)
		end
	end, { targetTextChannel, var8, var14 })
	
	return {
		isActive = var8 and (var12 and (var9 and not var14)),
		onDismiss = var19
	}
end