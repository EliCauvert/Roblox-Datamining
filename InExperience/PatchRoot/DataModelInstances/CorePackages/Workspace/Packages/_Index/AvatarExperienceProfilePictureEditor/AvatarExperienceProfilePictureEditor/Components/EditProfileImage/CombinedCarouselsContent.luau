local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ScrollSectionModule = require(AvatarExperienceProfilePictureEditor.Components.ScrollSection)
local AssetPickerCarouselModule = require(AvatarExperienceProfilePictureEditor.Components.AssetPicker.AssetPickerCarousel)
local _ = require(AvatarExperienceProfilePictureEditor.Components.AssetPicker.AssetPickerTile)
local ShopMoreCarouselTileModule = require(AvatarExperienceProfilePictureEditor.Components.AssetPicker.ShopMoreCarouselTile)
local GetAssetPickerStatusModule = require(AvatarExperienceProfilePictureEditor.Utils.getAssetPickerStatus)
local TextKeysModule = require(AvatarExperienceProfilePictureEditor.Common.TextKeys)
local UseEditProfileImageActionsFunction = require(AvatarExperienceProfilePictureEditor.Context.EditProfileImageActionsContext).useEditProfileImageActions

return function(p1)
	-- upvalues: UseEditProfileImageActionsFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), GetAssetPickerStatusModule (copy), ReactModule (copy), ShopMoreCarouselTileModule (copy), ScrollSectionModule (copy), View (copy), AssetPickerCarouselModule (copy), IconName (copy)
	local UseEditProfileImageActionsResult = UseEditProfileImageActionsFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		emotes = TextKeysModule.Emotes,
		frames = TextKeysModule.Frames,
		shopForMore = TextKeysModule.ShopForMore
	})
	local AssetPickerStatusModule = GetAssetPickerStatusModule(p1.emotesLoading, p1.emotesError)
	local ShowFrames = p1.showFrames
	
	return ReactModule.createElement(ScrollSectionModule, {
		pinHeader = false,
		layoutOrder = p1.layoutOrder,
		useInternalScroll = p1.useInternalScroll
	}, {
		Sections = ReactModule.createElement(View, { tag = "col gap-xsmall size-full-0 auto-y" }, {
			Emotes = ReactModule.createElement(AssetPickerCarouselModule, {
				layoutOrder = 1,
				title = UseLocalizationResult.emotes,
				status = AssetPickerStatusModule,
				onRetry = p1.onRetryEmotes,
				items = p1.emoteItems,
				selectedId = p1.selectedEmoteId,
				onSelect = p1.onSelectEmote,
				onDetailsActivated = UseEditProfileImageActionsResult.onOpenEmoteDetails,
				onTitleActivated = p1.onExpandEmotes,
				trailingCarouselComponent = if AssetPickerStatusModule == "ready" then ReactModule.createElement(ShopMoreCarouselTileModule, {
					label = UseLocalizationResult.shopForMore,
					tileSize = p1.tileSize,
					layoutOrder = #p1.emoteItems + 1,
					onActivated = UseEditProfileImageActionsResult.onShopForMoreEmotes
				}) else nil,
				tileSize = p1.tileSize
			}),
			Frames = if ShowFrames then ReactModule.createElement(AssetPickerCarouselModule, {
				layoutOrder = 2,
				title = UseLocalizationResult.frames,
				titleLeadingIconName = IconName.RobloxPlus,
				status = GetAssetPickerStatusModule(p1.framesLoading, p1.framesError),
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