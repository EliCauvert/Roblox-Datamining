local reactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local _ = require(script.Parent.SearchInputView)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		if var1.current then
			var1.current:CaptureFocus()
		end
	end, {})
	local var3 = reactModule.useRef(p1.onTextChanged)
	var3.current = p1.onTextChanged
	
	return {
		onBack = reactModule.useCallback(function()
			-- upvalues: var2 (ref), var1 (ref), p1 (ref)
			var2.current = true
			
			if var1.current then
				var1.current:ReleaseFocus()
			end
			task.defer(p1.onBack)
		end, { p1.onBack }),
		onClear = reactModule.useCallback(function()
			-- upvalues: p1 (ref), var1 (ref)
			p1.onTextChanged("")
			
			if var1.current then
				var1.current:CaptureFocus()
			end
		end, { p1.onTextChanged }),
		onTextChanged = reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref), var3 (ref)
			if not var2.current then
				var3.current(p2.Text)
			end
		end, {}),
		onFocusLost = reactModule.useCallback(function(p2, p3)
			-- upvalues: p1 (ref)
			if p3 then
				p1.onSearchSubmit(p2.Text or "")
			end
		end, { p1.onSearchSubmit }),
		text = p1.text,
		textBoxRef = var1
	}
end