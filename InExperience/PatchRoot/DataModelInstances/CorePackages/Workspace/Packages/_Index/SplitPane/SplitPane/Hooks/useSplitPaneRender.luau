local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local appSplitViewModule = require(parent.AppSplitView)
local constants = require(parent.NavigationRodux).Constants
local splitPaneContextModule = require(script.Parent.Parent.Context.SplitPaneContext)
local splitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local supportPaneMode = appSplitViewModule.Enums.SupportPaneMode
local tempRnSwitchNavigatorName = constants.TempRnSwitchNavigatorName

return function(p1, p2, p3, p4)
	-- upvalues: splitPaneStoreModule (ref), signalsReactModule (ref), reactModule (ref), splitPaneContextModule (ref), tempRnSwitchNavigatorName (ref), supportPaneMode (ref)
	local store = splitPaneStoreModule.getStore()
	local var1 = signalsReactModule.useSignalState(store.getSupportPaneMode)
	local var2 = signalsReactModule.useSignalState(store.getSupportWidth)
	local var3 = signalsReactModule.useSignalState(store.getIsBreakpointEnabled)
	local var4 = reactModule.useContext(splitPaneContextModule)
	local var5 = if p4 then #p3 else 0
	local cloned = table.clone(p2)
	local t = {}
	local t_1 = {}
	
	if p4 then
		for i, v in p3 do
			local key = p1[v].descriptor.key
			local var6 = cloned[key]
			
			if var6 ~= nil then
				cloned[key] = nil
				t[key] = var6
			end
		end
	end
	if var3 then
		local var7 = 0
		
		for i, v in p1 do
			local options = v.descriptor.options
			
			if options ~= nil and options.splitPaneEligibility ~= nil then
				var7 = i
			end
		end
		for i_1, v_1 in p1 do
			local options = v_1.descriptor.options
			
			if options ~= nil and options.transparent and (not options.overlayEnabled and options.splitPaneEligibility == nil) then
				local key = v_1.descriptor.key
				local var8 = cloned[key]
				
				if var8 ~= nil then
					cloned[key] = nil
					
					if var7 < i_1 then
						t_1[key] = var8
					end
				end
			end
		end
	end
	local var9 = p1[1] ~= nil and (p1[1].descriptor ~= nil and (p1[1].descriptor.state ~= nil and p1[1].descriptor.state.routeName == tempRnSwitchNavigatorName))
	local var10 = reactModule.useRef(0)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var5 (ref), var9 (ref), var1 (ref), supportPaneMode (copy), store (ref)
		local current = var10.current
		var10.current = var5
		
		if not var9 or var1 == supportPaneMode.Normal then return end
		if (current > 0 and var5 == 0) or (current == 0 and var5 > 0) then
			store.setSupportPaneMode(supportPaneMode.Normal)
		end
	end, { var9, var5, store, var1 })
	local var11 = if var5 > 0 then p3[var5] else nil
	local var12 = if var11 ~= nil then {} else p1[var11].descriptor.options
	
	return {
		primarySlotChildren = cloned,
		supportSlotChildren = t,
		overlaySlotChildren = t_1,
		supportContentProps = {
			hostNavigation = if var11 ~= nil then nil else p1[var11].descriptor.navigation,
			hasDetailOnTop = var11 ~= nil,
			paneCount = var5,
			splitPaneExpandable = var12.splitPaneExpandable,
			splitPaneCollapsible = var12.splitPaneCollapsible
		},
		supportWidth = var2,
		supportMinWidth = store.getMinSupportWidth(),
		supportMaxWidth = store.getMaxSupportWidth(),
		onSupportPaneWidthChanged = store.setSupportWidth,
		supportPaneMode = var1,
		supportPaneResizable = var4.supportPaneResizable == true,
		isBreakpointEnabled = var3,
		renderSupportContent = var4.renderSupportContent,
		onContentRegionRectChanged = var4.onContentRegionRectChanged
	}
end