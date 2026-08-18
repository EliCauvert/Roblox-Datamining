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

return function(p0) --[[ line: 52 | named "CombinedCarouselsContent" ]]
	-- upvalues: useEditProfileImageActions (ref), useLocalization (ref), textKeysModule (ref), getAssetPickerStatusModule (ref), reactModule (ref), shopMoreCarouselTileModule (ref), scrollSectionModule (ref), view (ref), assetPickerCarouselModule (ref), iconName (ref)
	local var9 = useEditProfileImageActions()
	local var10 = useLocalization({
		emotes = textKeysModule.Emotes,
		frames = textKeysModule.Frames,
		shopForMore = textKeysModule.ShopForMore
	})
	local var11 = getAssetPickerStatusModule(p0.emotesLoading, p0.emotesError)
	
	return reactModule.createElement(scrollSectionModule, {
		pinHeader = false,
		layoutOrder = p0.layoutOrder,
		useInternalScroll = p0.useInternalScroll
	}, {
		Sections = reactModule.createElement(view, { tag = "col gap-xsmall size-full-0 auto-y" }, {
			Emotes = reactModule.createElement(assetPickerCarouselModule, {
				layoutOrder = 1,
				title = var10.emotes,
				status = var11,
				onRetry = p0.onRetryEmotes,
				items = p0.emoteItems,
				selectedId = p0.selectedEmoteId,
				onSelect = p0.onSelectEmote,
				onDetailsActivated = var9.onOpenEmoteDetails,
				onTitleActivated = p0.onExpandEmotes,
				trailingCarouselComponent = if var11 == "ready" then reactModule.createElement(shopMoreCarouselTileModule, {
					label = var10.shopForMore,
					tileSize = p0.tileSize,
					layoutOrder = #p0.emoteItems + 1,
					onActivated = var9.onShopForMoreEmotes
				}) else nil,
				tileSize = p0.tileSize
			}),
			Frames = if p0.showFrames then reactModule.createElement(assetPickerCarouselModule, {
				layoutOrder = 2,
				title = var10.frames,
				titleLeadingIconName = iconName.RobloxPlus,
				status = getAssetPickerStatusModule(p0.framesLoading, p0.framesError),
				onRetry = p0.onRetryFrames,
				bannerComponent = p0.framesBannerComponent,
				items = p0.frameItems,
				selectedId = p0.selectedFrameId,
				onSelect = p0.onSelectFrame,
				onTitleActivated = p0.onExpandFrames,
				tileSize = p0.tileSize
			}) else nil
		})
	})
end