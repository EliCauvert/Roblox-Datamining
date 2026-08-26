local parent = script:FindFirstAncestor("Moments").Parent
local signalsModule = require(parent.Signals)
local cryoModule = require(parent.Cryo)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

return function()
	-- upvalues: createSignal (ref), createComputed (ref), cryoModule (ref)
	local var1, var2 = createSignal({})
	local t = {}
	
	return {
		getItems = var1,
		getIsModerated = function(p1)
			-- upvalues: t (ref), createComputed (copy), var1 (ref)
			if t[p1] == nil then
				t[p1] = createComputed(function(p2)
					-- upvalues: var1 (copy), p1 (ref)
					return table.find(var1(p2), p1) ~= nil
				end)
			end
			return t[p1]
		end,
		markReported = function(p1)
			-- upvalues: var1 (ref), var2 (ref), cryoModule (copy)
			local var3 = var1(false)
			
			if not table.find(var3, p1) then
				var2(cryoModule.List.join(var3, { p1 }))
			end
		end,
		addModeratedItems = function(p1)
			-- upvalues: var1 (ref), var2 (ref), cryoModule (copy)
			local var3 = var1(false)
			local t = {}
			
			for i, v in p1 do
				if not table.find(var3, v) then
					table.insert(t, v)
				end
			end
			if #t > 0 then
				var2(cryoModule.List.join(var3, t))
			end
		end
	}
end