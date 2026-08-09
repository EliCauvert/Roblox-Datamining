local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)

return function(p0, p1) --[[ line: 28 | named "useMessagesMap" ]]
	-- upvalues: reactModule (ref), signalsModule (ref)
	return reactModule.useMemo(function() --[[ line: 33 ]]
		-- upvalues: signalsModule (copy), p0 (ref), p1 (ref)
		return signalsModule.createComputed(function(p2) --[[ line: 34 ]]
			-- upvalues: p0 (copy), p1 (copy)
			local t = {}
			
			for i, v in p0(p2) do
				t[if p1 then p1(v) else v.messageId] = v
			end
			return t
		end)
	end, {})
end