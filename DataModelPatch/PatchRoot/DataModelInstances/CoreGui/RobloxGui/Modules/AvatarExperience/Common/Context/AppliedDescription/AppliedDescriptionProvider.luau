local ReactModule = require(game:GetService("CorePackages").Packages.React)
local AppliedDescriptionCallbackContextModule = require(script.Parent.AppliedDescriptionCallbackContext)
local AppliedDescriptionValueContextModule = require(script.Parent.AppliedDescriptionValueContext)

return function(p1)
	-- upvalues: ReactModule (copy), AppliedDescriptionCallbackContextModule (copy), AppliedDescriptionValueContextModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState({ appliedDescriptionBinding = UseBindingResult })
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(p2)
	end, { UseBindingResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), UseBindingResult (copy)
		UseStateResult2({ appliedDescriptionBinding = UseBindingResult })
	end, { UseBindingResult })
	
	return ReactModule.createElement(AppliedDescriptionCallbackContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseResult (copy)
			return { setAppliedDescription = UseResult }
		end, { UseResult })
	}, {
		AppliedDescriptionValueContextProvider = ReactModule.createElement(AppliedDescriptionValueContextModule.Provider, { value = UseStateResult }, p1.children)
	})
end