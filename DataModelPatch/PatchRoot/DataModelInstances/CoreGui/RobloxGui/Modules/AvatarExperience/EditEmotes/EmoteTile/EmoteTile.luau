local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local CatalogItemCard = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard
local ItemCardThumbnail = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.EditEmotes.EmoteTile.useEmoteTileProps)

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), CatalogItemCard (copy), RoactGamepadModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ItemCardThumbnail (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(CatalogItemCard, {
		onActivated = p1.onActivated,
		presentationSlot = ReactModule.createElement(RoactGamepadModule.Focusable.Frame, {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1)
		}, {
			CornerRadius = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Radius.Medium else UseTokensResult.Semantic.Radius.Medium)
			}),
			EmoteTileThumbnail = ReactModule.createElement(ItemCardThumbnail, {
				url = `rbxthumb://type=Asset&id={p1.itemId}&w=150&h=150&filters=0`
			})
		}),
		title = p1.item.name,
		isSelected = p1.isSelected,
		Size = UDim2.fromOffset(p1.itemWidth, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = Ref,
		LayoutOrder = p1.index,
		tag = p1.impressionsTag,
		gridInformation = p1.gridInformation
	})
end)