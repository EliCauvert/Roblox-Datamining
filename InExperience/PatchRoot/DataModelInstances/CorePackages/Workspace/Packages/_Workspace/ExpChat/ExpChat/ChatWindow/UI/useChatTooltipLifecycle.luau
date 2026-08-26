local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local configModule = require(expChat.Config)
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local getChatTooltipStoreModule = require(expChat.Stores.GetChatTooltipStore)
local _ = require(expChat.Stores.GetChatTooltipStore.createChatTooltipStore)

return function(p1)
	-- upvalues: getChatTooltipStoreModule (ref), getTransparencyStoreModule (ref), signalsReactModule (ref), reactModule (ref), configModule (ref)
	local tooltipKey = p1.tooltipKey
	local targetTextChannel = p1.targetTextChannel
	local var1 = getChatTooltipStoreModule(false)
	local var2 = getTransparencyStoreModule(false)
	local var3 = signalsReactModule.useSignalState(var1.getShouldShow(tooltipKey))
	local var4 = signalsReactModule.useSignalState(var1.getIsScreenWideEnough)
	local var5 = signalsReactModule.useSignalState(var2.getLastActivity)
	local var6 = signalsReactModule.useSignalState(var2.getIsFocused or var2.getIsTextBoxFocused)
	local var7, var8 = reactModule.useState(true)
	local var9, var10 = reactModule.useState(false)
	local var11 = reactModule.useRef(false)
	local var12 = reactModule.useRef(0)
	local var13 = reactModule.useRef(targetTextChannel)
	local setIsDismissed = var1.setIsDismissed
	local reportImpression = var1.reportImpression
	local var14 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), reportImpression (ref), tooltipKey (ref), setIsDismissed (ref)
		if not var11.current then
			var11.current = true
			reportImpression(tooltipKey)
		end
		setIsDismissed(tooltipKey, true)
	end, { tooltipKey, setIsDismissed, reportImpression })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var8 (ref), configModule (copy), var5 (ref)
		if var6 then
			var8(true)
			
			return nil
		end
		local var15 = configModule.ChatWindowBackgroundFadeOutTime - (os.clock() - var5)
		
		if var15 <= 0 then
			var8(false)
			
			return nil
		end
		var8(true)
		local delayedThread = task.delay(var15, function()
			-- upvalues: var8 (copy)
			var8(false)
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var5, var6 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var4 (ref), var9 (ref), var3 (ref), var12 (ref), var10 (ref)
		if var7 and var4 and not var9 and var3 then
			local processTime = os.clock()
			local delayedThread = task.delay(math.max(0, 10 - var12.current), function()
				-- upvalues: var10 (copy)
				var10(true)
			end)
			
			return function()
				-- upvalues: var12 (copy), processTime (ref), delayedThread (ref)
				var12.current += os.clock() - processTime
				task.cancel(delayedThread)
			end
		end
		return nil
	end, { var7, var4, var9, var3 })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var14 (ref)
		if var9 then
			local delayedThread = task.delay(1, function()
				-- upvalues: var14 (copy)
				var14()
			end)
			
			return function()
				-- upvalues: delayedThread (ref)
				task.cancel(delayedThread)
			end
		end
		return nil
	end, { var9, var14 })
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), targetTextChannel (ref), var3 (ref), var9 (ref), var10 (ref)
		local current = var13.current
		var13.current = targetTextChannel
		
		if current and current ~= targetTextChannel and (var3 and not var9) then
			var10(true)
		end
	end, { targetTextChannel, var3, var9 })
	
	return {
		isActive = var3 and (var7 and (var4 and not var9)),
		onDismiss = var14
	}
end