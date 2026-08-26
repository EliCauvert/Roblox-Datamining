local t = {}
local luauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object

local function __rest(p1, p2)
	-- upvalues: array (ref), object (ref)
	local t = {}
	array.forEach(p2, function(p3)
		-- upvalues: t (ref), object (copy)
		t[p3] = object.None
	end)
	
	return object.assign({}, p1, t)
end

local _ = require(script.Parent.Parent.Parent.cache.inmemory.policies_types)
local _ = require(script.Parent.Parent.graphql.storeUtils)
local mergeDeep = require(script.Parent.Parent.common.mergeDeep).mergeDeep
local getExtras = nil
local makeEmptyData = nil
local list = nil

function t.concatPagination(p1)
	-- upvalues: array (ref)
	if p1 == nil then
		p1 = false
	end
	return {
		keyArgs = p1,
		merge = function(_, p2, p3)
			-- upvalues: array (copy)
			return if p2 then array.concat(p2, p3) else p3
		end
	}
end

function t.offsetLimitPagination(value)
	-- upvalues: array (ref)
	if value == nil then
		value = false
	end
	return {
		keyArgs = value,
		merge = function(_, p1, p2, p3)
			-- upvalues: array (copy)
			local args = p3.args
			local var1 = if p1 ~= nil then {} else array.slice(p1, 1)
			
			if args == nil then
				return array.concat(var1, p2)
			end
			local var2 = if args.offset == nil then 0 else args.offset
			
			for i = 1, #p2 do
				var1[var2 + i] = p2[i]
			end
			return var1
		end
	}
end

function t.relayStylePagination(p1)
	-- upvalues: array (ref), boolean (ref), object (ref), getExtras (write), makeEmptyData (write), mergeDeep (ref)
	if p1 == nil then
		p1 = false
	end
	return {
		keyArgs = p1,
		read = function(_, p2, p3)
			-- upvalues: array (copy), boolean (copy), object (copy), getExtras (copy)
			if p2 then
				local t = {}
				local var1 = ""
				local var2 = ""
				array.forEach(p2.edges, function(p4)
					-- upvalues: p3 (ref), t (ref), var1 (write), boolean (copy), var2 (write)
					if p3:canRead(p3:readField("node", p4)) then
						table.insert(t, p4)
						
						if p4.cursor then
							var1 = if boolean.toJSBoolean(var1) then var1 else p4.cursor or ""
							var2 = if boolean.toJSBoolean(p4.cursor) then p4.cursor else var2
						end
					end
				end)
				local pageInfo = p2.pageInfo
				local startCursor = pageInfo and pageInfo.startCursor
				local endCursor = pageInfo and pageInfo.endCursor
				
				return object.assign({}, getExtras(p2), {
					edges = t,
					pageInfo = object.assign({}, p2.pageInfo, {
						startCursor = if boolean.toJSBoolean(startCursor) then startCursor else var1,
						endCursor = if boolean.toJSBoolean(endCursor) then endCursor else var2
					})
				})
			end
		end,
		merge = function(_, p2, p3, p4)
			-- upvalues: makeEmptyData (copy), array (copy), object (copy), mergeDeep (copy), boolean (copy), getExtras (copy)
			if p2 == nil then
				p2 = makeEmptyData()
			end
			local args = p4.args
			local var1 = if p3.edges then array.map(p3.edges, function(p5)
				-- upvalues: object (copy), p4 (ref)
				local var2 = object.assign({ cursor = "" }, p5)
				
				if p4:isReference(var2) then
					var2.cursor = p4:readField("cursor", var2)
				end
				return var2
			end) else {}
			
			if p3.pageInfo then
				local pageInfo = p3.pageInfo
				local startCursor = pageInfo.startCursor
				local endCursor = pageInfo.endCursor
				local var2 = var1[1]
				local var3 = var1[#var1]
				
				if var2 and startCursor then
					var2.cursor = startCursor
				end
				if var3 and endCursor then
					var3.cursor = endCursor
				end
				local cursor = var2 and var2.cursor
				
				if cursor and not startCursor then
					p3 = mergeDeep(p3, { pageInfo = { startCursor = cursor } })
				end
				local cursor_1 = var3 and var3.cursor
				
				if cursor_1 and not endCursor then
					p3 = mergeDeep(p3, { pageInfo = { endCursor = cursor_1 } })
				end
			end
			local edges = p2.edges
			local t = {}
			
			if args ~= nil and args.after then
				local var4 = array.findIndex(edges, function(p5)
					-- upvalues: args (ref)
					return p5.cursor == args.after
				end)
				
				if var4 >= 1 then
					edges = array.slice(edges, 1, var4 + 1)
				end
			elseif args ~= nil and boolean.toJSBoolean(args.before) then
				local var5 = array.findIndex(edges, function(p5)
					-- upvalues: args (ref)
					return p5.cursor == args.before
				end)
				t = if var5 < 0 then edges else array.slice(edges, var5)
				edges = {}
			elseif boolean.toJSBoolean(p3.edges) then
				edges = {}
			end
			local var6 = array.concat(edges, var1, t)
			local var7 = object.assign({}, p3.pageInfo, p2.pageInfo)
			
			if p3.pageInfo then
				local _ = nil
				local _ = nil
				local _ = nil
				local _ = nil
				local _ = nil
				local pageInfo = p3.pageInfo
				local hasPreviousPage = pageInfo.hasPreviousPage
				local hasNextPage = pageInfo.hasNextPage
				local startCursor = pageInfo.startCursor
				local endCursor = pageInfo.endCursor
				object.assign(var7, object.assign({}, pageInfo, {
					hasPreviousPage = object.None,
					hasNextPage = object.None,
					startCursor = object.None,
					endCursor = object.None
				}))
				
				if not boolean.toJSBoolean(#edges) then
					if hasPreviousPage ~= nil then
						var7.hasPreviousPage = hasPreviousPage
					end
					if startCursor ~= nil then
						var7.startCursor = startCursor
					end
				end
				if not boolean.toJSBoolean(#t) then
					if hasNextPage ~= nil then
						var7.hasNextPage = hasNextPage
					end
					if endCursor ~= nil then
						var7.endCursor = endCursor
					end
				end
			end
			return object.assign({}, getExtras(p2), getExtras(p3), { edges = var6, pageInfo = var7 })
		end
	}
end

getExtras = function(p1)
	-- upvalues: __rest (ref), list (write)
	return __rest(p1, list)
end

list = { "edges", "pageInfo" }

makeEmptyData = function()
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

return t