local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local _ = require(Modules.AvatarExperience.Common.Types)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local _ = require(Modules.AvatarExperience.AvatarSwitcher.AvatarTile.useAvatarTileProps)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogItemCard = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard
local ItemCardThumbnail = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local FFlagAXSlotAvatarThumbnailPromptFix = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotAvatarThumbnailPromptFix
local FFlagAXAvatarTileOutfitThumbnailUrlBuilderModule = require(Modules.AvatarExperience.Flags.FFlagAXAvatarTileOutfitThumbnailUrlBuilder)
local FFlagAXAvatarTileNoDefaultOutfitInfoModule = require(Modules.AvatarExperience.Flags.FFlagAXAvatarTileNoDefaultOutfitInfo)
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXEnableModeratedItemsFlowForDurables = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables

local function _(p1, p2): string
	-- upvalues: GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), FFlagAXSlotAvatarThumbnailPromptFix (copy)
	return `{GetRbxthumbWithTypeSizeAndOptionsFunction(p1, Constants.RbxthumbTypes.Outfit, 150)}&filters={if FFlagAXSlotAvatarThumbnailPromptFix then p2 else 0}`
end

local function selectDeviceOrientation(p3)
	return p3.DeviceOrientation
end

return ReactModule.forwardRef(function(p3, Ref)
	-- upvalues: UseTokensFunction (copy), UseSelectorFunction (copy), selectDeviceOrientation (copy), ResponsiveModule (copy), FFlagAXAvatarTileOutfitThumbnailUrlBuilderModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), FFlagAXSlotAvatarThumbnailPromptFix (copy), ReactModule (copy), CatalogItemCard (copy), RoactGamepadModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ItemCardThumbnail (copy), FFlagAXAvatarTileNoDefaultOutfitInfoModule (copy), ConstantsModule (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUseSelectorResultMatch = UseSelectorFunction(selectDeviceOrientation) == ResponsiveModule.Keys.Portrait
	local FiltersName = nil
	
	if FFlagAXAvatarTileOutfitThumbnailUrlBuilderModule then
		local OutfitUpdateCounter = p3.outfitUpdateCounter
		FiltersName = `{GetRbxthumbWithTypeSizeAndOptionsFunction(p3.itemId, Constants.RbxthumbTypes.Outfit, 150)}&filters={if FFlagAXSlotAvatarThumbnailPromptFix then OutfitUpdateCounter else 0}`
	else
		FiltersName = if FFlagAXSlotAvatarThumbnailPromptFix then `rbxthumb://type=Outfit&id={p3.itemId}&w={150}&h={150}&filters={p3.outfitUpdateCounter}` else `rbxthumb://type=Outfit&id={p3.itemId}&w={150}&h={150}&filters=0`
	end
	return ReactModule.createElement(CatalogItemCard, {
		onActivated = p3.onActivated,
		presentationSlot = ReactModule.createElement(RoactGamepadModule.Focusable.Frame, {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1)
		}, {
			CornerRadius = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Radius.Medium else UseTokensResult.Semantic.Radius.Medium)
			}),
			AvatarTileThumbnail = ReactModule.createElement(ItemCardThumbnail, { url = FiltersName })
		}),
		title = if FFlagAXAvatarTileNoDefaultOutfitInfoModule then p3.item and p3.item.name else p3.item.name,
		titleTextSize = if IsUseSelectorResultMatch then UseTokensResult.Typography.BodySmall else nil,
		isSelected = p3.isSelected,
		Size = UDim2.fromOffset(p3.itemWidth, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = Ref,
		headerAspectRatio = if p3.squareAspectRatio then ConstantsModule.ItemTileSquareAspectRatio else ConstantsModule.ItemTileTallAspectRatio,
		LayoutOrder = p3.index,
		tag = p3.impressionsTag,
		itemStatus = if FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables then p3.itemStatus else nil
	})
end)