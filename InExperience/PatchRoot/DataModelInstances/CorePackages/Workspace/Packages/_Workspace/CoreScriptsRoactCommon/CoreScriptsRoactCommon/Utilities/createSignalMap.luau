local parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local signalsModule = require(parent.Signals)
local cryoModule = require(parent.Cryo)

return function(value)
	-- upvalues: signalsModule (ref), cryoModule (ref)
	local t = {}
	local var3 = 0
	
	if value then
		for i, v in pairs(value) do
			t[i] = v
			var3 += 1
		end
	end
	local var4, var5 = signalsModule.createSignal(t)
	local var6, var7 = signalsModule.createSignal(var3)
	
	return {
		getData = function(p0, p1)
			-- upvalues: var4 (ref)
			return var4(p1)[p0]
		end,
		setData = function(value, p2, p3)
			-- upvalues: var4 (ref), cryoModule (copy), var7 (ref), var6 (ref), var5 (ref)
			local var8 = var4(p3)
			local var9 = cryoModule.Dictionary.join(var8, { [value] = p2 })
			
			if not var8[value] then
				var7(var6(p3) + 1)
			end
			var5(var9)
		end,
		removeData = function(p4, p5)
			-- upvalues: var4 (ref), cryoModule (copy), var7 (ref), var6 (ref), var5 (ref)
			local var10 = var4(p5)
			
			if var10[p4] then
				local var11 = cryoModule.Dictionary.join(var10, { [p4] = cryoModule.None })
				var7(var6(p5) - 1)
				var5(var11)
			end
		end,
		getCount = var6,
		iterateData = function(p6, p7)
			-- upvalues: signalsModule (copy), var4 (ref)
			return signalsModule.createEffect(function()
				-- upvalues: var4 (copy), p7 (ref), p6 (ref)
				for i, v in pairs(var4(p7)) do
					p6(i, v)
				end
			end)
		end,
		getAllData = signalsModule.createComputed(function(p8)
			-- upvalues: var4 (ref)
			return var4(p8)
		end)
	}
end