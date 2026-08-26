local parent = script:FindFirstAncestor("SettingReactView").Parent
local _ = require(parent.SettingsService)
local reactModule = require(parent.React)
local toggle = require(parent.Foundation).Toggle

return function(p1)
	-- upvalues: reactModule (ref), toggle (ref)
	local var1, var2 = reactModule.useState(p1.onChanged:get())
	p1.onChanged:connect(function(p2)
		-- upvalues: var2 (ref)
		var2(p2)
	end)
	
	return reactModule.createElement(toggle, {
		label = "",
		isDisabled = false,
		isChecked = var1,
		onActivated = reactModule.useCallback(function()
			-- upvalues: p1 (ref), var1 (ref)
			p1.onChanged:set(not var1)
		end, { var1 })
	})
end