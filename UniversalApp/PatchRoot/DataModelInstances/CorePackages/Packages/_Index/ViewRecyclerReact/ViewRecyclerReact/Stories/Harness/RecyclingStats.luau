local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
assert(viewRecyclerReact ~= nil, "RecyclingStats must be mounted under view-recycler-react")
local reactModule = require(viewRecyclerReact.Parent.React)
local var2 = reactModule.createContext(nil)

return {
	useStats = function()
		-- upvalues: reactModule (ref)
		local var3, var4 = reactModule.useState({ mounted = 0, mounts = 0, reassignments = 0 })
		local var5 = reactModule.useRef(0)
		
		return var3, reactModule.useMemo(function()
			-- upvalues: var5 (ref), var4 (ref)
			return {
				allocateMountId = function()
					-- upvalues: var5 (copy)
					var5.current += 1
					
					return var5.current
				end,
				onMount = function()
					-- upvalues: var4 (copy)
					var4(function(p0)
						return {
							mounted = p0.mounted + 1,
							mounts = p0.mounts + 1,
							reassignments = p0.reassignments
						}
					end)
				end,
				onUnmount = function()
					-- upvalues: var4 (copy)
					var4(function(p1)
						return {
							mounted = p1.mounted - 1,
							mounts = p1.mounts,
							reassignments = p1.reassignments
						}
					end)
				end,
				onReassignment = function()
					-- upvalues: var4 (copy)
					var4(function(p2)
						return {
							mounted = p2.mounted,
							mounts = p2.mounts,
							reassignments = p2.reassignments + 1
						}
					end)
				end
			}
		end, {})
	end,
	Provider = function(p3)
		-- upvalues: reactModule (ref), var2 (ref)
		return reactModule.createElement(var2.Provider, { value = p3.actions }, p3.children)
	end,
	useAssignment = function(value)
		-- upvalues: reactModule (ref), var2 (ref)
		local var6 = reactModule.useContext(var2)
		local var7 = reactModule.useState(function()
			-- upvalues: var6 (ref)
			return if var6 == nil then 0 else var6.allocateMountId()
		end)
		local var8 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: var6 (ref)
			if var6 == nil then
				return nil
			end
			var6.onMount()
			
			return var6.onUnmount
		end, { var6 })
		reactModule.useEffect(function()
			-- upvalues: var6 (ref), var8 (ref), value (ref)
			if var6 ~= nil and var8.current ~= nil and var8.current ~= value then
				var6.onReassignment()
			end
			var8.current = value
		end, { var6, value })
		
		return var7
	end,
	format = function(p4)
		return `Mounted: {p4.mounted}   Total mounts: {p4.mounts}   Reassignments: {p4.reassignments}`
	end
}