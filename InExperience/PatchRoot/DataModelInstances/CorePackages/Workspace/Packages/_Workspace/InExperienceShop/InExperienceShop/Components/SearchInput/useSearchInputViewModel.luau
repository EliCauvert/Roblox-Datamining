local reactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local _ = require(script.Parent.SearchInputView)

return function(p0)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		if var1.current then
			var1.current:CaptureFocus()
		end
	end, {})
	local var3 = reactModule.useRef(p0.onTextChanged)
	var3.current = p0.onTextChanged
	
	return {
		onBack = reactModule.useCallback(function()
			-- upvalues: var2 (ref), var1 (ref), p0 (ref)
			var2.current = true
			
			if var1.current then
				var1.current:ReleaseFocus()
			end
			task.defer(p0.onBack)
		end, { p0.onBack }),
		onClear = reactModule.useCallback(function()
			-- upvalues: p0 (ref), var1 (ref)
			p0.onTextChanged("")
			
			if var1.current then
				var1.current:CaptureFocus()
			end
		end, { p0.onTextChanged }),
		onTextChanged = reactModule.useCallback(function(p1)
			-- upvalues: var2 (ref), var3 (ref)
			if not var2.current then
				var3.current(p1.Text)
			end
		end, {}),
		onFocusLost = reactModule.useCallback(function(p2, p3)
			-- upvalues: p0 (ref)
			if p3 then
				p0.onSearchSubmit(p2.Text or "")
			end
		end, { p0.onSearchSubmit }),
		text = p0.text,
		textBoxRef = var1
	}
end