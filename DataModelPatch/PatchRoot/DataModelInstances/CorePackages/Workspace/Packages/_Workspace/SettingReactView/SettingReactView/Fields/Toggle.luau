local Parent = script:FindFirstAncestor("SettingReactView").Parent
local _ = require(Parent.SettingsService)
local ReactModule = require(Parent.React)
local Toggle = require(Parent.Foundation).Toggle

return function(p1)
	-- upvalues: ReactModule (copy), Toggle (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.onChanged:get())
	p1.onChanged:connect(function(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
	end)
	
	return ReactModule.createElement(Toggle, {
		label = "",
		isDisabled = false,
		isChecked = UseStateResult,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), UseStateResult (copy)
			p1.onChanged:set(not UseStateResult)
		end, { UseStateResult })
	})
end