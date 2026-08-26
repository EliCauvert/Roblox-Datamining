local parent = script:FindFirstAncestor("NavigationRodux").Parent
local argCheckModule = require(parent.ArgCheck)
local t = {}
local RNAdapterThunkTag = require(parent.AppCommonLib).Symbol.named("RNAdapterThunkTag")

function t.middleware(p1)
	-- upvalues: argCheckModule (ref), RNAdapterThunkTag (ref)
	argCheckModule.isType(p1, "function", "rnDispatcher")
	
	return function(p2, p3)
		-- upvalues: RNAdapterThunkTag (copy), p1 (ref)
		return function(p4)
			-- upvalues: RNAdapterThunkTag (copy), p3 (ref), p1 (copy), p2 (ref)
			return if typeof(p4) == "table" and p4[RNAdapterThunkTag] == true then p4(p3, p1) else p2(p4)
		end
	end
end

function t.new(p1, p2)
	-- upvalues: argCheckModule (ref), RNAdapterThunkTag (ref)
	argCheckModule.isNonEmptyString(p1, "name")
	argCheckModule.isType(p2, "function", "onInvoke")
	
	return setmetatable({ [RNAdapterThunkTag] = true, type = p1 }, {
		__call = function(_, ...)
			-- upvalues: p2 (ref)
			p2(...)
		end
	})
end

function t.test(p1, p2, p3)
	-- upvalues: argCheckModule (ref), RNAdapterThunkTag (ref)
	argCheckModule.assert(type(p1) == "table" and p1[RNAdapterThunkTag] == true, "'thunk' must be a valid RNAdapterThunk")
	
	return p1(p2, p3)
end

function t.is(p1)
	-- upvalues: RNAdapterThunkTag (ref)
	return type(p1) == "table" and p1[RNAdapterThunkTag] == true
end

return t