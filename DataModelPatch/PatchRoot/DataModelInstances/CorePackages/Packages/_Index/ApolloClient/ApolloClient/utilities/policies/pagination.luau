local LuauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object

local function __rest(p1, p2)
	-- upvalues: Array (copy), Object (copy)
	local Nones = {}
	Array.forEach(p2, function(Key)
		-- upvalues: Nones (copy), Object (upval)
		Nones[Key] = Object.None
	end)
	
	return Object.assign({}, p1, Nones)
end

local _ = require(script.Parent.Parent.Parent.cache.inmemory.policies_types)
local _ = require(script.Parent.Parent.graphql.storeUtils)
local MergeDeepFunction = require(script.Parent.Parent.common.mergeDeep).mergeDeep
local Callback = nil
local Callback1 = nil
local v1 = nil
local PaginationModule = {
	concatPagination = function(KeyArgs: boolean)
		-- upvalues: Array (copy)
		if KeyArgs == nil then
			KeyArgs = false
		end
		return {
			keyArgs = KeyArgs,
			merge = function(_, p1, p2)
				-- upvalues: Array (upval)
				return if p1 then Array.concat(p1, p2) else p2
			end
		}
	end,
	offsetLimitPagination = function(KeyArgs: boolean)
		-- upvalues: Array (copy)
		if KeyArgs == nil then
			KeyArgs = false
		end
		return {
			keyArgs = KeyArgs,
			merge = function(_, p1, p2, p3)
				-- upvalues: Array (upval)
				local Args = p3.args
				local T = if p1 == nil then {} else Array.slice(p1, 1)
				
				if Args == nil then
					T = Array.concat(T, p2)
					
					return T
				end
				local Offset = if Args.offset == nil then 0 else Args.offset
				for i = 1, #p2 do
					T[Offset + i] = p2[i]
				end
				return T
			end
		}
	end,
	relayStylePagination = function(KeyArgs: boolean)
		-- upvalues: Array (copy), Boolean (copy), Object (copy), Callback (ref), Callback1 (ref), MergeDeepFunction (copy)
		if KeyArgs == nil then
			KeyArgs = false
		end
		return {
			keyArgs = KeyArgs,
			read = function(_, EmptyData, p1)
				-- upvalues: Array (upval), Boolean (upval), Object (upval), Callback (upval)
				if not EmptyData then return end
				local Edges = {}
				local v2 = ""
				local Cursor = ""
				Array.forEach(EmptyData.edges, function(p2)
					-- upvalues: p1 (copy), Edges (copy), v2 (ref), Boolean (upval), Cursor (ref)
					if p1:canRead(p1:readField("node", p2)) then
						table.insert(Edges, p2)
						
						if p2.cursor then
							v2 = Boolean.toJSBoolean(v2) and v2 or (p2.cursor or "")
							Cursor = Boolean.toJSBoolean(p2.cursor) and p2.cursor or Cursor
						end
					end
				end)
				local PageInfo = EmptyData.pageInfo
				local StartCursor = PageInfo and PageInfo.startCursor
				local EndCursor = PageInfo and PageInfo.endCursor
				
				return Object.assign({}, Callback(EmptyData), {
					edges = Edges,
					pageInfo = Object.assign({}, EmptyData.pageInfo, {
						startCursor = Boolean.toJSBoolean(StartCursor) and StartCursor or v2,
						endCursor = Boolean.toJSBoolean(EndCursor) and EndCursor or Cursor
					})
				})
			end,
			merge = function(_, p1, EmptyData, p2)
				-- upvalues: Callback1 (upval), Array (upval), Object (upval), MergeDeepFunction (upval), Boolean (upval), Callback (upval)
				if p1 == nil then
					p1 = Callback1()
				end
				local EmptyData1 = p1
				local Args = p2.args
				local MapResult = if EmptyData.edges then Array.map(EmptyData.edges, function(p3)
					-- upvalues: Object (upval), p2 (copy)
					local AssignResult = Object.assign({ cursor = "" }, p3)
					
					if p2:isReference(AssignResult) then
						AssignResult.cursor = p2:readField("cursor", AssignResult)
					end
					return AssignResult
				end) else {}
				
				if EmptyData.pageInfo then
					local PageInfo = EmptyData.pageInfo
					local StartCursor = PageInfo.startCursor
					local EndCursor = PageInfo.endCursor
					local MapResultEntry = MapResult[1]
					local MapResultEntry1 = MapResult[#MapResult]
					
					if MapResultEntry and StartCursor then
						MapResultEntry.cursor = StartCursor
					end
					if MapResultEntry1 and EndCursor then
						MapResultEntry1.cursor = EndCursor
					end
					local Cursor = MapResultEntry and MapResultEntry.cursor
					
					if Cursor and not StartCursor then
						EmptyData = MergeDeepFunction(EmptyData, { pageInfo = { startCursor = Cursor } })
					end
					local Cursor1 = MapResultEntry1 and MapResultEntry1.cursor
					
					if Cursor1 and not EndCursor then
						EmptyData = MergeDeepFunction(EmptyData, { pageInfo = { endCursor = Cursor1 } })
					end
				end
				local Edges = EmptyData1.edges
				local SliceResult = {}
				
				if Args == nil or not Args.after then
					if Args == nil or not Boolean.toJSBoolean(Args.before) then
						if Boolean.toJSBoolean(EmptyData.edges) then
							Edges = {}
						end
					else
						local Index: number = Array.findIndex(Edges, function(p3): boolean
							-- upvalues: Args (copy)
							return p3.cursor == Args.before
						end)
						SliceResult = if Index < 0 then Edges else Array.slice(Edges, Index)
						Edges = {}
					end
				else
					local Index: number = Array.findIndex(Edges, function(p3): boolean
						-- upvalues: Args (copy)
						return p3.cursor == Args.after
					end)
					
					if Index >= 1 then
						Edges = Array.slice(Edges, 1, Index + 1)
					end
				end
				local ConcatResult = Array.concat(Edges, MapResult, SliceResult)
				local AssignResult = Object.assign({}, EmptyData.pageInfo, EmptyData1.pageInfo)
				
				if EmptyData.pageInfo then
					local PageInfo = EmptyData.pageInfo
					local HasPreviousPage = PageInfo.hasPreviousPage
					local HasNextPage = PageInfo.hasNextPage
					local StartCursor = PageInfo.startCursor
					local EndCursor = PageInfo.endCursor
					Object.assign(AssignResult, (Object.assign({}, PageInfo, {
						hasPreviousPage = Object.None,
						hasNextPage = Object.None,
						startCursor = Object.None,
						endCursor = Object.None
					})))
					
					if not Boolean.toJSBoolean(#Edges) then
						if HasPreviousPage ~= nil then
							AssignResult.hasPreviousPage = HasPreviousPage
						end
						if StartCursor ~= nil then
							AssignResult.startCursor = StartCursor
						end
					end
					if not Boolean.toJSBoolean(#SliceResult) then
						if HasNextPage ~= nil then
							AssignResult.hasNextPage = HasNextPage
						end
						if EndCursor ~= nil then
							AssignResult.endCursor = EndCursor
						end
					end
				end
				return Object.assign({}, Callback(EmptyData1), Callback(EmptyData), { edges = ConcatResult, pageInfo = AssignResult })
			end
		}
	end
}

Callback = function(p1)
	-- upvalues: __rest (copy), v1 (ref)
	return __rest(p1, v1)
end

v1 = { "edges", "pageInfo" }

Callback1 = function()
	return {
		edges = {},
		pageInfo = {
			hasPreviousPage = false,
			hasNextPage = true,
			startCursor = "",
			endCursor = ""
		}
	}
end

return PaginationModule