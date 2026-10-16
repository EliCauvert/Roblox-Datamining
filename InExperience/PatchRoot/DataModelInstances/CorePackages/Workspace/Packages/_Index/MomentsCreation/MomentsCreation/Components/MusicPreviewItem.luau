local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local IconButton = FoundationModule.IconButton
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local PlayLarge = BuilderIconsModule.Icon.PlayLarge
local PauseLarge = BuilderIconsModule.Icon.PauseLarge
local MusicThumbnailIcon = MomentsCommonModule.Components.MusicThumbnailIcon
local RadialProgressBarModule = require(MomentsCreation.Components.RadialProgressBar)
local UseBindingFunction = ReactModule.useBinding
local UseEffectFunction = ReactModule.useEffect
local UseMusicInfoModule = require(MomentsCreation.Hooks.useMusicInfo)
local MusicThumbnailIconSize = MomentsCommonModule.Enums.MusicThumbnailIconSize

return function(p1) --[[ Line: 41 | Named "MusicPreviewItem" ]]
	-- upvalues: UseMusicInfoModule (copy), UseBindingFunction (copy), UseEffectFunction (copy), ReactModule (copy), Skeleton (copy), View (copy), MusicThumbnailIcon (copy), MusicThumbnailIconSize (copy), Text (copy), IconButton (copy), PauseLarge (copy), PlayLarge (copy), FoundationModule (copy), RadialProgressBarModule (copy)
	local UseMusicInfoModuleResult = UseMusicInfoModule(p1.musicAssetId)
	local UseBindingResult, UseBindingResult2 = UseBindingFunction(p1.progress or 0)
	UseEffectFunction(function() --[[ Line: 45 ]]
		-- upvalues: UseBindingResult2 (copy), p1 (copy)
		UseBindingResult2(p1.progress or 0)
	end, { p1.progress })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 49 ]]
		-- upvalues: p1 (copy)
		if p1.onMusicSelected then
			p1.onMusicSelected(p1.musicAssetId)
		end
	end, { p1.onMusicSelected, p1.musicAssetId })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 55 ]]
		-- upvalues: p1 (copy)
		if p1.togglePreviewMusic then
			p1.togglePreviewMusic(p1.musicAssetId)
		end
	end, { p1.togglePreviewMusic, p1.musicAssetId })
	
	return if UseMusicInfoModuleResult == nil then ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, 64) }) else ReactModule.createElement(View, {
		tag = "row align-x-left align-y-center gap-medium auto-y padding-x-xsmall padding-y-small radius-medium",
		LayoutOrder = p1.layoutOrder,
		onActivated = if p1.onMusicSelected then UseResult else nil,
		Size = UDim2.fromScale(1, 0)
	}, {
		MusicThumbnail = ReactModule.createElement(MusicThumbnailIcon, {
			assetId = UseMusicInfoModuleResult.AssetId,
			size = MusicThumbnailIconSize.Large
		}),
		MusicInfo = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col shrink gap-xsmall size-full-0 auto-y"
		}, {
			Title = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-medium text-align-x-left text-align-y-top text-truncate-end content-emphasis",
				Text = UseMusicInfoModuleResult.Title or ""
			}),
			Artist = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-small text-align-x-left text-align-y-top text-truncate-end content-neutral",
				Text = UseMusicInfoModuleResult.Artist or ""
			})
		}),
		PlaybackButton = if p1.togglePreviewMusic then ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "position-center-center anchor-center-center size-900-900 padding-xxsmall radius-circle clip"
		}, {
			PlaybackIndicator = ReactModule.createElement(IconButton, {
				isCircular = true,
				icon = if p1.isPreviewing then PauseLarge else PlayLarge,
				onActivated = UseResult1,
				size = FoundationModule.Enums.IconSize.Small,
				variant = FoundationModule.Enums.ButtonVariant.Standard
			}),
			ProgressBar = if p1.progress == nil then nil else ReactModule.createElement(RadialProgressBarModule, { progress = UseBindingResult })
		}) else nil
	})
end