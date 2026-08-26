local parent = script:FindFirstAncestor("Groups").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local textInput = foundationModule.TextInput
local iconName = foundationModule.Enums.IconName

return function(p1)
	-- upvalues: reactModule (ref), textInput (ref), iconName (ref)
	local var1, var2 = reactModule.useState("")
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		if var3.current then
			task.cancel(var3.current)
			var3.current = nil
		end
	end, {})
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var4 (ref), var3 (ref), p1 (ref)
		var2(p2)
		var4()
		var3.current = task.delay(0.4, function()
			-- upvalues: p1 (copy), p2 (ref)
			if p1.onTextChanged then
				p1.onTextChanged(p2)
			end
		end)
	end, { p1.onTextChanged, var4 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref)
		return var4
	end, {})
	
	return reactModule.createElement(textInput, {
		label = "",
		leadingIcon = "icons/common/search",
		text = var1,
		width = UDim.new(1, 0),
		placeholder = p1.placeholderText or "",
		onChanged = var5,
		iconTrailing = if var1 ~= "" then nil else {
			name = iconName.CircleX,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var4 (ref), var2 (ref), p1 (ref)
				var4()
				var2("")
				
				if p1.onTextChanged then
					p1.onTextChanged("")
				end
			end, { p1.onTextChanged, var4 })
		}
	})
end