local ReactUtils = script:FindFirstAncestor("ReactUtils")
local ReactModule = require(ReactUtils.Parent.React)
local v1 = require(ReactUtils.Flags.getFFlagUseToggleStateImprovements)()

return function(p1)
	-- upvalues: ReactModule (copy), v1 (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1 or false)
	local UseResult = if v1 then ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p2): boolean
			return not p2
		end)
	end, {}) else nil
	
	return {
		enabled = UseStateResult,
		enable = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(true)
		end, {}),
		disable = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end, {}),
		toggle = if v1 then UseResult else nil,
		set = if v1 then UseStateResult2 else nil
	}
end