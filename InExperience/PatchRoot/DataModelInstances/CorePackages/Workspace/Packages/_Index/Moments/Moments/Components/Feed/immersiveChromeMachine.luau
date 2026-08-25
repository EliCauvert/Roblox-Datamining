return function(p0, p1)
	local now = p1.now
	local var0 = true
	local var1 = 0
	local var2 = nil
	local var3 = 0
	local var4 = true
	local var5 = false
	local var6 = false
	local var7 = false
	local var8 = now()
	local var9 = -1e999
	
	local function _(p2)
		-- upvalues: var7 (write), var1 (write), var8 (write), now (ref), var0 (write), p1 (ref)
		if var7 then return end
		var1 = 0
		var8 = now()
		
		if var0 then
			return
		end
		var0 = true
		p1.setChromeVisible(true, p2)
	end
	
	local _ = function(p3)
		-- upvalues: var0 (write), var9 (write), now (ref), p1 (ref)
		if var0 then
			var0 = false
			var9 = now()
			p1.setChromeVisible(false, p3 or "advance")
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: var6 (write), var0 (write), var1 (write), p0 (ref), var5 (write), var4 (write), now (ref), var8 (write), var9 (write), p1 (ref)
		if var6 or not var0 then return end
		if var1 < p0.hideAfterAdvances then return end
		if var5 and not var4 then return end
		if now() - var8 < p0.shownDwellMs then return end
		if var0 then
			var0 = false
			var9 = now()
			p1.setChromeVisible(false, "advance")
			
			return
		end
	end
	
	return {
		onActiveUpdate = function(p4, p5, p6)
			-- upvalues: var2 (write), var4 (write), var5 (write), var3 (write), var7 (write), var1 (write), var8 (write), now (ref), var0 (write), p1 (ref), var6 (write), p0 (ref), var9 (write)
			if var2 == nil then
				var2 = p4
				var4 = p5
				var5 = p5
				
				return
			end
			local var10 = p4 - var2
			var2 = p4
			
			if var10 == 0 then
				if p6 then return end
				if p5 then
					local var5_1 = not var4 and var5
					var4 = true
					var5 = true
					
					if var5_1 then
						var8 = now()
					end
					return
				elseif not var4 then return end
				var4 = false
				
				if not var5 then return end
				if var6 then return end
				if now() - var9 < p0.hiddenCooldownMs then return end
				if var7 then return end
				var1 = 0
				var8 = now()
				
				if var0 then
					return
				end
				var0 = true
				p1.setChromeVisible(true, "pause")
				
				return
			elseif var3 > 0 and var3 <= p4 then
				if not var7 then
					var1 = 0
					var8 = now()
					
					if not var0 then
						var0 = true
						p1.setChromeVisible(true, "endOfFeed")
					end
				end
			elseif var10 == 1 then
				var1 += 1
				
				if not var6 and var0 and var1 >= p0.hideAfterAdvances and ((not var5 or var4) and (now() - var8 >= p0.shownDwellMs and var0)) then
					var0 = false
					var9 = now()
					p1.setChromeVisible(false, "advance")
				end
			elseif var10 >= 0 then
				var1 = 0
			elseif not var7 then
				var1 = 0
				var8 = now()
				
				if not var0 then
					var0 = true
					p1.setChromeVisible(true, "reverse")
				end
			end
			var5 = false
		end,
		setForceShow = function(value)
			-- upvalues: var6 (write), var7 (write), var1 (write), var8 (write), now (ref), var0 (write), p1 (ref)
			if value == var6 then return end
			var6 = value
			
			if var6 then
				if var7 then return end
				var1 = 0
				var8 = now()
				
				if var0 then return end
				var0 = true
				p1.setChromeVisible(true, "force")
			end
		end,
		setForceHide = function(value)
			-- upvalues: var7 (write), var0 (write), var9 (write), now (ref), p1 (ref), var1 (write), var8 (write)
			if value == var7 then return end
			var7 = value
			
			if var7 then
				if var0 then
					var0 = false
					var9 = now()
					p1.setChromeVisible(false, "force")
					
					return
				end
				return
			elseif var7 then return end
			var1 = 0
			var8 = now()
			
			if var0 then
				return
			end
			var0 = true
			p1.setChromeVisible(true, "reveal")
		end,
		setCount = function(value)
			-- upvalues: var3 (write)
			var3 = value
		end,
		reveal = function()
			-- upvalues: var7 (write), var1 (write), var8 (write), now (ref), var0 (write), p1 (ref)
			if var7 then return end
			var1 = 0
			var8 = now()
			
			if var0 then
				return
			end
			var0 = true
			p1.setChromeVisible(true, "reveal")
		end,
		isVisible = function()
			-- upvalues: var0 (write)
			return var0
		end
	}
end