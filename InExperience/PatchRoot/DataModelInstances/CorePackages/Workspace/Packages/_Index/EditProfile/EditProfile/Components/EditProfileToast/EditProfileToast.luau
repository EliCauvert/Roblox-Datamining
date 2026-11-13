local Parent = script:FindFirstAncestor("EditProfile").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SnackbarDEPRECATED = FoundationModule.Snackbar_DEPRECATED
local Enums = FoundationModule.Enums

return function(p1)
	-- upvalues: ReactModule (copy), SnackbarDEPRECATED (copy), Enums (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
		end
		UseRefResult.current = task.delay(5, function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
		
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				task.cancel(UseRefResult.current)
				UseRefResult.current = nil
			end
		end
	end, {})
	
	return if UseStateResult then ReactModule.createElement(SnackbarDEPRECATED, {
		title = p1.text,
		icon = {
			name = Enums.IconName.CircleCheck,
			variant = Enums.IconVariant.Filled
		},
		Position = UDim2.new(0.5, 0, 0, 50),
		AnchorPoint = Vector2.new(0.5, 0)
	}) else nil
end