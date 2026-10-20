local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local TModule = require(CorePackages.Packages.t)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local CryoModule = require(CorePackages.Packages.Cryo)
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local ItemTile = UIBloxModule.Tile.ItemTile
local ItemTileEnums = UIBloxModule.Tile.ItemTileEnums
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Colors = UIBloxModule.App.Style.Colors
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local SetEquippedInTryOnManagerThunkModule = require(Modules.AvatarExperience.Common.Thunks.SetEquippedInTryOnManagerThunk)
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local SetTryOnManagerPeekViewStateFunction = AvatarExperienceRoduxModule.Actions.SetTryOnManagerPeekViewState
local SetSelectedTimedOptionFunction = AvatarExperienceRoduxModule.Actions.SetSelectedTimedOption
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local _ = require(Modules.AvatarExperience.Common.Types)
local VerifiedBadgesModule = require(CorePackages.Workspace.Packages.VerifiedBadges)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local WearTimeSelectedOptionInList = require(CorePackages.Workspace.Packages.AvatarExperienceTimedOptions).WearTimeSelectedOptionInList
local FlexLayout = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.FlexLayout
local IconsCommonRobux = Images["icons/common/robux"]
local IconsStatusErrorLarge = Images["icons/status/error_large"]
local LookDetailsTryOnElement = RoactModule.PureComponent:extend("LookDetailsTryOnElement")
LookDetailsTryOnElement.validateProps = TModule.strictInterface({
	tryOnItem = TModule.optional(TModule.table),
	itemInfo = TModule.table,
	layoutOrder = TModule.optional(TModule.number),
	allowAutomaticPeekViewStateChanges = TModule.optional(TModule.boolean),
	elementRef = TModule.optional(TModule.table),
	horizontalPadding = TModule.optional(TModule.number),
	disableInteractions = TModule.optional(TModule.boolean),
	forceShowPrice = TModule.optional(TModule.boolean),
	tokens = TModule.any,
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	playerMembership = TModule.optional(TModule.enum(Enum.MembershipType)),
	setEquippedInTryOnManager = TModule.callback,
	setTryOnManagerPeekViewState = TModule.optional(TModule.callback),
	setSelectedTimedOption = TModule.callback,
	networking = TModule.callback,
	appAnalytics = TModule.table,
	catalogAnalytics = TModule.table,
	localization = TModule.table,
	navigation = TModule.table
})

function LookDetailsTryOnElement.init(p1)
	-- upvalues: UtilsModule (copy), PeekViewState (copy)
	function p1.onTileActivated()
		-- upvalues: p1 (copy), UtilsModule (upval), PeekViewState (upval)
		local TryOnItem = p1.props.tryOnItem
		
		if not TryOnItem then return end
		if not UtilsModule.isItemSelectable(p1.props.itemInfo) or p1.props.disableInteractions then return end
		p1.props.setEquippedInTryOnManager(TryOnItem.itemId, not TryOnItem.selectedInTryOnManager, p1.props.catalogAnalytics, TryOnItem.itemType)
		
		if p1.props.allowAutomaticPeekViewStateChanges then
			p1.props.setTryOnManagerPeekViewState(PeekViewState.Brief)
		end
	end
end

function LookDetailsTryOnElement.getItemIconType(p1)
	-- upvalues: ConstantsModule (copy), ItemTileEnums (copy)
	local TryOnItem = p1.props.tryOnItem
	
	return if TryOnItem.itemType == ConstantsModule.ItemType.Bundle then if TryOnItem.itemSubType == ConstantsModule.BundleTypeIdStrings.DynamicHead then ItemTileEnums.ItemIconType.DynamicHead else nil else TryOnItem.itemType == ConstantsModule.ItemType.Bundle and ItemTileEnums.ItemIconType.Bundle or nil
end

