local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local MusicThumbnailIcon = MomentsCommonModule.Components.MusicThumbnailIcon
local MusicThumbnailIconSize = MomentsCommonModule.Enums.MusicThumbnailIconSize
local _ = require(Moments.Hooks.useMusicInfo)
local config = { title = "Feature.Moments.Label.Music" }

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), Sheet (copy), Text (copy), View (copy), MusicThumbnailIcon (copy), MusicThumbnailIconSize (copy)
	local MusicInfo = p1.musicInfo
	
	return ReactModule.createElement(Sheet.Root, {
		isOpen = true,
		preferCenterSheet = true,
		onClose = p1.onClose
	}, {
		Header = ReactModule.createElement(Sheet.Header, nil, {
			Title = ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-small content-emphasis",
				Text = UseLocalizationFunction(config).title
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			MusicInfoContainer = ReactModule.createElement(View, {
				tag = "row align-y-center gap-medium size-full-0 auto-y padding-bottom-large"
			}, {
				MusicThumbnail = ReactModule.createElement(MusicThumbnailIcon, {
					assetId = MusicInfo.AssetId,
					size = MusicThumbnailIconSize.Large
				}),
				MusicInfo = ReactModule.createElement(View, {
					tag = "col shrink gap-xsmall size-full-0 auto-y",
					LayoutOrder = 2
				}, {
					Title = ReactModule.createElement(Text, {
						tag = "auto-xy text-title-medium text-align-x-left text-align-y-top text-truncate-end content-emphasis",
						LayoutOrder = 1,
						Text = MusicInfo.Title or ""
					}),
					Artist = if MusicInfo.Artist then ReactModule.createElement(Text, {
						tag = "auto-xy text-body-small text-align-x-left text-align-y-top text-truncate-end content-neutral",
						LayoutOrder = 2,
						Text = MusicInfo.Artist
					}) else nil
				})
			})
		})
	})
end