local t = {}
local luauPolyfillModule = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object

local function __rest(p0, p1)
	-- upvalues: array (ref), object (ref)
	local t = {}
	array.forEach(p1, function(p2)
		-- upvalues: t (ref), object (copy)
		t[p2] = object.None
	end)
	
	return object.assign({}, p0, t)
end

local _ = require(script.Parent.Parent.Parent.cache.inmemory.policies_types)
local _ = require(script.Parent.Parent.graphql.storeUtils)
local mergeDeep = require(script.Parent.Parent.common.mergeDeep).mergeDeep
local getExtras = nil
local makeEmptyData = nil
local list = nil

function t.concatPagination(p3)
	-- upvalues: array (ref)
	if p3 == nil then
		p3 = false
	end
	return {
		keyArgs = p3,
		merge = function(_, p4, p5)
			-- upvalues: array (copy)
			return if p4 then array.concat(p4, p5) else p5
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
		merge = function(_, p6, p7, p8)
			-- upvalues: array (copy)
			local args = p8.args
			local var7 = if p6 ~= nil then {} else array.slice(p6, 1)
			
			if args == nil then
				return array.concat(var7, p7)
			end
			local var8 = if args.offset == nil then 0 else args.offset
			
			for i = 1, #p7 do
				var7[var8 + i] = p7[i]
			end
			return var7
		end
	}
end

function t.relayStylePagination(p9)
	-- upvalues: array (ref), boolean (ref), object (ref), getExtras (write), makeEmptyData (write), mergeDeep (ref)
	if p9 == nil then
		p9 = false
	end
	return {
		keyArgs = p9,
		read = function(_, p10, p11)
			-- upvalues: array (copy), boolean (copy), object (copy), getExtras (copy)
			if p10 then
				local t = {}
				local var10 = ""
				local var11 = ""
				array.forEach(p10.edges, function(p12)
					-- upvalues: p11 (ref), t (ref), var10 (write), boolean (copy), var11 (write)
					if p11:canRead(p11:readField("node", p12)) then
						table.insert(t, p12)
						
						if p12.cursor then
							var10 = if boolean.toJSBoolean(var10) then var10 else p12.cursor or ""
							var11 = if boolean.toJSBoolean(p12.cursor) then p12.cursor else var11
						end
					end
				end)
				local pageInfo = p10.pageInfo
				local startCursor = pageInfo and pageInfo.startCursor
				local endCursor = pageInfo and pageInfo.endCursor
				
				return object.assign({}, getExtras(p10), {
					edges = t,
					pageInfo = object.assign({}, p10.pageInfo, {
						startCursor = if boolean.toJSBoolean(startCursor) then startCursor else var10,
						endCursor = if boolean.toJSBoolean(endCursor) then endCursor else var11
					})
				})
			end
		end,
		merge = function(_, p13, p14, p15)
			-- upvalues: makeEmptyData (copy), array (copy), object (copy), mergeDeep (copy), boolean (copy), getExtras (copy)
			if p13 == nil then
				p13 = makeEmptyData()
			end
			local args = p15.args
			local var14 = if p14.edges then array.map(p14.edges, function(p16)
				-- upvalues: object (copy), p15 (ref)
				local var24 = object.assign({ cursor = "" }, p16)
				
				if p15:isReference(var24) then
					var24.cursor = p15:readField("cursor", var24)
				end
				return var24
			end) else {}
			
			if p14.pageInfo then
				local pageInfo = p14.pageInfo
				local startCursor = pageInfo.startCursor
				local endCursor = pageInfo.endCursor
				local var15 = var14[1]
				local var16 = var14[#var14]
				
				if var15 and startCursor then
					var15.cursor = startCursor
				end
				if var16 and endCursor then
					var16.cursor = endCursor
				end
				local cursor = var15 and var15.cursor
				
				if cursor and not startCursor then
					p14 = mergeDeep(p14, { pageInfo = { startCursor = cursor } })
				end
				local cursor_1 = var16 and var16.cursor
				
				if cursor_1 and not endCursor then
					p14 = mergeDeep(p14, { pageInfo = { endCursor = cursor_1 } })
				end
			end
			local edges = p13.edges
			local t = {}
			
			if args ~= nil and args.after then
				local var20 = array.findIndex(edges, function(p17)
					-- upvalues: args (ref)
					return p17.cursor == args.after
				end)
				
				if var20 >= 1 then
					edges = array.slice(edges, 1, var20 + 1)
				end
			elseif args ~= nil and boolean.toJSBoolean(args.before) then
				local var21 = array.findIndex(edges, function(p18)
					-- upvalues: args (ref)
					return p18.cursor == args.before
				end)
				t = if var21 < 0 then edges else array.slice(edges, var21)
				edges = {}
			elseif boolean.toJSBoolean(p14.edges) then
				edges = {}
			end
			local var22 = array.concat(edges, var14, t)
			local var23 = object.assign({}, p14.pageInfo, p13.pageInfo)
			
			if p14.pageInfo then
				local _ = nil
				local _ = nil
				local _ = nil
				local _ = nil
				local _ = nil
				local pageInfo = p14.pageInfo
				local hasPreviousPage = pageInfo.hasPreviousPage
				local hasNextPage = pageInfo.hasNextPage
				local startCursor = pageInfo.startCursor
				local endCursor = pageInfo.endCursor
				object.assign(var23, object.assign({}, pageInfo, {
					hasPreviousPage = object.None,
					hasNextPage = object.None,
					startCursor = object.None,
					endCursor = object.None
				}))
				
				if not boolean.toJSBoolean(#edges) then
					if hasPreviousPage ~= nil then
						var23.hasPreviousPage = hasPreviousPage
					end
					if startCursor ~= nil then
						var23.startCursor = startCursor
					end
				end
				if not boolean.toJSBoolean(#t) then
					if hasNextPage ~= nil then
						var23.hasNextPage = hasNextPage
					end
					if endCursor ~= nil then
						var23.endCursor = endCursor
					end
				end
			end
			return object.assign({}, getExtras(p13), getExtras(p14), { edges = var22, pageInfo = var23 })
		end
	}
end

getExtras = function(p19)
	-- upvalues: __rest (ref), list (write)
	return __rest(p19, list)
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