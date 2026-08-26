local parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local signalsModule = require(parent.Signals)
local cryoModule = require(parent.Cryo)

return function(value)
	-- upvalues: signalsModule (ref), cryoModule (ref)
	local t = {}
	local var1 = 0
	
	if value then
		for i, v in pairs(value) do
			t[i] = v
			var1 += 1
		end
	end
	local var2, var3 = signalsModule.createSignal(t)
	local var4, var5 = signalsModule.createSignal(var1)
	
	return {
		getData = function(p1, p2)
			-- upvalues: var2 (ref)
			return var2(p2)[p1]
		end,
		setData = function(value, p1, p2)
			-- upvalues: var2 (ref), cryoModule (copy), var5 (ref), var4 (ref), var3 (ref)
			local var6 = var2(p2)
			local var7 = cryoModule.Dictionary.join(var6, { [value] = p1 })
			
			if not var6[value] then
				var5(var4(p2) + 1)
			end
			var3(var7)
		end,
		removeData = function(p1, p2)
			-- upvalues: var2 (ref), cryoModule (copy), var5 (ref), var4 (ref), var3 (ref)
			local var6 = var2(p2)
			
			if var6[p1] then
				local var7 = cryoModule.Dictionary.join(var6, { [p1] = cryoModule.None })
				var5(var4(p2) - 1)
				var3(var7)
			end
		end,
		getCount = var4,
		iterateData = function(p1, p2)
			-- upvalues: signalsModule (copy), var2 (ref)
			return signalsModule.createEffect(function()
				-- upvalues: var2 (copy), p2 (ref), p1 (ref)
				for i, v in pairs(var2(p2)) do
					p1(i, v)
				end
			end)
		end,
		getAllData = signalsModule.createComputed(function(p3)
			-- upvalues: var2 (ref)
			return var2(p3)
		end)
	}
end