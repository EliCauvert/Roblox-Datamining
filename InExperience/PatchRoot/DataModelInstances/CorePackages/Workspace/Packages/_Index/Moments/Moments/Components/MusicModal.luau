local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local songbirdModule = require(parent.Songbird)
local iconButton = foundationModule.IconButton
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local useLocalization = localizationModule.Hooks.useLocalization
local sendAudioPlayerAnalytics = songbirdModule.Analytics.sendAudioPlayerAnalytics
local analyticActions = songbirdModule.Analytics.AnalyticActions
local musicThumbnailIcon = momentsCommonModule.Components.MusicThumbnailIcon
local musicThumbnailIconSize = momentsCommonModule.Enums.MusicThumbnailIconSize
local fFlagMomentsAudioSaveButtonModule = require(moments.Flags.FFlagMomentsAudioSaveButton)
local fFlagMomentsAudioSaveSongbirdAnalyticsModule = require(moments.Flags.FFlagMomentsAudioSaveSongbirdAnalytics)
local _ = require(moments.Hooks.useMusicInfo)
local t = { title = "Feature.Moments.Label.Music" }

local function SaveButtonWithAnalytics(p1)
	-- upvalues: reactModule (ref), sendAudioPlayerAnalytics (ref), analyticActions (ref), iconButton (ref), builderIconsModule (ref), foundationModule (ref)
	local var1, var2 = reactModule.useState(false)
	
	return reactModule.createElement(iconButton, {
		LayoutOrder = 3,
		testId = "MomentsMusicSaveButton",
		icon = {
			name = builderIconsModule.Icon.Bookmark,
			variant = if var1 then builderIconsModule.IconVariant.Filled else builderIconsModule.IconVariant.Regular
		},
		onActivated = reactModule.useCallback(function()
			-- upvalues: sendAudioPlayerAnalytics (copy), var1 (ref), analyticActions (copy), p1 (ref), var2 (ref)
			sendAudioPlayerAnalytics({
				thumbnailId = "-1",
				source = "moments",
				action = if var1 then analyticActions.Unlike else analyticActions.Like,
				songId = tostring(p1.assetId)
			})
			var2(not var1)
		end, { var1, p1.assetId }),
		size = foundationModule.Enums.InputSize.Medium
	})
end

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), sheet (ref), text (ref), view (ref), musicThumbnailIcon (ref), musicThumbnailIconSize (ref), fFlagMomentsAudioSaveButtonModule (ref), fFlagMomentsAudioSaveSongbirdAnalyticsModule (ref), SaveButtonWithAnalytics (ref), iconButton (ref), builderIconsModule (ref), foundationModule (ref)
	local musicInfo = p1.musicInfo
	
	return reactModule.createElement(sheet.Root, {
		isOpen = true,
		preferCenterSheet = true,
		onClose = p1.onClose
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
				}),
				SaveButton = if fFlagMomentsAudioSaveButtonModule and fFlagMomentsAudioSaveSongbirdAnalyticsModule then reactModule.createElement(SaveButtonWithAnalytics, { assetId = musicInfo.AssetId }) elseif fFlagMomentsAudioSaveButtonModule then reactModule.createElement(iconButton, {
					LayoutOrder = 3,
					testId = "MomentsMusicSaveButton",
					icon = builderIconsModule.Icon.Bookmark,
					onActivated = function() end,
					size = foundationModule.Enums.InputSize.Medium
				}) else nil
			})
		})
	})
end