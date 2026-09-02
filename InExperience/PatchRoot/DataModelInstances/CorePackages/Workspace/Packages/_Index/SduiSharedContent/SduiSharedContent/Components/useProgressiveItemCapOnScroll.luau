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

return function(p3, p4, p5, p6, p7)
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
		-- upvalues: p6 (ref), minValue (ref), var7 (ref), var6 (ref), p3 (ref), var2 (write), maxValue_1 (ref), p7 (ref), var4 (ref)
		local var8 = if p6 then p6.current else nil
		
		if not minValue or var8 == nil then
			return nil
		end
		local var9 = false
		
		local function _()
			-- upvalues: var7 (copy), var8 (ref), var6 (copy), p3 (copy), var2 (copy), maxValue_1 (copy)
			var7.current = var8.AbsoluteCanvasSize.Y
			var6(function(p8)
				-- upvalues: p3 (copy), var2 (copy), maxValue_1 (copy)
				local var10
				local minValue = math.min(p8, var2)
				
				if minValue <= 0 then
					var10 = 0
				else
					local var11 = 0
					
					for i, v in p3 do
						var11 += if v > 0 then v else 1
						
						if minValue <= var11 then
							var10 = i
						end
					end
					var10 = #p3
				end
				local var12 = 0
				
				for i = 1, var10 do
					local var13 = p3[i]
					var12 += if var13 > 0 then var13 else 1
				end
				return math.max(p8 + maxValue_1, var12 + 1)
			end)
		end
		
		local function showNextBatchIfUnderfilled()
			-- upvalues: var9 (write), var8 (ref), var7 (copy), var6 (copy), p3 (copy), var2 (copy), maxValue_1 (copy)
			if var9 then return end
			local y = var8.AbsoluteCanvasSize.Y
			
			if var8.AbsoluteWindowSize.Y < y then return end
			local current = var7.current
			
			if current == nil or y ~= current then
				var7.current = var8.AbsoluteCanvasSize.Y
				var6(function(p9)
					-- upvalues: p3 (copy), var2 (copy), maxValue_1 (copy)
					local var14
					local minValue = math.min(p9, var2)
					
					if minValue <= 0 then
						var14 = 0
					else
						local var15 = 0
						
						for i, v in p3 do
							var15 += if v > 0 then v else 1
							
							if minValue <= var15 then
								var14 = i
							end
						end
						var14 = #p3
					end
					local var16
					local var16 = 0
					
					for i = 1, var14 do
						local var17 = p3[i]
						var16 += if var17 > 0 then var17 else 1
					end
					return math.max(p9 + maxValue_1, var16 + 1)
				end)
				
				return
			end
		end
		
		local list = {
			var8:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: var9 (write), var8 (ref), var7 (copy), p7 (copy), var4 (copy), var6 (copy), p3 (copy), var2 (copy), maxValue_1 (copy)
				if var9 then return end
				local y = var8.CanvasPosition.Y
				local y_1 = var8.AbsoluteCanvasSize.Y
				local y_2 = var8.AbsoluteWindowSize.Y
				local current = var7.current
				
				if current ~= nil and y_1 == current then return end
				if math.max(0, p7) < y_1 - y_2 - y then return end
				local current_1 = var4.current
				
				if current_1 == nil or y > current_1 then
					var4.current = y
					var7.current = var8.AbsoluteCanvasSize.Y
					var6(function(p9)
						-- upvalues: p3 (copy), var2 (copy), maxValue_1 (copy)
						local var14
						local minValue = math.min(p9, var2)
						
						if minValue <= 0 then
							var14 = 0
						else
							local var15 = 0
							
							for i, v in p3 do
								var15 += if v > 0 then v else 1
								
								if minValue <= var15 then
									var14 = i
								end
							end
							var14 = #p3
						end
						local var16
						local var16 = 0
						
						for i = 1, var14 do
							local var17 = p3[i]
							var16 += if var17 > 0 then var17 else 1
						end
						return math.max(p9 + maxValue_1, var16 + 1)
					end)
					
					return
				end
			end),
			var8:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(showNextBatchIfUnderfilled),
			var8:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(showNextBatchIfUnderfilled)
		}
		local y = var8.AbsoluteCanvasSize.Y
		
		if var8.AbsoluteWindowSize.Y >= y then
			local current = var7.current
			
			if current == nil or y ~= current then
				var7.current = var8.AbsoluteCanvasSize.Y
				var6(function(p9)
					-- upvalues: p3 (copy), var2 (copy), maxValue_1 (copy)
					local var14
					local minValue = math.min(p9, var2)
					
					if minValue <= 0 then
						var14 = 0
					else
						local var15 = 0
						
						for i, v in p3 do
							var15 += if v > 0 then v else 1
							
							if minValue <= var15 then
								var14 = i
							end
						end
						var14 = #p3
					end
					local var16
					local var16 = 0
					
					for i = 1, var14 do
						local var17 = p3[i]
						var16 += if var17 > 0 then var17 else 1
					end
					return math.max(p9 + maxValue_1, var16 + 1)
				end)
			end
		end
		return function()
			-- upvalues: var9 (write), list (ref)
			var9 = true
			
			for i, v in list do
				v:Disconnect()
			end
		end
	end, {
		minValue, maxValue_1, var2, p6, p7, p3
	})
	
	return var3, minValue
end