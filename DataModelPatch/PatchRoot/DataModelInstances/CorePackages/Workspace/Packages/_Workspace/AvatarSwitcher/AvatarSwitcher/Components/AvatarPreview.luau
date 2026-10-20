local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local Parent = AvatarSwitcher.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FoundationCloudAssetsModule = require(Parent.FoundationCloudAssets)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SendAXCounterV2Function = require(Parent.AvatarExperienceAnalytics).sendAXCounterV2
local OutfitViewportModule = require(AvatarSwitcher.Components.OutfitViewport.OutfitViewport)
local ConstantsModule = require(AvatarSwitcher.Constants)
local AvatarSwitcher3DPreview = game:DefineFastFlag("AvatarSwitcher3DPreview", false)
local FFlagAvatarSwitcherAccurateAvatarWarning = require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning
local FFlagAvatarSwitcherWarningLayoutFix = require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherWarningLayoutFix
local FFlagAvatarSwitcherCounters = require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherCounters
local FFlagAXBackgroundsInOutfitThumbnails = require(Parent.SharedFlags).FFlagAXBackgroundsInOutfitThumbnails
local config = {
	AVATAR = FoundationCloudAssetsModule.Assets["pictograms/avatar"],
	AVATAR_ISSUE = FoundationCloudAssetsModule.Assets["pictograms/avatar_issue"]
}

return function(p1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), UseTokensFunction (copy), FoundationModule (copy), config (copy), AvatarSwitcher3DPreview (copy), OutfitViewportModule (copy), FFlagAvatarSwitcherCounters (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), FFlagAvatarSwitcherAccurateAvatarWarning (copy), FFlagAvatarSwitcherWarningLayoutFix (copy), FFlagAXBackgroundsInOutfitThumbnails (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, { p1.outfitId })
	local UseLocalizationResult = UseLocalizationFunction({
		selectAvatar = "Feature.AvatarSwitcher.Message.SelectAvatar",
		unkownSupportHeader = "Feature.AvatarSwitcher.Heading.UnknownSupport",
		unkownSupportContent = "Feature.AvatarSwitcher.Message.UnknownSupport",
		partiallyUnsupported = "Feature.AvatarSwitcher.Message.PartiallyUnsupported"
	})
	local UseTokensResult = UseTokensFunction()
	
	return if p1.outfitId == nil then ReactModule.createElement(FoundationModule.View, {
		tag = "size-full col align-x-center align-y-center",
		padding = {
			bottom = UDim.new(0, p1.messageBottomPadding or UseTokensResult.Padding.Medium)
		}
	}, {
		Image = ReactModule.createElement(FoundationModule.Image, {
			LayoutOrder = 1,
			Image = config.AVATAR.assetId,
			Size = UDim2.fromOffset(config.AVATAR.size.X / 3, config.AVATAR.size.Y / 3)
		}),
		Text = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-title-medium",
			LayoutOrder = 2,
			Text = UseLocalizationResult.selectAvatar
		})
	}) elseif p1.showAvatarSupportWarning then ReactModule.createElement(FoundationModule.View, {
		tag = "size-full",
		padding = {
			bottom = UDim.new(0, p1.messageBottomPadding or UseTokensResult.Padding.Medium)
		}
	}, {
		ScrollView = ReactModule.createElement(FoundationModule.ScrollView, {
			tag = "size-full",
			scroll = {
				CanvasSize = UDim2.fromScale(0, 1),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				scrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility.None
			}
		}, {
			ScrollingContent = ReactModule.createElement(FoundationModule.View, { tag = "size-full col align-x-center align-y-center" }, {
				Image = ReactModule.createElement(FoundationModule.Image, {
					LayoutOrder = 1,
					Image = config.AVATAR_ISSUE.assetId,
					Size = UDim2.fromOffset(config.AVATAR_ISSUE.size.X / 3, config.AVATAR_ISSUE.size.Y / 3)
				}),
				Header = ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-y size-full-0 text-title-medium text-wrap padding-bottom-small",
					LayoutOrder = 2,
					Text = UseLocalizationResult.unkownSupportHeader
				}),
				Content = ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-y size-full-0 text-body-small text-wrap",
					LayoutOrder = 3,
					Text = UseLocalizationResult.unkownSupportContent
				})
			})
		})
	}) elseif AvatarSwitcher3DPreview and not UseStateResult then ReactModule.createElement(FoundationModule.View, { tag = "size-full col" }, {
		OutfitViewportContainer = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 grow", LayoutOrder = 1 }, {
			OutfitViewport = ReactModule.createElement(OutfitViewportModule, {
				outfitId = p1.outfitId,
				rigType = p1.rigType,
				onLoadingFailed = function()
					-- upvalues: FFlagAvatarSwitcherCounters (upval), SendAXCounterV2Function (upval), ConstantsModule (upval), UseStateResult2 (copy)
					if FFlagAvatarSwitcherCounters then
						SendAXCounterV2Function(ConstantsModule.Counters.AvatarPreviewLoadFailed)
					end
					UseStateResult2(true)
				end,
				onLoaded = if FFlagAvatarSwitcherAccurateAvatarWarning then p1.onAvatarPreviewLoaded else nil
			})
		}),
		CompatibilityWarningContainer = not FFlagAvatarSwitcherWarningLayoutFix and (p1.showAvatarTypeCompatibilityWarning and ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y padding-y-medium",
			LayoutOrder = 2
		}, {
			InfoIcon = ReactModule.createElement(FoundationModule.Image, {
				Image = "icons/actions/info",
				LayoutOrder = 1,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_500, UseTokensResult.Size.Size_500)
			}),
			CompatibilityWarning = ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-y position-top-right anchor-top-right text-caption-small text-wrap text-align-x-left padding-top-xsmall",
				LayoutOrder = 2,
				Size = UDim2.new(1, -UseTokensResult.Size.Size_500 - UseTokensResult.Gap.Small, 0, 0),
				Text = UseLocalizationResult.partiallyUnsupported
			})
		}))
	}) else ReactModule.createElement(FoundationModule.Image, {
		tag = "size-full",
		Image = if FFlagAXBackgroundsInOutfitThumbnails then `rbxthumb://type=Outfit&id={p1.outfitId}&w=420&h=420&includeBackground=true` else `rbxthumb://type=Outfit&id={p1.outfitId}&w=420&h=420`,
		ScaleType = p1.imageScaleType
	}, {})
end