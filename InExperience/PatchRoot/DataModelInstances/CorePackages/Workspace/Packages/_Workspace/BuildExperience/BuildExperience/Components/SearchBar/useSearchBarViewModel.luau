local Parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(script.Parent.SearchBarView)

return function(Frame) --[[ Line: 24 | Named "useSearchBarViewModel" ]]
	-- upvalues: ReactModule (copy)
	local ClearFunction = Frame.clear
	local OnDismissFunction = Frame.onDismiss
	local SetQueryFunction = Frame.setQuery
	local OnFocusGainedFunction = Frame.onFocusGained
	local OnFocusLostFunction = Frame.onFocusLost
	local ShouldFocus = Frame.shouldFocus
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 37 ]]
		-- upvalues: ShouldFocus (copy), UseRefResult (copy)
		if ShouldFocus and UseRefResult.current then
			UseRefResult.current.focus()
		end
	end, { ShouldFocus })
	
	return {
		LayoutOrder = Frame.LayoutOrder,
		onChanged = ReactModule.useCallback(function(p1) --[[ Line: 57 ]]
			-- upvalues: ClearFunction (copy), UseRefResult1 (copy), OnDismissFunction (copy), SetQueryFunction (copy)
			if p1 == "" then
				ClearFunction()
				
				if not UseRefResult1.current and OnDismissFunction then
					OnDismissFunction()
					
					return
				end
			else
				SetQueryFunction(p1)
			end
		end, { ClearFunction, OnDismissFunction, SetQueryFunction }),
		onFocusGained = ReactModule.useCallback(function() --[[ Line: 43 ]]
			-- upvalues: UseRefResult1 (copy), OnFocusGainedFunction (copy)
			UseRefResult1.current = true
			
			if OnFocusGainedFunction then
				OnFocusGainedFunction()
			end
		end, { OnFocusGainedFunction }),
		onFocusLost = ReactModule.useCallback(function(p1) --[[ Line: 50 ]]
			-- upvalues: UseRefResult1 (copy), OnFocusLostFunction (copy)
			UseRefResult1.current = false
			
			if OnFocusLostFunction then
				OnFocusLostFunction(p1)
			end
		end, { OnFocusLostFunction }),
		placeholder = Frame.placeholder,
		query = Frame.query,
		textInputRef = UseRefResult
	}
end