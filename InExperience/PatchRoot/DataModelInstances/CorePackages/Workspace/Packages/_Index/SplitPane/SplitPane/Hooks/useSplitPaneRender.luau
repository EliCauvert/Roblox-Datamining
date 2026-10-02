local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local responsiveModule = require(parent.Responsive)
local _ = require(parent.AppSplitView)
local constants = require(parent.NavigationRodux).Constants
local splitPaneContextModule = require(script.Parent.Parent.Context.SplitPaneContext)
local splitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local isSupportPaneScreenModule = require(script.Parent.Parent.Utils.isSupportPaneScreen)
local splitPaneVariantModule = require(script.Parent.Parent.Utils.SplitPaneVariant)
local supportPaneInputRulesModule = require(script.Parent.Parent.Utils.supportPaneInputRules)
local usePreferredInput = responsiveModule.usePreferredInput
local tempRnSwitchNavigatorName = constants.TempRnSwitchNavigatorName

return function(p1, p2, p3, p4)
	-- upvalues: splitPaneStoreModule (ref), signalsReactModule (ref), reactModule (ref), splitPaneContextModule (ref), usePreferredInput (ref), tempRnSwitchNavigatorName (ref), splitPaneVariantModule (ref), supportPaneInputRulesModule (ref), isSupportPaneScreenModule (ref)
	local store = splitPaneStoreModule.getStore()
	local var1 = signalsReactModule.useSignalState(store.getSupportPaneMode)
	local var2 = signalsReactModule.useSignalState(store.getSupportWidth)
	local var3 = signalsReactModule.useSignalState(store.getIsBreakpointEnabled)
	local var4 = reactModule.useContext(splitPaneContextModule)
	local var5 = usePreferredInput()
	local var6 = if p4 then #p3 else 0
	local cloned = table.clone(p2)
	local t = {}
	local t_1 = {}
	
	if p4 then
		for i, v in p3 do
			local key = p1[v].descriptor.key
			local var7 = cloned[key]
			
			if var7 ~= nil then
				cloned[key] = nil
				t[key] = var7
			end
		end
	end
	if var3 then
		local var8 = 0
		
		for i, v in p1 do
			local options = v.descriptor.options
			
			if options ~= nil and options.splitPaneEligibility ~= nil then
				var8 = i
			end
		end
		for i_1, v_1 in p1 do
			local options = v_1.descriptor.options
			
			if options ~= nil and options.transparent and (not options.overlayEnabled and options.splitPaneEligibility == nil) then
				local key = v_1.descriptor.key
				local var9 = cloned[key]
				
				if var9 ~= nil then
					cloned[key] = nil
					
					if var8 < i_1 then
						t_1[key] = var9
					end
				end
			end
		end
	end
	local var10 = p1[1] ~= nil and (p1[1].descriptor ~= nil and (p1[1].descriptor.state ~= nil and p1[1].descriptor.state.routeName == tempRnSwitchNavigatorName))
	local var11 = reactModule.useRef(0)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var6 (ref), var10 (ref), splitPaneVariantModule (copy), store (ref), supportPaneInputRulesModule (copy), var5 (ref)
		local current = var11.current
		var11.current = var6
		
		if not var10 then return end
		local var12 = current > 0 and var6 == 0
		local var13 = current == 0 and var6 > 0
		local var14 = not var13 and var6 > 0
		
		if var13 then
			if splitPaneVariantModule.shouldAutoExpandOnSupportOpen() then
				store.setTemporarySupportPaneMode(supportPaneInputRulesModule.resolveOpenedMode(var5))
				
				return
			end
			store.setTemporarySupportPaneMode(supportPaneInputRulesModule.resolveInputChangedMode(var5))
			
			return
		elseif var12 then
			store.setTemporarySupportPaneMode(nil)
			
			return
		elseif var14 then
			store.setTemporarySupportPaneMode(supportPaneInputRulesModule.resolveInputChangedMode(var5))
		end
	end, {
		var10,
		var6,
		store,
		var1,
		var5
	})
	local var12 = if var6 > 0 then p3[var6] else nil
	local var13 = if var12 ~= nil then {} else p1[var12].descriptor.options
	local var14 = if var12 ~= nil then nil else p1[var12].descriptor.navigation
	local var15 = var12 ~= nil
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
	local var16
	local t_3 = {
		hostNavigation = var14,
		hasDetailOnTop = var15,
		paneCount = var6,
		splitPaneExpandable = var13.splitPaneExpandable,
		splitPaneCollapsible = var13.splitPaneCollapsible,
		supportRouteKeys = t_2
	}
	
	if var13.splitPaneCollapsible ~= true then
		var16 = not var15
		
		if var16 then
			var16 = not (var15 and var6 > 1)
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
			supportResizerAbovePane = not var16,
			isBreakpointEnabled = var3,
			renderSupportContent = var4.renderSupportContent,
			onContentRegionRectChanged = var4.onContentRegionRectChanged
		}
	end
end