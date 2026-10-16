local SignalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)
local _ = require(script.Parent.ChatCardEmphasisPositionContext)

local function outranks(p1, p2): boolean --[[ Line: 21 ]]
	if p1.priority == p2.priority then
		local Position = p1.position
		local Position1 = p2.position
		
		return if Position == nil or Position1 == nil then p2.order < p1.order elseif Position.messageOrder == Position1.messageOrder then if Position.segmentOrder == Position1.segmentOrder then Position1.childOrder < Position.childOrder else Position1.segmentOrder < Position.segmentOrder else Position1.messageOrder < Position.messageOrder
	else
		return p2.priority < p1.priority
	end
end

return function() --[[ Line: 38 | Named "createChatCardEmphasisStore" ]]
	-- upvalues: SignalsModule (copy), outranks (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	
	return {
		register = function(p1, Priority, MessageOrder, p2) --[[ Line: 53 ]]
			-- upvalues: Signal2 (copy)
			local config = {
				priority = Priority,
				order = MessageOrder,
				position = p2 or {
					segmentOrder = 0,
					childOrder = 0,
					messageOrder = MessageOrder
				}
			}
			Signal2(function(Tbl) --[[ Line: 59 ]]
				-- upvalues: p1 (copy), config (copy)
				local Copy = table.clone(Tbl)
				Copy[p1] = config
				
				return Copy
			end)
		end,
		unregister = function(p1) --[[ Line: 66 ]]
			-- upvalues: Signal2 (copy)
			Signal2(function(Tbl) --[[ Line: 67 ]]
				-- upvalues: p1 (copy)
				if Tbl[p1] == nil then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					Copy[p1] = nil
					
					return Copy
				end
			end)
		end,
		getEmphasizedKey = SignalsModule.createComputed(function(p1) --[[ Line: 41 ]]
			-- upvalues: Signal (copy), outranks (upval)
			local v1 = nil
			local v2 = nil
			
			for i, value in Signal(p1) do
				if v2 == nil or outranks(value, v2) then
					v1 = i
					v2 = value
				end
			end
			return v1
		end)
	}
end