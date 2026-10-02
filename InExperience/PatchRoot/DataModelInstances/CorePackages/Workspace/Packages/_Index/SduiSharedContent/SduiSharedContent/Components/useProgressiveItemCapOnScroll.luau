local sduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local reactModule = require(sduiSharedContent.Parent.React)
local fFlagSduiProgressiveScrollMathFixModule = require(sduiSharedContent.Flags.FFlagSduiProgressiveScrollMathFix)

local function _(p1, p2)
	if p2 <= 0 then
		return 0
	end
	local var1 = 0
	
	for i, v in p1 do
		var1 += if v > 0 then v else 1
		
		if p2 <= var1 then
			return i
		end
	end
	return #p1
end

local _ = function(p3, p4)
	if p3 == p4 then
		return true
	elseif #p3 ~= #p4 then
		return false
	end
	for i = 1, #p3 do
		if p3[i] == p4[i] then
			continue
		end
		return false
	end
	return true
end

return function(p5, p6, p7, p8, p9, p10, p11)
	-- upvalues: reactModule (ref), fFlagSduiProgressiveScrollMathFixModule (ref)
	local maxValue = math.max(0, p6)
	local maxValue_1 = math.max(1, p7)
	local var2 = 0
	
	for i, v in p5 do
		var2 += if v > 0 then v else 1
	end
	local var3, var4
	local p4Count = #p5
	local var5, var6 = reactModule.useState(maxValue)
	local var7 = if fFlagSduiProgressiveScrollMathFixModule then reactModule.useRef(0) else nil
	local var8 = if fFlagSduiProgressiveScrollMathFixModule then reactModule.useRef(false) else nil
	local var9 = if fFlagSduiProgressiveScrollMathFixModule then reactModule.useRef(p5) else nil
	local minValue = math.min(var5, var2)
	
	if minValue <= 0 then
		var3 = 0
	else
		var4 = 0
		
		for i_1, v_1 in p5 do
			var4 += if v_1 > 0 then v_1 else 1
			
			if minValue <= var4 then
				var3 = i_1
			end
		end
		var3 = #p5
	end
	if fFlagSduiProgressiveScrollMathFixModule and p4Count > 0 then
		if p4Count < var7.current then
			var7.current = p4Count
		end
		if var3 < var7.current then
			var3 = var7.current
		else
			var7.current = var3
		end
	end
	minValue = var3 < p4Count
	var4 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: fFlagSduiProgressiveScrollMathFixModule (copy), var9 (ref), p5 (ref), var4 (ref), var10 (ref), p8 (ref), minValue (ref), p9 (ref), var7 (ref), var6 (ref), var2 (write), maxValue_1 (ref), var8 (ref), p10 (ref), p11 (ref)
		local current, i
		local var11 = nil
		
		if fFlagSduiProgressiveScrollMathFixModule then
			local var12
			current = var9.current
			local var13 = p5
			
			if current == var13 then
				var12 = true
			elseif #current == #var13 then
				for i = 1, #current do
					if current[i] == var13[i] then
						continue
					end
					var12 = false
				end
				var12 = true
			else
				var12 = false
			end
			if not var12 then
				var9.current = p5
				
				if var4.current ~= nil then
					var4.current = nil
					var10.current = nil
					var11 = true
				end
			end
		end
		local var14 = if p8 then p8.current else nil
		
		if not minValue or var14 == nil then
			return nil
		end
		current = false
		
		local function var18()
			-- upvalues: p9 (copy)
			local var15 = if p9 then p9.current else nil
			
			return if var15 == nil then nil else var15.AbsoluteContentSize.Y
		end
		
		local y = nil
		local y_1 = nil
		i = nil
		
		if fFlagSduiProgressiveScrollMathFixModule then
			y = var14.AbsoluteCanvasSize.Y
			y_1 = var14.AbsoluteWindowSize.Y
			local var15 = if p9 then p9.current else nil
			i = if var15 ~= nil then nil else var15.AbsoluteContentSize.Y
		end
		local list
		local function _()
			-- upvalues: var10 (copy), fFlagSduiProgressiveScrollMathFixModule (copy), i (write), y (write), p9 (copy), var14 (ref), var7 (copy), var6 (copy), p5 (copy), var2 (copy), maxValue_1 (copy)
-- FATAL: Failed to generate AST for `showNextBatch` function:
runtime : [KeyError] :11990: 38
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
		end
		
		local function showNextBatchIfNearEnd()
			-- upvalues: current (write), fFlagSduiProgressiveScrollMathFixModule (copy), var8 (copy), var14 (ref), y (write), y_1 (write), i (write), p9 (copy), var10 (copy), p10 (copy), var4 (copy), var7 (copy), var6 (copy), p5 (copy), var2 (copy), maxValue_1 (copy)
-- FATAL: Failed to generate AST for `showNextBatchIfNearEnd` function:
runtime : [KeyError] :11990: 53
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
		end
		
		local _ = function()
			-- upvalues: current (write), fFlagSduiProgressiveScrollMathFixModule (copy), i (write), p9 (copy), y_1 (write), var14 (ref), var10 (copy), y (write), var7 (copy), var6 (copy), p5 (copy), var2 (copy), maxValue_1 (copy)
