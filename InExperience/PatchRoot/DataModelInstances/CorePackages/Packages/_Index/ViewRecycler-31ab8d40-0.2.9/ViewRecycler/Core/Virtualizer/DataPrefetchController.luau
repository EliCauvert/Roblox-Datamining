local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataPrefetchModule = require(ViewRecycler.Core.DataPrefetch)
local _ = require(ViewRecycler.Core.DataSource)
local TypesModule = require(ViewRecycler.Core.Types)
local Frozen = table.freeze({})
local Frozen1 = table.freeze({ startItems = 0, endItems = 0 })

local function _(p1, p2): boolean
	return p1.firstIndex == p2.firstIndex and p1.lastIndex == p2.lastIndex
end

local _ = function(p1, p2): boolean
	return p1.startItems == p2.startItems and p1.endItems == p2.endItems
end

return function(p1)
	-- upvalues: DataPrefetchModule (copy), TypesModule (copy), Frozen1 (copy), Frozen (copy)
	local Flag = false
	local DataSource = nil
	local ResolveResult = DataPrefetchModule.resolve(p1)
	local Tbl = {}
	
	local function createRequest(Edge, Tbl1)
		-- upvalues: Tbl (copy), Flag (ref)
		local config = { range = table.freeze(Tbl1) }
		Tbl[Edge] = config
		
		return table.freeze({
			edge = Edge,
			range = config.range,
			isCurrent = function(): boolean
				-- upvalues: Flag (upval), Tbl (upval), Edge (copy), config (copy)
				return not Flag and Tbl[Edge] == config
			end
		})
	end
	
	local function desiredRange(Start, ItemCount: number, MountedRange, ResolveResult)
		-- upvalues: DataPrefetchModule (upval), TypesModule (upval)
		local StartItems = if Start == DataPrefetchModule.Edge.Start then ResolveResult.startItems else ResolveResult.endItems
		
		if StartItems == 0 then
			return nil
		else
			local Config = if Start == DataPrefetchModule.Edge.Start then {
				firstIndex = math.max(1, MountedRange.firstIndex - StartItems),
				lastIndex = MountedRange.firstIndex - 1
			} else {
				firstIndex = MountedRange.lastIndex + 1,
				lastIndex = math.min(ItemCount, MountedRange.lastIndex + StartItems)
			}
			
			return if TypesModule.isIndexRangeEmpty(Config) then nil else Config
		end
	end
	
	local function reconcileEdge(Edge, p2, List)
		-- upvalues: Tbl (copy), createRequest (copy)
		local Entry = Tbl[Edge]
		
		if p2 == nil then
			Tbl[Edge] = nil
			
			return List
		end
		repeat
			if Entry ~= nil then
				local Range = Entry.range
				
				if Range.firstIndex == p2.firstIndex and Range.lastIndex == p2.lastIndex then break end
			end
			List = List or {}
			table.insert(List, createRequest(Edge, p2))
		until true
		return List
	end
	
	return {
		reconcile = function(p2)
			-- upvalues: Flag (ref), DataSource (ref), ResolveResult (ref), Frozen1 (upval), Tbl (copy), Frozen (upval), DataPrefetchModule (upval), TypesModule (upval), desiredRange (copy), reconcileEdge (copy)
			assert(not Flag, "DataPrefetchController: cannot reconcile after destroy")
			local Options = p2.options
			local EndItems = if Options == nil then 0 else Options.endItems or 0
			
			if (if Options == nil then 0 else Options.startItems or 0) == 0 and EndItems == 0 then
				repeat
					if DataSource == p2.dataSource then
						local ResolveResult2 = ResolveResult
						
						if ResolveResult2.startItems == Frozen1.startItems and ResolveResult2.endItems == Frozen1.endItems then break end
					end
					table.clear(Tbl)
				until true
				DataSource = p2.dataSource
				ResolveResult = Frozen1
				
				return Frozen
			else
				local ResolveResult1 = DataPrefetchModule.resolve(p2.options)
				local MountedRange = p2.mountedRange
				local ItemCount = if TypesModule.isIndexRangeEmpty(MountedRange) then 0 else p2.dataSource.getItemCount()
				local v1 = nil
				local v2 = nil
				
				if not TypesModule.isIndexRangeEmpty(MountedRange) then
					v1 = desiredRange(DataPrefetchModule.Edge.Start, ItemCount, MountedRange, ResolveResult1)
					v2 = desiredRange(DataPrefetchModule.Edge.End, ItemCount, MountedRange, ResolveResult1)
				end
				repeat
					if DataSource == p2.dataSource then
						local ResolveResult3 = ResolveResult
						
						if ResolveResult3.startItems == ResolveResult1.startItems and ResolveResult3.endItems == ResolveResult1.endItems then break end
					end
					table.clear(Tbl)
				until true
				DataSource = p2.dataSource
				ResolveResult = ResolveResult1
				
				return reconcileEdge(DataPrefetchModule.Edge.End, v2, (reconcileEdge(DataPrefetchModule.Edge.Start, v1, nil))) or Frozen
			end
		end,
		destroy = function()
			-- upvalues: Flag (ref), Tbl (copy)
			if not Flag then
				Flag = true
				table.clear(Tbl)
				
				return
			end
		end
	}
end