local _ = require(script.Parent.Types)
local NewResult = require(script:FindFirstAncestor("AmpUpsell").Parent.AppCommonLib).Signal.new()

return {
	requestOpen = function(Params)
		-- upvalues: NewResult (copy)
		local config = { handled = false, params = Params }
		NewResult:fire(config)
		
		return config.handled
	end,
	subscribe = function(Callback)
		-- upvalues: NewResult (copy)
		return NewResult:connect(function(p1)
			-- upvalues: Callback (copy)
			if not p1.handled then
				p1.handled = true
				Callback(p1.params)
				
				return
			end
		end)
	end
}