-- FATAL: Failed to generate AST for `decideUnderfill` function:
runtime : [KeyError] :11990: 79
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
		end
		
		local delayedThread = nil
		
		local function scheduleUnderfillDecision()
			-- upvalues: delayedThread (write), p11 (copy), current (write), fFlagSduiProgressiveScrollMathFixModule (copy), i (write), p9 (copy), y_1 (write), var14 (ref), var10 (copy), y (write), var7 (copy), var6 (copy), p5 (copy), var2 (copy), maxValue_1 (copy)
			if delayedThread then
				task.cancel(delayedThread)
			end
			delayedThread = task.delay(p11 / 1000, function()
				-- upvalues: delayedThread (copy), current (copy), fFlagSduiProgressiveScrollMathFixModule (copy), i (copy), p9 (copy), y_1 (copy), var14 (copy), var10 (copy), y (copy), var7 (copy), var6 (copy), p5 (copy), var2 (copy), maxValue_1 (copy)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 100
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
			end)
		end
		
		local _ = nil
		
		if fFlagSduiProgressiveScrollMathFixModule then
			list = {
				var14:GetPropertyChangedSignal("CanvasPosition"):Connect(showNextBatchIfNearEnd),
				var14:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
					-- upvalues: y (write), var14 (ref), var8 (copy), showNextBatchIfNearEnd (ref), delayedThread (write), p11 (copy), current (write), fFlagSduiProgressiveScrollMathFixModule (copy), i (write), p9 (copy), y_1 (write), var10 (copy), var7 (copy), var6 (copy), p5 (copy), var2 (copy), maxValue_1 (copy)
					y = var14.AbsoluteCanvasSize.Y
					
					if var8.current then
						showNextBatchIfNearEnd()
					end
					if delayedThread then
						task.cancel(delayedThread)
					end
					delayedThread = task.delay(p11 / 1000, function()
						-- upvalues: delayedThread (copy), current (copy), fFlagSduiProgressiveScrollMathFixModule (copy), i (copy), p9 (copy), y_1 (copy), var14 (copy), var10 (copy), y (copy), var7 (copy), var6 (copy), p5 (copy), var2 (copy), maxValue_1 (copy)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 100
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
					end)
				end),
				var14:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
					-- upvalues: y_1 (write), var14 (ref), var4 (copy), y (write), var10 (copy), showNextBatchIfNearEnd (ref), delayedThread (write), p11 (copy), current (write), fFlagSduiProgressiveScrollMathFixModule (copy), i (write), p9 (copy), var7 (copy), var6 (copy), p5 (copy), var2 (copy), maxValue_1 (copy)
					y_1 = var14.AbsoluteWindowSize.Y
					local current_1 = var4.current
					
					if current_1 ~= nil and y - y_1 < current_1 then
						var4.current = nil
						var10.current = nil
						showNextBatchIfNearEnd()
					end
					if delayedThread then
						task.cancel(delayedThread)
					end
					delayedThread = task.delay(p11 / 1000, function()
						-- upvalues: delayedThread (copy), current (copy), fFlagSduiProgressiveScrollMathFixModule (copy), i (copy), p9 (copy), y_1 (copy), var14 (copy), var10 (copy), y (copy), var7 (copy), var6 (copy), p5 (copy), var2 (copy), maxValue_1 (copy)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 100
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
					end)
				end)
			}
			local current_1 = p9 and p9.current
			
			if current_1 ~= nil then
				table.insert(list, current_1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					-- upvalues: i (write), current_1 (ref), var8 (copy), showNextBatchIfNearEnd (ref), delayedThread (write), p11 (copy), current (write), fFlagSduiProgressiveScrollMathFixModule (copy), p9 (copy), y_1 (write), var14 (ref), var10 (copy), y (write), var7 (copy), var6 (copy), p5 (copy), var2 (copy), maxValue_1 (copy)
					i = current_1.AbsoluteContentSize.Y
					
					if var8.current then
						showNextBatchIfNearEnd()
					end
					if delayedThread then
						task.cancel(delayedThread)
					end
					delayedThread = task.delay(p11 / 1000, function()
						-- upvalues: delayedThread (copy), current (copy), fFlagSduiProgressiveScrollMathFixModule (copy), i (copy), p9 (copy), y_1 (copy), var14 (copy), var10 (copy), y (copy), var7 (copy), var6 (copy), p5 (copy), var2 (copy), maxValue_1 (copy)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 100
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
					end)
				end))
			end
		else
			list = {
				var14:GetPropertyChangedSignal("CanvasPosition"):Connect(showNextBatchIfNearEnd),
				var14:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(scheduleUnderfillDecision)
			}
			
			if p9 ~= nil and p9.current ~= nil then
				table.insert(list, p9.current:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(scheduleUnderfillDecision))
			end
		end
		delayedThread = task.delay(p11 / 1000, function()
			-- upvalues: delayedThread (write), current (write), fFlagSduiProgressiveScrollMathFixModule (copy), i (write), p9 (copy), y_1 (write), var14 (ref), var10 (copy), y (write), var7 (copy), var6 (copy), p5 (copy), var2 (copy), maxValue_1 (copy)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 100
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
		end)
		
		if fFlagSduiProgressiveScrollMathFixModule and (var11 or var8.current) then
			showNextBatchIfNearEnd()
		end
		return function()
			-- upvalues: current (write), delayedThread (write), list (write)
			current = true
			
			if delayedThread then
				task.cancel(delayedThread)
			end
			for i, v in list do
				v:Disconnect()
			end
		end
	end, {
		minValue, maxValue_1, var2, p8, p9, p10, p5, p11
	})
	
	return var3, minValue
end