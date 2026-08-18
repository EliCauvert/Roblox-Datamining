local appTopBanner = script:FindFirstAncestor("AppTopBanner")
local parent = appTopBanner.Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useTokens = foundationModule.Hooks.useTokens
local appTopBannerTypeModule = require(appTopBanner.Enums.AppTopBannerType)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local t = { deviceStatusBarHeight = 0, contentMaps = {} }

return reactModule.memo(function(p0) --[[ line: 28 | named "AppTopBanner" ]]
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), reactModule (ref), useSelector (ref), appTopBannerTypeModule (ref), foundationModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	p0 = cryoModule.Dictionary.join(t, p0)
	local var7 = useTokens()
	local var8, var9 = reactModule.useState(0)
	local var10 = useSelector(reactModule.useCallback(function(p1) --[[ line: 38 ]]
		return if p1.AppTopBanner then p1.AppTopBanner.expanded else false
	end, {}))
	local var11 = useSelector(reactModule.useCallback(function(p2) --[[ line: 42 ]]
		return p2.AppTopBanner and p2.AppTopBanner.appTopBannerContentProps
	end, {}))
	local var12 = useSelector(reactModule.useCallback(function(p3) --[[ line: 46 ]]
		return p3.AppTopBanner and p3.AppTopBanner.onAppTopBannerClick
	end, {}))
	local var13 = useSelector(reactModule.useCallback(function(p4) --[[ line: 50 ]]
		return p4.AppTopBanner and p4.AppTopBanner.appTopBannerContentHeight
	end, {}))
	local var14 = useSelector(reactModule.useCallback(function(p5) --[[ line: 54 ]]
		return if p5.AppTopBanner then p5.AppTopBanner.isDisabled else false
	end, {}))
	reactModule.useEffect(function() --[[ line: 61 ]]
		-- upvalues: var10 (ref), var14 (ref), var9 (ref), var13 (ref), p0 (write)
		if var10 and not var14 then
			var9(var13 + p0.deviceStatusBarHeight)
			
			return
		end
		var9(0)
	end, { var13, var10, p0.deviceStatusBarHeight, var14 })
	local var15 = p0.contentMaps[useSelector(reactModule.useCallback(function(p6) --[[ line: 77 ]]
		-- upvalues: appTopBannerTypeModule (copy)
		return if p6.AppTopBanner then p6.AppTopBanner.appTopBannerType else appTopBannerTypeModule.None
	end, {}))]
	
	return if var8 > 0 and not var14 then reactModule.createElement(focusRoot, {
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.Auxiliary
	}, reactModule.createElement(foundationModule.View, {
		Size = UDim2.new(1, 0, 0, var8),
		backgroundStyle = var7.Color.Extended.Green.Green_800,
		onActivated = var12,
		padding = {
			left = UDim.new(0, var7.Padding.XLarge),
			right = UDim.new(0, var7.Padding.XLarge),
			top = UDim.new(0, p0.deviceStatusBarHeight)
		}
	}, {
		content = if var15 then reactModule.createElement(var15, var11) else nil
	})) else nil
end)