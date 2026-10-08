local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Virtualizer.ItemSequence)
local _ = require(viewRecycler.Core.Types)

return function(p1, p2)
	-- upvalues: dataSourceChangeTypeModule (ref)
	local var1 = p1
	local var2 = p2
	local var3 = nil
	local var4 = true
	
	local function _(p3, p4)
		if p3 ~= nil then
			p3.index += p4
			p3.lazy += p4
		end
	end
	
	local _ = function(p3)
		local lazy = p3.lazy
		
		if lazy ~= 0 then
			local left = p3.left
			
			if left ~= nil then
				left.index += lazy
				left.lazy += lazy
			end
			local right = p3.right
			
			if right ~= nil then
				right.index += lazy
				right.lazy += lazy
			end
			p3.lazy = 0
		end
	end
	
	local _ = function(p3)
		return if p3 == nil then 0 else p3.height
	end
	
	local _ = function(p3)
		local left = p3.left
		local right = p3.right
		p3.height = math.max(if left == nil then 0 else left.height, if right == nil then 0 else right.height) + 1
	end
	
	local _ = function(p3)
		local right = p3.right
		local lazy = p3.lazy
		
		if lazy ~= 0 then
			local left = p3.left
			
			if left ~= nil then
				left.index += lazy
				left.lazy += lazy
			end
			local right_1 = p3.right
			
			if right_1 ~= nil then
				right_1.index += lazy
				right_1.lazy += lazy
			end
			p3.lazy = 0
		end
		local lazy_1 = right.lazy
		
		if lazy_1 ~= 0 then
			local left = right.left
			
			if left ~= nil then
				left.index += lazy_1
				left.lazy += lazy_1
			end
			local right_1 = right.right
			
			if right_1 ~= nil then
				right_1.index += lazy_1
				right_1.lazy += lazy_1
			end
			right.lazy = 0
		end
		p3.right = right.left
		right.left = p3
		local left = p3.left
		local right_1 = p3.right
		p3.height = math.max(if left == nil then 0 else left.height, if right_1 == nil then 0 else right_1.height) + 1
		local left_1 = right.left
		local right_2 = right.right
		right.height = math.max(if left_1 == nil then 0 else left_1.height, if right_2 == nil then 0 else right_2.height) + 1
		
		return right
	end
	
	local _ = function(p3)
		local left = p3.left
		local lazy = p3.lazy
		
		if lazy ~= 0 then
			local left_1 = p3.left
			
			if left_1 ~= nil then
				left_1.index += lazy
				left_1.lazy += lazy
			end
			local right = p3.right
			
			if right ~= nil then
				right.index += lazy
				right.lazy += lazy
			end
			p3.lazy = 0
		end
		local lazy_1 = left.lazy
		
		if lazy_1 ~= 0 then
			local left_1 = left.left
			
			if left_1 ~= nil then
				left_1.index += lazy_1
				left_1.lazy += lazy_1
			end
			local right = left.right
			
			if right ~= nil then
				right.index += lazy_1
				right.lazy += lazy_1
			end
			left.lazy = 0
		end
		p3.left = left.right
		left.right = p3
		local left_1 = p3.left
		local right = p3.right
		p3.height = math.max(if left_1 == nil then 0 else left_1.height, if right == nil then 0 else right.height) + 1
		local left_2 = left.left
		local right_1 = left.right
		left.height = math.max(if left_2 == nil then 0 else left_2.height, if right_1 == nil then 0 else right_1.height) + 1
		
		return left
	end
	
	local function balance(p3)
		local left = p3.left
		local right = p3.right
		p3.height = math.max(if left == nil then 0 else left.height, if right == nil then 0 else right.height) + 1
		local left_1 = p3.left
		local right_1 = p3.right
		local var5 = (if left_1 == nil then 0 else left_1.height) - (if right_1 == nil then 0 else right_1.height)
		
		if var5 > 1 then
			local left_2 = p3.left
			local lazy = left_2.lazy
			
			if lazy ~= 0 then
				local left_3 = left_2.left
				
				if left_3 ~= nil then
					left_3.index += lazy
					left_3.lazy += lazy
				end
				local right_2 = left_2.right
				
				if right_2 ~= nil then
					right_2.index += lazy
					right_2.lazy += lazy
				end
				left_2.lazy = 0
			end
			local left_3 = left_2.left
			local right_2 = left_2.right
			
			if (if left_3 == nil then 0 else left_3.height) < (if right_2 == nil then 0 else right_2.height) then
				left_3 = left_2.right
				right_2 = left_2.lazy
				
				if right_2 ~= 0 then
					local left_4 = left_2.left
					
					if left_4 ~= nil then
						left_4.index += right_2
						left_4.lazy += right_2
					end
					local right_3 = left_2.right
					
					if right_3 ~= nil then
						right_3.index += right_2
						right_3.lazy += right_2
					end
					left_2.lazy = 0
				end
				right_2 = left_3.lazy
				
				if right_2 ~= 0 then
					local left_4 = left_3.left
					
					if left_4 ~= nil then
						left_4.index += right_2
						left_4.lazy += right_2
					end
					local right_3 = left_3.right
					
					if right_3 ~= nil then
						right_3.index += right_2
						right_3.lazy += right_2
					end
					left_3.lazy = 0
				end
				left_2.right = left_3.left
				left_3.left = left_2
				local left_4 = left_2.left
				local right_3 = left_2.right
				left_2.height = math.max(if left_4 == nil then 0 else left_4.height, if right_3 == nil then 0 else right_3.height) + 1
				local left_5 = left_3.left
				local right_4 = left_3.right
				left_3.height = math.max(if left_5 == nil then 0 else left_5.height, if right_4 == nil then 0 else right_4.height) + 1
				p3.left = left_3
			end
			local left_4 = p3.left
			local lazy_1 = p3.lazy
			
			if lazy_1 ~= 0 then
				local left_5 = p3.left
				
				if left_5 ~= nil then
					left_5.index += lazy_1
					left_5.lazy += lazy_1
				end
				local right_3 = p3.right
				
				if right_3 ~= nil then
					right_3.index += lazy_1
					right_3.lazy += lazy_1
				end
				p3.lazy = 0
			end
			local lazy_2 = left_4.lazy
			
			if lazy_2 ~= 0 then
				local left_5 = left_4.left
				
				if left_5 ~= nil then
					left_5.index += lazy_2
					left_5.lazy += lazy_2
				end
				local right_3 = left_4.right
				
				if right_3 ~= nil then
					right_3.index += lazy_2
					right_3.lazy += lazy_2
				end
				left_4.lazy = 0
			end
			p3.left = left_4.right
			left_4.right = p3
			local left_5 = p3.left
			local right_3 = p3.right
			p3.height = math.max(if left_5 == nil then 0 else left_5.height, if right_3 == nil then 0 else right_3.height) + 1
			local left_6 = left_4.left
			local right_4 = left_4.right
			left_4.height = math.max(if left_6 == nil then 0 else left_6.height, if right_4 == nil then 0 else right_4.height) + 1
			
			return left_4
		elseif var5 >= -1 then
			return p3
		end
		local right_2 = p3.right
		local lazy = right_2.lazy
		
		if lazy ~= 0 then
			local left_2 = right_2.left
			
			if left_2 ~= nil then
				left_2.index += lazy
				left_2.lazy += lazy
			end
			local right_3 = right_2.right
			
			if right_3 ~= nil then
				right_3.index += lazy
				right_3.lazy += lazy
			end
			right_2.lazy = 0
		end
		local right_3 = right_2.right
		local left_2 = right_2.left
		
		if (if right_3 == nil then 0 else right_3.height) < (if left_2 == nil then 0 else left_2.height) then
			right_3 = right_2.left
			left_2 = right_2.lazy
			
			if left_2 ~= 0 then
				local left_3 = right_2.left
				
				if left_3 ~= nil then
					left_3.index += left_2
					left_3.lazy += left_2
				end
				local right_4 = right_2.right
				
				if right_4 ~= nil then
					right_4.index += left_2
					right_4.lazy += left_2
				end
				right_2.lazy = 0
			end
			left_2 = right_3.lazy
			
			if left_2 ~= 0 then
				local left_3 = right_3.left
				
				if left_3 ~= nil then
					left_3.index += left_2
					left_3.lazy += left_2
				end
				local right_4 = right_3.right
				
				if right_4 ~= nil then
					right_4.index += left_2
					right_4.lazy += left_2
				end
				right_3.lazy = 0
			end
			right_2.left = right_3.right
			right_3.right = right_2
			local left_3 = right_2.left
			local right_4 = right_2.right
			right_2.height = math.max(if left_3 == nil then 0 else left_3.height, if right_4 == nil then 0 else right_4.height) + 1
			local left_4 = right_3.left
			local right_5 = right_3.right
			right_3.height = math.max(if left_4 == nil then 0 else left_4.height, if right_5 == nil then 0 else right_5.height) + 1
			p3.right = right_3
		end
		local right_4 = p3.right
		local lazy_1 = p3.lazy
		
		if lazy_1 ~= 0 then
			local left_3 = p3.left
			
			if left_3 ~= nil then
				left_3.index += lazy_1
				left_3.lazy += lazy_1
			end
			local right_5 = p3.right
			
			if right_5 ~= nil then
				right_5.index += lazy_1
				right_5.lazy += lazy_1
			end
			p3.lazy = 0
		end
		local lazy_2 = right_4.lazy
		
		if lazy_2 ~= 0 then
			local left_3 = right_4.left
			
			if left_3 ~= nil then
				left_3.index += lazy_2
				left_3.lazy += lazy_2
			end
			local right_5 = right_4.right
			
			if right_5 ~= nil then
				right_5.index += lazy_2
				right_5.lazy += lazy_2
			end
			right_4.lazy = 0
		end
		p3.right = right_4.left
		right_4.left = p3
		local left_3 = p3.left
		local right_5 = p3.right
		p3.height = math.max(if left_3 == nil then 0 else left_3.height, if right_5 == nil then 0 else right_5.height) + 1
		local left_4 = right_4.left
		local right_6 = right_4.right
		right_4.height = math.max(if left_4 == nil then 0 else left_4.height, if right_6 == nil then 0 else right_6.height) + 1
		
		return right_4
	end
	
	local _ = nil
	
	local var5 = function(p3, p4, p5)
		-- upvalues: var5 (write), balance (ref)
		local var6 = if p3 == nil then 0 else p3.height
		local var7 = if p5 == nil then 0 else p5.height
		
		if var7 + 1 < var6 then
			local lazy = p3.lazy
			
			if lazy ~= 0 then
				local left = p3.left
				
				if left ~= nil then
					left.index += lazy
					left.lazy += lazy
				end
				local right = p3.right
				
				if right ~= nil then
					right.index += lazy
					right.lazy += lazy
				end
				p3.lazy = 0
			end
			p3.right = var5(p3.right, p4, p5)
			
			return balance(p3)
		elseif var6 + 1 >= var7 then
			p4.left = p3
			p4.right = p5
			p4.lazy = 0
			local left = p4.left
			local right = p4.right
			p4.height = math.max(if left == nil then 0 else left.height, if right == nil then 0 else right.height) + 1
			
			return p4
		end
		local lazy = p5.lazy
		
		if lazy ~= 0 then
			local left = p5.left
			
			if left ~= nil then
				left.index += lazy
				left.lazy += lazy
			end
			local right = p5.right
			
			if right ~= nil then
				right.index += lazy
				right.lazy += lazy
			end
			p5.lazy = 0
		end
		p5.left = var5(p3, p4, p5.left)
		
		return balance(p5)
	end
	
	local function split(p3, p4)
		-- upvalues: split (ref), var5 (write)
		if p3 == nil then
			return nil, nil
		end
		local lazy = p3.lazy
		
		if lazy ~= 0 then
			local left = p3.left
			
			if left ~= nil then
				left.index += lazy
				left.lazy += lazy
			end
			local right = p3.right
			
			if right ~= nil then
				right.index += lazy
				right.lazy += lazy
			end
			p3.lazy = 0
		end
		if p3.index < p4 then
			local var6, var7 = split(p3.right, p4)
			local left = p3.left
			p3.left = nil
			p3.right = nil
			
			return var5(left, p3, var6), var7
		end
		local var8, var9 = split(p3.left, p4)
		local right = p3.right
		p3.left = nil
		p3.right = nil
		
		return var8, var5(var9, p3, right)
	end
	
	local function removeFirst(p3)
		-- upvalues: removeFirst (ref), balance (ref)
		local lazy = p3.lazy
		
		if lazy ~= 0 then
			local left = p3.left
			
			if left ~= nil then
				left.index += lazy
				left.lazy += lazy
			end
			local right = p3.right
			
			if right ~= nil then
				right.index += lazy
				right.lazy += lazy
			end
			p3.lazy = 0
		end
		if p3.left == nil then
			local right = p3.right
			p3.right = nil
			local left = p3.left
			local right_1 = p3.right
			p3.height = math.max(if left == nil then 0 else left.height, if right_1 == nil then 0 else right_1.height) + 1
			
			return right, p3
		end
		local var6, var7 = removeFirst(p3.left)
		p3.left = var6
		
		return balance(p3), var7
	end
	
	local _ = function(p3, p4)
		-- upvalues: removeFirst (ref), balance (ref), var5 (write)
		if p3 == nil then
			return p4
		elseif p4 == nil then
			return p3
		end
		local var6, var7
		local lazy = p4.lazy
		
		if lazy ~= 0 then
			local left = p4.left
			
			if left ~= nil then
				left.index += lazy
				left.lazy += lazy
			end
			local right = p4.right
			
			if right ~= nil then
				right.index += lazy
				right.lazy += lazy
			end
			p4.lazy = 0
		end
		if p4.left == nil then
			local right = p4.right
			p4.right = nil
			local left = p4.left
			local right_1 = p4.right
			p4.height = math.max(if left == nil then 0 else left.height, if right_1 == nil then 0 else right_1.height) + 1
			var6 = right
			var7 = p4
		else
			local var8, var9 = removeFirst(p4.left)
			p4.left = var8
			var6 = balance(p4)
			var7 = var9
		end
		return var5(p3, var7, var6)
	end
	
	local _ = function(p3)
		return {
			height = 1,
			lazy = 0,
			left = nil,
			right = nil,
			index = p3
		}
	end
	
	local function buildBalanced(p3, p4, p5)
		-- upvalues: buildBalanced (ref)
		if p5 < p4 then
			return nil
		end
		local floored = math.floor((p4 + p5) / 2)
		local t = {
			height = 1,
			lazy = 0,
			left = nil,
			right = nil,
			index = p3[floored],
			left = buildBalanced(p3, p4, floored - 1),
			right = buildBalanced(p3, floored + 1, p5)
		}
		local left = t.left
		local right = t.right
		t.height = math.max(if left == nil then 0 else left.height, if right == nil then 0 else right.height) + 1
		
		return t
	end
	
	local function rebuild()
		-- upvalues: var2 (write), var1 (write), var3 (write), buildBalanced (ref), var4 (write)
		local t = {}
		
		if var2 ~= nil then
			for i = 1, var1.getItemCount() do
				if var2(var1.getItemKey(i)) then
					table.insert(t, i)
				end
			end
		end
		var3 = buildBalanced(t, 1, #t)
		var4 = false
	end
	
	return {
		setPredicate = function(value)
			-- upvalues: var2 (write), var4 (write)
			if var2 == value then
				return false
			end
			var2 = value
			var4 = true
			
			return true
		end,
		setItemSequence = function(value)
			-- upvalues: var1 (write), var4 (write)
			if var1 ~= value then
				var1 = value
				var4 = true
			end
		end,
		applyDataSourceChange = function(p3)
			-- upvalues: var4 (write), var2 (write), dataSourceChangeTypeModule (copy), split (ref), var3 (write), buildBalanced (ref), removeFirst (ref), balance (ref), var5 (write)
			if var4 or var2 == nil then return end
			for i, v in p3.changes do
				if v.type ~= dataSourceChangeTypeModule.Reset and v.type ~= dataSourceChangeTypeModule.Reorder then
					local index, keysCount, i_1, v_1
					if v.type ~= dataSourceChangeTypeModule.Insert then
						if v.type == dataSourceChangeTypeModule.Remove then
							local var6
							index = v.index
							keysCount = index + #v.keys - 1
							local var7, var8 = split(var3, index)
							local _, var9 = split(var8, keysCount + 1)
							local var10 = -#v.keys
							
							if var9 ~= nil then
								var9.index += var10
								var9.lazy += var10
							end
							if var7 == nil then
								var6 = var9
							elseif var9 == nil then
								var6 = var7
							else
								local var11
								v_1 = var9.lazy
								
								if v_1 ~= 0 then
									local left = var9.left
									
									if left ~= nil then
										left.index += v_1
										left.lazy += v_1
									end
									local right = var9.right
									
									if right ~= nil then
										right.index += v_1
										right.lazy += v_1
									end
									var9.lazy = 0
								end
								if var9.left == nil then
									v_1 = var9.right
									var9.right = nil
									local left = var9.left
									local right = var9.right
									var9.height = math.max(if left == nil then 0 else left.height, if right == nil then 0 else right.height) + 1
									var11 = v_1
									i_1 = var9
								else
									v_1, var45 = removeFirst(var9.left)
									var9.left = v_1
									var11 = balance(var9)
									i_1 = var45
								end
								var6 = var5(var7, i_1, var11)
							end
							var3 = var6
						elseif v.type == dataSourceChangeTypeModule.Move then
							index = v.fromIndex
							keysCount = v.toIndex
							
							if index >= keysCount then
								local var12
								local var13, var14 = split(var3, keysCount)
								local var15, var16 = split(var14, index)
								local var17, var18 = split(var16, index + 1)
								
								if var15 ~= nil then
									var15.index += 1
									var15.lazy += 1
								end
								if var17 ~= nil then
									var17.index = keysCount
								end
								if var13 == nil then
									var12 = var17
								elseif var17 == nil then
									var12 = var13
								else
									local var19, var20
									local lazy = var17.lazy
									
									if lazy ~= 0 then
										local left = var17.left
										
										if left ~= nil then
											left.index += lazy
											left.lazy += lazy
										end
										local right = var17.right
										
										if right ~= nil then
											right.index += lazy
											right.lazy += lazy
										end
										var17.lazy = 0
									end
									if var17.left == nil then
										local right = var17.right
										var17.right = nil
										local left = var17.left
										local right_1 = var17.right
										var17.height = math.max(if left == nil then 0 else left.height, if right_1 == nil then 0 else right_1.height) + 1
										var19 = right
										var20 = var17
									else
										local var21, var22 = removeFirst(var17.left)
										var17.left = var21
										var19 = balance(var17)
										var20 = var22
									end
									var12 = var5(var13, var20, var19)
								end
								if var12 == nil then
									v_1 = var15
								elseif var15 == nil then
									v_1 = var12
								else
									local var23, var24
									local lazy = var15.lazy
									
									if lazy ~= 0 then
										local left = var15.left
										
										if left ~= nil then
											left.index += lazy
											left.lazy += lazy
										end
										local right = var15.right
										
										if right ~= nil then
											right.index += lazy
											right.lazy += lazy
										end
										var15.lazy = 0
									end
									if var15.left == nil then
										local right = var15.right
										var15.right = nil
										local left = var15.left
										local right_1 = var15.right
										var15.height = math.max(if left == nil then 0 else left.height, if right_1 == nil then 0 else right_1.height) + 1
										var23 = right
										var24 = var15
									else
										local var25, var26 = removeFirst(var15.left)
										var15.left = var25
										var23 = balance(var15)
										var24 = var26
									end
									v_1 = var5(var12, var24, var23)
								end
								if v_1 == nil then
									i_1 = var18
								elseif var18 == nil then
									i_1 = v_1
								else
									local var27, var28
									local lazy = var18.lazy
									
									if lazy ~= 0 then
										local left = var18.left
										
										if left ~= nil then
											left.index += lazy
											left.lazy += lazy
										end
										local right = var18.right
										
										if right ~= nil then
											right.index += lazy
											right.lazy += lazy
										end
										var18.lazy = 0
									end
									if var18.left == nil then
										local right = var18.right
										var18.right = nil
										local left = var18.left
										local right_1 = var18.right
										var18.height = math.max(if left == nil then 0 else left.height, if right_1 == nil then 0 else right_1.height) + 1
										var27 = right
										var28 = var18
									else
										local var29, var30 = removeFirst(var18.left)
										var18.left = var29
										var27 = balance(var18)
										var28 = var30
									end
									i_1 = var5(v_1, var28, var27)
								end
								var3 = i_1
							end
							local var31
							local var32, var33 = split(var3, index)
							local var34, var35 = split(var33, index + 1)
							local var36, var37 = split(var35, keysCount + 1)
							
							if var36 ~= nil then
								var36.index += -1
								var36.lazy += -1
							end
							if var34 ~= nil then
								var34.index = keysCount
							end
							if var32 == nil then
								var31 = var36
							elseif var36 == nil then
								var31 = var32
							else
								local var38, var39
								local lazy = var36.lazy
								
								if lazy ~= 0 then
									local left = var36.left
									
									if left ~= nil then
										left.index += lazy
										left.lazy += lazy
									end
									local right = var36.right
									
									if right ~= nil then
										right.index += lazy
										right.lazy += lazy
									end
									var36.lazy = 0
								end
								if var36.left == nil then
									local right = var36.right
									var36.right = nil
									local left = var36.left
									local right_1 = var36.right
									var36.height = math.max(if left == nil then 0 else left.height, if right_1 == nil then 0 else right_1.height) + 1
									var38 = right
									var39 = var36
								else
									local var40, var41 = removeFirst(var36.left)
									var36.left = var40
									var38 = balance(var36)
									var39 = var41
								end
								var31 = var5(var32, var39, var38)
							end
							if var31 == nil then
								v_1 = var34
							elseif var34 == nil then
								v_1 = var31
							else
								local var42, var43
								local lazy = var34.lazy
								
								if lazy ~= 0 then
									local left = var34.left
									
									if left ~= nil then
										left.index += lazy
										left.lazy += lazy
									end
									local right = var34.right
									
									if right ~= nil then
										right.index += lazy
										right.lazy += lazy
									end
									var34.lazy = 0
								end
								if var34.left == nil then
									local right = var34.right
									var34.right = nil
									local left = var34.left
									local right_1 = var34.right
									var34.height = math.max(if left == nil then 0 else left.height, if right_1 == nil then 0 else right_1.height) + 1
									var42 = right
									var43 = var34
								else
									local var44, var45 = removeFirst(var34.left)
									var34.left = var44
									var42 = balance(var34)
									var43 = var45
								end
								v_1 = var5(var31, var43, var42)
							end
							if v_1 == nil then
								i_1 = var37
							elseif var37 == nil then
								i_1 = v_1
							else
								local var46, var47
								local lazy = var37.lazy
								
								if lazy ~= 0 then
									local left = var37.left
									
									if left ~= nil then
										left.index += lazy
										left.lazy += lazy
									end
									local right = var37.right
									
									if right ~= nil then
										right.index += lazy
										right.lazy += lazy
									end
									var37.lazy = 0
								end
								if var37.left == nil then
									local right = var37.right
									var37.right = nil
									local left = var37.left
									local right_1 = var37.right
									var37.height = math.max(if left == nil then 0 else left.height, if right_1 == nil then 0 else right_1.height) + 1
									var46 = right
									var47 = var37
								else
									local var48, var49 = removeFirst(var37.left)
									var37.left = var48
									var46 = balance(var37)
									var47 = var49
								end
								i_1 = var5(v_1, var47, var46)
							end
							var3 = i_1
						end
					end
					index = v.index
					keysCount = #v.keys
					local var50, var51 = split(var3, index)
					
					if var51 ~= nil then
						var51.index += keysCount
						var51.lazy += keysCount
					end
					local t = {}
					
					for i_1, v_1 in v.keys do
						if var2(v_1) then
							table.insert(t, index + i_1 - 1)
						end
					end
					local var52
					local var53 = buildBalanced(t, 1, #t)
					
					if var50 == nil then
						var52 = var53
					elseif var53 == nil then
						var52 = var50
					else
						local lazy = var53.lazy
						
						if lazy ~= 0 then
							local left = var53.left
							
							if left ~= nil then
								left.index += lazy
								left.lazy += lazy
							end
							local right = var53.right
							
							if right ~= nil then
								right.index += lazy
								right.lazy += lazy
							end
							var53.lazy = 0
						end
						if var53.left == nil then
							local right = var53.right
							var53.right = nil
							local left = var53.left
							local right_1 = var53.right
							var53.height = math.max(if left == nil then 0 else left.height, if right_1 == nil then 0 else right_1.height) + 1
							i_1 = right
							v_1 = var53
						else
							local var54, var55 = removeFirst(var53.left)
							var53.left = var54
							i_1 = balance(var53)
							v_1 = var55
						end
						var52 = var5(var50, v_1, i_1)
					end
					local var56
					if var52 == nil then
						var56 = var51
					elseif var51 == nil then
						var56 = var52
					else
						local lazy = var51.lazy
						
						if lazy ~= 0 then
							local left = var51.left
							
							if left ~= nil then
								left.index += lazy
								left.lazy += lazy
							end
							local right = var51.right
							
							if right ~= nil then
								right.index += lazy
								right.lazy += lazy
							end
							var51.lazy = 0
						end
						if var51.left == nil then
							local right = var51.right
							var51.right = nil
							local left = var51.left
							local right_1 = var51.right
							var51.height = math.max(if left == nil then 0 else left.height, if right_1 == nil then 0 else right_1.height) + 1
							i_1 = right
							v_1 = var51
						else
							local var57, var58 = removeFirst(var51.left)
							var51.left = var57
							i_1 = balance(var51)
							v_1 = var58
						end
						var56 = var5(var52, v_1, i_1)
					end
					var3 = var56
				end
				var4 = true
				
				return
			end
		end,
		resolveActive = function(p4)
			-- upvalues: var4 (write), rebuild (ref), var3 (write)
			if var4 then
				rebuild()
			end
			local index = nil
			local index_1 = nil
			local var59 = var3
			while var59 ~= nil do
				local lazy = var59.lazy
				
				if lazy ~= 0 then
					local left = var59.left
					
					if left ~= nil then
						left.index += lazy
						left.lazy += lazy
					end
					local right = var59.right
					
					if right ~= nil then
						right.index += lazy
						right.lazy += lazy
					end
					var59.lazy = 0
				end
				if p4(var59.index) then
					index = var59.index
					var59 = var59.right
				else
					index_1 = var59.index
					var59 = var59.left
				end
			end
			return index, index_1
		end
	}
end