local Moments = script:FindFirstAncestor("Moments")
local ReactModule = require(Moments.Parent.React)
local MomentSearchProviderModule = require(Moments.Components.MomentSearch.MomentSearchProvider)

return function()
	-- upvalues: ReactModule (copy), MomentSearchProviderModule (copy)
	local UseContextResult = ReactModule.useContext(MomentSearchProviderModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	
	return {
		isOpen = UseStateResult,
		onSearch = if UseContextResult == nil then nil else UseResult,
		onClose = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end, {}),
		provider = UseContextResult
	}
end