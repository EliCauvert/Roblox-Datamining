local parent = script:FindFirstAncestor("BuildExperience").Parent
local _ = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(script.Parent.SearchBarView)

return function(p0) --[[ line: 24 | named "useSearchBarViewModel" ]]
	-- upvalues: reactModule (ref)
	local clear = p0.clear
	local onDismiss = p0.onDismiss
	local setQuery = p0.setQuery
	local onFocusGained = p0.onFocusGained
	local onFocusLost = p0.onFocusLost
	local shouldFocus = p0.shouldFocus
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 37 ]]
		-- upvalues: shouldFocus (ref), var1 (ref)
		if shouldFocus and var1.current then
			var1.current.focus()
		end
	end, { shouldFocus })
	
	return {
		LayoutOrder = p0.LayoutOrder,
		onChanged = reactModule.useCallback(function(p1) --[[ line: 57 ]]
			-- upvalues: clear (ref), var2 (ref), onDismiss (ref), setQuery (ref)
			if p1 == "" then
				clear()
				
				if var2.current or not onDismiss then
					return
				else
					onDismiss()
					
					return
				end
			else
				setQuery(p1)
			end
		end, { clear, onDismiss, setQuery }),
		onFocusGained = reactModule.useCallback(function() --[[ line: 43 ]]
			-- upvalues: var2 (ref), onFocusGained (ref)
			var2.current = true
			
			if onFocusGained then
				onFocusGained()
			end
		end, { onFocusGained }),
		onFocusLost = reactModule.useCallback(function(p2) --[[ line: 50 ]]
			-- upvalues: var2 (ref), onFocusLost (ref)
			var2.current = false
			
			if onFocusLost then
				onFocusLost(p2)
			end
		end, { onFocusLost }),
		placeholder = p0.placeholder,
		query = p0.query,
		textInputRef = var1
	}
end