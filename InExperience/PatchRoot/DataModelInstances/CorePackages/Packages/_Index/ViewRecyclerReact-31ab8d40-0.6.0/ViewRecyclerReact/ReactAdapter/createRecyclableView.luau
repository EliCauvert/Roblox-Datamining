local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(viewRecyclerReact.ReactAdapter.Private.CompositionPlacement)
local compositionPlacementSuspendedModule = require(viewRecyclerReact.ReactAdapter.Private.CompositionPlacementSuspended)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclableViewContextModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclableViewContext)
local recyclableViewReadinessModule = require(viewRecyclerReact.ReactAdapter.RecyclableViewReadiness)
local recyclableViewRegistryModule = require(viewRecyclerReact.ReactAdapter.Private.RecyclableViewRegistry)
local signalsModule = require(viewRecyclerReact.Parent.Signals)
local signalsReactModule = require(viewRecyclerReact.Parent.SignalsReact)
local var1 = signalsModule.createSignal(true)
local var2 = signalsModule.createSignal(false)
local var3 = signalsModule.createSignal(nil)
local var4 = signalsModule.createSignal(nil)
local var5 = signalsModule.createSignal(nil)

local function InlineRecyclableView(p1)
	-- upvalues: reactModule (ref), signalsModule (ref), var5 (ref), var3 (ref), var4 (ref), recyclableViewRegistryModule (ref), recyclableViewContextModule (ref)
	local var6 = reactModule.useState(function()
		-- upvalues: signalsModule (copy), p1 (ref), var5 (copy), var3 (copy), var4 (copy)
		local var7, var8 = signalsModule.createSignal({ get = p1.itemSignal })
		
		return {
			context = {
				placement = var5,
				assignmentSignal = var3,
				indexSignal = var4,
				itemSignal = function(value)
					-- upvalues: var7 (ref)
					return var7(value).get(value)
				end,
				itemKeySignal = signalsModule.createSignal({})
			},
			set = var8,
			source = p1.itemSignal
		}
	end)
	
	if var6.source ~= p1.itemSignal then
		var6.source = p1.itemSignal
		var6.set({ get = p1.itemSignal })
	end
	local var7 = reactModule.useState(function()
		-- upvalues: reactModule (copy)
		return { binding = reactModule.createBinding(false) }
	end)
	local metadata = recyclableViewRegistryModule.getMetadata(p1.viewType)
	assert(metadata ~= nil, "createRecyclableView: unknown Recyclable view type")
	
	return reactModule.createElement(recyclableViewContextModule.Provider, { value = var6.context }, {
		Content = reactModule.createElement(metadata.signalComponent, {
			itemSignal = var6.context.itemSignal,
			pending = var7.binding
		})
	})
end

local var6 = reactModule.memo(function(p1)
	-- upvalues: signalsReactModule (ref), reactModule (ref), InlineRecyclableView (ref)
	return if signalsReactModule.useSignalState(p1.active) then reactModule.createElement(InlineRecyclableView, p1) else nil
end)

local function RecyclableViewComponent(p1)
	-- upvalues: reactModule (ref), recyclableViewContextModule (ref), compositionPlacementSuspendedModule (ref), var5 (ref), signalsModule (ref), var6 (ref)
	local var7 = reactModule.useContext(recyclableViewContextModule)
	local var8 = var7 == false
	local var9 = if var8 or var7 == compositionPlacementSuspendedModule then nil else var7
	local var10 = if var9 == nil then var5 else var9.placement
	local var11 = reactModule.useState(function()
		return {}
	end)
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useRef(p1.itemSignal)
	var14.current = p1.itemSignal
	local var15 = reactModule.useRef(p1.active)
	var15.current = p1.active
	local viewType = p1.viewType
	reactModule.useLayoutEffect(function()
		-- upvalues: signalsModule (copy), var10 (ref), var13 (ref), var9 (ref), viewType (ref), var11 (ref), var14 (ref), var12 (ref), var15 (ref)
		local var16 = nil
		local var17 = signalsModule.createEffect(function(p2)
			-- upvalues: var10 (copy), var16 (write), var13 (copy), var9 (copy), viewType (copy), var11 (copy), var14 (copy), var12 (copy), var15 (copy)
			local var18 = var10(p2)
			
			if var18 == var16 then return end
			var16 = var18
			local current = var13.current
			
			if current ~= nil then
				var13.current = nil
				current.unregister()
			end
			if var9 ~= nil and var18 ~= nil then
				var13.current = var18.register(viewType, var11, var9.assignmentSignal, var14.current, var12.current, var15.current)
			end
		end)
		
		return function()
			-- upvalues: var17 (ref), var13 (copy)
			var17()
			local current = var13.current
			
			if current ~= nil then
				var13.current = nil
				current.unregister()
			end
		end
	end, { var9, var10, var11, viewType })
	local itemSignal = p1.itemSignal
	reactModule.useLayoutEffect(function()
		-- upvalues: var13 (ref), itemSignal (ref)
		local current = var13.current
		
		if current ~= nil then
			current.setItemSignal(itemSignal)
		end
	end, { itemSignal })
	local active = p1.active
	reactModule.useLayoutEffect(function()
		-- upvalues: var13 (ref), active (ref)
		local current = var13.current
		
		if current ~= nil then
			current.setActive(active)
		end
	end, { active })
	
	return if var8 then reactModule.createElement(var6, {
		active = active,
		itemSignal = itemSignal,
		viewType = viewType
	}) else reactModule.createElement("Frame", {
		Name = "RecyclableView",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(),
		ref = reactModule.useCallback(function(p2)
			-- upvalues: var12 (ref), var13 (ref)
			var12.current = p2
			local current = var13.current
			
			if current ~= nil then
				current.setPlaceholder(p2)
			end
		end, {})
	})
end

return function(p1, p2)
	-- upvalues: recyclableViewReadinessModule (ref), var2 (ref), var1 (ref), reactModule (ref), RecyclableViewComponent (ref), recyclableViewRegistryModule (ref)
	p2 = p2 or {}
	local readiness = p2.readiness or recyclableViewReadinessModule.ReadyOnAssignment
	assert(if readiness ~= recyclableViewReadinessModule.ReadyOnAssignment then readiness == recyclableViewReadinessModule.ReadyOnCommit else true, "createRecyclableView: readiness must be ReadyOnAssignment or ReadyOnCommit")
	local t = {}
	
	local function RecyclableViewFacade(p3)
		-- upvalues: var2 (copy), var1 (copy), reactModule (copy), RecyclableViewComponent (copy), t (ref), RecyclableViewFacade (ref)
		local active = p3.active
		
		return reactModule.createElement(RecyclableViewComponent, {
			active = if type(active) == "function" then active elseif active == false then var2 else var1,
			itemSignal = p3.itemSignal,
			_definitionIdentity = t,
			viewType = RecyclableViewFacade
		})
	end
	
	recyclableViewRegistryModule.register(RecyclableViewFacade, {
		readiness = readiness,
		hideWhilePending = p2.hideWhilePending == true,
		contributesToParentMeasurement = p2.contributesToParentMeasurement ~= false,
		signalComponent = p1
	})
	
	return RecyclableViewFacade
end