local ReactUtils = script:FindFirstAncestor("ReactUtils")
local ReactModule = require(ReactUtils.Parent.React)
local UseEventConnectionModule = require(ReactUtils.useEventConnection)

return function(p1) --[[ Line: 9 | Named "useSelection" ]]
	-- upvalues: ReactModule (copy), UseEventConnectionModule (copy)
	local P0 = p1 or game:GetService("Selection")
	local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 12 ]]
		-- upvalues: P0 (copy)
		return P0:Get()
	end)
	UseEventConnectionModule(P0.SelectionChanged, function() --[[ Line: 16 ]]
		-- upvalues: UseStateResult2 (copy), P0 (copy)
		UseStateResult2(P0:Get())
	end, {})
	
	return UseStateResult
end