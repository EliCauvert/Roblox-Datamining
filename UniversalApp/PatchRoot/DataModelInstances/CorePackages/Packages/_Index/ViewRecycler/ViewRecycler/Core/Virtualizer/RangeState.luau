local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local shallowTableModule = require(viewRecycler.Internal.ShallowTable)
local typesModule = require(viewRecycler.Core.Types)
local createEventModule = require(viewRecycler.Internal.createEvent)
local INDEX_RANGE_KEYS = typesModule.INDEX_RANGE_KEYS

return function()
	-- upvalues: typesModule (ref), createEventModule (ref), shallowTableModule (ref), INDEX_RANGE_KEYS (ref)
	local EMPTY_INDEX_RANGE = typesModule.EMPTY_INDEX_RANGE
	local var1 = false
	local var2 = false
	local var3 = 0
	local var4 = createEventModule()
	
	return {
		report = function(p1)
			-- upvalues: var1 (write), shallowTableModule (copy), EMPTY_INDEX_RANGE (write), INDEX_RANGE_KEYS (copy), var2 (write), var3 (write), var4 (ref)
			if var1 and shallowTableModule.containsEqual(EMPTY_INDEX_RANGE, p1, INDEX_RANGE_KEYS) then return end
			var1 = true
			EMPTY_INDEX_RANGE = p1
			var2 = false
			
			if var3 > 0 then
				var4.fire(p1)
			end
		end,
		set = function(value)
			-- upvalues: var1 (write), shallowTableModule (copy), EMPTY_INDEX_RANGE (write), INDEX_RANGE_KEYS (copy), var2 (write)
			if var1 and shallowTableModule.containsEqual(EMPTY_INDEX_RANGE, value, INDEX_RANGE_KEYS) then
				return
			end
			var1 = true
			EMPTY_INDEX_RANGE = value
			var2 = true
		end,
		publish = function()
			-- upvalues: var2 (write), var3 (write), var4 (ref), EMPTY_INDEX_RANGE (write)
			if not var2 then return end
			var2 = false
			
			if var3 > 0 then
				var4.fire(EMPTY_INDEX_RANGE)
			end
		end,
		get = function()
			-- upvalues: EMPTY_INDEX_RANGE (write)
			return EMPTY_INDEX_RANGE
		end,
		connect = function(p1)
			-- upvalues: var3 (write), var4 (ref)
			var3 += 1
			local var5 = var4.connect(p1)
			local var6 = true
			
			return function()
				-- upvalues: var6 (write), var3 (copy), var5 (ref)
				if var6 then
					var6 = false
					var3 -= 1
					var5()
					
					return
				end
			end
		end,
		isObserved = function()
			-- upvalues: var3 (write)
			return var3 > 0
		end
	}
end