local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local Players = game:GetService("Players")
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local Image = FoundationModule.Image
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseFormFactorFunction = MomentsCommonModule.Hooks.useFormFactor
local UseImageLoadingStateFunction = MomentsCommonModule.Hooks.useImageLoadingState
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(Moments.Constants)
local FormFactor = MomentsCommonModule.Enums.FormFactor
local config = {
	moderatedBody = "Feature.Moments.Label.ModeratedRodeoBody",
	unavailableBody = "Feature.Moments.Label.MomentUnavailableDefault"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseFormFactorFunction (copy), Players (copy), ReactModule (copy), UseImageLoadingStateFunction (copy), Image (copy), Skeleton (copy), View (copy), FormFactor (copy), ConstantsModule (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseFormFactorResult = UseFormFactorFunction()
	local LocalPlayer = Players.LocalPlayer
	local UserId = if LocalPlayer then LocalPlayer.UserId else nil
	local UseMemoResult = ReactModule.useMemo(function(): boolean
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
			ZIndex = 3,
			sizeConstraint = {
				MaxSize = if UseFormFactorResult == FormFactor.Wide then ConstantsModule.MaxSize.BottomUI else nil
			}
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