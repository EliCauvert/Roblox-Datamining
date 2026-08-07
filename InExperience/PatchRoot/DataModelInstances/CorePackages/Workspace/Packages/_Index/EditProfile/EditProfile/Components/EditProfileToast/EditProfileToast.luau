local parent = script:FindFirstAncestor("EditProfile").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local snackbar = foundationModule.Snackbar
local enums = foundationModule.Enums

return function(p0) --[[ line: 12 | named "EditProfileToast" ]]
	-- upvalues: reactModule (ref), snackbar (ref), enums (ref)
	local var2, var3 = reactModule.useState(true)
	local var4 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 18 ]]
		-- upvalues: var4 (ref), var3 (ref)
		if var4.current then
			task.cancel(var4.current)
		end
		var4.current = task.delay(5, function() --[[ line: 25 ]]
			-- upvalues: var3 (copy)
			var3(false)
		end)
		
		return function() --[[ line: 30 ]]
			-- upvalues: var4 (copy)
			if var4.current then
				task.cancel(var4.current)
				var4.current = nil
			end
		end
	end, {})
	
	return if var2 then reactModule.createElement(snackbar, {
		title = p0.text,
		icon = {
			name = enums.IconName.CircleCheck,
			variant = enums.IconVariant.Filled
		},
		Position = UDim2.new(0.5, 0, 0, 50),
		AnchorPoint = Vector2.new(0.5, 0)
	}) else nil
end