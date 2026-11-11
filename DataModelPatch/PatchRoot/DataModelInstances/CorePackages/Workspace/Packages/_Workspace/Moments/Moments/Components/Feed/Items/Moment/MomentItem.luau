local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseFormFactorFunction = MomentsCommonModule.Hooks.useFormFactor
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FormFactor = MomentsCommonModule.Enums.FormFactor
local GradientBackdrop = MomentsCommonModule.Components.GradientBackdrop
local MomentLayoutModule = require(script.Parent.momentLayout)
local MomentContextModule = require(script.Parent.MomentContext)
local CallToActionModule = require(script.Parent.CallToAction)
local ScrubberModule = require(script.Parent.Scrubber)
local TopContentModule = require(script.Parent.TopContent)
local VideoScrimModule = require(script.Parent.VideoScrim)
local PlaybackToggleIndicatorModule = require(script.Parent.PlaybackToggleIndicator)
local MomentOverlayInsetContextModule = require(script.Parent.MomentOverlayInsetContext)
local ReactionEffectsContextModule = require(script.Parent.Reactions.ReactionEffectsContext)
local MomentGestureLayerModule = require(script.Parent.Reactions.MomentGestureLayer)
local ReactionExplosionLayerModule = require(script.Parent.Reactions.ReactionExplosionLayer)
local UseChromeRatioModule = require(Moments.Hooks.useChromeRatio)
local GetFFlagMomentsImmersiveChromeModule = require(Moments.Flags.GetFFlagMomentsImmersiveChrome)
local GetFFlagMomentsImmersiveResizeViewportModule = require(Moments.Flags.GetFFlagMomentsImmersiveResizeViewport)

local function OverlayInfoFrame(p1)
	-- upvalues: MomentOverlayInsetContextModule (copy), UseChromeRatioModule (copy), ReactModule (copy), View (copy)
	local UseMomentOverlayInsetResult = MomentOverlayInsetContextModule.useMomentOverlayInset()
	local InlinePadding = p1.inlinePadding
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y",
		ZIndex = 2,
		padding = {
			top = UDim.new(0, InlinePadding),
			left = UDim.new(0, InlinePadding),
			right = UDim.new(0, InlinePadding),
			bottom = UseChromeRatioModule():map(function(p2): UDim
				-- upvalues: InlinePadding (copy), UseMomentOverlayInsetResult (copy)
				return UDim.new(0, InlinePadding + math.round(UseMomentOverlayInsetResult * p2))
			end)
		},
		sizeConstraint = { MaxSize = p1.maxSize },
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
	}, p1.children)
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseFormFactorFunction (copy), ReactUtilsModule (copy), GetFFlagMomentsImmersiveChromeModule (copy), GetFFlagMomentsImmersiveResizeViewportModule (copy), ReactModule (copy), TopContentModule (copy), ScrubberModule (copy), CallToActionModule (copy), FormFactor (copy), MomentLayoutModule (copy), OverlayInfoFrame (copy), View (copy), MomentContextModule (copy), Text (copy), VideoScrimModule (copy), MomentGestureLayerModule (copy), GradientBackdrop (copy), PlaybackToggleIndicatorModule (copy), ReactionExplosionLayerModule (copy), ReactionEffectsContextModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseFormFactorResult = UseFormFactorFunction()
	local NextOrder = ReactUtilsModule.createNextOrder()
	local Inverted: boolean = GetFFlagMomentsImmersiveChromeModule() and not GetFFlagMomentsImmersiveResizeViewportModule()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.fromScale(1, 0))
	local ScaledXLarge = 2 * UseTokensResult.Padding.XLarge
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy), ScaledXLarge (copy)
		UseBindingResult2(UDim2.new(1, 0, 0, Frame.AbsoluteSize.Y + ScaledXLarge))
	end, { ScaledXLarge })
	local config = {
		TopContent = ReactModule.createElement(TopContentModule, { LayoutOrder = NextOrder(), moment = p1.moment }),
		Scrubber = ReactModule.createElement(ScrubberModule, { LayoutOrder = NextOrder() }),
		CallToAction = ReactModule.createElement(CallToActionModule, { LayoutOrder = NextOrder() })
	}
	local BOTTOMUIMAXSIZE = if UseFormFactorResult == FormFactor.Wide then MomentLayoutModule.BOTTOM_UI_MAX_SIZE else nil
	
	return ReactModule.createElement(ReactionEffectsContextModule.Provider, nil, (ReactModule.createElement(MomentContextModule.Provider, { data = p1.data }, {
		Root = ReactModule.createElement(View, {
			tag = "size-full clip bg-surface-0",
			LayoutOrder = p1.layoutOrder
		}, {
			Video = ReactModule.createElement(View, { tag = "size-full", ZIndex = 1 }, {
				Surface = if p1.mediaSurface == nil then ReactModule.createElement(View, { tag = "size-full bg-surface-100" }, {
					Label = ReactModule.createElement(Text, {
						tag = "size-full text-body-large text-align-x-center text-align-y-center content-emphasis",
						Text = "[ video ]"
					})
				}) else p1.mediaSurface,
				Scrim = ReactModule.createElement(VideoScrimModule, { ZIndex = 2 }),
				GestureLayer = ReactModule.createElement(MomentGestureLayerModule, { ZIndex = 3 })
			}),
			Overlay = ReactModule.createElement(View, {
				tag = "position-bottom-center anchor-bottom-center size-full-0 auto-y",
				ZIndex = 2
			}, {
				Backdrop = ReactModule.createElement(GradientBackdrop, {
					rotation = 270,
					color3 = UseTokensResult.Color.Common.Scrim.Color3,
					size = UseBindingResult
				}),
				InfoFrame = if Inverted then ReactModule.createElement(OverlayInfoFrame, {
					inlinePadding = UseTokensResult.Padding.XLarge,
					maxSize = BOTTOMUIMAXSIZE,
					onAbsoluteSizeChanged = UseResult
				}, config) else ReactModule.createElement(View, {
					tag = "col align-x-center align-y-bottom gap-large position-bottom-center anchor-bottom-center size-full-0 auto-y padding-xlarge",
					ZIndex = 2,
					sizeConstraint = { MaxSize = BOTTOMUIMAXSIZE },
					onAbsoluteSizeChanged = UseResult
				}, config)
			}),
			PlaybackIndicator = ReactModule.createElement(PlaybackToggleIndicatorModule),
			ReactionExplosionLayer = ReactModule.createElement(ReactionExplosionLayerModule)
		})
	})))
end