function LookDetailsTryOnElement.getItemInfo(p1, ItemInfo, p2)
	-- upvalues: NumberLocalization (copy)
	local PriceInRobux = ItemInfo.priceInRobux or nil
	
	if p1.props.tryOnItem.selectedTimedOptionIndex and ItemInfo.timedOptions then
		local TimedOption = ItemInfo.timedOptions[p1.props.tryOnItem.selectedTimedOptionIndex]
		
		if TimedOption then
			PriceInRobux = TimedOption.price
		end
	end
	local IsQuantityOwnedAbove = ItemInfo.quantityOwned > 0
	local NoPriceStatus = ItemInfo.noPriceStatus
	local Flag = false
	local FreeText = ""
	local Flag1 = true
	local OffSaleText = nil
	local LocalizeResult = nil
	
	if IsQuantityOwnedAbove and not p1.props.forceShowPrice then
		FreeText = p2.ownedText
	elseif PriceInRobux == 0 then
		FreeText = p2.freeText
	elseif PriceInRobux == nil then
		OffSaleText = p2.offSaleText
		Flag1 = false
	else
		FreeText = NumberLocalization.localize(string.format("%.0f", PriceInRobux), p1.props.localization:GetLocale())
		Flag = true
	end
	if NoPriceStatus then
		if NoPriceStatus == "OffSale" then
			OffSaleText = p2.offSaleText
			Flag1 = false
		elseif NoPriceStatus == "NoResellers" then
			OffSaleText = p2.noResellersText
			Flag1 = false
		elseif NoPriceStatus == "InExperience" then
			OffSaleText = p2.inExperienceText
		elseif NoPriceStatus == "Unavailable" then
			OffSaleText = p2.contentDeletedText
			Flag1 = false
		end
	end
	if IsQuantityOwnedAbove and NoPriceStatus ~= "Unavailable" then
		Flag1 = true
	end
	if ItemInfo.discountInformation and not IsQuantityOwnedAbove then
		local OriginalPrice = ItemInfo.discountInformation.originalPrice
		
		if p1.props.tryOnItem.selectedTimedOptionIndex and ItemInfo.timedOptions then
			local TimedOption = ItemInfo.timedOptions[p1.props.tryOnItem.selectedTimedOptionIndex]
			
			if TimedOption and TimedOption.discountInformation then
				OriginalPrice = TimedOption.discountInformation.originalPrice
			elseif TimedOption and not TimedOption.discountInformation and TimedOption.days ~= 0 then
				OriginalPrice = nil
			end
		end
		LocalizeResult = if OriginalPrice then NumberLocalization.localize(string.format("%.0f", OriginalPrice), p1.props.localization:GetLocale()) else nil
	end
	return FreeText, Flag, OffSaleText, Flag1, LocalizeResult
end

