local Parent = script:FindFirstAncestor("AddFriends").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UIBloxModule = require(Parent.UIBlox)
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local GetPageMarginFunction = UIBloxModule.App.Container.getPageMargin
local AddFriendsScalingFix = game:DefineFastFlag("AddFriendsScalingFix", false)

return function()
	-- upvalues: UseDesignTokensFunction (copy), UseScreenSizeFunction (copy), AddFriendsScalingFix (copy), UseTokensFunction (copy), UseTextSizeOffsetFunction (copy), UseSelectorFunction (copy), GridMetrics (copy), ReactModule (copy), GetPageMarginFunction (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseTokensResult = if AddFriendsScalingFix then UseTokensFunction() else nil
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local Size2000 = UseDesignTokensResult.Size.Size_2000
	local CustomMetricsGetter = if AddFriendsScalingFix then GridMetrics.makeCustomMetricsGetter({
		minimumItemsPerRow = math.floor(2 / UseTokensResult.Config.UI.Scale),
		minimumItemWidth = 160 * UseTokensResult.Config.UI.Scale
	}) else GridMetrics.getMediumMetrics
	local UseResult = ReactModule.useCallback(function(p1): number
		-- upvalues: Size2000 (copy), UseTextSizeOffsetResult (copy)
		return p1 + Size2000 + 3 * UseTextSizeOffsetResult
	end, { Size2000, UseTextSizeOffsetResult })
	local ItemMargin = UseDesignTokensResult.LuaApps.FriendsLanding.AddFriendsPage.ItemMargin or 12
	local SafeAreaMargin = UseDesignTokensResult.LuaApps.App.Page.SafeAreaMargin
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseScreenSizeResult.X - 2 * (if SafeAreaMargin.X > 0 then SafeAreaMargin.X else GetPageMarginFunction(UseScreenSizeResult.X)) - UseSelectorFunction(function(p1)
		return p1.GlobalGuiInset
	end).left)
	
	local function OnContainerSizeChanged(p1)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p1.X)
	end
	
	local CustomMetricsGetterResult = CustomMetricsGetter(UseStateResult, ItemMargin)
	
	return {
		numColumns = CustomMetricsGetterResult.itemsPerRow,
		columnGap = CustomMetricsGetterResult.itemsPerRow <= 2 and ItemMargin or nil,
		getItemHeight = UseResult,
		onContainerSizeChanged = OnContainerSizeChanged
	}, CustomMetricsGetterResult
end