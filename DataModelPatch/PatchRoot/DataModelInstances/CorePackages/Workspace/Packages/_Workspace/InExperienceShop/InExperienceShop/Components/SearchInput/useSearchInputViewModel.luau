local ReactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local _ = require(script.Parent.SearchInputView)

return function(p1)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current:CaptureFocus()
		end
	end, {})
	local UseRefResult2 = ReactModule.useRef(p1.onTextChanged)
	UseRefResult2.current = p1.onTextChanged
	
	return {
		onBack = ReactModule.useCallback(function()
			-- upvalues: UseRefResult1 (copy), UseRefResult (copy), p1 (copy)
			UseRefResult1.current = true
			
			if UseRefResult.current then
				UseRefResult.current:ReleaseFocus()
			end
			task.defer(p1.onBack)
		end, { p1.onBack }),
		onClear = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), UseRefResult (copy)
			p1.onTextChanged("")
			
			if UseRefResult.current then
				UseRefResult.current:CaptureFocus()
			end
		end, { p1.onTextChanged }),
		onTextChanged = ReactModule.useCallback(function(p2)
			-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy)
			if not UseRefResult1.current then
				UseRefResult2.current(p2.Text)
			end
		end, {}),
		onFocusLost = ReactModule.useCallback(function(p2, p3)
			-- upvalues: p1 (copy)
			if p3 then
				p1.onSearchSubmit(p2.Text or "")
			end
		end, { p1.onSearchSubmit }),
		text = p1.text,
		textBoxRef = UseRefResult
	}
end