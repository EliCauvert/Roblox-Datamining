-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:00 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local useTokensModule = require(foundation.Providers.Style.useTokens)

local function _(p0, p1) --[[ line: 36 | named "truncatePath" ]]
	local t = {}
	
	for i = 1, p1 do
		if p0[i] then
			t[i] = p0[i]
		end
	end
	return t
end

local _ = function(p2, p3, p4) --[[ line: 46 | named "buildPath" ]]
	local t = {}
	
	for i = 1, p3 - 1 do
		if p2[i] then
			t[i] = p2[i]
		end
	end
	t[p3] = p4
	
	return t
end

return function() --[[ line: 52 | named "useSubmenuHover" ]]
	-- upvalues: useTokensModule (ref), reactModule (ref)
	local var5 = useTokensModule()
	local time100 = var5.Time.Time_100
	local time300 = var5.Time.Time_300
	local var6, var7 = reactModule.useState({})
	local var8 = reactModule.useRef({})
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	var8.current = var6
	local var11 = reactModule.useCallback(function() --[[ line: 64 ]]
		-- upvalues: var9 (ref), var10 (ref)
		if var9.current then
			task.cancel(var9.current)
			var9.current = nil
		end
		if var10.current then
			task.cancel(var10.current)
			var10.current = nil
		end
	end, {})
	local var12 = reactModule.useCallback(function(p5, p6, p7) --[[ line: 75 ]]
		-- upvalues: var11 (ref), var8 (ref), var7 (ref), var9 (ref), time100 (ref)
		var11()
		
		if var8.current[p5] == p6 then return end
		if p7 then
			var7(function(p8) --[[ line: 83 ]]
				-- upvalues: p5 (ref), p6 (ref)
				local t = {}
				
				for i = 1, p5 - 1 do
					if p8[i] then
						t[i] = p8[i]
					end
				end
				t[p5] = p6
				
				return t
			end)
			
			return
		end
		var9.current = task.delay(time100, function() --[[ line: 89 ]]
			-- upvalues: var7 (copy), p5 (ref), p6 (ref), var9 (copy)
			var7(function(p9) --[[ line: 90 ]]
				-- upvalues: p5 (copy), p6 (copy)
				local t = {}
				
				for i = 1, p5 - 1 do
					if p9[i] then
						t[i] = p9[i]
					end
				end
				t[p5] = p6
				
				return t
			end)
			var9.current = nil
		end)
	end, { var11, time100 })
	local var13 = reactModule.useCallback(function(p10) --[[ line: 97 ]]
		-- upvalues: var11 (ref), var8 (ref), var10 (ref), time300 (ref), var7 (ref)
		var11()
		
		if #var8.current < p10 then
			return
		end
		var10.current = task.delay(time300, function() --[[ line: 104 ]]
			-- upvalues: var7 (copy), p10 (ref), var10 (copy)
			var7(function(p11) --[[ line: 105 ]]
				-- upvalues: p10 (copy)
				if #p11 < p10 then
					return p11
				end
				local t = {}
				
				for i = 1, p10 - 1 do
					if p11[i] then
						t[i] = p11[i]
					end
				end
				return t
			end)
			var10.current = nil
		end)
	end, { var11, time300 })
	local var14 = reactModule.useCallback(function() --[[ line: 117 ]]
		-- upvalues: var11 (ref), var7 (ref)
		var11()
		var7({})
	end, { var11 })
	reactModule.useEffect(function() --[[ line: 123 ]]
		-- upvalues: var9 (ref), var10 (ref)
		return function() --[[ line: 124 ]]
			-- upvalues: var9 (copy), var10 (copy)
			if var9.current then
				task.cancel(var9.current)
			end
			if var10.current then
				task.cancel(var10.current)
			end
		end
	end, {})
	
	return {
		openPath = var6,
		openAtDepth = var12,
		closeAtDepth = var13,
		reset = var14
	}
end