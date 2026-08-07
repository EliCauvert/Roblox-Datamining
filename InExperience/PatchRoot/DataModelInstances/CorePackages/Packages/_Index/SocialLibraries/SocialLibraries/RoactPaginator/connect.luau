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

local function _(p0, p1) --[[ line: 16 | named "formatMessage" ]]
	return table.concat(p0, "\n"):format(unpack(p1 or {}))
end

return function(p2) --[[ line: 20 | named "connect" ]]
	-- upvalues: roact (ref), genericPagination (ref), fetchInitSymbolModule (ref), fetchWithCursorSymbolModule (ref), cryo (ref), loadNextSymbolModule (ref), loggerModule (ref), loadPreviousSymbolModule (ref)
	assert(p2 and type(p2) == "function", "RoactPaginator.connect: parameters expected to be a function")
	local trac = debug.traceback()
	
	return function(p3) --[[ line: 24 ]]
		-- upvalues: trac (ref), roact (copy), p2 (ref), genericPagination (copy), fetchInitSymbolModule (copy), fetchWithCursorSymbolModule (copy), cryo (copy), loadNextSymbolModule (copy), loggerModule (copy), loadPreviousSymbolModule (copy)
		if p3 == nil then
			error(table.concat({
				"connect returns a function that must be passed a component.",
				"Check the connection at:",
				"%s"
			}, "\n"):format(unpack({ trac } or {})), 2)
		end
		local var8 = roact.Component:extend(("PaginatorConnection(%s)"):format(tostring(p3)))
		
		function var8.init(p4) --[[ line: 41 ]]
			-- upvalues: p2 (copy), genericPagination (copy), fetchInitSymbolModule (copy), fetchWithCursorSymbolModule (copy)
			local var9 = p2()
			assert(var9, "RoactPaginator.connect: Expected parameters to return an object")
			p4.paginator = genericPagination.new({
				pageSize = var9.pageSize,
				fetchInit = p4.props[fetchInitSymbolModule],
				fetchWithCursor = p4.props[fetchWithCursorSymbolModule]
			})
		end
		
		function var8.render(p5) --[[ line: 52 ]]
			-- upvalues: cryo (copy), loadNextSymbolModule (copy), loggerModule (copy), loadPreviousSymbolModule (copy), roact (copy), p3 (ref)
			return roact.createElement(p3, cryo.Dictionary.join(p5.props, {
				[loadNextSymbolModule] = function() --[[ line: 54 ]]
					-- upvalues: p5 (ref), loggerModule (copy)
					if p5.paginator:isFetching() then
						return
					end
					p5.paginator:getNext():catch(function(p6) --[[ line: 59 ]]
						-- upvalues: loggerModule (copy)
						loggerModule:error("Could not getNext. Got error: {}", p6)
					end)
				end,
				[loadPreviousSymbolModule] = function() --[[ line: 63 ]]
					-- upvalues: p5 (ref), loggerModule (copy)
					if p5.paginator:isFetching() then
						return
					end
					p5.paginator:getPrevious():catch(function(p7) --[[ line: 68 ]]
						-- upvalues: loggerModule (copy)
						loggerModule:error("Could not getPrevious. Got error: {}", p7)
					end)
				end
			}))
		end
		
		return var8
	end
end