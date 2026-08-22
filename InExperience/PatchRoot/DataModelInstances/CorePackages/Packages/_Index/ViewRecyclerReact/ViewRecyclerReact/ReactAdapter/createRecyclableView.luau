local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local compositionPlacementContextModule = require(viewRecyclerReact.ReactAdapter.Private.CompositionPlacementContext)
local _ = require(viewRecyclerReact.ReactAdapter.Private.CompositionPlacementManager)
local compositionPlacementSuspendedModule = require(viewRecyclerReact.ReactAdapter.Private.CompositionPlacementSuspended)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclableViewRegistryModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclableViewRegistry)
local signalsModule = require(viewRecyclerReact.Parent.Signals)
local signalsReactModule = require(viewRecyclerReact.Parent.SignalsReact)
local var7 = signalsModule.createSignal(nil)
local var8 = signalsModule.createSignal(nil)

local function InlineRecyclableView(p0) --[[ line: 32 ]]
	-- upvalues: reactModule (ref), signalsModule (ref), recyclableViewRegistryModule (ref)
	local var11 = reactModule.useState(function() --[[ line: 33 ]]
		-- upvalues: signalsModule (copy), p0 (ref)
		local var14, var15 = signalsModule.createSignal(p0.componentProps)
		
		return { signal = var14, set = var15, value = p0.componentProps }
	end)
	
	if var11.value ~= p0.componentProps then
		var11.value = p0.componentProps
		var11.set(p0.componentProps)
	end
	local var12 = reactModule.useState(function() --[[ line: 45 ]]
		-- upvalues: reactModule (copy)
		return { binding = reactModule.createBinding(false) }
	end)
	local metadata = recyclableViewRegistryModule.getMetadata(p0.viewType)
	assert(metadata ~= nil, "createRecyclableView: unknown Recyclable view type")
	
	return reactModule.createElement(metadata.signalComponent, { valueSignal = var11.signal, pending = var12.binding })
end

local function RecyclableViewComponent(p1) --[[ line: 57 ]]
	-- upvalues: reactModule (ref), compositionPlacementContextModule (ref), compositionPlacementSuspendedModule (ref), var8 (ref), signalsReactModule (ref), var7 (ref), InlineRecyclableView (ref)
	local var16 = reactModule.useContext(compositionPlacementContextModule)
	local var17 = var16 == false
	local var18 = if var17 or var16 == compositionPlacementSuspendedModule then nil else var16
	local var19 = signalsReactModule.useSignalState(if var18 == nil then var8 else var18.manager)
	local var20 = reactModule.useState(function() --[[ line: 63 ]]
		return {}
	end)
	local var21 = reactModule.useRef(nil)
	local var22 = reactModule.useRef(nil)
	local var23 = reactModule.useRef(p1.componentProps)
	var23.current = p1.componentProps
	local var24 = signalsReactModule.useSignalState(if var18 == nil then var7 else var18.parentSignal)
	local viewType = p1.viewType
	reactModule.useLayoutEffect(function() --[[ line: 74 ]]
		-- upvalues: var18 (ref), var19 (ref), viewType (ref), var20 (ref), var23 (ref), var21 (ref), var22 (ref)
		if var18 == nil or var19 == nil then
			return nil
		end
		local var25 = var19.register(viewType, var20, var18.parentSignal, var23.current, var21.current)
		var22.current = var25
		
		return function() --[[ line: 82 ]]
			-- upvalues: var22 (copy), var25 (ref)
			var22.current = nil
			var25.unregister()
		end
	end, { var18, var19, var20, viewType })
	local componentProps = p1.componentProps
	reactModule.useLayoutEffect(function() --[[ line: 89 ]]
		-- upvalues: var22 (ref), componentProps (ref)
		local current = var22.current
		
		if current ~= nil then
			current.setProps(componentProps)
		end
	end, { componentProps, var24 })
	
	return if var17 then reactModule.createElement(InlineRecyclableView, { componentProps = componentProps, viewType = viewType }) else reactModule.createElement("Frame", {
		Name = "RecyclableView",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(),
		ref = reactModule.useCallback(function(p2) --[[ line: 96 ]]
			-- upvalues: var21 (ref), var22 (ref)
			var21.current = p2
			local current = var22.current
			
			if current ~= nil then
				current.setPlaceholder(p2)
			end
		end, {})
	})
end

return function(p3, p4) --[[ line: 121 | named "createRecyclableView" ]]
	-- upvalues: reactModule (ref), RecyclableViewComponent (ref), recyclableViewRegistryModule (ref)
	assert(p4 ~= nil, "createRecyclableView: explicit readiness is required")
	assert(if p4.readiness ~= "ReadyOnAssignment" then p4.readiness == "ReadyOnCommit" else true, "createRecyclableView: readiness must be ReadyOnAssignment or ReadyOnCommit")
	local t = {}
	
	local function RecyclableViewFacade(p5) --[[ line: 137 ]]
		-- upvalues: reactModule (copy), RecyclableViewComponent (copy), t (ref), RecyclableViewFacade (ref)
		return reactModule.createElement(RecyclableViewComponent, {
			componentProps = p5,
			_definitionIdentity = t,
			viewType = RecyclableViewFacade
		})
	end
	
	recyclableViewRegistryModule.register(RecyclableViewFacade, {
		readiness = p4.readiness,
		hideWhilePending = p4.hideWhilePending == true,
		signalComponent = p3
	})
	
	return RecyclableViewFacade
end