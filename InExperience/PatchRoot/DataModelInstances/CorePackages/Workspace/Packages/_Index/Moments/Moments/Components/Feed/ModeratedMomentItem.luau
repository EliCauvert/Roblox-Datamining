local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local playersService = game:GetService("Players")
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local text = foundationModule.Text
local useImageLoadingState = momentsCommonModule.Hooks.useImageLoadingState
local useLocalization = localizationModule.Hooks.useLocalization
local constantsModule = require(moments.Constants)
local t = {
	moderatedBody = "Feature.Moments.Label.ModeratedRodeoBody",
	unavailableBody = "Feature.Moments.Label.MomentUnavailableDefault"
}

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), playersService (ref), reactModule (ref), useImageLoadingState (ref), image (ref), skeleton (ref), view (ref), constantsModule (ref), text (ref)
	local var1 = useLocalization(t)
	local localPlayer = playersService.LocalPlayer
	local var2 = if localPlayer then localPlayer.UserId else nil
	local var3 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), p1 (ref)
		return var2 ~= nil and p1.creatorId == var2
	end, { p1.creatorId, var2 or false })
	local text_1 = "rbxthumb://type=Asset&id=" .. p0.moment.assetId .. "&w=480&h=270"
	
	return reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center size-full"
	}, {
		OverlayText = reactModule.createElement(view, {
			tag = "col flex-evenly align-x-center position-center-center anchor-center-center size-full padding-xlarge",
			testId = "--moments-moderated-overlay-text",
			ZIndex = 3,
			sizeConstraint = { MaxSize = constantsModule.MaxSize.BottomUI }
		}, {
			Text = reactModule.createElement(text, {
				tag = "auto-xy text-wrap",
				LayoutOrder = 1,
				Text = if var3 then var1.moderatedBody else var1.unavailableBody
			})
		}),
		Overlay = reactModule.createElement(view, {
			tag = "position-center-center anchor-center-center size-full bg-over-media-0",
			ZIndex = 2
		}),
		Content = if var3 then reactModule.createElement(image, {
			Size = UDim2.fromScale(1, 1),
			ScaleType = Enum.ScaleType.Crop,
			Image = text_1
		}, {
			Skeleton = if not useImageLoadingState(if var3 then text_1 else nil) then reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) }) else nil
		}) else nil
	})
end