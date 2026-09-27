local _ = require(script.Parent.Types)
local var1 = require(script:FindFirstAncestor("AmpUpsell").Parent.AppCommonLib).Signal.new()

return {
	requestOpen = function(p1)
		-- upvalues: var1 (ref)
		local t = { handled = false, params = p1 }
		var1:fire(t)
		
		return t.handled
	end,
	subscribe = function(p1)
		-- upvalues: var1 (ref)
		return var1:connect(function(p2)
			-- upvalues: p1 (ref)
			if p2.handled then
				return
			end
			p2.handled = true
			p1(p2.params)
		end)
	end
}