local parent = script:FindFirstAncestor("SettingReactView").Parent
local _ = require(parent.SettingsService)
local reactModule = require(parent.React)
local toggle = require(parent.Foundation).Toggle

return function(p0) --[[ line: 16 ]]
	-- upvalues: reactModule (ref), toggle (ref)
	local var1, var2 = reactModule.useState(p0.onChanged:get())
	p0.onChanged:connect(function(p1) --[[ line: 18 ]]
		-- upvalues: var2 (ref)
		var2(p1)
	end)
	
	return reactModule.createElement(toggle, {
		label = "",
		isDisabled = false,
		isChecked = var1,
		onActivated = reactModule.useCallback(function() --[[ line: 21 ]]
			-- upvalues: p0 (ref), var1 (ref)
			p0.onChanged:set(not var1)
		end, { var1 })
	})
end