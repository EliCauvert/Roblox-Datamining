local appTopBanner = script:FindFirstAncestor("AppTopBanner")
local parent = appTopBanner.Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local fFlagUseSignalsForAppTopBanner = require(parent.SharedFlags).FFlagUseSignalsForAppTopBanner
local var4 = if fFlagUseSignalsForAppTopBanner then require(parent.SignalsReact).useSignalState else nil
local var5 = if fFlagUseSignalsForAppTopBanner then require(appTopBanner.Stores.GetAppTopBannerStore) else nil
local useTokens = foundationModule.Hooks.useTokens
local appTopBannerTypeModule = require(appTopBanner.Enums.AppTopBannerType)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local t = { deviceStatusBarHeight = 0, contentMaps = {} }

return reactModule.memo(function(p0) --[[ line: 37 | named "AppTopBanner" ]]
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), reactModule (ref), fFlagUseSignalsForAppTopBanner (ref), var5 (ref), var4 (ref), useSelector (ref), appTopBannerTypeModule (ref), foundationModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var13, var14, var15, var16, var17
	p0 = cryoModule.Dictionary.join(t, p0)
	local var9 = useTokens()
	local var10, var11 = reactModule.useState(0)
	local var12 = if fFlagUseSignalsForAppTopBanner then var5(false) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagUseSignalsForAppTopBanner then
		var13 = var4(var12.getExpanded)
		var14 = var4(var12.getAppTopBannerContentProps)
		var15 = var4(var12.getOnAppTopBannerClick).callback
		var16 = var4(var12.getAppTopBannerContentHeight)
		var17 = var4(var12.getIsDisabled)
	else
		var13 = useSelector(reactModule.useCallback(function(p1) --[[ line: 61 ]]
			return if p1.AppTopBanner then p1.AppTopBanner.expanded else false
		end, {}))
		var14 = useSelector(reactModule.useCallback(function(p2) --[[ line: 65 ]]
			return p2.AppTopBanner and p2.AppTopBanner.appTopBannerContentProps
		end, {}))
		var15 = useSelector(reactModule.useCallback(function(p3) --[[ line: 69 ]]
			return p3.AppTopBanner and p3.AppTopBanner.onAppTopBannerClick
		end, {}))
		var16 = useSelector(reactModule.useCallback(function(p4) --[[ line: 73 ]]
			return p4.AppTopBanner and p4.AppTopBanner.appTopBannerContentHeight
		end, {}))
		var17 = useSelector(reactModule.useCallback(function(p5) --[[ line: 77 ]]
			return if p5.AppTopBanner then p5.AppTopBanner.isDisabled else false
		end, {}))
	end
	reactModule.useEffect(function() --[[ line: 85 ]]
		-- upvalues: var13 (write), var17 (write), var11 (ref), var16 (write), p0 (write)
		if var13 and not var17 then
			var11(var16 + p0.deviceStatusBarHeight)
			
			return
		end
		var11(0)
	end, { var16, var13, p0.deviceStatusBarHeight, var17 })
	local var18 = p0.contentMaps[if fFlagUseSignalsForAppTopBanner then var4(var12.getAppTopBannerType) else useSelector(reactModule.useCallback(function(p6) --[[ line: 105 ]]
		-- upvalues: appTopBannerTypeModule (copy)
		return if p6.AppTopBanner then p6.AppTopBanner.appTopBannerType else appTopBannerTypeModule.None
	end, {}))]
	
	return if var10 > 0 and not var17 then reactModule.createElement(focusRoot, {
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.Auxiliary
	}, reactModule.createElement(foundationModule.View, {
		Size = UDim2.new(1, 0, 0, var10),
		backgroundStyle = var9.Color.Extended.Green.Green_800,
		onActivated = var15,
		padding = {
			left = UDim.new(0, var9.Padding.XLarge),
			right = UDim.new(0, var9.Padding.XLarge),
			top = UDim.new(0, p0.deviceStatusBarHeight)
		}
	}, {
		content = if var18 then reactModule.createElement(var18, var14) else nil
	})) else nil
end)