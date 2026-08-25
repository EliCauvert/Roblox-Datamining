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
local useFormFactor = momentsCommonModule.Hooks.useFormFactor
local useImageLoadingState = momentsCommonModule.Hooks.useImageLoadingState
local useLocalization = localizationModule.Hooks.useLocalization
local constantsModule = require(moments.Constants)
local formFactor = momentsCommonModule.Enums.FormFactor
local fFlagMomentsUseCompositionLibraryModule = require(moments.Flags.FFlagMomentsUseCompositionLibrary)
local t = {
	moderatedBody = "Feature.Moments.Label.ModeratedRodeoBody",
	unavailableBody = "Feature.Moments.Label.MomentUnavailableDefault"
}

return function(p0)
	-- upvalues: useLocalization (ref), t (ref), fFlagMomentsUseCompositionLibraryModule (ref), useFormFactor (ref), playersService (ref), reactModule (ref), useImageLoadingState (ref), image (ref), skeleton (ref), view (ref), constantsModule (ref), formFactor (ref), text (ref)
	local var9 = useLocalization(t)
	local var10 = if not fFlagMomentsUseCompositionLibraryModule then useFormFactor() else nil
	local localPlayer = playersService.LocalPlayer
	local var11 = if localPlayer then localPlayer.UserId else nil
	local var12 = reactModule.useMemo(function()
		-- upvalues: var11 (ref), p0 (ref)
		return var11 ~= nil and p0.creatorId == var11
	end, { p0.creatorId, var11 or false })
	local text_1 = "rbxthumb://type=Asset&id=" .. p0.moment.assetId .. "&w=480&h=270"
	
	return reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center size-full"
	}, {
		OverlayText = reactModule.createElement(view, {
			tag = "col flex-evenly align-x-center position-center-center anchor-center-center size-full padding-xlarge",
			testId = "--moments-moderated-overlay-text",
			ZIndex = 3,
			sizeConstraint = {
				MaxSize = if fFlagMomentsUseCompositionLibraryModule then constantsModule.MaxSize.BottomUI elseif var10 ~= formFactor.Wide then constantsModule.MaxSize.BottomUI else nil
			}
		}, {
			Text = reactModule.createElement(text, {
				tag = "auto-xy text-wrap",
				LayoutOrder = 1,
				Text = if var12 then var9.moderatedBody else var9.unavailableBody
			})
		}),
		Overlay = reactModule.createElement(view, {
			tag = "position-center-center anchor-center-center size-full bg-over-media-0",
			ZIndex = 2
		}),
		Content = if var12 then reactModule.createElement(image, {
			Size = UDim2.fromScale(1, 1),
			ScaleType = Enum.ScaleType.Crop,
			Image = text_1
		}, {
			Skeleton = if not useImageLoadingState(if var12 then text_1 else nil) then reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) }) else nil
		}) else nil
	})
end