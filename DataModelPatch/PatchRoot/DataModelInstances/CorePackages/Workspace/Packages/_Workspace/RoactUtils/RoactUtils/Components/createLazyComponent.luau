local RoactUtils = script:FindFirstAncestor("RoactUtils")
local ReactModule = require(RoactUtils.Parent.React)
local _ = require(RoactUtils.types)

return function(p1)
	-- upvalues: ReactModule (copy)
	local MemoResult = ReactModule.memo(function(p2)
		-- upvalues: ReactModule (upval), p1 (copy)
		return ReactModule.createElement(ReactModule.useMemo(p1, {}), p2)
	end)
	
	return function(p2)
		-- upvalues: ReactModule (upval), MemoResult (copy)
		return ReactModule.createElement(MemoResult, p2)
	end
end