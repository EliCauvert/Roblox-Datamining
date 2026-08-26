local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local useLocalization = localizationModule.Hooks.useLocalization
local scrollSectionModule = require(avatarExperienceProfilePictureEditor.Components.ScrollSection)
local assetPickerCarouselModule = require(avatarExperienceProfilePictureEditor.Components.AssetPicker.AssetPickerCarousel)
local _ = require(avatarExperienceProfilePictureEditor.Components.AssetPicker.AssetPickerTile)
local shopMoreCarouselTileModule = require(avatarExperienceProfilePictureEditor.Components.AssetPicker.ShopMoreCarouselTile)
local getAssetPickerStatusModule = require(avatarExperienceProfilePictureEditor.Utils.getAssetPickerStatus)
local textKeysModule = require(avatarExperienceProfilePictureEditor.Common.TextKeys)
local useEditProfileImageActions = require(avatarExperienceProfilePictureEditor.Context.EditProfileImageActionsContext).useEditProfileImageActions

return function(p1)
	-- upvalues: useEditProfileImageActions (ref), useLocalization (ref), textKeysModule (ref), getAssetPickerStatusModule (ref), reactModule (ref), shopMoreCarouselTileModule (ref), scrollSectionModule (ref), view (ref), assetPickerCarouselModule (ref), iconName (ref)
	local var1 = useEditProfileImageActions()
	local var2 = useLocalization({
		emotes = textKeysModule.Emotes,
		frames = textKeysModule.Frames,
		shopForMore = textKeysModule.ShopForMore
	})
	local var3 = getAssetPickerStatusModule(p1.emotesLoading, p1.emotesError)
	
	return reactModule.createElement(scrollSectionModule, {
		pinHeader = false,
		layoutOrder = p1.layoutOrder,
		useInternalScroll = p1.useInternalScroll
	}, {
		Sections = reactModule.createElement(view, { tag = "col gap-xsmall size-full-0 auto-y" }, {
			Emotes = reactModule.createElement(assetPickerCarouselModule, {
				layoutOrder = 1,
				title = var2.emotes,
				status = var3,
				onRetry = p1.onRetryEmotes,
				items = p1.emoteItems,
				selectedId = p1.selectedEmoteId,
				onSelect = p1.onSelectEmote,
				onDetailsActivated = var1.onOpenEmoteDetails,
				onTitleActivated = p1.onExpandEmotes,
				trailingCarouselComponent = if var3 == "ready" then reactModule.createElement(shopMoreCarouselTileModule, {
					label = var2.shopForMore,
					tileSize = p1.tileSize,
					layoutOrder = #p1.emoteItems + 1,
					onActivated = var1.onShopForMoreEmotes
				}) else nil,
				tileSize = p1.tileSize
			}),
			Frames = if p1.showFrames then reactModule.createElement(assetPickerCarouselModule, {
				layoutOrder = 2,
				title = var2.frames,
				titleLeadingIconName = iconName.RobloxPlus,
				status = getAssetPickerStatusModule(p1.framesLoading, p1.framesError),
				onRetry = p1.onRetryFrames,
				bannerComponent = p1.framesBannerComponent,
				items = p1.frameItems,
				selectedId = p1.selectedFrameId,
				onSelect = p1.onSelectFrame,
				onTitleActivated = p1.onExpandFrames,
				tileSize = p1.tileSize
			}) else nil
		})
	})
end