function LookDetailsTryOnElement.renderElement(p1, p2, p3, HorizontalPadding)
	-- upvalues: ConstantsModule (copy), GetIconRichTextFunction (copy), FoundationModule (copy), CatalogUtilsModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), UtilsModule (copy), RoactModule (copy), ItemTile (copy), ImageSetLabel (copy), IconsStatusErrorLarge (copy), Colors (copy), FFlagRenameDeprecatedUIBloxTokens (copy), FlexLayout (copy), VerifiedBadgesModule (copy), View (copy), WearTimeSelectedOptionInList (copy), IconsCommonRobux (copy)
	local TryOnItem = p1.props.tryOnItem
	local Theme = p2.Theme
	local _Font = p2.Font
	local FontSize350 = p1.props.tokens.FontSize.FontSize_350
	local FontSize300 = p1.props.tokens.FontSize.FontSize_300
	local IsItemTypeMatch = TryOnItem.itemType == ConstantsModule.ItemType.Bundle
	local ItemInfo = p1.props.itemInfo
	local ItemInfo1, ItemInfo2, ItemInfo3, ItemInfo4, ItemInfo5 = p1:getItemInfo(ItemInfo, p3)
	local Name = ItemInfo.name
	local Creator = ItemInfo.creator
	local ItemRestrictionsMap = ItemInfo.itemRestrictionsMap
	local Text = if ItemInfo5 then `{GetIconRichTextFunction(FoundationModule.Enums.IconName.Robux)} {ItemInfo5}` else nil
	local Count = 0
	
	if IsItemTypeMatch then
		for _, _ in TryOnItem.bundleInfo do
			Count += 1
		end
	end
	local RbxThumbType = TryOnItem.itemType and CatalogUtilsModule.GetRbxThumbType(TryOnItem.itemType) or nil
	local IsItemSelectable = UtilsModule.isItemSelectable(ItemInfo)
	local FeatureCatalogLabelUsingBundleParts = p1.props.localization:Format("Feature.Catalog.Label.UsingBundleParts", { count = Count })
	local Size1800: number = p1.props.tokens.Size.Size_1800
	local XLarge = p1.props.tokens.Padding.XLarge
	local Size500 = p1.props.tokens.Size.Size_500
	local Size800 = p1.props.tokens.Size.Size_800
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, XLarge)
		}),
		TryOnManagerTileFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(Size1800, Size1800)
		}, {
			TryOnManagerTile = RoactModule.createElement(ItemTile, {
				titleTextLineCount = 0,
				itemIconType = p1:getItemIconType(),
				restrictionTypes = ItemRestrictionsMap,
				Selectable = IsItemSelectable,
				isSelected = if IsItemSelectable then TryOnItem.selectedInTryOnManager else nil,
				onActivated = p1.onTileActivated,
				thumbnail = if TryOnItem.itemId and RbxThumbType then GetRbxthumbWithTypeSizeAndOptionsFunction(TryOnItem.itemId, RbxThumbType, 150) else nil
			}),
			TryOnManagerTileAlertFrame = if IsItemSelectable then nil else RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundColor3 = Theme.Overlay.Color,
				BackgroundTransparency = Theme.Overlay.Transparency,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 10) }),
				TryOnManagerTileAlert = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = IconsStatusErrorLarge,
					ImageColor3 = Colors.White,
					ImageTransparency = Theme.IconEmphasis.Transparency,
					Size = UDim2.fromOffset(Size800, Size800),
					Position = UDim2.new(0.5, 0, 0.5, 0)
				})
			})
		}),
		TryOnInfoFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0 - Size1800 - XLarge - XLarge + HorizontalPadding, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Size.Size_100 else p2.Tokens.Global.Space_50)
			}),
			TopTextRow = RoactModule.createElement(FlexLayout, {
				flexSlot = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					UIListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Size.Size_250 else p2.Tokens.Global.Space_125)
					}),
					ItemName = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						TextSize = FontSize350,
						Font = _Font.Header1.Font,
						TextColor3 = p1.props.tokens.Color.Content.Emphasis.Color3,
						TextTransparency = p1.props.tokens.Color.Content.Emphasis.Transparency,
						TextTruncate = Enum.TextTruncate.AtEnd,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						Text = Name
					}),
					VerifiedCreatorName = if Creator and Creator.hasVerifiedBadge == true and Creator.name then RoactModule.createElement(VerifiedBadgesModule.EmojiWrapper, {
						layoutOrder = 2,
						emoji = VerifiedBadgesModule.emoji.verified,
						font = _Font.SubHeader1.Font,
						anchorPoint = Vector2.new(1, 0),
						position = UDim2.new(1, 0, 0, 0),
						size = UDim2.new(1, 0, 0, 0),
						automaticSize = Enum.AutomaticSize.Y,
						verticalAlignment = Enum.VerticalAlignment.Center
					}, {
						TextLabel = RoactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							Font = _Font.SubHeader1.Font,
							Size = UDim2.new(0, 0, 1, 0),
							Text = Creator.name,
							TextColor3 = p1.props.tokens.Color.Content.Emphasis.Color3,
							TextSize = FontSize300,
							TextTruncate = Enum.TextTruncate.AtEnd,
							AutomaticSize = Enum.AutomaticSize.XY
						})
					}) else nil,
					UnverifiedCreatorName = if Creator and Creator.hasVerifiedBadge ~= true and Creator.name then RoactModule.createElement("TextLabel", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						TextWrapped = true,
						AnchorPoint = Vector2.new(1, 0),
						AutomaticSize = Enum.AutomaticSize.XY,
						Position = UDim2.new(1, 0, 0, 0),
						Size = UDim2.new(1, 0, 0, 0),
						Font = _Font.SubHeader1.Font,
						TextColor3 = p1.props.tokens.Color.Content.Emphasis.Color3,
						TextTransparency = p1.props.tokens.Color.Content.Emphasis.Transparency,
						TextSize = FontSize300,
						Text = Creator.name,
						TextTruncate = Enum.TextTruncate.AtEnd,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					}) else nil,
					HorizontalContainer = RoactModule.createElement("Frame", {
						LayoutOrder = 3,
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.XY,
						Size = UDim2.new(0, 0, 0, 0)
					}, {
						UIListLayout = RoactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, p1.props.tokens.Padding.Small),
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							VerticalAlignment = Enum.VerticalAlignment.Center
						}),
						WearTimeOptions = if p1.props.itemInfo.timedOptions then RoactModule.createElement(View, { tag = "auto-xy", LayoutOrder = 1 }, {
							WearTimeSelectedOptionInList = RoactModule.createElement(WearTimeSelectedOptionInList, {
								options = p1.props.itemInfo.timedOptions,
								onOptionActivated = function(p4)
									-- upvalues: p1 (copy)
									for i, timedOption in ipairs(p1.props.itemInfo.timedOptions) do
										timedOption.selected = i == p4
									end
									p1.props.setSelectedTimedOption(p1.props.tryOnItem.itemId, p4, p1.props.tryOnItem.itemType)
								end
							})
						}) else nil,
						BundleParts = if Count > 0 then RoactModule.createElement("Frame", {
							LayoutOrder = 2,
							BorderSizePixel = 0,
							AutomaticSize = Enum.AutomaticSize.XY,
							Transparency = p1.props.tokens.Color.Shift.Shift_200.Transparency,
							BackgroundColor3 = p1.props.tokens.Color.Shift.Shift_200.Color3,
							Size = UDim2.new(0, 0, 0, 0)
						}, {
							UICorner = RoactModule.createElement("UICorner", {
								CornerRadius = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Size.Size_250 else p2.Tokens.Global.Size_125)
							}),
							UIPadding = RoactModule.createElement("UIPadding", {
								PaddingTop = UDim.new(0, p1.props.tokens.Padding.Small),
								PaddingLeft = UDim.new(0, p1.props.tokens.Padding.Medium),
								PaddingRight = UDim.new(0, p1.props.tokens.Padding.Medium),
								PaddingBottom = UDim.new(0, p1.props.tokens.Padding.Small)
							}),
							BundlePartsText2 = RoactModule.createElement("TextLabel", {
								BackgroundTransparency = 1,
								TextWrapped = true,
								AnchorPoint = Vector2.new(0, 0),
								AutomaticSize = Enum.AutomaticSize.XY,
								Position = UDim2.new(0, 0, 0, 0),
								Size = UDim2.new(0, 0, 0, 0),
								Font = _Font.SubHeader1.Font,
								TextColor3 = p1.props.tokens.Color.Content.Emphasis.Color3,
								TextTransparency = p1.props.tokens.Color.Content.Emphasis.Transparency,
								TextSize = FontSize300,
								Text = FeatureCatalogLabelUsingBundleParts,
								TextTruncate = Enum.TextTruncate.AtEnd,
								TextXAlignment = Enum.TextXAlignment.Left,
								TextYAlignment = Enum.TextYAlignment.Center
							})
						}) else nil
					}),
					PriceStatusText = if ItemInfo3 then RoactModule.createElement("TextLabel", {
						LayoutOrder = 4,
						BackgroundTransparency = 1,
						TextWrapped = true,
						AnchorPoint = Vector2.new(1, 0),
						AutomaticSize = Enum.AutomaticSize.XY,
						Position = UDim2.new(1, 0, 0, 0),
						Size = UDim2.new(1, 0, 0, 0),
						Font = _Font.SubHeader1.Font,
						TextColor3 = p1.props.tokens.Color.Content.Muted.Color3,
						TextTransparency = p1.props.tokens.Color.Content.Muted.Transparency,
						TextSize = FontSize350,
						Text = ItemInfo3,
						TextTruncate = Enum.TextTruncate.AtEnd,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center
					}) else nil
				}),
				rigidSlot = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(0, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Bottom,
						Padding = UDim.new(0, 6)
					}),
					Icon = ItemInfo2 and ItemInfo4 and RoactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Image = IconsCommonRobux,
						ImageTransparency = p1.props.tokens.Color.Content.Muted.Transparency,
						ImageColor3 = p1.props.tokens.Color.Content.Muted.Color3,
						Size = UDim2.fromOffset(Size500, Size500)
					}) or nil,
					Price = ItemInfo4 and RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(0, -Size500 - HorizontalPadding, 0, Size500),
						Text = ItemInfo1,
						TextSize = FontSize350,
						Font = _Font.Header1.Font,
						TextColor3 = p1.props.tokens.Color.Content.Muted.Color3,
						TextTransparency = p1.props.tokens.Color.Content.Muted.Transparency,
						TextTruncate = Enum.TextTruncate.AtEnd,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						AutomaticSize = Enum.AutomaticSize.X
					}) or nil,
					OriginalPrice = ItemInfo4 and Text and RoactModule.createElement("TextLabel", {
						RichText = true,
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(0, -Size500 - HorizontalPadding, 0, Size500),
						Text = "<s>" .. Text .. "</s>",
						TextSize = FontSize300,
						Font = _Font.SubHeader1.Font,
						TextColor3 = p1.props.tokens.Color.Content.Muted.Color3,
						TextTransparency = p1.props.tokens.Color.Content.Muted.Transparency,
						TextTruncate = Enum.TextTruncate.AtEnd,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						AutomaticSize = Enum.AutomaticSize.X
					}) or nil
				})
			})
		})
	})
