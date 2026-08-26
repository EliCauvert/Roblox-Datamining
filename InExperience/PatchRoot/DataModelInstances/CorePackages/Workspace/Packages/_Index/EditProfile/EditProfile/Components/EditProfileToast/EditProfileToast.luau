local parent = script:FindFirstAncestor("EditProfile").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local snackbar = foundationModule.Snackbar
local enums = foundationModule.Enums

return function(p1)
	-- upvalues: reactModule (ref), snackbar (ref), enums (ref)
	local var1, var2 = reactModule.useState(true)
	local var3 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var2 (ref)
		if var3.current then
			task.cancel(var3.current)
		end
		var3.current = task.delay(5, function()
			-- upvalues: var2 (copy)
			var2(false)
		end)
		
		return function()
			-- upvalues: var3 (copy)
			if var3.current then
				task.cancel(var3.current)
				var3.current = nil
			end
		end
	end, {})
	
	return if var1 then reactModule.createElement(snackbar, {
		title = p1.text,
		icon = {
			name = enums.IconName.CircleCheck,
			variant = enums.IconVariant.Filled
		},
		Position = UDim2.new(0.5, 0, 0, 50),
		AnchorPoint = Vector2.new(0.5, 0)
	}) else nil
end