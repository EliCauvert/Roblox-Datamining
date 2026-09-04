local reactModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.React)

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

return function(p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: reactModule (ref)
	local maxValue = math.max(0, p4)
	local maxValue_1 = math.max(1, p5)
	local var2 = 0
	
	for i, v in p3 do
		var2 += if v > 0 then v else 1
	end
	local var3, var4
	local p2Count = #p3
	local var5, var6 = reactModule.useState(maxValue)
	local minValue = math.min(var5, var2)
	
	if minValue <= 0 then
		var3 = 0
	else
		var4 = 0
		
		for i_1, v_1 in p3 do
			var4 += if v_1 > 0 then v_1 else 1
			
			if minValue <= var4 then
				var3 = i_1
			end
		end
		var3 = #p3
	end
	minValue = var3 < p2Count
	var4 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: p6 (ref), minValue (ref), p7 (ref), var7 (ref), var6 (ref), p3 (ref), var2 (write), maxValue_1 (ref), p8 (ref), var4 (ref), p9 (ref)
		local var8 = if p6 then p6.current else nil
		
		if not minValue or var8 == nil then
			return nil
		end
		local var9 = false
		
		local function _()
			-- upvalues: p7 (copy)
			local var10 = if p7 then p7.current else nil
			
			return if var10 == nil then nil else var10.AbsoluteContentSize.Y
		end
		
		local _ = function()
			-- upvalues: var7 (copy), p7 (copy), var8 (ref), var6 (copy), p3 (copy), var2 (copy), maxValue_1 (copy)
			local var10 = if p7 then p7.current else nil
			var7.current = (if var10 == nil then nil else var10.AbsoluteContentSize.Y) or var8.AbsoluteCanvasSize.Y
			var6(function(p10)
				-- upvalues: p3 (copy), var2 (copy), maxValue_1 (copy)
				local var11
				local minValue = math.min(p10, var2)
				
				if minValue <= 0 then
					var11 = 0
				else
					local var12 = 0
					
					for i, v in p3 do
						var12 += if v > 0 then v else 1
						
						if minValue <= var12 then
							var11 = i
						end
					end
					var11 = #p3
				end
				local var13 = 0
				
				for i = 1, var11 do
					local var14 = p3[i]
					var13 += if var14 > 0 then var14 else 1
				end
				return math.max(p10 + maxValue_1, var13 + 1)
			end)
		end
		
		local function showNextBatchIfNearEnd()
			-- upvalues: var9 (write), var8 (ref), p7 (copy), var7 (copy), p8 (copy), var4 (copy), var6 (copy), p3 (copy), var2 (copy), maxValue_1 (copy)
			if var9 then return end
			local y = var8.CanvasPosition.Y
			local y_1 = var8.AbsoluteCanvasSize.Y
			local y_2 = var8.AbsoluteWindowSize.Y
			local var15 = if p7 then p7.current else nil
			local current = var7.current
			
			if current ~= nil and ((if var15 == nil then nil else var15.AbsoluteContentSize.Y) or y_1) == current then return end
			if math.max(0, p8) < y_1 - y_2 - y then return end
			local current_1 = var4.current
			
			if current_1 == nil or y > current_1 then
				var4.current = y
				local var16 = if p7 then p7.current else nil
				var7.current = (if var16 == nil then nil else var16.AbsoluteContentSize.Y) or var8.AbsoluteCanvasSize.Y
				var6(function(p11)
					-- upvalues: p3 (copy), var2 (copy), maxValue_1 (copy)
					local var17
					local minValue = math.min(p11, var2)
					
					if minValue <= 0 then
						var17 = 0
					else
						local var18 = 0
						
						for i, v in p3 do
							var18 += if v > 0 then v else 1
							
							if minValue <= var18 then
								var17 = i
							end
						end
						var17 = #p3
					end
					local var19
					local var19 = 0
					
					for i = 1, var17 do
						local var20 = p3[i]
						var19 += if var20 > 0 then var20 else 1
					end
					return math.max(p11 + maxValue_1, var19 + 1)
				end)
				
				return
			end
		end
		
		local _ = function()
			-- upvalues: var9 (write), p7 (copy), var8 (ref), var7 (copy), var6 (copy), p3 (copy), var2 (copy), maxValue_1 (copy)
			if var9 then return end
			local var17 = if p7 then p7.current else nil
			local var18 = if var17 == nil then nil else var17.AbsoluteContentSize.Y
			
			if var18 == nil or var18 <= 0 then return end
			if var8.AbsoluteWindowSize.Y <= var18 then return end
			local current = var7.current
			
			if current == nil or var18 ~= current then
				var7.current = var18
				local var19 = if p7 then p7.current else nil
				var7.current = (if var19 == nil then nil else var19.AbsoluteContentSize.Y) or var8.AbsoluteCanvasSize.Y
				var6(function(p11)
					-- upvalues: p3 (copy), var2 (copy), maxValue_1 (copy)
					local var20
					local minValue = math.min(p11, var2)
					
					if minValue <= 0 then
						var20 = 0
					else
						local var21 = 0
						
						for i, v in p3 do
							var21 += if v > 0 then v else 1
							
							if minValue <= var21 then
								var20 = i
							end
						end
						var20 = #p3
					end
					local var22
					local var22 = 0
					
					for i = 1, var20 do
						local var23 = p3[i]
						var22 += if var23 > 0 then var23 else 1
					end
					return math.max(p11 + maxValue_1, var22 + 1)
				end)
				
				return
			end
		end
		
		local delayedThread = nil
		
		local function scheduleUnderfillDecision()
			-- upvalues: delayedThread (write), p9 (copy), var9 (write), p7 (copy), var8 (ref), var7 (copy), var6 (copy), p3 (copy), var2 (copy), maxValue_1 (copy)
			if delayedThread then
				task.cancel(delayedThread)
			end
			delayedThread = task.delay(p9 / 1000, function()
				-- upvalues: delayedThread (copy), var9 (copy), p7 (copy), var8 (copy), var7 (copy), var6 (copy), p3 (copy), var2 (copy), maxValue_1 (copy)
				delayedThread = nil
				
				if not var9 then
					if var9 then return end
					local var20 = if p7 then p7.current else nil
					local var21 = if var20 == nil then nil else var20.AbsoluteContentSize.Y
					
					if var21 ~= nil then
						if var21 <= 0 then return end
						if var8.AbsoluteWindowSize.Y <= var21 then return end
						local current = var7.current
						
						if current ~= nil and var21 == current then return end
						var7.current = var21
						local var22 = if p7 then p7.current else nil
						var7.current = (if var22 == nil then nil else var22.AbsoluteContentSize.Y) or var8.AbsoluteCanvasSize.Y
						var6(function(p11)
							-- upvalues: p3 (copy), var2 (copy), maxValue_1 (copy)
							local var23
							local minValue = math.min(p11, var2)
							
							if minValue <= 0 then
								var23 = 0
							else
								local var24 = 0
								
								for i, v in p3 do
									var24 += if v > 0 then v else 1
									
									if minValue <= var24 then
										var23 = i
									end
								end
								var23 = #p3
							end
							local var25
							local var25 = 0
							
							for i = 1, var23 do
								local var26 = p3[i]
								var25 += if var26 > 0 then var26 else 1
							end
							return math.max(p11 + maxValue_1, var25 + 1)
						end)
					end
				end
			end)
		end
		
		local list = {
			var8:GetPropertyChangedSignal("CanvasPosition"):Connect(showNextBatchIfNearEnd),
			var8:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(scheduleUnderfillDecision)
		}
		
		if p7 ~= nil and p7.current ~= nil then
			table.insert(list, p7.current:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(scheduleUnderfillDecision))
		end
		delayedThread = task.delay(p9 / 1000, function()
			-- upvalues: delayedThread (write), var9 (write), p7 (copy), var8 (ref), var7 (copy), var6 (copy), p3 (copy), var2 (copy), maxValue_1 (copy)
			delayedThread = nil
			
			if not var9 then
				if var9 then return end
				local var23 = if p7 then p7.current else nil
				local var24 = if var23 == nil then nil else var23.AbsoluteContentSize.Y
				
				if var24 ~= nil then
					if var24 <= 0 then return end
					if var8.AbsoluteWindowSize.Y <= var24 then return end
					local current = var7.current
					
					if current ~= nil and var24 == current then return end
					var7.current = var24
					local var25 = if p7 then p7.current else nil
					var7.current = (if var25 == nil then nil else var25.AbsoluteContentSize.Y) or var8.AbsoluteCanvasSize.Y
					var6(function(p11)
						-- upvalues: p3 (copy), var2 (copy), maxValue_1 (copy)
						local var26
						local minValue = math.min(p11, var2)
						
						if minValue <= 0 then
							var26 = 0
						else
							local var27 = 0
							
							for i, v in p3 do
								var27 += if v > 0 then v else 1
								
								if minValue <= var27 then
									var26 = i
								end
							end
							var26 = #p3
						end
						local var28
						local var28 = 0
						
						for i = 1, var26 do
							local var29 = p3[i]
							var28 += if var29 > 0 then var29 else 1
						end
						return math.max(p11 + maxValue_1, var28 + 1)
					end)
				end
			end
		end)
		
		return function()
			-- upvalues: var9 (write), delayedThread (write), list (ref)
			var9 = true
			
			if delayedThread then
				task.cancel(delayedThread)
			end
			for i, v in list do
				v:Disconnect()
			end
		end
	end, {
		minValue, maxValue_1, var2, p6, p7, p8, p3, p9
	})
	
	return var3, minValue
end