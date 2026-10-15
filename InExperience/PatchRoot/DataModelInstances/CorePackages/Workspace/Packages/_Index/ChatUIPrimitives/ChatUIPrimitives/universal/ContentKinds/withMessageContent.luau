local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local _ = require(script.Parent.Parent.Types)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	return function(p3)
		-- upvalues: reactModule (copy), p2 (ref), p1 (ref)
		return reactModule.createElement(p1, {
			getContent = reactModule.useMemo(function()
				-- upvalues: p2 (copy), p3 (ref)
				return function(p4)
					-- upvalues: p2 (copy), p3 (copy)
					local var1 = p2(p3.getContent(p4))
					assert(var1 ~= nil, "Message content did not match its registered renderer")
					
					return var1
				end
			end, { p3.getContent }),
			LayoutOrder = p3.LayoutOrder
		})
	end
end