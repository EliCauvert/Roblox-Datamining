local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)

return function(p1, p2)
	-- upvalues: reactModule (ref), signalsModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p1 (ref), p2 (ref)
		return signalsModule.createComputed(function(p3)
			-- upvalues: p1 (copy), p2 (copy)
			local t = {}
			
			for i, v in p1(p3) do
				t[if p2 then p2(v) else v.messageId] = v
			end
			return t
		end)
	end, { p1, p2 })
end