end

function LookDetailsTryOnElement.renderWithProviders(p4, p5, p6)
	-- upvalues: RoactModule (copy), Focusable (copy)
	local HorizontalPadding = p4.props.horizontalPadding or 0
	
	return RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p4.props.layoutOrder,
		ref = p4.props.elementRef,
		NextSelectionDown = p4.props.NextSelectionDown,
		NextSelectionUp = p4.props.NextSelectionUp
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, p4.props.tokens.Padding.Medium)
		}),
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, HorizontalPadding),
			PaddingRight = UDim.new(0, HorizontalPadding)
		}),
		LookDetailsTryOnElement = p4:renderElement(p5, p6, HorizontalPadding)
	})
end

function LookDetailsTryOnElement.render(p4)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy)
	return WithStyleFunction(function(p5)
		-- upvalues: WithLocalizationFunction (upval), p4 (copy)
		return WithLocalizationFunction({
			noResellersText = "Feature.Catalog.LabelNoResellers",
			inExperienceTest = "Feature.Catalog.Label.InSingleExperience",
			inExperienceText = "Feature.Catalog.Label.InSingleExperience",
			offSaleText = "Feature.Catalog.LabelOffSale",
			freeText = "Feature.Catalog.LabelFree",
			ownedText = "Feature.Catalog.Label.Owned",
			contentDeletedText = "Feature.Catalog.LabelContentDeleted"
		})(function(p6)
			-- upvalues: p4 (upval), p5 (copy)
			return p4:renderWithProviders(p5, p6)
		end)
	end)
