local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
assert(ViewRecyclerReact ~= nil, "RecyclingStats must be mounted under view-recycler-react")
local ReactModule = require(ViewRecyclerReact.Parent.React)
local Context = ReactModule.createContext(nil)

return {
	useStats = function() --[[ Line: 22 ]]
		-- upvalues: ReactModule (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState({ mounted = 0, mounts = 0, reassignments = 0 })
		local UseRefResult = ReactModule.useRef(0)
		
		return UseStateResult, (ReactModule.useMemo(function() --[[ Line: 30 ]]
			-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
			return {
				allocateMountId = function() --[[ Line: 32 ]]
					-- upvalues: UseRefResult (upval)
					UseRefResult.current += 1
					
					return UseRefResult.current
				end,
				onMount = function() --[[ Line: 36 ]]
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(function(p1) --[[ Line: 37 ]]
						return {
							mounted = p1.mounted + 1,
							mounts = p1.mounts + 1,
							reassignments = p1.reassignments
						}
					end)
				end,
				onUnmount = function() --[[ Line: 45 ]]
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(function(p1) --[[ Line: 46 ]]
						return {
							mounted = p1.mounted - 1,
							mounts = p1.mounts,
							reassignments = p1.reassignments
						}
					end)
				end,
				onReassignment = function() --[[ Line: 54 ]]
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(function(p1) --[[ Line: 55 ]]
						return {
							mounted = p1.mounted,
							mounts = p1.mounts,
							reassignments = p1.reassignments + 1
						}
					end)
				end
			}
		end, {}))
	end,
	Provider = function(p1) --[[ Line: 69 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.createElement(Context.Provider, { value = p1.actions }, p1.children)
	end,
	useAssignment = function(Current) --[[ Line: 75 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		local UseStateResult = ReactModule.useState(function() --[[ Line: 77 ]]
			-- upvalues: UseContextResult (copy)
			return if UseContextResult == nil then 0 else UseContextResult.allocateMountId()
		end)
		local UseRefResult = ReactModule.useRef(nil)
		ReactModule.useEffect(function() --[[ Line: 82 ]]
			-- upvalues: UseContextResult (copy)
			if UseContextResult == nil then
				return nil
			else
				UseContextResult.onMount()
				
				return UseContextResult.onUnmount
			end
		end, { UseContextResult })
		ReactModule.useEffect(function() --[[ Line: 90 ]]
			-- upvalues: UseContextResult (copy), UseRefResult (copy), Current (copy)
			if UseContextResult ~= nil and UseRefResult.current ~= nil and UseRefResult.current ~= Current then
				UseContextResult.onReassignment()
			end
			UseRefResult.current = Current
		end, { UseContextResult, Current })
		
		return UseStateResult
	end,
	format = function(p1): string --[[ Line: 100 ]]
		return `Mounted: {p1.mounted}   Total mounts: {p1.mounts}   Reassignments: {p1.reassignments}`
	end
}