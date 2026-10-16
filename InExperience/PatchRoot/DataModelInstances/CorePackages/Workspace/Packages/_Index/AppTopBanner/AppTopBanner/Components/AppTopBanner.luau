local AppTopBanner = script:FindFirstAncestor("AppTopBanner")
local Parent = AppTopBanner.Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagUseSignalsForAppTopBanner = require(Parent.SharedFlags).FFlagUseSignalsForAppTopBanner
local UseSignalState = if FFlagUseSignalsForAppTopBanner then require(Parent.SignalsReact).useSignalState else nil
local GetAppTopBannerStoreModule = if FFlagUseSignalsForAppTopBanner then require(AppTopBanner.Stores.GetAppTopBannerStore) else nil
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AppTopBannerTypeModule = require(AppTopBanner.Enums.AppTopBannerType)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local config = { deviceStatusBarHeight = 0, contentMaps = {} }

return ReactModule.memo(function(p1) --[[ Line: 37 | Named "AppTopBanner" ]]
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), ReactModule (copy), FFlagUseSignalsForAppTopBanner (copy), GetAppTopBannerStoreModule (copy), UseSignalState (copy), UseSelectorFunction (copy), AppTopBannerTypeModule (copy), FoundationModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local AppTopBannerStoreModule = if FFlagUseSignalsForAppTopBanner then GetAppTopBannerStoreModule(false) else nil
	local UseSignalStateResult = nil
	local UseSignalStateResult2 = nil
	local UseSignalStateResult3 = nil
	local UseSignalStateResult1 = nil
	local Callback = nil
	
	if FFlagUseSignalsForAppTopBanner then
		UseSignalStateResult = UseSignalState(AppTopBannerStoreModule.getExpanded)
		UseSignalStateResult1 = UseSignalState(AppTopBannerStoreModule.getAppTopBannerContentProps)
		Callback = UseSignalState(AppTopBannerStoreModule.getOnAppTopBannerClick).callback
		UseSignalStateResult2 = UseSignalState(AppTopBannerStoreModule.getAppTopBannerContentHeight)
		UseSignalStateResult3 = UseSignalState(AppTopBannerStoreModule.getIsDisabled)
	else
		UseSignalStateResult = UseSelectorFunction((ReactModule.useCallback(function(p2) --[[ Line: 61 ]]
			return if p2.AppTopBanner then p2.AppTopBanner.expanded else false
		end, {})))
		UseSignalStateResult1 = UseSelectorFunction((ReactModule.useCallback(function(p2) --[[ Line: 65 ]]
			return p2.AppTopBanner and p2.AppTopBanner.appTopBannerContentProps
		end, {})))
		Callback = UseSelectorFunction((ReactModule.useCallback(function(p2) --[[ Line: 69 ]]
			return p2.AppTopBanner and p2.AppTopBanner.onAppTopBannerClick
		end, {})))
		UseSignalStateResult2 = UseSelectorFunction((ReactModule.useCallback(function(p2) --[[ Line: 73 ]]
			return p2.AppTopBanner and p2.AppTopBanner.appTopBannerContentHeight
		end, {})))
		UseSignalStateResult3 = UseSelectorFunction((ReactModule.useCallback(function(p2) --[[ Line: 77 ]]
			return if p2.AppTopBanner then p2.AppTopBanner.isDisabled else false
		end, {})))
	end
	ReactModule.useEffect(function() --[[ Line: 85 ]]
		-- upvalues: UseSignalStateResult (ref), UseSignalStateResult3 (ref), UseStateResult2 (copy), UseSignalStateResult2 (ref), JoinResult (ref)
		if UseSignalStateResult and not UseSignalStateResult3 then
			UseStateResult2(UseSignalStateResult2 + JoinResult.deviceStatusBarHeight)
			
			return
		else
			UseStateResult2(0)
		end
	end, {
		UseSignalStateResult2,
		UseSignalStateResult,
		JoinResult.deviceStatusBarHeight,
		UseSignalStateResult3
	})
	local ContentMap = JoinResult.contentMaps[if FFlagUseSignalsForAppTopBanner then UseSignalState(AppTopBannerStoreModule.getAppTopBannerType) else UseSelectorFunction((ReactModule.useCallback(function(p2) --[[ Line: 105 ]]
		-- upvalues: AppTopBannerTypeModule (upval)
		return if p2.AppTopBanner then p2.AppTopBanner.appTopBannerType else AppTopBannerTypeModule.None
	end, {})))]
	local Element = ReactModule.createElement(FoundationModule.View, {
		Size = UDim2.new(1, 0, 0, UseStateResult),
		backgroundStyle = UseTokensResult.Color.Extended.Green.Green_800,
		onActivated = Callback,
		padding = {
			left = UDim.new(0, UseTokensResult.Padding.XLarge),
			right = UDim.new(0, UseTokensResult.Padding.XLarge),
			top = UDim.new(0, JoinResult.deviceStatusBarHeight)
		}
	}, {
		content = if ContentMap then ReactModule.createElement(ContentMap, UseSignalStateResult1) else nil
	})
	
	return if UseStateResult > 0 and not UseSignalStateResult3 then ReactModule.createElement(FocusRoot, {
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.Auxiliary
	}, Element) else nil
end)