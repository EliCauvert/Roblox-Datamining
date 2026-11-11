local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FetchSellPageDataModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchSellPageData)
local FetchCollectibleResellableInstancesModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Interactable = UIBloxModule.Core.Control.Interactable
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local GetFFlagL2ControllerSupportModule = require(Modules.AvatarExperience.Flags.GetFFlagL2ControllerSupport)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local config = {
	[ControlState.Default] = "BackgroundUIDefault",
	[ControlState.Hover] = "BackgroundOnHover",
	[ControlState.Pressed] = "BackgroundOnPress"
}
local config1 = { onActivated = function() end }

return (ReactModule.forwardRef(function(p1, p2)
	-- upvalues: CryoModule (copy), config1 (copy), UseStyleFunction (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), ReactModule (copy), ControlState (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), FetchCollectibleResellableInstancesModule (copy), FetchSellPageDataModule (copy), config (copy), UseLocalizationFunction (copy), UseSelectionCursorFunction (copy), CursorKind (copy), Focusable (copy), Interactable (copy), GetFFlagL2ControllerSupportModule (copy), ImageSetLabel (copy), Images (copy)
	local JoinResult = CryoModule.Dictionary.join(config1, p1)
	local UseStyleResult = UseStyleFunction()
	local UseDispatchResult = UseDispatchFunction()
	local CollectibleItemId = JoinResult.collectibleItemId
	local UseSelectorResult = UseSelectorFunction(function(p3)
		-- upvalues: CollectibleItemId (copy), JoinResult (ref)
		if not CollectibleItemId then
			local AvailableToSellAsset = p3.AvatarExperience.Catalog.Sell.AvailableToSellAssets[JoinResult.itemId]
			local CurrentlySellingAsset = p3.AvatarExperience.Catalog.Sell.CurrentlySellingAssets[JoinResult.itemId]
			
			return if AvailableToSellAsset and CurrentlySellingAsset then #AvailableToSellAsset + #CurrentlySellingAsset else nil
		end
		local CollectiblesResellableInstance = p3.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[CollectibleItemId]
		
		if not CollectiblesResellableInstance then
			return nil
		end
		local Count = 0
		
		for _, _ in CollectiblesResellableInstance do
			Count += 1
		end
		return Count
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1 = UseSelectorFunction(function(p4)
		return p4.LocalUserId
	end, GetUseSelectorDeepEqualsFunction())
	local UseStateResult, UseStateResult2 = ReactModule.useState(ControlState.Initialize)
	local UseResult = ReactModule.useCallback(function(_, p4)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p4)
	end)
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	ReactModule.useEffect(function()
		-- upvalues: UseRoactServiceModuleResult (copy), CollectibleItemId (copy), UseDispatchResult (copy), FetchCollectibleResellableInstancesModule (upval), UseSelectorResult1 (copy), FetchSellPageDataModule (upval), JoinResult (ref)
		if not UseRoactServiceModuleResult then return end
		if CollectibleItemId then
			UseDispatchResult(FetchCollectibleResellableInstancesModule(UseRoactServiceModuleResult, CollectibleItemId, UseSelectorResult1))
			
			return
		else
			UseDispatchResult(FetchSellPageDataModule(UseRoactServiceModuleResult, JoinResult.itemId, UseSelectorResult1))
		end
	end, { JoinResult.itemId, UseSelectorResult1, CollectibleItemId })
	local ThemeEntry = UseStyleResult.Theme[config[UseStateResult] or config[ControlState.Default]]
	local UseLocalizationResult = UseLocalizationFunction({
		itemOwned = {
			"Feature.Catalog.Label.ItemOwnedCount",
			itemCount = UseSelectorResult or 0
		}
	})
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.RoundedRect)
	
	return ReactModule.createElement(Focusable[Interactable], {
		Size = JoinResult.size,
		AutomaticSize = JoinResult.automaticSize,
		BackgroundColor3 = ThemeEntry.Color,
		BackgroundTransparency = ThemeEntry.Transparency,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		LayoutOrder = JoinResult.layoutOrder,
		onStateChanged = UseResult,
		ref = if GetFFlagL2ControllerSupportModule() then p2 else nil,
		SelectionImageObject = if GetFFlagL2ControllerSupportModule() then UseSelectionCursorResult else nil,
		NextSelectionUp = if GetFFlagL2ControllerSupportModule() then JoinResult.NextSelectionUp else nil,
		NextSelectionDown = if GetFFlagL2ControllerSupportModule() then JoinResult.NextSelectionDown else nil,
		NextSelectionLeft = if GetFFlagL2ControllerSupportModule() then JoinResult.NextSelectionLeft else nil,
		NextSelectionRight = if GetFFlagL2ControllerSupportModule() then JoinResult.NextSelectionRight else nil,
		[ReactModule.Event.Activated] = JoinResult.onActivated
	}, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 14),
			PaddingRight = UDim.new(0, 14),
			PaddingTop = UDim.new(0, 14),
			PaddingBottom = UDim.new(0, 14)
		}),
		ItemOwnedLabelContainer = ReactModule.createElement("Frame", { BorderSizePixel = 0, Size = UDim2.fromScale(0, 1) }, {
			Layout = ReactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, 6),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Horizontal
			}),
			OwnedIcon = ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Size = UDim2.fromOffset(16, 16),
				Image = Images["icons/status/item/owned"],
				ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color
			}),
			ItemOwnedLabel = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = UseLocalizationResult.itemOwned,
				Font = UseStyleResult.Font.Body.Font,
				TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Body.RelativeSize,
				TextColor3 = UseStyleResult.Theme.TextDefault.Color
			})
		}),
		ItemCountLabelContainer = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.fromScale(0, 1),
			Position = UDim2.fromScale(1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, 6),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				FillDirection = Enum.FillDirection.Horizontal
			}),
			ArrowIcon = ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.fromOffset(16, 16),
				Image = Images["icons/navigation/pushRight_small"],
				ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color
			})
		})
	})
end))