local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ScrollSectionModule = require(AvatarExperienceProfilePictureEditor.Components.ScrollSection)
local SectionHeaderModule = require(AvatarExperienceProfilePictureEditor.Components.SectionTitle.SectionHeader)
local AssetPickerGridModule = require(AvatarExperienceProfilePictureEditor.Components.AssetPicker.AssetPickerGrid)
local VirtualizedFeedContainerModule = require(AvatarExperienceProfilePictureEditor.Components.AssetPicker.VirtualizedFeedContainer)
local GetAssetPickerStatusModule = require(AvatarExperienceProfilePictureEditor.Utils.getAssetPickerStatus)
local TextKeysModule = require(AvatarExperienceProfilePictureEditor.Common.TextKeys)
local UseEditProfileImageActionsFunction = require(AvatarExperienceProfilePictureEditor.Context.EditProfileImageActionsContext).useEditProfileImageActions

return function(p1) --[[ Line: 50 | Named "ExpandedEmotesGridContent" ]]
	-- upvalues: UseTokensFunction (copy), UseEditProfileImageActionsFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), GetAssetPickerStatusModule (copy), View (copy), SectionHeaderModule (copy), ScrollSectionModule (copy), AssetPickerGridModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy), FillBehavior (copy), VirtualizedFeedContainerModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseEditProfileImageActionsResult = UseEditProfileImageActionsFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		emotes = TextKeysModule.Emotes,
		details = TextKeysModule.DetailsButton,
		recommendations = TextKeysModule.Recommendations,
		shopForMore = TextKeysModule.ShopForMore
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 59 ]]
		-- upvalues: UseLocalizationResult (copy)
		return { details = UseLocalizationResult.details }
	end, { UseLocalizationResult.details })
	local AssetPickerStatusModule = GetAssetPickerStatusModule(p1.emotesLoading, p1.emotesError)
	local IsNotReady = AssetPickerStatusModule ~= "ready" or p1.useInternalScroll
	local Element = ReactModule.createElement(View, {
		tag = {
			["auto-xy padding-x-xlarge"] = IsNotReady,
			["auto-xy padding-x-xlarge padding-bottom-medium"] = not IsNotReady
		}
	}, {
		Title = ReactModule.createElement(SectionHeaderModule, {
			title = UseLocalizationResult.emotes,
			onBack = p1.onTitleBack
		})
	})
	
	return if AssetPickerStatusModule == "ready" then ReactModule.createElement(View, {
		tag = {
			["col grow gap-medium size-full-0 padding-top-xlarge"] = IsNotReady,
			["col grow size-full-0 padding-top-xlarge"] = not IsNotReady
		},
		LayoutOrder = p1.layoutOrder
	}, {
		Header = if IsNotReady then Element else nil,
		FeedContainer = ReactModule.createElement(View, {
			tag = "grow size-full-0",
			LayoutOrder = if IsNotReady then 2 else 1
		}, {
			Feed = ReactModule.createElement(VirtualizedFeedContainerModule, {
				items = p1.ownedEmoteItems,
				selectedId = p1.selectedEmoteId,
				onSelect = p1.onSelectEmote,
				onDetailsActivated = UseEditProfileImageActionsResult.onOpenEmoteDetails,
				labels = UseMemoResult,
				minTileSize = p1.tileSize,
				initialContainerWidth = p1.containerWidth,
				gap = UseTokensResult.Gap.Medium,
				horizontalPadding = UseTokensResult.Padding.XLarge,
				strokeInset = UseTokensResult.Padding.XSmall,
				onMoreItems = p1.onMoreEmotes,
				hasMoreItems = p1.hasMoreEmotes,
				isLoadingMore = p1.isLoadingMoreEmotes,
				hasLoadMoreError = p1.hasLoadMoreEmotesError,
				onRetryLoadMore = p1.onMoreEmotes,
				listHeaderComponent = if IsNotReady then nil else Element,
				listFooterComponent = if p1.hasMoreEmotes or p1.isLoadingMoreEmotes or p1.hasLoadMoreEmotesError then nil else ReactModule.createElement(View, { tag = "col size-full-0 auto-y padding-top-xlarge" }, {
					Recommendations = ReactModule.createElement(AssetPickerGridModule, {
						layoutOrder = 2,
						title = UseLocalizationResult.recommendations,
						items = p1.recommendedEmoteItems,
						selectedId = p1.selectedEmoteId,
						onSelect = p1.onSelectEmote,
						onDetailsActivated = UseEditProfileImageActionsResult.onOpenEmoteDetails,
						footerComponent = ReactModule.createElement(Button, {
							text = UseLocalizationResult.shopForMore,
							variant = ButtonVariant.Standard,
							size = InputSize.Medium,
							fillBehavior = FillBehavior.Fill,
							onActivated = UseEditProfileImageActionsResult.onShopForMoreEmotes
						}),
						tileSize = p1.tileSize,
						containerWidth = p1.containerWidth
					})
				})
			})
		})
	}) else ReactModule.createElement(ScrollSectionModule, {
		pinHeader = true,
		useInternalScroll = true,
		layoutOrder = p1.layoutOrder,
		header = Element
	}, {
		OwnedEmotes = ReactModule.createElement(AssetPickerGridModule, {
			layoutOrder = 1,
			status = AssetPickerStatusModule,
			items = p1.ownedEmoteItems,
			onRetry = p1.onRetryEmotes,
			selectedId = p1.selectedEmoteId,
			onSelect = p1.onSelectEmote,
			onDetailsActivated = UseEditProfileImageActionsResult.onOpenEmoteDetails,
			tileSize = p1.tileSize,
			containerWidth = p1.containerWidth
		})
	})
end