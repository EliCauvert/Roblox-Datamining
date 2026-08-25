local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local appSplitViewModule = require(parent.AppSplitView)
local constants = require(parent.NavigationRodux).Constants
local splitPaneContextModule = require(script.Parent.Parent.Context.SplitPaneContext)
local splitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local supportPaneMode = appSplitViewModule.Enums.SupportPaneMode
local tempRnSwitchNavigatorName = constants.TempRnSwitchNavigatorName

return function(p0, p1, p2, p3)
	-- upvalues: splitPaneStoreModule (ref), signalsReactModule (ref), reactModule (ref), splitPaneContextModule (ref), tempRnSwitchNavigatorName (ref), supportPaneMode (ref)
	local store = splitPaneStoreModule.getStore()
	local var6 = signalsReactModule.useSignalState(store.getSupportPaneMode)
	local var7 = signalsReactModule.useSignalState(store.getSupportWidth)
	local var8 = signalsReactModule.useSignalState(store.getIsBreakpointEnabled)
	local var9 = reactModule.useContext(splitPaneContextModule)
	local var10 = if p3 then #p2 else 0
	local cloned = table.clone(p1)
	local t = {}
	local t_1 = {}
	
	if p3 then
		for i, v in p2 do
			local key = p0[v].descriptor.key
			local var14 = cloned[key]
			
			if var14 ~= nil then
				cloned[key] = nil
				t[key] = var14
			end
		end
	end
	if var8 then
		local var15 = 0
		
		for i, v in p0 do
			local options = v.descriptor.options
			
			if options ~= nil and options.splitPaneEligibility ~= nil then
				var15 = i
			end
		end
		for i_1, v_1 in p0 do
			local options = v_1.descriptor.options
			
			if options ~= nil and options.transparent and (not options.overlayEnabled and options.splitPaneEligibility == nil) then
				local key = v_1.descriptor.key
				local var16 = cloned[key]
				
				if var16 ~= nil then
					cloned[key] = nil
					
					if var15 < i_1 then
						t_1[key] = var16
					end
				end
			end
		end
	end
	local var17 = p0[1] ~= nil and (p0[1].descriptor ~= nil and (p0[1].descriptor.state ~= nil and p0[1].descriptor.state.routeName == tempRnSwitchNavigatorName))
	local var18 = reactModule.useRef(0)
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var10 (ref), var17 (ref), var6 (ref), supportPaneMode (copy), store (ref)
		local current = var18.current
		var18.current = var10
		
		if not var17 or var6 == supportPaneMode.Normal then return end
		if (current > 0 and var10 == 0) or (current == 0 and var10 > 0) then
			store.setSupportPaneMode(supportPaneMode.Normal)
		end
	end, { var17, var10, store, var6 })
	local var19 = if var10 > 0 then p2[var10] else nil
	local var20 = if var19 ~= nil then {} else p0[var19].descriptor.options
	
	return {
		primarySlotChildren = cloned,
		supportSlotChildren = t,
		overlaySlotChildren = t_1,
		supportContentProps = {
			hostNavigation = if var19 ~= nil then nil else p0[var19].descriptor.navigation,
			hasDetailOnTop = var19 ~= nil,
			paneCount = var10,
			splitPaneExpandable = var20.splitPaneExpandable,
			splitPaneCollapsible = var20.splitPaneCollapsible
		},
		supportWidth = var7,
		supportMinWidth = store.getMinSupportWidth(),
		supportMaxWidth = store.getMaxSupportWidth(),
		onSupportPaneWidthChanged = store.setSupportWidth,
		supportPaneMode = var6,
		supportPaneResizable = var9.supportPaneResizable == true,
		isBreakpointEnabled = var8,
		renderSupportContent = var9.renderSupportContent,
		onContentRegionRectChanged = var9.onContentRegionRectChanged
	}
end