local parent = script.Parent.Parent
local parent_1 = parent.Parent
local foundationModule = require(parent_1.Foundation)
local reactModule = require(parent_1.React)
local icon = foundationModule.Icon
local view = foundationModule.View
local useCallback = reactModule.useCallback
local useScreenSizeModule = require(parent.Hooks.useScreenSize)
local useState = reactModule.useState
local useTokens = foundationModule.Hooks.useTokens
local captureItemModule = require(parent.Components.CaptureItem)
local _ = require(parent.Types)
local vector2 = Vector2.new(700, 500)

return function(p0) --[[ line: 31 ]]
	-- upvalues: useTokens (ref), useScreenSizeModule (ref), useState (ref), useCallback (ref), vector2 (ref), reactModule (ref), view (ref), foundationModule (ref), icon (ref), captureItemModule (ref)
	local var5 = useTokens()
	local var6 = useScreenSizeModule()
	local var7, var8 = useState(var6)
	local var9 = useCallback(function(p1) --[[ line: 37 ]]
		-- upvalues: var8 (ref), p0 (ref)
		var8(p1.AbsoluteSize)
		p0.onAbsoluteSizeChangedCallback(p1)
	end, { p0.onAbsoluteSizeChangedCallback })
	local y = var6.Y
	local x = var6.X
	local var10 = p0.enableLargeScreenMode and (vector2.X < var7.X and vector2.Y < var7.Y)
	local var11 = if p0.children == nil then 1 else 0.6
	
	return reactModule.createElement(view, {
		tag = "size-full-full bg-over-media-0",
		onAbsoluteSizeChanged = var9,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		}
	}, {
		ComposerScreenContainer = reactModule.createElement(view, {
			Size = if var10 then UDim2.fromOffset(math.min(var7.X, vector2.X), math.min(var7.Y, vector2.Y)) else UDim2.fromScale(1, 1),
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			tag = {
				["anchor-center-center bg-surface-200 position-center-center"] = true,
				["radius-large"] = var10
			}
		}, {
			ComposerContainer = reactModule.createElement(view, {
				tag = {
					["anchor-center-center bg-action-subtle position-center-center size-full-full"] = true,
					["padding-right-large"] = var10
				}
			}, {
				BackButtonContainer = reactModule.createElement(view, { tag = "auto-xy bg-action-subtle", ZIndex = 2 }, {
					Padding = reactModule.createElement("UIPadding", {
						PaddingBottom = UDim.new(0, var5.Padding.Large),
						PaddingLeft = UDim.new(0, var5.Padding.XXLarge),
						PaddingRight = UDim.new(0, var5.Padding.Large),
						PaddingTop = UDim.new(0, var5.Padding.XXLarge)
					}),
					BackButton = reactModule.createElement(view, {
						onActivated = p0.onCloseCallback,
						tag = {
							["auto-xy bg-over-media-300 padding-medium radius-circle"] = true
						}
					}, {
						BackIcon = reactModule.createElement(icon, {
							ZIndex = 2,
							AnchorPoint = Vector2.new(0.5, 0.5),
							IconSize = foundationModule.Enums.IconSize.Small,
							name = if var10 then "icons/navigation/close" else "icons/actions/cycleLeft",
							Position = UDim2.fromScale(0.5, 0.5),
							style = var5.Color.ActionEmphasis.Foreground
						})
					})
				}),
				CaptureContainer = reactModule.createElement(view, {
					ZIndex = 1,
					Size = if y < x then UDim2.new(var11, if var10 then var5.Padding.Large else 0, 1, 0) else UDim2.fromScale(1, var11),
					tag = {
						["bg-surface-100 clip"] = true,
						["padding-right-large"] = var10 and p0.children ~= nil,
						["radius-large"] = var10
					}
				}, {
					CapturePreviewFrame = reactModule.createElement(view, {
						LayoutOrder = 2,
						tag = "anchor-center-center bg-action-subtle position-center-center size-full-full"
					}, {
						CapturePreview = reactModule.createElement(captureItemModule, {
							isVideoPlaying = true,
							capture = p0.capture,
							onActivated = function() --[[ line: 120 ]] end,
							scaleType = Enum.ScaleType.Fit
						})
					})
				}),
				ComposerBody = p0.children
			})
		})
	})
end