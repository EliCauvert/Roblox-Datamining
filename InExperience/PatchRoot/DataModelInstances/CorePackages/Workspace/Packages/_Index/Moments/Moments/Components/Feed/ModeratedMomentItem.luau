local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local Players = game:GetService("Players")
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local Image = FoundationModule.Image
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseImageLoadingStateFunction = require(Parent.MomentsCommon).Hooks.useImageLoadingState
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(Moments.Constants)
local config = {
	moderatedBody = "Feature.Moments.Label.ModeratedRodeoBody",
	unavailableBody = "Feature.Moments.Label.MomentUnavailableDefault"
}

return function(p1) --[[ Line: 34 | Named "ModeratedMomentItem" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), Players (copy), ReactModule (copy), UseImageLoadingStateFunction (copy), Image (copy), Skeleton (copy), View (copy), ConstantsModule (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local LocalPlayer = Players.LocalPlayer
	local UserId = if LocalPlayer then LocalPlayer.UserId else nil
	local UseMemoResult = ReactModule.useMemo(function(): boolean --[[ Line: 39 ]]
		-- upvalues: UserId (copy), p1 (copy)
		return UserId ~= nil and p1.creatorId == UserId
	end, { p1.creatorId, UserId or false })
	local Text1 = "rbxthumb://type=Asset&id=" .. p1.moment.assetId .. "&w=480&h=270"
	local UseImageLoadingStateResult = UseImageLoadingStateFunction(if UseMemoResult then Text1 else nil)
	
	return ReactModule.createElement(View, {
		tag = "position-center-center anchor-center-center size-full"
	}, {
		OverlayText = ReactModule.createElement(View, {
			tag = "col flex-evenly align-x-center position-center-center anchor-center-center size-full padding-xlarge",
			testId = "--moments-moderated-overlay-text",
			ZIndex = 3,
			sizeConstraint = { MaxSize = ConstantsModule.MaxSize.BottomUI }
		}, {
			Text = ReactModule.createElement(Text, {
				tag = "auto-xy text-wrap",
				LayoutOrder = 1,
				Text = if UseMemoResult then UseLocalizationResult.moderatedBody else UseLocalizationResult.unavailableBody
			})
		}),
		Overlay = ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center size-full bg-over-media-0",
			ZIndex = 2
		}),
		Content = if UseMemoResult then ReactModule.createElement(Image, {
			Size = UDim2.fromScale(1, 1),
			ScaleType = Enum.ScaleType.Crop,
			Image = Text1
		}, {
			Skeleton = if UseImageLoadingStateResult then nil else ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1) })
		}) else nil
	})
end