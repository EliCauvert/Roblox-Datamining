local parent = script:FindFirstAncestor("Moments").Parent
local signalsModule = require(parent.Signals)
local cryoModule = require(parent.Cryo)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

return function() --[[ line: 18 | named "createModeratedItemsStore" ]]
	-- upvalues: createSignal (ref), createComputed (ref), cryoModule (ref)
	local var2, var3 = createSignal({})
	local t = {}
	
	return {
		getItems = var2,
		getIsModerated = function(p0) --[[ line: 22 ]]
			-- upvalues: t (ref), createComputed (copy), var2 (ref)
			if t[p0] == nil then
				t[p0] = createComputed(function(p1) --[[ line: 24 ]]
					-- upvalues: var2 (copy), p0 (ref)
					return table.find(var2(p1), p0) ~= nil
				end)
			end
			return t[p0]
		end,
		markReported = function(p2) --[[ line: 31 ]]
			-- upvalues: var2 (ref), var3 (ref), cryoModule (copy)
			local var5 = var2(false)
			
			if not table.find(var5, p2) then
				var3(cryoModule.List.join(var5, { p2 }))
			end
		end,
		addModeratedItems = function(p3) --[[ line: 38 ]]
			-- upvalues: var2 (ref), var3 (ref), cryoModule (copy)
			local var6 = var2(false)
			local t = {}
			
			for i, v in p3 do
				if not table.find(var6, v) then
					table.insert(t, v)
				end
			end
			if #t > 0 then
				var3(cryoModule.List.join(var6, t))
			end
		end
	}
end