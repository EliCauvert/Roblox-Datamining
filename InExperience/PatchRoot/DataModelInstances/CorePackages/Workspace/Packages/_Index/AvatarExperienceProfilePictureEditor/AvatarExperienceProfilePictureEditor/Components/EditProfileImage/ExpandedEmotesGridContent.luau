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
local assetPickerVirtualizedFeedContainerModule = require(avatarExperienceProfilePictureEditor.Components.AssetPicker.AssetPickerVirtualizedFeed.AssetPickerVirtualizedFeedContainer)
local getAssetPickerStatusModule = require(avatarExperienceProfilePictureEditor.Utils.getAssetPickerStatus)
local textKeysModule = require(avatarExperienceProfilePictureEditor.Common.TextKeys)
local useEditProfileImageActions = require(avatarExperienceProfilePictureEditor.Context.EditProfileImageActionsContext).useEditProfileImageActions

return function(p0) --[[ line: 52 | named "ExpandedEmotesGridContent" ]]
	-- upvalues: useTokens (ref), useEditProfileImageActions (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), getAssetPickerStatusModule (ref), view (ref), sectionHeaderModule (ref), scrollSectionModule (ref), assetPickerGridModule (ref), divider (ref), button (ref), buttonVariant (ref), inputSize (ref), fillBehavior (ref), assetPickerVirtualizedFeedContainerModule (ref)
	local var10 = useTokens()
	local var11 = useEditProfileImageActions()
	local var12 = useLocalization({
		emotes = textKeysModule.Emotes,
		details = textKeysModule.DetailsButton,
		recommendations = textKeysModule.Recommendations,
		shopForMore = textKeysModule.ShopForMore
	})
	local var13 = reactModule.useMemo(function() --[[ line: 61 ]]
		-- upvalues: var12 (ref)
		return { details = var12.details }
	end, { var12.details })
	local var14 = getAssetPickerStatusModule(p0.emotesLoading, p0.emotesError)
	local var15 = if var14 == "ready" then p0.useInternalScroll else true
	local var16 = reactModule.createElement(view, {
		tag = {
			["auto-xy padding-x-xlarge"] = var15,
			["auto-xy padding-x-xlarge padding-bottom-medium"] = not var15
		}
	}, {
		Title = reactModule.createElement(sectionHeaderModule, { title = var12.emotes, onBack = p0.onTitleBack })
	})
	
	return if var14 == "ready" then reactModule.createElement(view, {
		tag = {
			["col grow gap-medium size-full-0 padding-top-xlarge"] = var15,
			["col grow size-full-0 padding-top-xlarge"] = not var15
		},
		LayoutOrder = p0.layoutOrder
	}, {
		Header = if var15 then var16 else nil,
		Feed = reactModule.createElement(assetPickerVirtualizedFeedContainerModule, {
			items = p0.ownedEmoteItems,
			selectedId = p0.selectedEmoteId,
			onSelect = p0.onSelectEmote,
			onDetailsActivated = var11.onOpenEmoteDetails,
			labels = var13,
			minTileSize = p0.tileSize,
			initialContainerWidth = p0.containerWidth,
			gap = var10.Gap.Medium,
			horizontalPadding = var10.Padding.XLarge,
			strokeInset = var10.Padding.XSmall,
			onMoreItems = p0.onMoreEmotes,
			hasMoreItems = p0.hasMoreEmotes,
			isLoadingMore = p0.isLoadingMoreEmotes,
			hasLoadMoreError = p0.hasLoadMoreEmotesError,
			onRetryLoadMore = p0.onMoreEmotes,
			listHeaderComponent = if var15 then nil else var16,
			listFooterComponent = if not (p0.hasMoreEmotes or p0.isLoadingMoreEmotes or p0.hasLoadMoreEmotesError) then reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, {
				Divider = reactModule.createElement(view, {
					tag = "size-full-0 auto-y padding-x-xlarge padding-y-xlarge",
					LayoutOrder = 1
				}, {
					Line = reactModule.createElement(divider, { Size = UDim2.new(1, 0, 0, 1) })
				}),
				Recommendations = reactModule.createElement(assetPickerGridModule, {
					layoutOrder = 2,
					title = var12.recommendations,
					items = p0.recommendedEmoteItems,
					selectedId = p0.selectedEmoteId,
					onSelect = p0.onSelectEmote,
					onDetailsActivated = var11.onOpenEmoteDetails,
					footerComponent = reactModule.createElement(button, {
						text = var12.shopForMore,
						variant = buttonVariant.Standard,
						size = inputSize.Medium,
						fillBehavior = fillBehavior.Fill,
						onActivated = var11.onShopForMoreEmotes
					}),
					tileSize = p0.tileSize,
					containerWidth = p0.containerWidth
				})
			}) else nil,
			LayoutOrder = if var15 then 2 else 1
		})
	}) else reactModule.createElement(scrollSectionModule, {
		pinHeader = true,
		useInternalScroll = true,
		layoutOrder = p0.layoutOrder,
		header = var16
	}, {
		OwnedEmotes = reactModule.createElement(assetPickerGridModule, {
			layoutOrder = 1,
			status = var14,
			items = p0.ownedEmoteItems,
			onRetry = p0.onRetryEmotes,
			selectedId = p0.selectedEmoteId,
			onSelect = p0.onSelectEmote,
			onDetailsActivated = var11.onOpenEmoteDetails,
			tileSize = p0.tileSize,
			containerWidth = p0.containerWidth
		})
	})
end