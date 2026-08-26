local roactPaginator = script:FindFirstAncestor("RoactPaginator")
local fetchInitSymbolModule = require(roactPaginator.fetchInitSymbol)
local fetchWithCursorSymbolModule = require(roactPaginator.fetchWithCursorSymbol)
local loadNextSymbolModule = require(roactPaginator.loadNextSymbol)
local loadPreviousSymbolModule = require(roactPaginator.loadPreviousSymbol)
local loggerModule = require(roactPaginator.Logger)
local dependenciesModule = require(roactPaginator.Parent.dependencies)
local roact = dependenciesModule.Roact
local cryo = dependenciesModule.Cryo
local genericPagination = dependenciesModule.GenericPagination

local function _(p1, p2)
	return table.concat(p1, "\n"):format(unpack(p2 or {}))
end

return function(p1)
	-- upvalues: roact (ref), genericPagination (ref), fetchInitSymbolModule (ref), fetchWithCursorSymbolModule (ref), cryo (ref), loadNextSymbolModule (ref), loggerModule (ref), loadPreviousSymbolModule (ref)
	assert(p1 and type(p1) == "function", "RoactPaginator.connect: parameters expected to be a function")
	local trac = debug.traceback()
	
	return function(p2)
		-- upvalues: trac (ref), roact (copy), p1 (ref), genericPagination (copy), fetchInitSymbolModule (copy), fetchWithCursorSymbolModule (copy), cryo (copy), loadNextSymbolModule (copy), loggerModule (copy), loadPreviousSymbolModule (copy)
		if p2 == nil then
			error(table.concat({
				"connect returns a function that must be passed a component.",
				"Check the connection at:",
				"%s"
			}, "\n"):format(unpack({ trac } or {})), 2)
		end
		local var1 = roact.Component:extend(("PaginatorConnection(%s)"):format(tostring(p2)))
		
		function var8.init(p3)
			-- upvalues: p1 (copy), genericPagination (copy), fetchInitSymbolModule (copy), fetchWithCursorSymbolModule (copy)
			local var2 = p1()
			assert(var2, "RoactPaginator.connect: Expected parameters to return an object")
			p3.paginator = genericPagination.new({
				pageSize = var2.pageSize,
				fetchInit = p3.props[fetchInitSymbolModule],
				fetchWithCursor = p3.props[fetchWithCursorSymbolModule]
			})
		end
		
		function var8.render(p3)
			-- upvalues: cryo (copy), loadNextSymbolModule (copy), loggerModule (copy), loadPreviousSymbolModule (copy), roact (copy), p2 (ref)
			return roact.createElement(p2, cryo.Dictionary.join(p3.props, {
				[loadNextSymbolModule] = function()
					-- upvalues: p3 (ref), loggerModule (copy)
					if p3.paginator:isFetching() then
						return
					end
					p3.paginator:getNext():catch(function(p4)
						-- upvalues: loggerModule (copy)
						loggerModule:error("Could not getNext. Got error: {}", p4)
					end)
				end,
				[loadPreviousSymbolModule] = function()
					-- upvalues: p3 (ref), loggerModule (copy)
					if p3.paginator:isFetching() then
						return
					end
					p3.paginator:getPrevious():catch(function(p4)
						-- upvalues: loggerModule (copy)
						loggerModule:error("Could not getPrevious. Got error: {}", p4)
					end)
				end
			}))
		end
		
		return var1
	end
end