end

local v1 = RoactRoduxModule.connect(function(p4, _)
	local LocalUserId = p4.LocalUserId
	
	return {
		playerMembership = p4.Users[LocalUserId] and p4.Users[LocalUserId].membership or Enum.MembershipType.None
	}
end, function(Callback)
	-- upvalues: SetEquippedInTryOnManagerThunkModule (copy), AvatarScreen (copy), SetTryOnManagerPeekViewStateFunction (copy), SetSelectedTimedOptionFunction (copy)
	return {
		setEquippedInTryOnManager = function(p4, p5, p6, p7)
			-- upvalues: Callback (copy), SetEquippedInTryOnManagerThunkModule (upval), AvatarScreen (upval)
			return Callback(SetEquippedInTryOnManagerThunkModule(p4, p5, p6, p7, AvatarScreen.LookDetails))
		end,
		setTryOnManagerPeekViewState = function(p4)
			-- upvalues: Callback (copy), SetTryOnManagerPeekViewStateFunction (upval)
			Callback(SetTryOnManagerPeekViewStateFunction(p4))
		end,
		setSelectedTimedOption = function(p4, p5, p6)
			-- upvalues: Callback (copy), SetSelectedTimedOptionFunction (upval)
			Callback(SetSelectedTimedOptionFunction(p4, p5, p6))
		end
	}
end)((WithNavigationFunction((RoactServices.connect({
	appAnalytics = RoactAnalyticsModule,
	catalogAnalytics = AnalyticsModule,
	networking = RoactNetworkingModule,
	localization = RoactLocalizationModule
})(LookDetailsTryOnElement)))))

return function(p4)
	-- upvalues: UseTokensFunction (copy), RoactModule (copy), v1 (ref), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join({ tokens = UseTokensFunction() }, p4))
end