local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local compositionPlacementContextModule = require(viewRecyclerReact.ReactAdapter.Private.CompositionPlacementContext)
local _ = require(viewRecyclerReact.ReactAdapter.Private.CompositionPlacementManager)
local compositionPlacementSuspendedModule = require(viewRecyclerReact.ReactAdapter.Private.CompositionPlacementSuspended)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclableViewRegistryModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclableViewRegistry)
local signalsModule = require(viewRecyclerReact.Parent.Signals)
local signalsReactModule = require(viewRecyclerReact.Parent.SignalsReact)
local var1 = signalsModule.createSignal(nil)
local var2 = signalsModule.createSignal(nil)

local function InlineRecyclableView(p1)
	-- upvalues: reactModule (ref), signalsModule (ref), recyclableViewRegistryModule (ref)
	local var3 = reactModule.useState(function()
		-- upvalues: signalsModule (copy), p1 (ref)
		local var4, var5 = signalsModule.createSignal(p1.componentProps)
		
		return { signal = var4, set = var5, value = p1.componentProps }
	end)
	
	if var3.value ~= p1.componentProps then
		var3.value = p1.componentProps
		var3.set(p1.componentProps)
	end
	local var4 = reactModule.useState(function()
		-- upvalues: reactModule (copy)
		return { binding = reactModule.createBinding(false) }
	end)
	local metadata = recyclableViewRegistryModule.getMetadata(p1.viewType)
	assert(metadata ~= nil, "createRecyclableView: unknown Recyclable view type")
	
	return reactModule.createElement(metadata.signalComponent, { valueSignal = var3.signal, pending = var4.binding })
end

local function RecyclableViewComponent(p1)
	-- upvalues: reactModule (ref), compositionPlacementContextModule (ref), compositionPlacementSuspendedModule (ref), var2 (ref), signalsReactModule (ref), var1 (ref), InlineRecyclableView (ref)
	local var3 = reactModule.useContext(compositionPlacementContextModule)
	local var4 = var3 == false
	local var5 = if var4 or var3 == compositionPlacementSuspendedModule then nil else var3
	local var6 = signalsReactModule.useSignalState(if var5 == nil then var2 else var5.manager)
	local var7 = reactModule.useState(function()
		return {}
	end)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(p1.componentProps)
	var10.current = p1.componentProps
	local var11 = signalsReactModule.useSignalState(if var5 == nil then var1 else var5.parentSignal)
	local viewType = p1.viewType
	reactModule.useLayoutEffect(function()
		-- upvalues: var5 (ref), var6 (ref), viewType (ref), var7 (ref), var10 (ref), var8 (ref), var9 (ref)
		if var5 == nil or var6 == nil then
			return nil
		end
		local var12 = var6.register(viewType, var7, var5.parentSignal, var10.current, var8.current)
		var9.current = var12
		
		return function()
			-- upvalues: var9 (copy), var12 (ref)
			var9.current = nil
			var12.unregister()
		end
	end, { var5, var6, var7, viewType })
	local componentProps = p1.componentProps
	reactModule.useLayoutEffect(function()
		-- upvalues: var9 (ref), componentProps (ref)
		local current = var9.current
		
		if current ~= nil then
			current.setProps(componentProps)
		end
	end, { componentProps, var11 })
	
	return if var4 then reactModule.createElement(InlineRecyclableView, { componentProps = componentProps, viewType = viewType }) else reactModule.createElement("Frame", {
		Name = "RecyclableView",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(),
		ref = reactModule.useCallback(function(p2)
			-- upvalues: var8 (ref), var9 (ref)
			var8.current = p2
			local current = var9.current
			
			if current ~= nil then
				current.setPlaceholder(p2)
			end
		end, {})
	})
end

return function(p1, p2)
	-- upvalues: reactModule (ref), RecyclableViewComponent (ref), recyclableViewRegistryModule (ref)
	assert(p2 ~= nil, "createRecyclableView: explicit readiness is required")
	assert(if p2.readiness ~= "ReadyOnAssignment" then p2.readiness == "ReadyOnCommit" else true, "createRecyclableView: readiness must be ReadyOnAssignment or ReadyOnCommit")
	local t = {}
	
	local function RecyclableViewFacade(p3)
		-- upvalues: reactModule (copy), RecyclableViewComponent (copy), t (ref), RecyclableViewFacade (ref)
		return reactModule.createElement(RecyclableViewComponent, {
			componentProps = p3,
			_definitionIdentity = t,
			viewType = RecyclableViewFacade
		})
	end
	
	recyclableViewRegistryModule.register(RecyclableViewFacade, {
		readiness = p2.readiness,
		hideWhilePending = p2.hideWhilePending == true,
		signalComponent = p1
	})
	
	return RecyclableViewFacade
end