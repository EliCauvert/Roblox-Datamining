local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local iconButton = foundationModule.IconButton
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local playLarge = builderIconsModule.Icon.PlayLarge
local pauseLarge = builderIconsModule.Icon.PauseLarge
local musicThumbnailIcon = momentsCommonModule.MusicThumbnailIcon
local radialProgressBarModule = require(momentsCreationFlow.Components.RadialProgressBar)
local useBinding = reactModule.useBinding
local useEffect = reactModule.useEffect
local useMusicInfoModule = require(momentsCreationFlow.Hooks.useMusicInfo)
local musicThumbnailIconSize = momentsCommonModule.Enums.MusicThumbnailIconSize

return function(p1)
	-- upvalues: useMusicInfoModule (ref), useBinding (ref), useEffect (ref), reactModule (ref), skeleton (ref), view (ref), musicThumbnailIcon (ref), musicThumbnailIconSize (ref), text (ref), iconButton (ref), pauseLarge (ref), playLarge (ref), foundationModule (ref), radialProgressBarModule (ref)
	local var1 = useMusicInfoModule(p1.musicAssetId)
	local var2, var3 = useBinding(p1.progress or 0)
	useEffect(function()
		-- upvalues: var3 (ref), p1 (ref)
		var3(p1.progress or 0)
	end, { p1.progress })
	
	return if var1 then reactModule.createElement(view, {
		tag = "align-x-left align-y-center auto-y row gap-medium padding-x-xsmall padding-y-small radius-medium",
		LayoutOrder = p1.layoutOrder,
		onActivated = if p1.onMusicSelected then reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			if p1.onMusicSelected then
				p1.onMusicSelected(p1.musicAssetId)
			end
		end, { p1.onMusicSelected, p1.musicAssetId }) else nil,
		Size = UDim2.fromScale(1, 0)
	}, {
		MusicThumbnail = reactModule.createElement(musicThumbnailIcon, {
			assetId = var1.AssetId,
			size = musicThumbnailIconSize.Large
		}),
		MusicInfo = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "auto-y col gap-xsmall size-full-0 shrink"
		}, {
			Title = reactModule.createElement(text, {
				tag = "auto-xy text-body-medium content-emphasis text-truncate-end text-align-x-left text-align-y-top",
				Text = var1.Title
			}),
			Artist = reactModule.createElement(text, {
				tag = "auto-xy text-body-small content-neutral text-truncate-end text-align-x-left text-align-y-top",
				Text = var1.Artist
			})
		}),
		PlaybackButton = if p1.togglePreviewMusic then reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "anchor-center-center clip position-center-center radius-circle size-900-900 padding-xxsmall"
		}, {
			PlaybackIndicator = reactModule.createElement(iconButton, {
				isCircular = true,
				icon = if p1.isPreviewing then pauseLarge else playLarge,
				onActivated = reactModule.useCallback(function()
					-- upvalues: p1 (ref)
					if p1.togglePreviewMusic then
						p1.togglePreviewMusic(p1.musicAssetId)
					end
				end, { p1.togglePreviewMusic, p1.musicAssetId }),
				size = foundationModule.Enums.IconSize.Small,
				variant = foundationModule.Enums.ButtonVariant.Standard
			}),
			ProgressBar = if p1.progress then reactModule.createElement(radialProgressBarModule, { progress = var2 }) else nil
		}) else nil
	}) else reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, 64) })
end