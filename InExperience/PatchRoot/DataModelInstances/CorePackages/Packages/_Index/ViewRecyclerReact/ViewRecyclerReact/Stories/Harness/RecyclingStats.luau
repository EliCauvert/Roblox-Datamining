local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
assert(viewRecyclerReact ~= nil, "RecyclingStats must be mounted under view-recycler-react")
local reactModule = require(viewRecyclerReact.Parent.React)
local var1 = reactModule.createContext(nil)

return {
	useStats = function()
		-- upvalues: reactModule (ref)
		local var2, var3 = reactModule.useState({ mounted = 0, mounts = 0, reassignments = 0 })
		local var4 = reactModule.useRef(0)
		
		return var2, reactModule.useMemo(function()
			-- upvalues: var4 (ref), var3 (ref)
			return {
				allocateMountId = function()
					-- upvalues: var4 (copy)
					var4.current += 1
					
					return var4.current
				end,
				onMount = function()
					-- upvalues: var3 (copy)
					var3(function(p1)
						return {
							mounted = p1.mounted + 1,
							mounts = p1.mounts + 1,
							reassignments = p1.reassignments
						}
					end)
				end,
				onUnmount = function()
					-- upvalues: var3 (copy)
					var3(function(p1)
						return {
							mounted = p1.mounted - 1,
							mounts = p1.mounts,
							reassignments = p1.reassignments
						}
					end)
				end,
				onReassignment = function()
					-- upvalues: var3 (copy)
					var3(function(p1)
						return {
							mounted = p1.mounted,
							mounts = p1.mounts,
							reassignments = p1.reassignments + 1
						}
					end)
				end
			}
		end, {})
	end,
	Provider = function(p1)
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.createElement(var1.Provider, { value = p1.actions }, p1.children)
	end,
	useAssignment = function(value)
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useContext(var1)
		local var3 = reactModule.useState(function()
			-- upvalues: var2 (ref)
			return if var2 == nil then 0 else var2.allocateMountId()
		end)
		local var4 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: var2 (ref)
			if var2 == nil then
				return nil
			end
			var2.onMount()
			
			return var2.onUnmount
		end, { var2 })
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), var4 (ref), value (ref)
			if var2 ~= nil and var4.current ~= nil and var4.current ~= value then
				var2.onReassignment()
			end
			var4.current = value
		end, { var2, value })
		
		return var3
	end,
	format = function(p1)
		return `Mounted: {p1.mounted}   Total mounts: {p1.mounts}   Reassignments: {p1.reassignments}`
	end
}