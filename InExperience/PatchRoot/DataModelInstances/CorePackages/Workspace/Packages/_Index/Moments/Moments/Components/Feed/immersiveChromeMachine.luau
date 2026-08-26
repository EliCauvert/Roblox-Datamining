return function(p1, p2)
	local now = p2.now
	local var1 = true
	local var2 = 0
	local var3 = nil
	local var4 = 0
	local var5 = true
	local var6 = false
	local var7 = false
	local var8 = false
	local var9 = now()
	local var10 = -1e999
	
	local function _(p3)
		-- upvalues: var8 (write), var2 (write), var9 (write), now (ref), var1 (write), p2 (ref)
		if var8 then return end
		var2 = 0
		var9 = now()
		
		if var1 then
			return
		end
		var1 = true
		p2.setChromeVisible(true, p3)
	end
	
	local _ = function(p3)
		-- upvalues: var1 (write), var10 (write), now (ref), p2 (ref)
		if var1 then
			var1 = false
			var10 = now()
			p2.setChromeVisible(false, p3 or "advance")
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: var7 (write), var1 (write), var2 (write), p1 (ref), var6 (write), var5 (write), now (ref), var9 (write), var10 (write), p2 (ref)
		if var7 or not var1 then return end
		if var2 < p1.hideAfterAdvances then return end
		if var6 and not var5 then return end
		if now() - var9 < p1.shownDwellMs then return end
		if var1 then
			var1 = false
			var10 = now()
			p2.setChromeVisible(false, "advance")
			
			return
		end
	end
	
	return {
		onActiveUpdate = function(p3, p4, p5)
			-- upvalues: var3 (write), var5 (write), var6 (write), var4 (write), var8 (write), var2 (write), var9 (write), now (ref), var1 (write), p2 (ref), var7 (write), p1 (ref), var10 (write)
			if var3 == nil then
				var3 = p3
				var5 = p4
				var6 = p4
				
				return
			end
			local var11 = p3 - var3
			var3 = p3
			
			if var11 == 0 then
				if p5 then return end
				if p4 then
					local var12 = not var5 and var6
					var5 = true
					var6 = true
					
					if var12 then
						var9 = now()
					end
					return
				elseif not var5 then return end
				var5 = false
				
				if not var6 then return end
				if var7 then return end
				if now() - var10 < p1.hiddenCooldownMs then return end
				if var8 then return end
				var2 = 0
				var9 = now()
				
				if var1 then
					return
				end
				var1 = true
				p2.setChromeVisible(true, "pause")
				
				return
			elseif var4 > 0 and var4 <= p3 then
				if not var8 then
					var2 = 0
					var9 = now()
					
					if not var1 then
						var1 = true
						p2.setChromeVisible(true, "endOfFeed")
					end
				end
			elseif var11 == 1 then
				var2 += 1
				
				if not var7 and var1 and var2 >= p1.hideAfterAdvances and ((not var6 or var5) and (now() - var9 >= p1.shownDwellMs and var1)) then
					var1 = false
					var10 = now()
					p2.setChromeVisible(false, "advance")
				end
			elseif var11 >= 0 then
				var2 = 0
			elseif not var8 then
				var2 = 0
				var9 = now()
				
				if not var1 then
					var1 = true
					p2.setChromeVisible(true, "reverse")
				end
			end
			var6 = false
		end,
		setForceShow = function(value)
			-- upvalues: var7 (write), var8 (write), var2 (write), var9 (write), now (ref), var1 (write), p2 (ref)
			if value == var7 then return end
			var7 = value
			
			if var7 then
				if var8 then return end
				var2 = 0
				var9 = now()
				
				if var1 then return end
				var1 = true
				p2.setChromeVisible(true, "force")
			end
		end,
		setForceHide = function(value)
			-- upvalues: var8 (write), var1 (write), var10 (write), now (ref), p2 (ref), var2 (write), var9 (write)
			if value == var8 then return end
			var8 = value
			
			if var8 then
				if var1 then
					var1 = false
					var10 = now()
					p2.setChromeVisible(false, "force")
					
					return
				end
				return
			elseif var8 then return end
			var2 = 0
			var9 = now()
			
			if var1 then
				return
			end
			var1 = true
			p2.setChromeVisible(true, "reveal")
		end,
		setCount = function(value)
			-- upvalues: var4 (write)
			var4 = value
		end,
		reveal = function()
			-- upvalues: var8 (write), var2 (write), var9 (write), now (ref), var1 (write), p2 (ref)
			if var8 then return end
			var2 = 0
			var9 = now()
			
			if var1 then
				return
			end
			var1 = true
			p2.setChromeVisible(true, "reveal")
		end,
		isVisible = function()
			-- upvalues: var1 (write)
			return var1
		end
	}
end