-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:50 2026 Pacific Standard Time.

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

return function(p0) --[[ line: 36 ]]
	-- upvalues: useMusicInfoModule (ref), useBinding (ref), useEffect (ref), reactModule (ref), skeleton (ref), view (ref), musicThumbnailIcon (ref), musicThumbnailIconSize (ref), text (ref), iconButton (ref), pauseLarge (ref), playLarge (ref), foundationModule (ref), radialProgressBarModule (ref)
	local var7 = useMusicInfoModule(p0.musicAssetId)
	local var8, var9 = useBinding(p0.progress or 0)
	useEffect(function() --[[ line: 40 ]]
		-- upvalues: var9 (ref), p0 (ref)
		var9(p0.progress or 0)
	end, { p0.progress })
	
	return if var7 then reactModule.createElement(view, {
		tag = "align-x-left align-y-center auto-y row gap-medium padding-x-xsmall padding-y-small radius-medium",
		LayoutOrder = p0.layoutOrder,
		onActivated = if p0.onMusicSelected then reactModule.useCallback(function() --[[ line: 44 ]]
			-- upvalues: p0 (ref)
			if p0.onMusicSelected then
				p0.onMusicSelected(p0.musicAssetId)
			end
		end, { p0.onMusicSelected, p0.musicAssetId }) else nil,
		Size = UDim2.fromScale(1, 0)
	}, {
		MusicThumbnail = reactModule.createElement(musicThumbnailIcon, {
			assetId = var7.AssetId,
			size = musicThumbnailIconSize.Large
		}),
		MusicInfo = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "auto-y col gap-xsmall size-full-0 shrink"
		}, {
			Title = reactModule.createElement(text, {
				tag = "auto-xy text-body-medium content-emphasis text-truncate-end text-align-x-left text-align-y-top",
				Text = var7.Title
			}),
			Artist = reactModule.createElement(text, {
				tag = "auto-xy text-body-small content-neutral text-truncate-end text-align-x-left text-align-y-top",
				Text = var7.Artist
			})
		}),
		PlaybackButton = if p0.togglePreviewMusic then reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "anchor-center-center clip position-center-center radius-circle size-900-900 padding-xxsmall"
		}, {
			PlaybackIndicator = reactModule.createElement(iconButton, {
				isCircular = true,
				icon = if p0.isPreviewing then pauseLarge else playLarge,
				onActivated = reactModule.useCallback(function() --[[ line: 50 ]]
					-- upvalues: p0 (ref)
					if p0.togglePreviewMusic then
						p0.togglePreviewMusic(p0.musicAssetId)
					end
				end, { p0.togglePreviewMusic, p0.musicAssetId }),
				size = foundationModule.Enums.IconSize.Small,
				variant = foundationModule.Enums.ButtonVariant.Standard
			}),
			ProgressBar = if p0.progress then reactModule.createElement(radialProgressBarModule, { progress = var8 }) else nil
		}) else nil
	}) else reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, 64) })
end