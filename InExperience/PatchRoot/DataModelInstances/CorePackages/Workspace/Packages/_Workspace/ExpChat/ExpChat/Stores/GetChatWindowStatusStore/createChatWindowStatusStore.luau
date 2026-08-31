local expChat = script:FindFirstAncestor("ExpChat")
local signalsModule = require(expChat.Parent.Signals)
local createSignal = signalsModule.createSignal
local fFlagExpChatWindowStatusEventFixesModule = require(expChat.Flags.FFlagExpChatWindowStatusEventFixes)

return function()
	-- upvalues: createSignal (ref), signalsModule (ref), fFlagExpChatWindowStatusEventFixesModule (ref)
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
	local var21 = nil
	
	local function _(p1)
		-- upvalues: var5 (ref), var7 (ref), var3 (ref), var1 (ref)
		return if p1 == "open" then var5(false) elseif p1 == "closed" then var7(false) elseif p1 == "textIdle" then var3(false) elseif p1 == "backgroundIdle" then var1(false) else 0
	end
	
	local _ = function(p1, p2)
		-- upvalues: var5 (ref), var7 (ref), var3 (ref), var1 (ref), var20 (ref)
		if p1 == "unknown" then return end
		local var22 = p2 - (if p1 == "open" then var5(false) elseif p1 == "closed" then var7(false) elseif p1 == "textIdle" then var3(false) elseif p1 == "backgroundIdle" then var1(false) else 0)
		
		if var22 <= 0 then
			return
		end
		var20(function(p3)
			-- upvalues: p1 (ref), var22 (ref)
			return if p1 == "open" then {
				openDuration = p3.openDuration + var22,
				closedDuration = p3.closedDuration,
				textIdleDuration = p3.textIdleDuration,
				backgroundIdleDuration = p3.backgroundIdleDuration
			} elseif p1 == "closed" then {
				openDuration = p3.openDuration,
				closedDuration = p3.closedDuration + var22,
				textIdleDuration = p3.textIdleDuration,
				backgroundIdleDuration = p3.backgroundIdleDuration
			} elseif p1 == "textIdle" then {
				openDuration = p3.openDuration,
				closedDuration = p3.closedDuration,
				textIdleDuration = p3.textIdleDuration + var22,
				backgroundIdleDuration = p3.backgroundIdleDuration
			} elseif p1 == "backgroundIdle" then {
				openDuration = p3.openDuration,
				closedDuration = p3.closedDuration,
				textIdleDuration = p3.textIdleDuration,
				backgroundIdleDuration = p3.backgroundIdleDuration + var22
			} else p3
		end)
	end
	
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
		flushFinalDuration = function(p1)
			-- upvalues: var21 (write), var11 (ref), var19 (ref), var5 (ref), var7 (ref), var3 (ref), var1 (ref), var20 (ref)
			if var21 then
				return var21, false
			end
			local var22 = var11(false)
			
			if var22 == "unknown" then
				return var19(false), false
			end
			p1 = p1 or os.clock()
			
			if var22 ~= "unknown" then
				local var23 = p1 - (if var22 == "open" then var5(false) elseif var22 == "closed" then var7(false) elseif var22 == "textIdle" then var3(false) elseif var22 == "backgroundIdle" then var1(false) else 0)
				
				if var23 > 0 then
					var20(function(p2)
						-- upvalues: var22 (ref), var23 (ref)
						return if var22 == "open" then {
							openDuration = p2.openDuration + var23,
							closedDuration = p2.closedDuration,
							textIdleDuration = p2.textIdleDuration,
							backgroundIdleDuration = p2.backgroundIdleDuration
						} elseif var22 == "closed" then {
							openDuration = p2.openDuration,
							closedDuration = p2.closedDuration + var23,
							textIdleDuration = p2.textIdleDuration,
							backgroundIdleDuration = p2.backgroundIdleDuration
						} elseif var22 == "textIdle" then {
							openDuration = p2.openDuration,
							closedDuration = p2.closedDuration,
							textIdleDuration = p2.textIdleDuration + var23,
							backgroundIdleDuration = p2.backgroundIdleDuration
						} elseif var22 == "backgroundIdle" then {
							openDuration = p2.openDuration,
							closedDuration = p2.closedDuration,
							textIdleDuration = p2.textIdleDuration,
							backgroundIdleDuration = p2.backgroundIdleDuration + var23
						} else p2
					end)
				end
			end
			local var24 = var19(false)
			var21 = var24
			
			return var24, true
		end,
		newStateEffect = signalsModule.createEffect(function(p1)
			-- upvalues: var1 (ref), var3 (ref), var5 (ref), var7 (ref), var14 (ref), var11 (ref), var12 (ref), var10 (ref)
			local var22 = var1(p1)
			local var23 = var3(p1)
			local var24 = var5(p1)
			local var25 = var7(p1)
			var14(var11(false))
			
			if var25 < var24 and var23 < var24 and var22 < var24 then
				var12("open")
				var10(var24)
				
				return
			elseif var23 < var25 and var22 < var25 then
				var12("closed")
				var10(var25)
				
				return
			elseif var22 < var23 then
				var12("textIdle")
				var10(var23)
				
				return
			elseif var22 > 0 then
				var12("backgroundIdle")
				var10(var22)
				
				return
			end
			var12("unknown")
		end),
		changingWindowStateEffect = signalsModule.createEffect(function(p1)
			-- upvalues: var13 (ref), var9 (ref), fFlagExpChatWindowStatusEventFixesModule (copy), var5 (ref), var7 (ref), var3 (ref), var1 (ref), var20 (ref), var15 (write), var16 (write), var17 (write), var18 (write)
			local var22 = var13(p1)
			local var23 = var9(p1)
			
			if fFlagExpChatWindowStatusEventFixesModule then
				if var22 == "unknown" then return end
				local var24 = var23 - (if var22 == "open" then var5(false) elseif var22 == "closed" then var7(false) elseif var22 == "textIdle" then var3(false) elseif var22 == "backgroundIdle" then var1(false) else 0)
				
				if var24 <= 0 then
					return
				end
				var20(function(p2)
					-- upvalues: var22 (ref), var24 (ref)
					return if var22 == "open" then {
						openDuration = p2.openDuration + var24,
						closedDuration = p2.closedDuration,
						textIdleDuration = p2.textIdleDuration,
						backgroundIdleDuration = p2.backgroundIdleDuration
					} elseif var22 == "closed" then {
						openDuration = p2.openDuration,
						closedDuration = p2.closedDuration + var24,
						textIdleDuration = p2.textIdleDuration,
						backgroundIdleDuration = p2.backgroundIdleDuration
					} elseif var22 == "textIdle" then {
						openDuration = p2.openDuration,
						closedDuration = p2.closedDuration,
						textIdleDuration = p2.textIdleDuration + var24,
						backgroundIdleDuration = p2.backgroundIdleDuration
					} elseif var22 == "backgroundIdle" then {
						openDuration = p2.openDuration,
						closedDuration = p2.closedDuration,
						textIdleDuration = p2.textIdleDuration,
						backgroundIdleDuration = p2.backgroundIdleDuration + var24
					} else p2
				end)
				
				return
			elseif var22 == "open" then
				var15 = var23 - var5(p1)
			elseif var22 == "closed" then
				var16 = var23 - var7(p1)
			elseif var22 == "textIdle" then
				var17 = var23 - var3(p1)
			elseif var22 == "backgroundIdle" then
				var18 = var23 - var1(p1)
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