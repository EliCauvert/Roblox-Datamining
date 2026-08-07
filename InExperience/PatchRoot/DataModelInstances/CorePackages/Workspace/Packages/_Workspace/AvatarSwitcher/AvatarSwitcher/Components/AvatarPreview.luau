local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local sendAXCounterV2 = require(parent.AvatarExperienceAnalytics).sendAXCounterV2
local outfitViewportModule = require(avatarSwitcher.Components.OutfitViewport.OutfitViewport)
local constantsModule = require(avatarSwitcher.Constants)
local avatarSwitcher3DPreview = game:DefineFastFlag("AvatarSwitcher3DPreview", false)
local fFlagAvatarSwitcherAccurateAvatarWarning = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning
local fFlagAvatarSwitcherWarningLayoutFix = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherWarningLayoutFix
local fFlagAvatarSwitcherCounters = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherCounters
local fFlagAXBackgroundsInOutfitThumbnails = require(parent.SharedFlags).FFlagAXBackgroundsInOutfitThumbnails
local t = {
	AVATAR = foundationCloudAssetsModule.Assets["pictograms/avatar"],
	AVATAR_ISSUE = foundationCloudAssetsModule.Assets["pictograms/avatar_issue"]
}

return function(p0) --[[ line: 46 | named "AvatarPreview" ]]
	-- upvalues: reactModule (ref), useLocalization (ref), useTokens (ref), foundationModule (ref), t (ref), avatarSwitcher3DPreview (ref), outfitViewportModule (ref), fFlagAvatarSwitcherCounters (ref), sendAXCounterV2 (ref), constantsModule (ref), fFlagAvatarSwitcherAccurateAvatarWarning (ref), fFlagAvatarSwitcherWarningLayoutFix (ref), fFlagAXBackgroundsInOutfitThumbnails (ref)
	local var8, var9 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 48 ]]
		-- upvalues: var9 (ref)
		var9(false)
	end, { p0.outfitId })
	local var10 = useLocalization({
		selectAvatar = "Feature.AvatarSwitcher.Message.SelectAvatar",
		unkownSupportHeader = "Feature.AvatarSwitcher.Heading.UnknownSupport",
		unkownSupportContent = "Feature.AvatarSwitcher.Message.UnknownSupport",
		partiallyUnsupported = "Feature.AvatarSwitcher.Message.PartiallyUnsupported"
	})
	local var11 = useTokens()
	
	return if p0.outfitId == nil then reactModule.createElement(foundationModule.View, {
		tag = "size-full col align-x-center align-y-center",
		padding = {
			bottom = UDim.new(0, p0.messageBottomPadding or var11.Padding.Medium)
		}
	}, {
		Image = reactModule.createElement(foundationModule.Image, {
			LayoutOrder = 1,
			Image = t.AVATAR.assetId,
			Size = UDim2.fromOffset(t.AVATAR.size.X / 3, t.AVATAR.size.Y / 3)
		}),
		Text = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-title-medium",
			LayoutOrder = 2,
			Text = var10.selectAvatar
		})
	}) elseif p0.showAvatarSupportWarning then reactModule.createElement(foundationModule.View, {
		tag = "size-full",
		padding = {
			bottom = UDim.new(0, p0.messageBottomPadding or var11.Padding.Medium)
		}
	}, {
		ScrollView = reactModule.createElement(foundationModule.ScrollView, {
			tag = "size-full",
			scroll = {
				CanvasSize = UDim2.fromScale(0, 1),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility.None
			}
		}, {
			ScrollingContent = reactModule.createElement(foundationModule.View, { tag = "size-full col align-x-center align-y-center" }, {
				Image = reactModule.createElement(foundationModule.Image, {
					LayoutOrder = 1,
					Image = t.AVATAR_ISSUE.assetId,
					Size = UDim2.fromOffset(t.AVATAR_ISSUE.size.X / 3, t.AVATAR_ISSUE.size.Y / 3)
				}),
				Header = reactModule.createElement(foundationModule.Text, {
					tag = "auto-y size-full-0 text-title-medium text-wrap padding-bottom-small",
					LayoutOrder = 2,
					Text = var10.unkownSupportHeader
				}),
				Content = reactModule.createElement(foundationModule.Text, {
					tag = "auto-y size-full-0 text-body-small text-wrap",
					LayoutOrder = 3,
					Text = var10.unkownSupportContent
				})
			})
		})
	}) elseif avatarSwitcher3DPreview and not var8 then reactModule.createElement(foundationModule.View, { tag = "size-full col" }, {
		OutfitViewportContainer = reactModule.createElement(foundationModule.View, { tag = "size-full-0 grow", LayoutOrder = 1 }, {
			OutfitViewport = reactModule.createElement(outfitViewportModule, {
				outfitId = p0.outfitId,
				rigType = p0.rigType,
				onLoadingFailed = function() --[[ line: 131 ]]
					-- upvalues: fFlagAvatarSwitcherCounters (copy), sendAXCounterV2 (copy), constantsModule (copy), var9 (ref)
					if fFlagAvatarSwitcherCounters then
						sendAXCounterV2(constantsModule.Counters.AvatarPreviewLoadFailed)
					end
					var9(true)
				end,
				onLoaded = if fFlagAvatarSwitcherAccurateAvatarWarning then p0.onAvatarPreviewLoaded else nil
			})
		}),
		CompatibilityWarningContainer = not fFlagAvatarSwitcherWarningLayoutFix and (p0.showAvatarTypeCompatibilityWarning and reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y padding-y-medium",
			LayoutOrder = 2
		}, {
			InfoIcon = reactModule.createElement(foundationModule.Image, {
				Image = "icons/actions/info",
				LayoutOrder = 1,
				Size = UDim2.fromOffset(var11.Size.Size_500, var11.Size.Size_500)
			}),
			CompatibilityWarning = reactModule.createElement(foundationModule.Text, {
				tag = "auto-y position-top-right anchor-top-right text-caption-small text-wrap text-align-x-left padding-top-xsmall",
				LayoutOrder = 2,
				Size = UDim2.new(1, (-var11.Size.Size_500) - var11.Gap.Small, 0, 0),
				Text = var10.partiallyUnsupported
			})
		}))
	}) else reactModule.createElement(foundationModule.Image, {
		tag = "size-full",
		Image = if fFlagAXBackgroundsInOutfitThumbnails then `rbxthumb://type=Outfit&id={p0.outfitId}&w=420&h=420&includeBackground=true` else `rbxthumb://type=Outfit&id={p0.outfitId}&w=420&h=420`,
		ScaleType = p0.imageScaleType
	}, {})
end