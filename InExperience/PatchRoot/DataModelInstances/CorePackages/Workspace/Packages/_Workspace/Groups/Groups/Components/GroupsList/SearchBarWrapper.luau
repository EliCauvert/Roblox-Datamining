local parent = script:FindFirstAncestor("Groups").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local textInput = foundationModule.TextInput
local iconName = foundationModule.Enums.IconName

return function(p0)
	-- upvalues: reactModule (ref), textInput (ref), iconName (ref)
	local var2, var3 = reactModule.useState("")
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		if var4.current then
			task.cancel(var4.current)
			var4.current = nil
		end
	end, {})
	local var6 = reactModule.useCallback(function(p1)
		-- upvalues: var3 (ref), var5 (ref), var4 (ref), p0 (ref)
		var3(p1)
		var5()
		var4.current = task.delay(0.4, function()
			-- upvalues: p0 (copy), p1 (ref)
			if p0.onTextChanged then
				p0.onTextChanged(p1)
			end
		end)
	end, { p0.onTextChanged, var5 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref)
		return var5
	end, {})
	
	return reactModule.createElement(textInput, {
		label = "",
		leadingIcon = "icons/common/search",
		text = var2,
		width = UDim.new(1, 0),
		placeholder = p0.placeholderText or "",
		onChanged = var6,
		iconTrailing = if var2 ~= "" then nil else {
			name = iconName.CircleX,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var5 (ref), var3 (ref), p0 (ref)
				var5()
				var3("")
				
				if p0.onTextChanged then
					p0.onTextChanged("")
				end
			end, { p0.onTextChanged, var5 })
		}
	})
end