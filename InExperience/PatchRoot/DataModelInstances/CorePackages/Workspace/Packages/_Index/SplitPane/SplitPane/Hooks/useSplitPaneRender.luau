local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local appSplitViewModule = require(parent.AppSplitView)
local constants = require(parent.NavigationRodux).Constants
local splitPaneContextModule = require(script.Parent.Parent.Context.SplitPaneContext)
local splitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local isSupportPaneScreenModule = require(script.Parent.Parent.Utils.isSupportPaneScreen)
local splitPaneVariantModule = require(script.Parent.Parent.Utils.SplitPaneVariant)
local supportPaneMode = appSplitViewModule.Enums.SupportPaneMode
local tempRnSwitchNavigatorName = constants.TempRnSwitchNavigatorName

return function(p1, p2, p3, p4)
	-- upvalues: splitPaneStoreModule (ref), signalsReactModule (ref), reactModule (ref), splitPaneContextModule (ref), tempRnSwitchNavigatorName (ref), splitPaneVariantModule (ref), supportPaneMode (ref), isSupportPaneScreenModule (ref)
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
		-- upvalues: var10 (ref), var5 (ref), var9 (ref), splitPaneVariantModule (copy), store (ref), var1 (ref), supportPaneMode (copy)
		local current = var10.current
		var10.current = var5
		
		if not var9 then return end
		local var11 = current > 0 and var5 == 0
		local var12 = current == 0 and var5 > 0
		
		if var11 and splitPaneVariantModule.shouldCollapseOnSupportClose() then
			store.resetSupportPaneMode()
			
			return
		elseif var12 and splitPaneVariantModule.shouldAutoExpandOnSupportOpen() and var1 ~= supportPaneMode.Normal then
			store.setSupportPaneMode(supportPaneMode.Normal)
			
			return
		elseif splitPaneVariantModule.isPaneCollapsedByDefault() and not splitPaneVariantModule.shouldAutoExpandOnSupportOpen() then return end
		if var1 == supportPaneMode.Normal then return end
		if var11 or var12 then
			store.setSupportPaneMode(supportPaneMode.Normal)
		end
	end, { var9, var5, store, var1 })
	local var11 = if var5 > 0 then p3[var5] else nil
	local var12 = if var11 ~= nil then {} else p1[var11].descriptor.options
	local var13 = if var11 ~= nil then nil else p1[var11].descriptor.navigation
	local var14 = var11 ~= nil
	local t_2 = {}
	
	if p4 then
		for i, v in p1 do
			if isSupportPaneScreenModule(v) then
				local state = v.descriptor.state
				
				if state ~= nil and state.key ~= nil then
					table.insert(t_2, state.key)
				end
			end
		end
	end
	local var15
	local t_3 = {
		hostNavigation = var13,
		hasDetailOnTop = var14,
		paneCount = var5,
		splitPaneExpandable = var12.splitPaneExpandable,
		splitPaneCollapsible = var12.splitPaneCollapsible,
		supportRouteKeys = t_2
	}
	
	if var12.splitPaneCollapsible ~= true then
		var15 = not var14
		
		if var15 then
			var15 = not (var14 and var5 > 1)
		end
		return {
			primarySlotChildren = cloned,
			supportSlotChildren = t,
			overlaySlotChildren = t_1,
			supportContentProps = t_3,
			supportWidth = var2,
			supportMinWidth = store.getMinSupportWidth(),
			supportMaxWidth = store.getMaxSupportWidth(),
			onSupportPaneWidthChanged = store.setSupportWidth,
			supportPaneMode = var1,
			supportPaneResizable = var4.supportPaneResizable == true,
			supportResizerAbovePane = not var15,
			isBreakpointEnabled = var3,
			renderSupportContent = var4.renderSupportContent,
			onContentRegionRectChanged = var4.onContentRegionRectChanged
		}
	end
end