local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local useLocalization = localizationModule.Hooks.useLocalization
local musicThumbnailIcon = momentsCommonModule.Components.MusicThumbnailIcon
local musicThumbnailIconSize = momentsCommonModule.Enums.MusicThumbnailIconSize
local _ = require(moments.Hooks.useMusicInfo)
local t = { title = "Feature.Moments.Label.Music" }

return function(p0)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), sheet (ref), text (ref), view (ref), musicThumbnailIcon (ref), musicThumbnailIconSize (ref)
	local musicInfo = p0.musicInfo
	
	return reactModule.createElement(sheet.Root, {
		isOpen = true,
		preferCenterSheet = true,
		onClose = p0.onClose
	}, {
		Header = reactModule.createElement(sheet.Header, nil, {
			Title = reactModule.createElement(text, {
				tag = "auto-xy text-heading-small content-emphasis",
				Text = useLocalization(t).title
			})
		}),
		Content = reactModule.createElement(sheet.Content, nil, {
			MusicInfoContainer = reactModule.createElement(view, {
				tag = "row align-y-center gap-medium size-full-0 auto-y padding-bottom-large"
			}, {
				MusicThumbnail = reactModule.createElement(musicThumbnailIcon, {
					assetId = musicInfo.AssetId,
					size = musicThumbnailIconSize.Large
				}),
				MusicInfo = reactModule.createElement(view, {
					tag = "col shrink gap-xsmall size-full-0 auto-y",
					LayoutOrder = 2
				}, {
					Title = reactModule.createElement(text, {
						tag = "auto-xy text-title-medium text-align-x-left text-align-y-top text-truncate-end content-emphasis",
						LayoutOrder = 1,
						Text = musicInfo.Title or ""
					}),
					Artist = if musicInfo.Artist then reactModule.createElement(text, {
						tag = "auto-xy text-body-small text-align-x-left text-align-y-top text-truncate-end content-neutral",
						LayoutOrder = 2,
						Text = musicInfo.Artist
					}) else nil
				})
			})
		})
	})
end