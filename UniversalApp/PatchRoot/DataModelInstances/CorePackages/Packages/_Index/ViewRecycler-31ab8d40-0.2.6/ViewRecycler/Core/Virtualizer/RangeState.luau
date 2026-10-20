local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local ShallowTableModule = require(ViewRecycler.Internal.ShallowTable)
local TypesModule = require(ViewRecycler.Core.Types)
local CreateEventModule = require(ViewRecycler.Internal.createEvent)
local INDEXRANGEKEYS = TypesModule.INDEX_RANGE_KEYS

return function()
	-- upvalues: TypesModule (copy), CreateEventModule (copy), ShallowTableModule (copy), INDEXRANGEKEYS (copy)
	local EMPTYINDEXRANGE = TypesModule.EMPTY_INDEX_RANGE
	local Flag = false
	local Flag1 = false
	local Count = 0
	local EventModule = CreateEventModule()
	
	return {
		report = function(p1)
			-- upvalues: Flag (ref), ShallowTableModule (upval), EMPTYINDEXRANGE (ref), INDEXRANGEKEYS (upval), Flag1 (ref), Count (ref), EventModule (copy)
			if Flag and ShallowTableModule.containsEqual(EMPTYINDEXRANGE, p1, INDEXRANGEKEYS) then return end
			Flag = true
			EMPTYINDEXRANGE = p1
			Flag1 = false
			
			if Count > 0 then
				EventModule.fire(p1)
			end
		end,
		set = function(p1)
			-- upvalues: Flag (ref), ShallowTableModule (upval), EMPTYINDEXRANGE (ref), INDEXRANGEKEYS (upval), Flag1 (ref)
			if not Flag or not ShallowTableModule.containsEqual(EMPTYINDEXRANGE, p1, INDEXRANGEKEYS) then
				Flag = true
				EMPTYINDEXRANGE = p1
				Flag1 = true
				
				return
			end
		end,
		publish = function()
			-- upvalues: Flag1 (ref), Count (ref), EventModule (copy), EMPTYINDEXRANGE (ref)
			if not Flag1 then return end
			Flag1 = false
			
			if Count > 0 then
				EventModule.fire(EMPTYINDEXRANGE)
			end
		end,
		get = function()
			-- upvalues: EMPTYINDEXRANGE (ref)
			return EMPTYINDEXRANGE
		end,
		connect = function(p1)
			-- upvalues: Count (ref), EventModule (copy)
			Count += 1
			local ConnectResult = EventModule.connect(p1)
			local Flag = true
			
			return function()
				-- upvalues: Flag (ref), Count (upval), ConnectResult (copy)
				if Flag then
					Flag = false
					Count -= 1
					ConnectResult()
					
					return
				end
			end
		end,
		isObserved = function(): boolean
			-- upvalues: Count (ref)
			return Count > 0
		end
	}
end