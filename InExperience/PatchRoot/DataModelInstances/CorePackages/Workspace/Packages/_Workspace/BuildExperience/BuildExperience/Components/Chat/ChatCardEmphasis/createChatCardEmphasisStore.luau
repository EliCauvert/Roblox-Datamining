local signalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)
local _ = require(script.Parent.ChatCardEmphasisPositionContext)

local function outranks(p1, p2)
	if p1.priority ~= p2.priority then
		return p2.priority < p1.priority
	end
	local position = p1.position
	local position_1 = p2.position
	
	return if position == nil or position_1 == nil then p2.order < p1.order elseif position.messageOrder == position_1.messageOrder then if position.segmentOrder == position_1.segmentOrder then position_1.childOrder < position.childOrder else position_1.segmentOrder < position.segmentOrder else position_1.messageOrder < position.messageOrder
end

return function()
	-- upvalues: signalsModule (ref), outranks (ref)
	local var1, var2 = signalsModule.createSignal({})
	
	return {
		register = function(p1, p2, p3, p4)
			-- upvalues: var2 (ref)
			local t = {
				priority = p2,
				order = p3,
				position = p4 or { segmentOrder = 0, childOrder = 0, messageOrder = p3 }
			}
			var2(function(p5)
				-- upvalues: p1 (ref), t (ref)
				local cloned = table.clone(p5)
				cloned[p1] = t
				
				return cloned
			end)
		end,
		unregister = function(p1)
			-- upvalues: var2 (ref)
			var2(function(p2)
				-- upvalues: p1 (ref)
				if p2[p1] == nil then
					return p2
				end
				local cloned = table.clone(p2)
				cloned[p1] = nil
				
				return cloned
			end)
		end,
		getEmphasizedKey = signalsModule.createComputed(function(p1)
			-- upvalues: var1 (ref), outranks (copy)
			local var3 = nil
			local var4 = nil
			
			for i, v in var1(p1) do
				if var4 == nil or outranks(v, var4) then
					var3 = i
					var4 = v
				end
			end
			return var3
		end)
	}
end