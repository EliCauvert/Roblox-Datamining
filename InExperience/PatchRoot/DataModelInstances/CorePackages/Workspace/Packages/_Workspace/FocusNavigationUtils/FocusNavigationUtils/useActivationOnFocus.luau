local parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local var1 = nil
local var2 = nil

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: reactModule (ref), reactFocusNavigationModule (ref), var1 (write), var2 (write)
	local var3 = p3 ~= nil
	local var4 = p6 == true
	local var5 = reactModule.useRef(p3)
	local var6 = reactModule.useRef(p4)
	local var7 = reactModule.useRef(p5)
	var5.current = p3
	var6.current = p4
	var7.current = p5
	local var8 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), var8 (ref), p2 (ref), var6 (ref), var4 (ref), var7 (ref), var1 (copy), var2 (copy), var5 (ref)
		if p1 and var3 and var8 then
			local var9 = var8.focusedGuiObject:subscribe(function(p7)
				-- upvalues: p2 (copy), var6 (copy), var4 (copy), var7 (copy), var1 (copy), var2 (copy), var5 (copy)
				local current = p2.current
				local current_1 = var6.current
				local var10 = if current_1 then current_1(current) else current
				
				if var10 ~= nil and p7 == var10 then
					if not var4 then
						local current_2 = var7.current
						local var11 = if current_2 then current_2() else nil
						
						if var1 == var10 and var2 == var11 then return end
						var1 = var10
						var2 = var11
					end
					local current_2 = var5.current
					
					if current_2 then
						current_2()
					end
				end
			end)
			
			return function()
				-- upvalues: var9 (ref)
				var9:unsubscribe()
			end
		end
		return function() end
	end, {
		p1,
		var3,
		var4,
		var8,
		p2
	})
end