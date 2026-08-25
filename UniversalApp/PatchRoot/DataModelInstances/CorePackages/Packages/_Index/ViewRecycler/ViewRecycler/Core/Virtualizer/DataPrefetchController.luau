local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataPrefetchModule = require(viewRecycler.Core.DataPrefetch)
local _ = require(viewRecycler.Core.DataSource)
local typesModule = require(viewRecycler.Core.Types)
local frozen = table.freeze({})
local frozen_1 = table.freeze({ startItems = 0, endItems = 0 })

local function _(p0, p1)
	return p0.firstIndex == p1.firstIndex and p0.lastIndex == p1.lastIndex
end

local _ = function(p2, p3)
	return p2.startItems == p3.startItems and p2.endItems == p3.endItems
end

return function(p4)
	-- upvalues: dataPrefetchModule (ref), typesModule (ref), frozen_1 (ref), frozen (ref)
	local var5 = false
	local var6 = nil
	local var7 = dataPrefetchModule.resolve(p4)
	local t = {}
	
	local function createRequest(p5, p6)
		-- upvalues: t (ref), var5 (write)
		local t_1 = { range = table.freeze(p6) }
		t[p5] = t_1
		
		return table.freeze({
			edge = p5,
			range = t_1.range,
			isCurrent = function()
				-- upvalues: var5 (copy), t (copy), p5 (ref), t_1 (ref)
				return not var5 and t[p5] == t_1
			end
		})
	end
	
	local function desiredRange(p7, p8, p9, p10)
		-- upvalues: dataPrefetchModule (copy), typesModule (copy)
		local var13 = if p7 == dataPrefetchModule.Edge.Start then p10.startItems else p10.endItems
		
		if var13 == 0 then
			return nil
		end
		local var14 = if p7 == dataPrefetchModule.Edge.Start then {
			firstIndex = math.max(1, p9.firstIndex - var13),
			lastIndex = p9.firstIndex - 1
		} else {
			firstIndex = p9.lastIndex + 1,
			lastIndex = math.min(p8, p9.lastIndex + var13)
		}
		
		return if typesModule.isIndexRangeEmpty(var14) then nil else var14
	end
	
	local function reconcileEdge(p11, p12, p13)
		-- upvalues: t (ref), createRequest (ref)
		local var15 = t[p11]
		
		if p12 == nil then
			t[p11] = nil
			
			return p13
		elseif var15 ~= nil then
			local range = var15.range
			
			if not (range.firstIndex == p12.firstIndex and range.lastIndex == p12.lastIndex) then
				p13 = p13 or {}
				table.insert(p13, createRequest(p11, p12))
			end
			return p13
		end
	end
	
	return {
		reconcile = function(p14)
			-- upvalues: var5 (write), var6 (write), var7 (write), frozen_1 (copy), t (ref), frozen (copy), dataPrefetchModule (copy), typesModule (copy), desiredRange (ref), reconcileEdge (ref)
			assert(not var5, "DataPrefetchController: cannot reconcile after destroy")
			local options = p14.options
			local var16 = if options == nil then 0 else options.startItems or 0
			local var17 = options ~= nil and ((if options ~= nil then options.endItems else nil) or 0)
			if var16 == 0 and var17 == 0 then
				if var6 == p14.dataSource then
					local var18 = var7
					local var19 = frozen_1
					
					if not (var18.startItems == var19.startItems and var18.endItems == var19.endItems) then
						table.clear(t)
					end
					var6 = p14.dataSource
					var7 = frozen_1
					
					return frozen
				end
			else
				local var20 = dataPrefetchModule.resolve(p14.options)
				local mountedRange = p14.mountedRange
				local var21 = if typesModule.isIndexRangeEmpty(mountedRange) then 0 else p14.dataSource.getItemCount()
				local var22 = nil
				local var23 = nil
				
				if not typesModule.isIndexRangeEmpty(mountedRange) then
					var22 = desiredRange(dataPrefetchModule.Edge.Start, var21, mountedRange, var20)
					var23 = desiredRange(dataPrefetchModule.Edge.End, var21, mountedRange, var20)
				end
				if var6 == p14.dataSource then
					local var24 = var7
					
					if not (var24.startItems == var20.startItems and var24.endItems == var20.endItems) then
						table.clear(t)
					end
					var6 = p14.dataSource
					var7 = var20
					
					return reconcileEdge(dataPrefetchModule.Edge.End, var23, reconcileEdge(dataPrefetchModule.Edge.Start, var22, nil)) or frozen
				end
			end
		end,
		destroy = function()
			-- upvalues: var5 (write), t (ref)
			if var5 then
				return
			end
			var5 = true
			table.clear(t)
		end
	}
end