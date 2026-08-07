local parent = script:FindFirstAncestor("NavigationRodux").Parent
local argCheckModule = require(parent.ArgCheck)
local t = {}
local RNAdapterThunkTag = require(parent.AppCommonLib).Symbol.named("RNAdapterThunkTag")

function t.middleware(p0) --[[ line: 19 ]]
	-- upvalues: argCheckModule (ref), RNAdapterThunkTag (ref)
	argCheckModule.isType(p0, "function", "rnDispatcher")
	
	return function(p1, p2) --[[ line: 22 ]]
		-- upvalues: RNAdapterThunkTag (copy), p0 (ref)
		return function(p3) --[[ line: 23 ]]
			-- upvalues: RNAdapterThunkTag (copy), p2 (ref), p0 (copy), p1 (ref)
			return if typeof(p3) == "table" and p3[RNAdapterThunkTag] == true then p3(p2, p0) else p1(p3)
		end
	end
end

function t.new(p4, p5) --[[ line: 33 ]]
	-- upvalues: argCheckModule (ref), RNAdapterThunkTag (ref)
	argCheckModule.isNonEmptyString(p4, "name")
	argCheckModule.isType(p5, "function", "onInvoke")
	
	return setmetatable({ [RNAdapterThunkTag] = true, type = p4 }, {
		__call = function(_, ...) --[[ line: 41 ]]
			-- upvalues: p5 (ref)
			p5(...)
		end
	})
end

function t.test(p6, p7, p8) --[[ line: 47 ]]
	-- upvalues: argCheckModule (ref), RNAdapterThunkTag (ref)
	argCheckModule.assert(type(p6) == "table" and p6[RNAdapterThunkTag] == true, "'thunk' must be a valid RNAdapterThunk")
	
	return p6(p7, p8)
end

function t.is(p9) --[[ line: 56 ]]
	-- upvalues: RNAdapterThunkTag (ref)
	return type(p9) == "table" and p9[RNAdapterThunkTag] == true
end

return t