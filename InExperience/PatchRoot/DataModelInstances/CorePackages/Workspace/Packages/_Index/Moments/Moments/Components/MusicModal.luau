local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SongbirdModule = require(Parent.Songbird)
local IconButton = FoundationModule.IconButton
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SendAudioPlayerAnalyticsFunction = SongbirdModule.Analytics.sendAudioPlayerAnalytics
local AnalyticActions = SongbirdModule.Analytics.AnalyticActions
local MusicThumbnailIcon = MomentsCommonModule.Components.MusicThumbnailIcon
local MusicThumbnailIconSize = MomentsCommonModule.Enums.MusicThumbnailIconSize
local FFlagMomentsAudioSaveButton = MomentsCommonModule.Flags.FFlagMomentsAudioSaveButton
local FFlagMomentsAudioSaveSongbirdAnalyticsModule = require(Moments.Flags.FFlagMomentsAudioSaveSongbirdAnalytics)
local _ = require(Moments.Hooks.useMusicInfo)
local config = { title = "Feature.Moments.Label.Music" }

local function SaveButtonWithAnalytics(p1) --[[ Line: 38 ]]
	-- upvalues: ReactModule (copy), SendAudioPlayerAnalyticsFunction (copy), AnalyticActions (copy), IconButton (copy), BuilderIconsModule (copy), FoundationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement(IconButton, {
		LayoutOrder = 3,
		testId = "MomentsMusicSaveButton",
		icon = {
			name = BuilderIconsModule.Icon.Bookmark,
			variant = if UseStateResult then BuilderIconsModule.IconVariant.Filled else BuilderIconsModule.IconVariant.Regular
		},
		onActivated = ReactModule.useCallback(function() --[[ Line: 41 ]]
			-- upvalues: SendAudioPlayerAnalyticsFunction (upval), UseStateResult (copy), AnalyticActions (upval), p1 (copy), UseStateResult2 (copy)
			SendAudioPlayerAnalyticsFunction({
				thumbnailId = "-1",
				source = "moments",
				action = if UseStateResult then AnalyticActions.Unlike else AnalyticActions.Like,
				songId = tostring(p1.assetId)
			})
			UseStateResult2(not UseStateResult)
		end, { UseStateResult, p1.assetId }),
		size = FoundationModule.Enums.InputSize.Medium
	})
end

return function(p1) --[[ Line: 65 | Named "MusicModal" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), Sheet (copy), Text (copy), View (copy), MusicThumbnailIcon (copy), MusicThumbnailIconSize (copy), FFlagMomentsAudioSaveButton (copy), FFlagMomentsAudioSaveSongbirdAnalyticsModule (copy), SaveButtonWithAnalytics (copy), IconButton (copy), BuilderIconsModule (copy), FoundationModule (copy)
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
				}),
				SaveButton = if FFlagMomentsAudioSaveButton and FFlagMomentsAudioSaveSongbirdAnalyticsModule then ReactModule.createElement(SaveButtonWithAnalytics, { assetId = MusicInfo.AssetId }) elseif FFlagMomentsAudioSaveButton then ReactModule.createElement(IconButton, {
					LayoutOrder = 3,
					testId = "MomentsMusicSaveButton",
					icon = BuilderIconsModule.Icon.Bookmark,
					onActivated = function() --[[ Line: 112 ]] end,
					size = FoundationModule.Enums.InputSize.Medium
				}) else nil
			})
		})
	})
end