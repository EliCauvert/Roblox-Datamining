local RoactPaginator = script:FindFirstAncestor("RoactPaginator")
local FetchInitSymbolModule = require(RoactPaginator.fetchInitSymbol)
local FetchWithCursorSymbolModule = require(RoactPaginator.fetchWithCursorSymbol)
local LoadNextSymbolModule = require(RoactPaginator.loadNextSymbol)
local LoadPreviousSymbolModule = require(RoactPaginator.loadPreviousSymbol)
local LoggerModule = require(RoactPaginator.Logger)
local DependenciesModule = require(RoactPaginator.Parent.dependencies)
local Roact = DependenciesModule.Roact
local Cryo = DependenciesModule.Cryo
local GenericPagination = DependenciesModule.GenericPagination

local function _(List, p1) --[[ Line: 16 | Named "formatMessage" ]]
	return table.concat(List, "\n"):format(unpack(p1 or {}))
end

return function(Callback) --[[ Line: 20 | Named "connect" ]]
	-- upvalues: Roact (copy), GenericPagination (copy), FetchInitSymbolModule (copy), FetchWithCursorSymbolModule (copy), Cryo (copy), LoadNextSymbolModule (copy), LoggerModule (copy), LoadPreviousSymbolModule (copy)
	assert(Callback and type(Callback) == "function", "RoactPaginator.connect: parameters expected to be a function")
	local Traceback = debug.traceback()
	
	return function(p1) --[[ Line: 24 ]]
		-- upvalues: Traceback (copy), Roact (upval), Callback (copy), GenericPagination (upval), FetchInitSymbolModule (upval), FetchWithCursorSymbolModule (upval), Cryo (upval), LoadNextSymbolModule (upval), LoggerModule (upval), LoadPreviousSymbolModule (upval)
		if p1 == nil then
			error(table.concat({
				"connect returns a function that must be passed a component.",
				"Check the connection at:",
				"%s"
			}, "\n"):format(unpack({ Traceback } or {})), 2)
		end
		local ExtendResult = Roact.Component:extend((("PaginatorConnection(%s)"):format((tostring(p1)))))
		
		function ExtendResult.init(p2) --[[ Line: 41 ]]
			-- upvalues: Callback (upval), GenericPagination (upval), FetchInitSymbolModule (upval), FetchWithCursorSymbolModule (upval)
			local CallbackResult = Callback()
			assert(CallbackResult, "RoactPaginator.connect: Expected parameters to return an object")
			p2.paginator = GenericPagination.new({
				pageSize = CallbackResult.pageSize,
				fetchInit = p2.props[FetchInitSymbolModule],
				fetchWithCursor = p2.props[FetchWithCursorSymbolModule]
			})
		end
		
		function ExtendResult.render(p2) --[[ Line: 52 ]]
			-- upvalues: Cryo (upval), LoadNextSymbolModule (upval), LoggerModule (upval), LoadPreviousSymbolModule (upval), Roact (upval), p1 (copy)
			return Roact.createElement(p1, (Cryo.Dictionary.join(p2.props, {
				[LoadNextSymbolModule] = function() --[[ Line: 54 ]]
					-- upvalues: p2 (copy), LoggerModule (upval)
					if not p2.paginator:isFetching() then
						p2.paginator:getNext():catch(function(Err) --[[ Line: 59 ]]
							-- upvalues: LoggerModule (upval)
							LoggerModule:error("Could not getNext. Got error: {}", Err)
						end)
						
						return
					end
				end,
				[LoadPreviousSymbolModule] = function() --[[ Line: 63 ]]
					-- upvalues: p2 (copy), LoggerModule (upval)
					if not p2.paginator:isFetching() then
						p2.paginator:getPrevious():catch(function(Err) --[[ Line: 68 ]]
							-- upvalues: LoggerModule (upval)
							LoggerModule:error("Could not getPrevious. Got error: {}", Err)
						end)
						
						return
					end
				end
			})))
		end
		
		return ExtendResult
	end
end