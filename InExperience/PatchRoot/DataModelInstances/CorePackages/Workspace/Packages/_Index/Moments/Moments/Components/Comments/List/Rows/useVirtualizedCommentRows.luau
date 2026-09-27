local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local _ = require(script.Parent.CommentRowTypes)
local buildVirtualizedCommentRowsModule = require(script.Parent.buildVirtualizedCommentRows)
local t = {}

local function findTopLogicalRow(p1, p2)
	local var1 = p1[#p1]
	
	if var1 == nil or var1.yOffset + var1.height < p2 then
		return nil, nil
	end
	for i = #p1, 1, -1 do
		local var2 = p1[i]
		
		if var2.yOffset > p2 then
			continue
		end
		if var2.yOffset + var2.height < p2 and p1[i + 1] ~= nil then
			return i + 1, p1[i + 1]
		end
		return i, var2
	end
	return if p1[1] ~= nil then nil else 1, p1[1]
end

return function(p3, p4, p5, p6, p7)
	-- upvalues: reactModule (ref), t (ref), buildVirtualizedCommentRowsModule (ref), findTopLogicalRow (ref)
	local var3 = reactModule.useMemo(function()
		return {}
	end, { p6 })
	local var4, var5 = reactModule.useState(function()
		-- upvalues: var3 (ref)
		return { sessionToken = var3, byRowKey = {} }
	end)
	local var6 = reactModule.useRef(var3)
	var6.current = var3
	local var7 = reactModule.useMemo(function()
		-- upvalues: p3 (ref)
		local t = {}
		
		for i, v in p3 do
			t[v.key] = i
		end
		return t
	end, { p3 })
	local var8 = reactModule.useRef(var7)
	var8.current = var7
	local var9 = if var4.sessionToken == var3 then var4.byRowKey else t
	local var10 = reactModule.useMemo(function()
		-- upvalues: buildVirtualizedCommentRowsModule (copy), p3 (ref), var9 (ref), p4 (ref), p5 (ref)
		return buildVirtualizedCommentRowsModule(p3, var9, p4, p5)
	end, { p3, var9, p4, p5 })
	local var11 = reactModule.useRef(var10)
	var11.current = var10
	local var12 = reactModule.useRef(var4)
	var12.current = var4
	local var13 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var3 (ref), t (copy), p3 (ref), var13 (ref)
		var5(function(p8)
			-- upvalues: var3 (copy), t (copy), p3 (copy)
			local var14 = if p8.sessionToken == var3 then p8.byRowKey else t
			local t_1 = {}
			local var15 = 0
			
			for i, v in p3 do
				local key = var14[v.key]
				
				if key ~= nil and key > 0 then
					t_1[v.key] = key
					var15 += 1
				end
			end
			local var16 = 0
			
			for i_1 in var14 do
				var16 += 1
			end
			return if p8.sessionToken == var3 and var15 == var16 then p8 else { sessionToken = var3, byRowKey = t_1 }
		end)
		
		if #p3 == 0 then
			var13.current = nil
		end
	end, { p3, var3 })
	local var17 = reactModule.useCallback(function(p9, p10)
		-- upvalues: var6 (ref), var3 (ref), var8 (ref), var12 (ref), t (copy), p7 (ref), var11 (ref), findTopLogicalRow (copy), var13 (ref), var5 (ref)
		if var6.current ~= var3 or var8.current[p9] == nil or (p10 <= 0 or p10 ~= p10) then return end
		local current = var12.current
		
		if (if current.sessionToken == var3 then current.byRowKey[p9] else nil) == p10 then return end
		local cloned = table.clone(if current.sessionToken == var3 then current.byRowKey else t)
		cloned[p9] = p10
		var12.current = { sessionToken = var3, byRowKey = cloned }
		local current_1 = p7.current
		local current_2 = var11.current
		
		if current_1 ~= nil then
			local var18 = var8.current[p9]
			local var19, var20 = findTopLogicalRow(current_2, current_1.CanvasPosition.Y)
			
			if var18 ~= nil and var19 ~= nil and (var18 <= var19 and var20 ~= nil) then
				local var21 = current_2[#current_2]
				var13.current = {
					sessionToken = var3,
					scrollingFrame = current_1,
					canvasY = current_1.CanvasPosition.Y,
					rowKey = var20.row.key,
					intraRowOffset = current_1.CanvasPosition.Y - var20.yOffset,
					trailingExtent = math.max(0, current_1.AbsoluteCanvasSize.Y - (if var21 ~= nil then 0 else var21.yOffset + var21.height))
				}
			end
		end
		var5(function(p11)
			-- upvalues: var3 (copy), t (copy), p9 (ref), p10 (ref)
			local var22 = if p11.sessionToken == var3 then p11.byRowKey else t
			
			if var22[p9] == p10 then
				return p11
			end
			local cloned = table.clone(var22)
			cloned[p9] = p10
			
			return { sessionToken = var3, byRowKey = cloned }
		end)
	end, { p7, var3 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var13 (ref), p7 (ref), var3 (ref), var6 (ref), var10 (ref)
		local current = var13.current
		
		if current == nil then return end
		var13.current = nil
		local current_1 = p7.current
		
		if current.sessionToken ~= var3 or var6.current ~= var3 or (current_1 ~= current.scrollingFrame or current_1 == nil) or current_1.CanvasPosition.Y ~= current.canvasY then return end
		local var18 = nil
		
		for i, v in var10 do
			if v.row.key == current.rowKey then
				var18 = v
				break
			end
		end
		if var18 == nil then return end
		local var19 = var10[#var10]
		local clampedValue = math.clamp(var18.yOffset + math.min(current.intraRowOffset, var18.height), 0, math.max(0, (if var19 ~= nil then 0 else var19.yOffset + var19.height) + current.trailingExtent - current_1.AbsoluteWindowSize.Y))
		
		if clampedValue ~= current_1.CanvasPosition.Y then
			current_1.CanvasPosition = Vector2.new(current_1.CanvasPosition.X, clampedValue)
		end
	end, { var10, p7, var3 })
	
	return { geometry = var10, onRowHeightChanged = var17 }
end