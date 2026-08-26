local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local view = foundationModule.View
local divider = foundationModule.Divider
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local useLocalization = localizationModule.Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local scrollSectionModule = require(avatarExperienceProfilePictureEditor.Components.ScrollSection)
local sectionHeaderModule = require(avatarExperienceProfilePictureEditor.Components.SectionTitle.SectionHeader)
local assetPickerGridModule = require(avatarExperienceProfilePictureEditor.Components.AssetPicker.AssetPickerGrid)
local assetPickerVirtualizedFeedContainerModule = require(avatarExperienceProfilePictureEditor.Components.AssetPicker.AssetPickerVirtualizedFeedContainer)
local getAssetPickerStatusModule = require(avatarExperienceProfilePictureEditor.Utils.getAssetPickerStatus)
local textKeysModule = require(avatarExperienceProfilePictureEditor.Common.TextKeys)
local useEditProfileImageActions = require(avatarExperienceProfilePictureEditor.Context.EditProfileImageActionsContext).useEditProfileImageActions

return function(p1)
	-- upvalues: useTokens (ref), useEditProfileImageActions (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), getAssetPickerStatusModule (ref), view (ref), sectionHeaderModule (ref), scrollSectionModule (ref), assetPickerGridModule (ref), divider (ref), button (ref), buttonVariant (ref), inputSize (ref), fillBehavior (ref), assetPickerVirtualizedFeedContainerModule (ref)
	local var1 = useTokens()
	local var2 = useEditProfileImageActions()
	local var3 = useLocalization({
		emotes = textKeysModule.Emotes,
		details = textKeysModule.DetailsButton,
		recommendations = textKeysModule.Recommendations,
		shopForMore = textKeysModule.ShopForMore
	})
	local var4 = reactModule.useMemo(function()
		-- upvalues: var3 (ref)
		return { details = var3.details }
	end, { var3.details })
	local var5 = getAssetPickerStatusModule(p1.emotesLoading, p1.emotesError)
	local var6 = if var5 == "ready" then p1.useInternalScroll else true
	local var7 = reactModule.createElement(view, {
		tag = {
			["auto-xy padding-x-xlarge"] = var6,
			["auto-xy padding-x-xlarge padding-bottom-medium"] = not var6
		}
	}, {
		Title = reactModule.createElement(sectionHeaderModule, { title = var3.emotes, onBack = p1.onTitleBack })
	})
	
	return if var5 == "ready" then reactModule.createElement(view, {
		tag = {
			["col grow gap-medium size-full-0 padding-top-xlarge"] = var6,
			["col grow size-full-0 padding-top-xlarge"] = not var6
		},
		LayoutOrder = p1.layoutOrder
	}, {
		Header = if var6 then var7 else nil,
		Feed = reactModule.createElement(assetPickerVirtualizedFeedContainerModule, {
			items = p1.ownedEmoteItems,
			selectedId = p1.selectedEmoteId,
			onSelect = p1.onSelectEmote,
			onDetailsActivated = var2.onOpenEmoteDetails,
			labels = var4,
			minTileSize = p1.tileSize,
			initialContainerWidth = p1.containerWidth,
			gap = var1.Gap.Medium,
			horizontalPadding = var1.Padding.XLarge,
			strokeInset = var1.Padding.XSmall,
			onMoreItems = p1.onMoreEmotes,
			hasMoreItems = p1.hasMoreEmotes,
			isLoadingMore = p1.isLoadingMoreEmotes,
			hasLoadMoreError = p1.hasLoadMoreEmotesError,
			onRetryLoadMore = p1.onMoreEmotes,
			listHeaderComponent = if var6 then nil else var7,
			listFooterComponent = if not (p1.hasMoreEmotes or p1.isLoadingMoreEmotes or p1.hasLoadMoreEmotesError) then reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, {
				Divider = reactModule.createElement(view, {
					tag = "size-full-0 auto-y padding-x-xlarge padding-y-xlarge",
					LayoutOrder = 1
				}, {
					Line = reactModule.createElement(divider, { Size = UDim2.new(1, 0, 0, 1) })
				}),
				Recommendations = reactModule.createElement(assetPickerGridModule, {
					layoutOrder = 2,
					title = var3.recommendations,
					items = p1.recommendedEmoteItems,
					selectedId = p1.selectedEmoteId,
					onSelect = p1.onSelectEmote,
					onDetailsActivated = var2.onOpenEmoteDetails,
					footerComponent = reactModule.createElement(button, {
						text = var3.shopForMore,
						variant = buttonVariant.Standard,
						size = inputSize.Medium,
						fillBehavior = fillBehavior.Fill,
						onActivated = var2.onShopForMoreEmotes
					}),
					tileSize = p1.tileSize,
					containerWidth = p1.containerWidth
				})
			}) else nil,
			LayoutOrder = if var6 then 2 else 1
		})
	}) else reactModule.createElement(scrollSectionModule, {
		pinHeader = true,
		useInternalScroll = true,
		layoutOrder = p1.layoutOrder,
		header = var7
	}, {
		OwnedEmotes = reactModule.createElement(assetPickerGridModule, {
			layoutOrder = 1,
			status = var5,
			items = p1.ownedEmoteItems,
			onRetry = p1.onRetryEmotes,
			selectedId = p1.selectedEmoteId,
			onSelect = p1.onSelectEmote,
			onDetailsActivated = var2.onOpenEmoteDetails,
			tileSize = p1.tileSize,
			containerWidth = p1.containerWidth
		})
	})
end