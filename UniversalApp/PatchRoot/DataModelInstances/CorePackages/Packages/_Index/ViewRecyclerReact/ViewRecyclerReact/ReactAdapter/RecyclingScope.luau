local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecyclerReact").Flags).FFlagViewRecyclerReact084
local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecyclerReact").Flags).FFlagViewRecyclerReact08
local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(ViewRecyclerReact.Parent.ViewRecycler)
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclingRootModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclingRoot)
local RecyclingScopeContextModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclingScopeContext)
local CreateElementFunction = ReactModule.createElement
local PoolObserver = nil
local withPoolObserver = nil

if FFlagViewRecyclerReact084 then
	PoolObserver = function(p1)
		-- upvalues: ReactModule (copy)
		local ObservePoolFunction = p1.observePool
		local Diagnostics = p1.diagnostics
		ReactModule.useLayoutEffect(function()
			-- upvalues: Diagnostics (copy), ObservePoolFunction (copy)
			return if Diagnostics == nil then nil else ObservePoolFunction(Diagnostics)
		end, { ObservePoolFunction, Diagnostics })
		
		return nil
	end
	
	withPoolObserver = function(ObservePool, Diagnostics, Children)
		-- upvalues: CreateElementFunction (copy), ReactModule (copy), PoolObserver (ref)
		return CreateElementFunction(ReactModule.Fragment, nil, CreateElementFunction(PoolObserver, { observePool = ObservePool, diagnostics = Diagnostics }), CreateElementFunction(ReactModule.Fragment, nil, Children))
	end
else
	PoolObserver = nil
	withPoolObserver = nil
	
	if FFlagViewRecyclerReact08 then
		PoolObserver = function(p1)
			-- upvalues: ReactModule (copy)
			local ObservePoolFunction = p1.observePool
			local Diagnostics = p1.diagnostics
			ReactModule.useLayoutEffect(function()
				-- upvalues: Diagnostics (copy), ObservePoolFunction (copy)
				return if Diagnostics == nil then nil else ObservePoolFunction(Diagnostics)
			end, { ObservePoolFunction, Diagnostics })
			
			return nil
		end
		
		withPoolObserver = function(ObservePool, Diagnostics, p1)
			-- upvalues: CreateElementFunction (copy), ReactModule (copy), PoolObserver (ref)
			return CreateElementFunction(ReactModule.Fragment, nil, CreateElementFunction(PoolObserver, { observePool = ObservePool, diagnostics = Diagnostics }), CreateElementFunction(ReactModule.Fragment, nil, p1))
		end
	end
