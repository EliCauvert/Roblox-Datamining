local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local MusicThumbnailIcon = MomentsCommonModule.Components.MusicThumbnailIcon
local MusicThumbnailIconSize = MomentsCommonModule.Enums.MusicThumbnailIconSize
local UseMusicInfoModule = require(Moments.Hooks.useMusicInfo)
local MusicModalModule = require(Moments.Components.MusicModal)

return ReactModule.memo(function(Frame)
	-- upvalues: ReactModule (copy), UseMusicInfoModule (copy), View (copy), MusicThumbnailIcon (copy), MusicThumbnailIconSize (copy), MusicModalModule (copy)
	local Moment = Frame.moment
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseMusicInfoModuleResult = UseMusicInfoModule((ReactModule.useMemo(function()
		-- upvalues: Moment (copy)
		if Moment == nil then
			return nil
		end
		local Edits = Moment.metadata.edits
		
		if Edits == nil then
			return nil
		else
			local Music = Edits.music
			
			return if Music == nil then nil else Music.assetId
		end
	end, { Moment })))
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	
	return if UseMusicInfoModuleResult == nil then nil else ReactModule.createElement(ReactModule.Fragment, nil, {
		Button = ReactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			GroupTransparency = Frame.animationRatio,
			LayoutOrder = Frame.LayoutOrder,
			Size = UDim2.fromOffset(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Inner = ReactModule.createElement(View, {
				tag = "align-x-center align-y-center size-1200-1200 radius-medium",
				isDisabled = Frame.isDisabled,
				onActivated = UseResult
			}, {
				MusicThumbnail = ReactModule.createElement(MusicThumbnailIcon, {
					assetId = UseMusicInfoModuleResult.AssetId,
					size = MusicThumbnailIconSize.Small
				})
			})
		}),
		Modal = if UseStateResult then ReactModule.createElement(MusicModalModule, {
			musicInfo = UseMusicInfoModuleResult,
			onClose = UseResult1
		}) else nil
	})
end)