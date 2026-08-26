local appTopBanner = script:FindFirstAncestor("AppTopBanner")
local parent = appTopBanner.Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local fFlagUseSignalsForAppTopBanner = require(parent.SharedFlags).FFlagUseSignalsForAppTopBanner
local var1 = if fFlagUseSignalsForAppTopBanner then require(parent.SignalsReact).useSignalState else nil
local var2 = if fFlagUseSignalsForAppTopBanner then require(appTopBanner.Stores.GetAppTopBannerStore) else nil
local useTokens = foundationModule.Hooks.useTokens
local appTopBannerTypeModule = require(appTopBanner.Enums.AppTopBannerType)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local t = { deviceStatusBarHeight = 0, contentMaps = {} }

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), reactModule (ref), fFlagUseSignalsForAppTopBanner (ref), var2 (ref), var1 (ref), useSelector (ref), appTopBannerTypeModule (ref), foundationModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var3, var4, var5, var6, var7
	p1 = cryoModule.Dictionary.join(t, p1)
	local var8 = useTokens()
	local var9, var10 = reactModule.useState(0)
	local var11 = if fFlagUseSignalsForAppTopBanner then var2(false) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagUseSignalsForAppTopBanner then
		var3 = var1(var11.getExpanded)
		var4 = var1(var11.getAppTopBannerContentProps)
		var5 = var1(var11.getOnAppTopBannerClick).callback
		var6 = var1(var11.getAppTopBannerContentHeight)
		var7 = var1(var11.getIsDisabled)
	else
		var3 = useSelector(reactModule.useCallback(function(p2)
			return if p2.AppTopBanner then p2.AppTopBanner.expanded else false
		end, {}))
		var4 = useSelector(reactModule.useCallback(function(p2)
			return p2.AppTopBanner and p2.AppTopBanner.appTopBannerContentProps
		end, {}))
		var5 = useSelector(reactModule.useCallback(function(p2)
			return p2.AppTopBanner and p2.AppTopBanner.onAppTopBannerClick
		end, {}))
		var6 = useSelector(reactModule.useCallback(function(p2)
			return p2.AppTopBanner and p2.AppTopBanner.appTopBannerContentHeight
		end, {}))
		var7 = useSelector(reactModule.useCallback(function(p2)
			return if p2.AppTopBanner then p2.AppTopBanner.isDisabled else false
		end, {}))
	end
	reactModule.useEffect(function()
		-- upvalues: var3 (write), var7 (write), var10 (ref), var6 (write), p1 (write)
		if var3 and not var7 then
			var10(var6 + p1.deviceStatusBarHeight)
			
			return
		end
		var10(0)
	end, { var6, var3, p1.deviceStatusBarHeight, var7 })
	local var12 = p1.contentMaps[if fFlagUseSignalsForAppTopBanner then var1(var11.getAppTopBannerType) else useSelector(reactModule.useCallback(function(p2)
		-- upvalues: appTopBannerTypeModule (copy)
		return if p2.AppTopBanner then p2.AppTopBanner.appTopBannerType else appTopBannerTypeModule.None
	end, {}))]
	
	return if var9 > 0 and not var7 then reactModule.createElement(focusRoot, {
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.Auxiliary
	}, reactModule.createElement(foundationModule.View, {
		Size = UDim2.new(1, 0, 0, var9),
		backgroundStyle = var8.Color.Extended.Green.Green_800,
		onActivated = var5,
		padding = {
			left = UDim.new(0, var8.Padding.XLarge),
			right = UDim.new(0, var8.Padding.XLarge),
			top = UDim.new(0, p1.deviceStatusBarHeight)
		}
	}, {
		content = if var12 then reactModule.createElement(var12, var4) else nil
	})) else nil
end)