end
return {
	create = function(p1)
		-- upvalues: FFlagViewRecyclerReact084 (copy), ReactModule (copy), RecyclingRootModule (copy), withPoolObserver (ref), CreateElementFunction (copy), RecyclingScopeContextModule (copy), FFlagViewRecyclerReact08 (copy)
		local CreatePortal = if p1 == nil then nil else p1.createPortal
		local CreatedRecyclingScope = nil
		CreatedRecyclingScope = if FFlagViewRecyclerReact084 then function(p2)
			-- upvalues: CreatePortal (copy), ReactModule (upval), RecyclingRootModule (upval), withPoolObserver (upval), CreateElementFunction (upval), RecyclingScopeContextModule (upval)
			assert(CreatePortal ~= nil, "RecyclingScope requires a configured portal renderer")
			local _, UseStateResult2 = ReactModule.useState(0)
			local UseRefResult = ReactModule.useRef(0)
			local UseRefResult1 = ReactModule.useRef(false)
			local UseRefResult2 = ReactModule.useRef(false)
			local UseStateResult = ReactModule.useState(function()
				-- upvalues: RecyclingRootModule (upval), UseRefResult1 (copy), UseStateResult2 (copy), p2 (copy)
				return RecyclingRootModule.new(function()
					-- upvalues: UseRefResult1 (upval), UseStateResult2 (upval)
					if not UseRefResult1.current then
						UseStateResult2(function(p3: number): number
							return p3 + 1
						end)
					end
				end, p2.maxPoolSize)
			end)
			
			local function destroyRootIfReady()
				-- upvalues: UseRefResult1 (copy), UseRefResult (copy), UseRefResult2 (copy), UseStateResult (copy)
				if UseRefResult1.current and UseRefResult.current == 0 and not UseRefResult2.current then
					UseRefResult2.current = true
					UseStateResult.destroy()
				end
			end
			
			local UseStateResult1 = ReactModule.useState(function()
				-- upvalues: UseStateResult (copy), UseRefResult2 (copy), UseRefResult1 (copy), UseRefResult (copy), destroyRootIfReady (copy)
				return table.freeze({
					getScope = UseStateResult.getScope,
					observePool = UseStateResult.observePool,
					registerConsumer = function()
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
				})
			end)
			ReactModule.useLayoutEffect(function()
				-- upvalues: UseStateResult (copy), p2 (copy)
				UseStateResult.setMaxPoolSize(p2.maxPoolSize)
			end, { UseStateResult, p2.maxPoolSize })
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
				Consumers = withPoolObserver(UseStateResult.observePool, p2.diagnostics, p2.children),
				ViewRecyclerVacantHostAnchor = CreateElementFunction("Frame", {
					BackgroundTransparency = 1,
					Visible = false,
					Size = UDim2.fromScale(1, 1),
					ref = ReactModule.useCallback(function(p3)
						-- upvalues: UseStateResult (copy)
						UseStateResult.setVacantHostParent(p3)
					end, { UseStateResult })
				})
			}
			
			for i, value in UseStateResult.getPortalChildren(CreatePortal) do
				config[i] = value
			end
			return CreateElementFunction(RecyclingScopeContextModule.Provider, { value = UseStateResult1 }, config)
		end elseif FFlagViewRecyclerReact08 then function(p3)
			-- upvalues: CreatePortal (copy), ReactModule (upval), RecyclingRootModule (upval), withPoolObserver (upval), CreateElementFunction (upval), RecyclingScopeContextModule (upval)
			assert(CreatePortal ~= nil, "RecyclingScope requires a configured portal renderer")
			local _, UseStateResult2 = ReactModule.useState(0)
			local UseRefResult = ReactModule.useRef(0)
			local UseRefResult1 = ReactModule.useRef(false)
			local UseRefResult2 = ReactModule.useRef(false)
			local UseStateResult = ReactModule.useState(function()
				-- upvalues: RecyclingRootModule (upval), UseRefResult1 (copy), UseStateResult2 (copy), p3 (copy)
				return RecyclingRootModule.new(function()
					-- upvalues: UseRefResult1 (upval), UseStateResult2 (upval)
					if not UseRefResult1.current then
						UseStateResult2(function(p4: number): number
							return p4 + 1
						end)
					end
				end, p3.maxPoolSize)
			end)
			
			local function destroyRootIfReady()
				-- upvalues: UseRefResult1 (copy), UseRefResult (copy), UseRefResult2 (copy), UseStateResult (copy)
				if UseRefResult1.current and UseRefResult.current == 0 and not UseRefResult2.current then
					UseRefResult2.current = true
					UseStateResult.destroy()
				end
			end
			
			local UseStateResult1 = ReactModule.useState(function()
				-- upvalues: UseStateResult (copy), UseRefResult2 (copy), UseRefResult1 (copy), UseRefResult (copy), destroyRootIfReady (copy)
				return table.freeze({
					getScope = UseStateResult.getScope,
					observePool = UseStateResult.observePool,
					registerConsumer = function()
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
				})
			end)
			ReactModule.useLayoutEffect(function()
				-- upvalues: UseStateResult (copy), p3 (copy)
				UseStateResult.setMaxPoolSize(p3.maxPoolSize)
			end, { UseStateResult, p3.maxPoolSize })
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
				Consumers = withPoolObserver(UseStateResult.observePool, p3.diagnostics, p3.children)
			}
			
			for i, value in UseStateResult.getPortalChildren(CreatePortal) do
				config[i] = value
			end
			return CreateElementFunction(RecyclingScopeContextModule.Provider, { value = UseStateResult1 }, config)
		end else nil
		
		return function(p4)
			-- upvalues: FFlagViewRecyclerReact084 (upval), ReactModule (upval), RecyclingScopeContextModule (upval), CreateElementFunction (upval), CreatedRecyclingScope (ref), FFlagViewRecyclerReact08 (upval), CreatePortal (copy), RecyclingRootModule (upval), withPoolObserver (upval)
			local UseStateResult2 = nil
			local UseRefResult = nil
			local UseRefResult1 = nil
			local UseRefResult2 = nil
			local UseStateResult = nil
			local destroyRootIfReady = nil
			local UseStateResult1 = nil
			local v1 = nil
			local UseContextResult = nil
			
			if FFlagViewRecyclerReact084 then
				UseContextResult = ReactModule.useContext(RecyclingScopeContextModule)
				
				if UseContextResult == nil then
					return CreateElementFunction(CreatedRecyclingScope, p4)
				end
			else
				UseContextResult = nil
				UseStateResult2 = nil
				UseRefResult = nil
				UseRefResult1 = nil
				UseRefResult2 = nil
				UseStateResult = nil
				destroyRootIfReady = nil
				UseStateResult1 = nil
				v1 = nil
				
				if FFlagViewRecyclerReact08 then
					UseContextResult = ReactModule.useContext(RecyclingScopeContextModule)
					
					if UseContextResult == nil then
						return CreateElementFunction(CreatedRecyclingScope, p4)
					end
				else
					assert(CreatePortal ~= nil, "RecyclingScope requires a configured portal renderer")
					local _
					_, UseStateResult2 = ReactModule.useState(0)
					UseRefResult = ReactModule.useRef(0)
					UseRefResult1 = ReactModule.useRef(false)
					UseRefResult2 = ReactModule.useRef(false)
					UseStateResult = ReactModule.useState(function()
						-- upvalues: RecyclingRootModule (upval), UseRefResult1 (ref), UseStateResult2 (ref)
						return RecyclingRootModule.new(function()
							-- upvalues: UseRefResult1 (upval), UseStateResult2 (upval)
							if not UseRefResult1.current then
								UseStateResult2(function(p5: number): number
									return p5 + 1
								end)
							end
						end)
					end)
					
					destroyRootIfReady = function()
						-- upvalues: UseRefResult1 (ref), UseRefResult (ref), UseRefResult2 (ref), UseStateResult (ref)
						if UseRefResult1.current and UseRefResult.current == 0 and not UseRefResult2.current then
							UseRefResult2.current = true
							UseStateResult.destroy()
						end
					end
					
					UseStateResult1 = ReactModule.useState(function()
						-- upvalues: UseRefResult2 (ref), UseRefResult1 (ref), UseRefResult (ref), destroyRootIfReady (ref)
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
									local UseRefResult1 = UseRefResult
									UseRefResult1.current -= 1
									task.defer(destroyRootIfReady)
									
									return
								end
							end
						end
					end)
					local UseMemoResult = ReactModule.useMemo(function()
						-- upvalues: UseStateResult (ref), p4 (copy), UseStateResult1 (ref)
						return {
							root = UseStateResult,
							listOptions = {
								maxPoolSize = p4.maxPoolSize,
								diagnostics = p4.diagnostics
							},
							registerConsumer = UseStateResult1
						}
					end, {
						p4.maxPoolSize,
						p4.diagnostics,
						UseStateResult1,
						UseStateResult
					})
					ReactModule.useEffect(function()
						-- upvalues: UseRefResult1 (ref), destroyRootIfReady (ref)
						UseRefResult1.current = false
						
						return function()
							-- upvalues: UseRefResult1 (upval), destroyRootIfReady (upval)
							UseRefResult1.current = true
							task.defer(destroyRootIfReady)
						end
					end, { UseStateResult })
					v1 = {
						Consumers = CreateElementFunction(RecyclingScopeContextModule.Provider, { value = UseMemoResult }, p4.children)
					}
					
					for i, value in UseStateResult.getPortalChildren(CreatePortal) do
						v1[i] = value
					end
				end
			end
			return (if FFlagViewRecyclerReact084 then withPoolObserver elseif FFlagViewRecyclerReact08 then withPoolObserver else CreateElementFunction)(if FFlagViewRecyclerReact084 then UseContextResult.observePool elseif FFlagViewRecyclerReact08 then UseContextResult.observePool else ReactModule.Fragment, if FFlagViewRecyclerReact084 then p4.diagnostics elseif FFlagViewRecyclerReact08 then p4.diagnostics else nil, if FFlagViewRecyclerReact084 then p4.children elseif FFlagViewRecyclerReact08 then p4.children else v1)
		end
	end
}