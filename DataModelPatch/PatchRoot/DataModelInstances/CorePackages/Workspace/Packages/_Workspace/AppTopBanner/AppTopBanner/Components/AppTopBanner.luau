local AppTopBanner = script:FindFirstAncestor("AppTopBanner")
local Parent = AppTopBanner.Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AppTopBannerTypeModule = require(AppTopBanner.Enums.AppTopBannerType)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local config = { deviceStatusBarHeight = 0, contentMaps = {} }

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), ReactModule (copy), UseSelectorFunction (copy), AppTopBannerTypeModule (copy), FoundationModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return if p2.AppTopBanner then p2.AppTopBanner.expanded else false
	end, {})))
	local UseSelectorResult1 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return p2.AppTopBanner and p2.AppTopBanner.appTopBannerContentProps
	end, {})))
	local UseSelectorResult2 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return p2.AppTopBanner and p2.AppTopBanner.onAppTopBannerClick
	end, {})))
	local UseSelectorResult3 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return p2.AppTopBanner and p2.AppTopBanner.appTopBannerContentHeight
	end, {})))
	local UseSelectorResult4 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return if p2.AppTopBanner then p2.AppTopBanner.isDisabled else false
	end, {})))
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), UseSelectorResult4 (copy), UseStateResult2 (copy), UseSelectorResult3 (copy), JoinResult (ref)
		if UseSelectorResult and not UseSelectorResult4 then
			UseStateResult2(UseSelectorResult3 + JoinResult.deviceStatusBarHeight)
			
			return
		else
			UseStateResult2(0)
		end
	end, {
		UseSelectorResult3,
		UseSelectorResult,
		JoinResult.deviceStatusBarHeight,
		UseSelectorResult4
	})
	local ContentMap = JoinResult.contentMaps[UseSelectorFunction((ReactModule.useCallback(function(p2)
		-- upvalues: AppTopBannerTypeModule (upval)
		return if p2.AppTopBanner then p2.AppTopBanner.appTopBannerType else AppTopBannerTypeModule.None
	end, {})))]
	local Element = ReactModule.createElement(FoundationModule.View, {
		Size = UDim2.new(1, 0, 0, UseStateResult),
		backgroundStyle = UseTokensResult.Color.Extended.Green.Green_800,
		onActivated = UseSelectorResult2,
		padding = {
			left = UDim.new(0, UseTokensResult.Padding.XLarge),
			right = UDim.new(0, UseTokensResult.Padding.XLarge),
			top = UDim.new(0, JoinResult.deviceStatusBarHeight)
		}
	}, {
		content = if ContentMap then ReactModule.createElement(ContentMap, UseSelectorResult1) else nil
	})
	
	return if UseStateResult > 0 and not UseSelectorResult4 then ReactModule.createElement(FocusRoot, {
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.Auxiliary
	}, Element) else nil
end)