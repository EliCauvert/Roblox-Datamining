local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local recordModule = require(viewRecycler.Internal.Record)
local typesModule = require(viewRecycler.Core.Types)
local createEventModule = require(viewRecycler.Internal.createEvent)
local INDEX_RANGE_KEYS = typesModule.INDEX_RANGE_KEYS

return function()
	-- upvalues: typesModule (ref), createEventModule (ref), recordModule (ref), INDEX_RANGE_KEYS (ref)
	local EMPTY_INDEX_RANGE = typesModule.EMPTY_INDEX_RANGE
	local var4 = false
	local var5 = false
	local var6 = 0
	local var7 = createEventModule()
	
	return {
		report = function(p0)
			-- upvalues: var4 (write), recordModule (copy), EMPTY_INDEX_RANGE (write), INDEX_RANGE_KEYS (copy), var5 (write), var6 (write), var7 (ref)
			if var4 and recordModule.containsEqual(EMPTY_INDEX_RANGE, p0, INDEX_RANGE_KEYS) then return end
			var4 = true
			EMPTY_INDEX_RANGE = p0
			var5 = false
			
			if var6 > 0 then
				var7.fire(p0)
			end
		end,
		set = function(value)
			-- upvalues: var4 (write), recordModule (copy), EMPTY_INDEX_RANGE (write), INDEX_RANGE_KEYS (copy), var5 (write)
			if var4 and recordModule.containsEqual(EMPTY_INDEX_RANGE, value, INDEX_RANGE_KEYS) then
				return
			end
			var4 = true
			EMPTY_INDEX_RANGE = value
			var5 = true
		end,
		publish = function()
			-- upvalues: var5 (write), var6 (write), var7 (ref), EMPTY_INDEX_RANGE (write)
			if not var5 then return end
			var5 = false
			
			if var6 > 0 then
				var7.fire(EMPTY_INDEX_RANGE)
			end
		end,
		get = function()
			-- upvalues: EMPTY_INDEX_RANGE (write)
			return EMPTY_INDEX_RANGE
		end,
		connect = function(p1)
			-- upvalues: var6 (write), var7 (ref)
			var6 += 1
			local var8 = var7.connect(p1)
			local var9 = true
			
			return function()
				-- upvalues: var9 (write), var6 (copy), var8 (ref)
				if var9 then
					var9 = false
					var6 -= 1
					var8()
					
					return
				end
			end
		end,
		isObserved = function()
			-- upvalues: var6 (write)
			return var6 > 0
		end
	}
end