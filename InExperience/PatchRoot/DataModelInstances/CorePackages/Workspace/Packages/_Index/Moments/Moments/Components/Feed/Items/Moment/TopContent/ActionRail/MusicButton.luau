local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local view = foundationModule.View
local musicThumbnailIcon = momentsCommonModule.Components.MusicThumbnailIcon
local musicThumbnailIconSize = momentsCommonModule.Enums.MusicThumbnailIconSize
local useMusicInfoModule = require(moments.Hooks.useMusicInfo)
local musicModalModule = require(moments.Components.MusicModal)

return reactModule.memo(function(p0) --[[ line: 26 | named "MusicButton" ]]
	-- upvalues: reactModule (ref), useMusicInfoModule (ref), view (ref), musicThumbnailIcon (ref), musicThumbnailIconSize (ref), musicModalModule (ref)
	local moment = p0.moment
	local var6, var7 = reactModule.useState(false)
	local var8 = useMusicInfoModule(reactModule.useMemo(function() --[[ line: 30 ]]
		-- upvalues: moment (ref)
		if moment == nil then
			return nil
		end
		local edits = moment.metadata.edits
		
		if edits == nil then
			return nil
		end
		local music = edits.music
		
		return if music == nil then nil else music.assetId
	end, { moment }))
	
	return if var8 == nil then nil else reactModule.createElement(reactModule.Fragment, nil, {
		Button = reactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			GroupTransparency = p0.animationRatio,
			LayoutOrder = p0.LayoutOrder,
			Size = UDim2.fromOffset(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Inner = reactModule.createElement(view, {
				tag = "align-x-center align-y-center size-1200-1200 radius-medium",
				isDisabled = p0.isDisabled,
				onActivated = reactModule.useCallback(function() --[[ line: 47 ]]
					-- upvalues: var7 (ref)
					var7(true)
				end, {})
			}, {
				MusicThumbnail = reactModule.createElement(musicThumbnailIcon, {
					assetId = var8.AssetId,
					size = musicThumbnailIconSize.Small
				})
			})
		}),
		Modal = if var6 then reactModule.createElement(musicModalModule, {
			musicInfo = var8,
			onClose = reactModule.useCallback(function() --[[ line: 51 ]]
				-- upvalues: var7 (ref)
				var7(false)
			end, {})
		}) else nil
	})
end)