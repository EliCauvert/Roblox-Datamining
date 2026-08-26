local signalsModule = require(script:FindFirstAncestor("ExpChat").Parent.Signals)
local createSignal = signalsModule.createSignal

return function()
	-- upvalues: createSignal (ref), signalsModule (ref)
	local var1, var2 = createSignal(0)
	local var3, var4 = createSignal(0)
	local var5, var6 = createSignal(0)
	local var7, var8 = createSignal(0)
	local var9, var10 = createSignal(0)
	local var11, var12 = createSignal("unknown")
	local var13, var14 = createSignal("unknown")
	local var15 = 0
	local var16 = 0
	local var17 = 0
	local var18 = 0
	local var19, var20 = createSignal({
		openDuration = 0,
		closedDuration = 0,
		textIdleDuration = 0,
		backgroundIdleDuration = 0
	})
	
	return {
		getBackgroundTimerStarted = var1,
		getTextTimerStarted = var3,
		getOpenTimerStarted = var5,
		getClosedTimerStarted = var7,
		getPreviousChatWindowStateTimerExpired = var9,
		getCurrentChatWindowState = var11,
		getPreviousChatWindowState = var13,
		getDurationUpdates = var19,
		setBackgroundTimerStarted = var2,
		setTextTimerStarted = var4,
		setOpenTimerStarted = var6,
		setClosedTimerStarted = var8,
		setPreviousChatWindowStateTimerExpired = var10,
		setCurrentChatWindowState = var12,
		setPreviousChatWindowState = var14,
		setDurationUpdates = var20,
		newStateEffect = signalsModule.createEffect(function(p1)
			-- upvalues: var1 (ref), var3 (ref), var5 (ref), var7 (ref), var14 (ref), var11 (ref), var12 (ref), var10 (ref)
			local var21 = var1(p1)
			local var22 = var3(p1)
			local var23 = var5(p1)
			local var24 = var7(p1)
			var14(var11(false))
			
			if var24 < var23 and var22 < var23 and var21 < var23 then
				var12("open")
				var10(var23)
				
				return
			elseif var22 < var24 and var21 < var24 then
				var12("closed")
				var10(var24)
				
				return
			elseif var21 < var22 then
				var12("textIdle")
				var10(var22)
				
				return
			elseif var21 > 0 then
				var12("backgroundIdle")
				var10(var21)
				
				return
			end
			var12("unknown")
		end),
		changingWindowStateEffect = signalsModule.createEffect(function(p1)
			-- upvalues: var13 (ref), var9 (ref), var15 (write), var5 (ref), var16 (write), var7 (ref), var17 (write), var3 (ref), var18 (write), var1 (ref), var20 (ref)
			local var21 = var13(p1)
			local var22 = var9(p1)
			
			if var21 == "open" then
				var15 = var22 - var5(p1)
			elseif var21 == "closed" then
				var16 = var22 - var7(p1)
			elseif var21 == "textIdle" then
				var17 = var22 - var3(p1)
			elseif var21 == "backgroundIdle" then
				var18 = var22 - var1(p1)
			end
			var20(function(p2)
				-- upvalues: var15 (copy), var16 (copy), var17 (copy), var18 (copy)
				return {
					openDuration = p2.openDuration + var15,
					closedDuration = p2.closedDuration + var16,
					textIdleDuration = p2.textIdleDuration + var17,
					backgroundIdleDuration = p2.backgroundIdleDuration + var18
				}
			end)
		end)
	}
end