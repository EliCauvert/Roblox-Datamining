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

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useMusicInfoModule (ref), view (ref), musicThumbnailIcon (ref), musicThumbnailIconSize (ref), musicModalModule (ref)
	local moment = p1.moment
	local var1, var2 = reactModule.useState(false)
	local var3 = useMusicInfoModule(reactModule.useMemo(function()
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
	
	return if var3 == nil then nil else reactModule.createElement(reactModule.Fragment, nil, {
		Button = reactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			GroupTransparency = p1.animationRatio,
			LayoutOrder = p1.LayoutOrder,
			Size = UDim2.fromOffset(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Inner = reactModule.createElement(view, {
				tag = "align-x-center align-y-center size-1200-1200 radius-medium",
				isDisabled = p1.isDisabled,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var2 (ref)
					var2(true)
				end, {})
			}, {
				MusicThumbnail = reactModule.createElement(musicThumbnailIcon, {
					assetId = var3.AssetId,
					size = musicThumbnailIconSize.Small
				})
			})
		}),
		Modal = if var1 then reactModule.createElement(musicModalModule, {
			musicInfo = var3,
			onClose = reactModule.useCallback(function()
				-- upvalues: var2 (ref)
				var2(false)
			end, {})
		}) else nil
	})
end)