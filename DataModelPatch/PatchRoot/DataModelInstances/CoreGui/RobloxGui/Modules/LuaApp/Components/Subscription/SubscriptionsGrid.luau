local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseScreenSizeFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useScreenSize
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local DefaultMetricsGridView = UIBloxModule.App.Grid.DefaultMetricsGridView
local SubscriptionTileModule = require(Modules.LuaApp.Components.Subscription.SubscriptionTile)
local _ = require(Modules.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel)
local GetFFlagEnableDevSubsInRobuxModule = require(Modules.LuaApp.Flags.GetFFlagEnableDevSubsInRobux)
local FFlagEnableDevSubsFastFollowFixes = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableDevSubsFastFollowFixes

local function getTiles(p1, UniverseId, ScreenSize, CreatorName, CreatorVerified)
	local List = {}
	local GameSubscriptionProduct = p1.GameSubscriptionProducts[UniverseId]
	
	if GameSubscriptionProduct == nil then
		return List
	end
	local SubscriptionProductsThumbnails = p1.SubscriptionProductsThumbnails
	local SubscriptionStatuses = p1.SubscriptionStatuses
	
	for _, SubscriptionProduct in GameSubscriptionProduct do
		local Url = ""
		local IsSubscribed = false
		
		if SubscriptionProductsThumbnails[tostring(SubscriptionProduct.iconImageAssetId)] then
			Url = SubscriptionProductsThumbnails[tostring(SubscriptionProduct.iconImageAssetId)].url
		end
		if SubscriptionProduct.subscriptionTargetKey and SubscriptionStatuses[SubscriptionProduct.subscriptionTargetKey] then
			IsSubscribed = SubscriptionStatuses[SubscriptionProduct.subscriptionTargetKey].isSubscribed
		end
		table.insert(List, {
			subscriptionProduct = SubscriptionProduct,
			thumbnailString = Url,
			screenSize = ScreenSize,
			isSubscribed = IsSubscribed,
			creatorName = CreatorName,
			creatorVerified = CreatorVerified
		})
	end
	return List
end

return function(p2)
	-- upvalues: UseScreenSizeFunction (copy), ReactModule (copy), getTiles (copy), UseSelectorFunction (copy), UseDesignTokensFunction (copy), FFlagEnableDevSubsFastFollowFixes (copy), FFlagRenameDeprecatedUIBloxTokens (copy), DefaultMetricsGridView (copy), SubscriptionTileModule (copy), GetFFlagEnableDevSubsInRobuxModule (copy), GridMetrics (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local CreatorName = p2.creatorName
	local CreatorVerified = p2.creatorVerified
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p3)
		-- upvalues: getTiles (upval), p2 (copy), UseScreenSizeResult (copy), CreatorName (copy), CreatorVerified (copy)
		return (getTiles(p3, p2.universeId, UseScreenSizeResult, CreatorName, CreatorVerified))
	end, {
		p2.universeId,
		UseScreenSizeResult,
		CreatorName,
		CreatorVerified
	})))
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Size400 = if FFlagEnableDevSubsFastFollowFixes then if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_400 else UseDesignTokensResult.Global.Space_200 elseif FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_600 else UseDesignTokensResult.Global.Space_300
	
	return ReactModule.createElement(DefaultMetricsGridView, {
		renderItem = function(p3)
			-- upvalues: ReactModule (upval), SubscriptionTileModule (upval)
			return ReactModule.createElement(SubscriptionTileModule, p3)
		end,
		getItemHeight = function(): number
			-- upvalues: GetFFlagEnableDevSubsInRobuxModule (upval)
			return if GetFFlagEnableDevSubsInRobuxModule() then 136 else 224
		end,
		getItemMetrics = GridMetrics.getLargeMetrics,
		itemPadding = Vector2.new(Size400, Size400),
		items = UseSelectorResult,
		LayoutOrder = p2.layoutOrder
	})
end