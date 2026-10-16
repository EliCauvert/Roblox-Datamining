local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local TextInput = FoundationModule.TextInput
local IconName = FoundationModule.Enums.IconName

return function(p1) --[[ Line: 24 | Named "SearchBar" ]]
	-- upvalues: ReactModule (copy), TextInput (copy), IconName (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 28 ]]
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
			UseRefResult.current = nil
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 35 ]]
		-- upvalues: UseStateResult2 (copy), UseResult (copy), UseRefResult (copy), p1 (copy)
		UseStateResult2(p2)
		UseResult()
		UseRefResult.current = task.delay(0.4, function() --[[ Line: 39 ]]
			-- upvalues: p1 (upval), p2 (copy)
			if p1.onTextChanged then
				p1.onTextChanged(p2)
			end
		end)
	end, { p1.onTextChanged, UseResult })
	ReactModule.useEffect(function() --[[ Line: 46 ]]
		-- upvalues: UseResult (copy)
		return UseResult
	end, {})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 50 ]]
		-- upvalues: UseResult (copy), UseStateResult2 (copy), p1 (copy)
		UseResult()
		UseStateResult2("")
		
		if p1.onTextChanged then
			p1.onTextChanged("")
		end
	end, { p1.onTextChanged, UseResult })
	
	return ReactModule.createElement(TextInput, {
		label = "",
		leadingIcon = "icons/common/search",
		text = UseStateResult,
		width = UDim.new(1, 0),
		placeholder = p1.placeholderText or "",
		onChanged = UseResult1,
		iconTrailing = if UseStateResult == "" then nil else { name = IconName.CircleX, onActivated = UseResult2 }
	})
end