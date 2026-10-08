local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataPrefetchModule = require(viewRecycler.Core.DataPrefetch)
local _ = require(viewRecycler.Core.DataSource)
local typesModule = require(viewRecycler.Core.Types)
local frozen = table.freeze({})
local frozen_1 = table.freeze({ startItems = 0, endItems = 0 })

local function _(p1, p2)
	return p1.firstIndex == p2.firstIndex and p1.lastIndex == p2.lastIndex
end

local _ = function(p1, p2)
	return p1.startItems == p2.startItems and p1.endItems == p2.endItems
end

return function(p1)
	-- upvalues: dataPrefetchModule (ref), typesModule (ref), frozen_1 (ref), frozen (ref)
	local var1 = false
	local var2 = nil
	local var3 = dataPrefetchModule.resolve(p1)
	local t = {}
	
	local function createRequest(p2, p3)
		-- upvalues: t (ref), var1 (write)
		local t_1 = { range = table.freeze(p3) }
		t[p2] = t_1
		
		return table.freeze({
			edge = p2,
			range = t_1.range,
			isCurrent = function()
				-- upvalues: var1 (copy), t (copy), p2 (ref), t_1 (ref)
				return not var1 and t[p2] == t_1
			end
		})
	end
	
	local function desiredRange(p2, p3, p4, p5)
		-- upvalues: dataPrefetchModule (copy), typesModule (copy)
		local var4 = if p2 == dataPrefetchModule.Edge.Start then p5.startItems else p5.endItems
		
		if var4 == 0 then
			return nil
		end
		local var5 = if p2 == dataPrefetchModule.Edge.Start then {
			firstIndex = math.max(1, p4.firstIndex - var4),
			lastIndex = p4.firstIndex - 1
		} else {
			firstIndex = p4.lastIndex + 1,
			lastIndex = math.min(p3, p4.lastIndex + var4)
		}
		
		return if typesModule.isIndexRangeEmpty(var5) then nil else var5
	end
	
	local function reconcileEdge(p2, p3, p4)
		-- upvalues: t (ref), createRequest (ref)
		local var4 = t[p2]
		
		if p3 == nil then
			t[p2] = nil
			
			return p4
		elseif var4 ~= nil then
			local range = var4.range
			
			if not (range.firstIndex == p3.firstIndex and range.lastIndex == p3.lastIndex) then
				p4 = p4 or {}
				table.insert(p4, createRequest(p2, p3))
			end
			return p4
		end
	end
	
	return {
		reconcile = function(p2)
			-- upvalues: var1 (write), var2 (write), var3 (write), frozen_1 (copy), t (ref), frozen (copy), dataPrefetchModule (copy), typesModule (copy), desiredRange (ref), reconcileEdge (ref)
			assert(not var1, "DataPrefetchController: cannot reconcile after destroy")
			local options = p2.options
			local var4 = if options == nil then 0 else options.startItems or 0
			local var5 = options ~= nil and ((if options ~= nil then options.endItems else nil) or 0)
			if var4 == 0 and var5 == 0 then
				if var2 == p2.dataSource then
					local var6 = var3
					local var7 = frozen_1
					
					if not (var6.startItems == var7.startItems and var6.endItems == var7.endItems) then
						table.clear(t)
					end
					var2 = p2.dataSource
					var3 = frozen_1
					
					return frozen
				end
			else
				local var8 = dataPrefetchModule.resolve(p2.options)
				local mountedRange = p2.mountedRange
				local var9 = if typesModule.isIndexRangeEmpty(mountedRange) then 0 else p2.dataSource.getItemCount()
				local var10 = nil
				local var11 = nil
				
				if not typesModule.isIndexRangeEmpty(mountedRange) then
					var10 = desiredRange(dataPrefetchModule.Edge.Start, var9, mountedRange, var8)
					var11 = desiredRange(dataPrefetchModule.Edge.End, var9, mountedRange, var8)
				end
				if var2 == p2.dataSource then
					local var12 = var3
					
					if not (var12.startItems == var8.startItems and var12.endItems == var8.endItems) then
						table.clear(t)
					end
					var2 = p2.dataSource
					var3 = var8
					
					return reconcileEdge(dataPrefetchModule.Edge.End, var11, reconcileEdge(dataPrefetchModule.Edge.Start, var10, nil)) or frozen
				end
			end
		end,
		destroy = function()
			-- upvalues: var1 (write), t (ref)
			if var1 then
				return
			end
			var1 = true
			table.clear(t)
		end
	}
end