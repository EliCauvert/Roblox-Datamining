local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(ViewRecyclerReact.Parent.ViewRecycler)
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclingRootModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclingRoot)
local RecyclingScopeContextModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclingScopeContext)
local CreateElementFunction = ReactModule.createElement

return {
	create = function(p1)
		-- upvalues: ReactModule (copy), RecyclingRootModule (copy), CreateElementFunction (copy), RecyclingScopeContextModule (copy)
		local CreatePortal = if p1 == nil then nil else p1.createPortal
		
		return function(p2)
			-- upvalues: CreatePortal (copy), ReactModule (upval), RecyclingRootModule (upval), CreateElementFunction (upval), RecyclingScopeContextModule (upval)
			assert(CreatePortal ~= nil, "RecyclingScope requires a configured portal renderer")
			local _, UseStateResult2 = ReactModule.useState(0)
			local UseRefResult = ReactModule.useRef(0)
			local UseRefResult1 = ReactModule.useRef(false)
			local UseRefResult2 = ReactModule.useRef(false)
			local UseStateResult = ReactModule.useState(function()
				-- upvalues: RecyclingRootModule (upval), UseRefResult1 (copy), UseStateResult2 (copy)
				return RecyclingRootModule.new(function()
					-- upvalues: UseRefResult1 (upval), UseStateResult2 (upval)
					if not UseRefResult1.current then
						UseStateResult2(function(p3: number): number
							return p3 + 1
						end)
					end
				end)
			end)
			
			local function destroyRootIfReady()
				-- upvalues: UseRefResult1 (copy), UseRefResult (copy), UseRefResult2 (copy), UseStateResult (copy)
				if UseRefResult1.current and UseRefResult.current == 0 and not UseRefResult2.current then
					UseRefResult2.current = true
					UseStateResult.destroy()
				end
			end
			
			local UseStateResult1 = ReactModule.useState(function()
				-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), UseRefResult (copy), destroyRootIfReady (copy)
				return function()
					-- upvalues: UseRefResult2 (upval), UseRefResult1 (upval), UseRefResult (upval), destroyRootIfReady (upval)
					assert(not UseRefResult2.current, "RecyclingScope: cannot register after destruction")
					UseRefResult1.current = false
					local UseRefResult3 = UseRefResult
					UseRefResult3.current += 1
					local Flag = true
					
					return function()
						-- upvalues: Flag (ref), UseRefResult (upval), destroyRootIfReady (upval)
						if Flag then
							Flag = false
							UseRefResult.current -= 1
							task.defer(destroyRootIfReady)
							
							return
						end
					end
				end
			end)
			local UseMemoResult = ReactModule.useMemo(function()
				-- upvalues: UseStateResult (copy), p2 (copy), UseStateResult1 (copy)
				return {
					root = UseStateResult,
					listOptions = {
						maxPoolSize = p2.maxPoolSize,
						diagnostics = p2.diagnostics
					},
					registerConsumer = UseStateResult1
				}
			end, {
				p2.maxPoolSize,
				p2.diagnostics,
				UseStateResult1,
				UseStateResult
			})
			ReactModule.useEffect(function()
				-- upvalues: UseRefResult1 (copy), destroyRootIfReady (copy)
				UseRefResult1.current = false
				
				return function()
					-- upvalues: UseRefResult1 (upval), destroyRootIfReady (upval)
					UseRefResult1.current = true
					task.defer(destroyRootIfReady)
				end
			end, { UseStateResult })
			local config = {
				Consumers = CreateElementFunction(RecyclingScopeContextModule.Provider, { value = UseMemoResult }, p2.children)
			}
			
			for i, value in UseStateResult.getPortalChildren(CreatePortal) do
				config[i] = value
			end
			return CreateElementFunction(ReactModule.Fragment, nil, config)
		end
	end
}