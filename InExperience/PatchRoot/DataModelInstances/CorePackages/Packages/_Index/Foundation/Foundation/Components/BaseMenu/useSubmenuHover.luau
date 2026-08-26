local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local useTokensModule = require(foundation.Providers.Style.useTokens)

local function _(p1, p2)
	local t = {}
	
	for i = 1, p2 do
		if p1[i] then
			t[i] = p1[i]
		end
	end
	return t
end

local _ = function(p3, p4, p5)
	local t = {}
	
	for i = 1, p4 - 1 do
		if p3[i] then
			t[i] = p3[i]
		end
	end
	t[p4] = p5
	
	return t
end

return function()
	-- upvalues: useTokensModule (ref), reactModule (ref)
	local var1 = useTokensModule()
	local time100 = var1.Time.Time_100
	local time300 = var1.Time.Time_300
	local var2, var3 = reactModule.useState({})
	local var4 = reactModule.useRef({})
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	var4.current = var2
	local var7 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var6 (ref)
		if var5.current then
			task.cancel(var5.current)
			var5.current = nil
		end
		if var6.current then
			task.cancel(var6.current)
			var6.current = nil
		end
	end, {})
	local var8 = reactModule.useCallback(function(p6, p7, p8)
		-- upvalues: var7 (ref), var4 (ref), var3 (ref), var5 (ref), time100 (ref)
		var7()
		
		if var4.current[p6] == p7 then return end
		if p8 then
			var3(function(p9)
				-- upvalues: p6 (ref), p7 (ref)
				local t = {}
				
				for i = 1, p6 - 1 do
					if p9[i] then
						t[i] = p9[i]
					end
				end
				t[p6] = p7
				
				return t
			end)
			
			return
		end
		var5.current = task.delay(time100, function()
			-- upvalues: var3 (copy), p6 (ref), p7 (ref), var5 (copy)
			var3(function(p9)
				-- upvalues: p6 (copy), p7 (copy)
				local t = {}
				
				for i = 1, p6 - 1 do
					if p9[i] then
						t[i] = p9[i]
					end
				end
				t[p6] = p7
				
				return t
			end)
			var5.current = nil
		end)
	end, { var7, time100 })
	local var9 = reactModule.useCallback(function(p9)
		-- upvalues: var7 (ref), var4 (ref), var6 (ref), time300 (ref), var3 (ref)
		var7()
		
		if #var4.current < p9 then
			return
		end
		var6.current = task.delay(time300, function()
			-- upvalues: var3 (copy), p9 (ref), var6 (copy)
			var3(function(p10)
				-- upvalues: p9 (copy)
				if #p10 < p9 then
					return p10
				end
				local t = {}
				
				for i = 1, p9 - 1 do
					if p10[i] then
						t[i] = p10[i]
					end
				end
				return t
			end)
			var6.current = nil
		end)
	end, { var7, time300 })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var3 (ref)
		var7()
		var3({})
	end, { var7 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var6 (ref)
		return function()
			-- upvalues: var5 (copy), var6 (copy)
			if var5.current then
				task.cancel(var5.current)
			end
			if var6.current then
				task.cancel(var6.current)
			end
		end
	end, {})
	
	return {
		openPath = var2,
		openAtDepth = var8,
		closeAtDepth = var9,
		reset = var10
	}
end