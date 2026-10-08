local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(viewRecyclerReact.Parent.ViewRecycler)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclingRootModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclingRoot)
local recyclingScopeContextModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclingScopeContext)
local createElement = reactModule.createElement

return {
	create = function(p1)
		-- upvalues: reactModule (ref), recyclingRootModule (ref), createElement (ref), recyclingScopeContextModule (ref)
		local var1 = if p1 == nil then nil else p1.createPortal
		
		return function(p2)
			-- upvalues: var1 (ref), reactModule (copy), recyclingRootModule (copy), createElement (copy), recyclingScopeContextModule (copy)
			assert(var1 ~= nil, "RecyclingScope requires a configured portal renderer")
			local _, var2 = reactModule.useState(0)
			local var3 = reactModule.useRef(0)
			local var4 = reactModule.useRef(false)
			local var5 = reactModule.useRef(false)
			local var6 = reactModule.useState(function()
				-- upvalues: recyclingRootModule (copy), var4 (ref), var2 (ref)
				return recyclingRootModule.new(function()
					-- upvalues: var4 (copy), var2 (copy)
					if not var4.current then
						var2(function(p3)
							return p3 + 1
						end)
					end
				end)
			end)
			
			local function destroyRootIfReady()
				-- upvalues: var4 (ref), var3 (ref), var5 (ref), var6 (ref)
				if var4.current and var3.current == 0 and not var5.current then
					var5.current = true
					var6.destroy()
				end
			end
			
			local var7 = reactModule.useState(function()
				-- upvalues: var5 (ref), var4 (ref), var3 (ref), destroyRootIfReady (ref)
				return function()
					-- upvalues: var5 (copy), var4 (copy), var3 (copy), destroyRootIfReady (copy)
					assert(not var5.current, "RecyclingScope: cannot register after destruction")
					var4.current = false
					var3.current += 1
					local var8 = true
					
					return function()
						-- upvalues: var8 (write), var3 (copy), destroyRootIfReady (copy)
						if var8 then
							var8 = false
							var3.current -= 1
							task.defer(destroyRootIfReady)
							
							return
						end
					end
				end
			end)
			local var8 = reactModule.useMemo(function()
				-- upvalues: var6 (ref), p2 (ref), var7 (ref)
				return {
					root = var6,
					listOptions = {
						maxPoolSize = p2.maxPoolSize,
						diagnostics = p2.diagnostics
					},
					registerConsumer = var7
				}
			end, { p2.maxPoolSize, p2.diagnostics, var7, var6 })
			reactModule.useEffect(function()
				-- upvalues: var4 (ref), destroyRootIfReady (ref)
				var4.current = false
				
				return function()
					-- upvalues: var4 (copy), destroyRootIfReady (copy)
					var4.current = true
					task.defer(destroyRootIfReady)
				end
			end, { var6 })
			local t = {
				Consumers = createElement(recyclingScopeContextModule.Provider, { value = var8 }, p2.children)
			}
			
			for i, v in var6.getPortalChildren(var1) do
				t[i] = v
			end
			return createElement(reactModule.Fragment, nil, t)
		end
	end
}