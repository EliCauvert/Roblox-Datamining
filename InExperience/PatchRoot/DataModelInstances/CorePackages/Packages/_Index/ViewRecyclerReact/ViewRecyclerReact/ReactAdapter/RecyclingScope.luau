local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(viewRecyclerReact.Parent.ViewRecycler)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclingRuntimeModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclingRuntime)
local recyclingScopeContextModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclingScopeContext)
local createElement = reactModule.createElement

return {
	create = function(p0)
		-- upvalues: reactModule (ref), recyclingRuntimeModule (ref), createElement (ref), recyclingScopeContextModule (ref)
		local var4 = if p0 == nil then nil else p0.createPortal
		
		return function(p1)
			-- upvalues: var4 (ref), reactModule (copy), recyclingRuntimeModule (copy), createElement (copy), recyclingScopeContextModule (copy)
			assert(var4 ~= nil, "RecyclingScope requires a configured portal renderer")
			local _, var5 = reactModule.useState(0)
			local var6 = reactModule.useRef(0)
			local var7 = reactModule.useRef(false)
			local var8 = reactModule.useRef(false)
			local var9 = reactModule.useState(function()
				-- upvalues: recyclingRuntimeModule (copy), var7 (ref), var5 (ref)
				return recyclingRuntimeModule.new(function()
					-- upvalues: var7 (copy), var5 (copy)
					if not var7.current then
						var5(function(p2)
							return p2 + 1
						end)
					end
				end)
			end)
			
			local function destroyRuntimeIfReady()
				-- upvalues: var7 (ref), var6 (ref), var8 (ref), var9 (ref)
				if var7.current and var6.current == 0 and not var8.current then
					var8.current = true
					var9.destroy()
				end
			end
			
			local var11 = reactModule.useState(function()
				-- upvalues: var8 (ref), var7 (ref), var6 (ref), destroyRuntimeIfReady (ref)
				return function()
					-- upvalues: var8 (copy), var7 (copy), var6 (copy), destroyRuntimeIfReady (copy)
					assert(not var8.current, "RecyclingScope: cannot register after destruction")
					var7.current = false
					var6.current += 1
					local var14 = true
					
					return function()
						-- upvalues: var14 (write), var6 (copy), destroyRuntimeIfReady (copy)
						if var14 then
							var14 = false
							var6.current -= 1
							task.defer(destroyRuntimeIfReady)
							
							return
						end
					end
				end
			end)
			local var12 = reactModule.useMemo(function()
				-- upvalues: var9 (ref), p1 (ref), var11 (ref)
				return {
					runtime = var9,
					listOptions = {
						maxPoolSize = p1.maxPoolSize,
						diagnostics = p1.diagnostics
					},
					registerConsumer = var11
				}
			end, { p1.maxPoolSize, p1.diagnostics, var11, var9 })
			reactModule.useEffect(function()
				-- upvalues: var7 (ref), destroyRuntimeIfReady (ref)
				var7.current = false
				
				return function()
					-- upvalues: var7 (copy), destroyRuntimeIfReady (copy)
					var7.current = true
					task.defer(destroyRuntimeIfReady)
				end
			end, { var9 })
			local t = {
				Consumers = createElement(recyclingScopeContextModule.Provider, { value = var12 }, p1.children)
			}
			
			for i, v in var9.getHostChildren(var4) do
				t[i] = v
			end
			return createElement(reactModule.Fragment, nil, t)
		end
	end
}