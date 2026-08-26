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

return function(p1)
	-- upvalues: useTokens (ref), useScreenSizeModule (ref), useState (ref), useCallback (ref), vector2 (ref), reactModule (ref), view (ref), foundationModule (ref), icon (ref), captureItemModule (ref)
	local var1 = useTokens()
	local var2 = useScreenSizeModule()
	local var3, var4 = useState(var2)
	local var5 = useCallback(function(p2)
		-- upvalues: var4 (ref), p1 (ref)
		var4(p2.AbsoluteSize)
		p1.onAbsoluteSizeChangedCallback(p2)
	end, { p1.onAbsoluteSizeChangedCallback })
	local y = var2.Y
	local x = var2.X
	local var6 = p1.enableLargeScreenMode and (vector2.X < var3.X and vector2.Y < var3.Y)
	local var7 = if p1.children == nil then 1 else 0.6
	
	return reactModule.createElement(view, {
		tag = "size-full-full bg-over-media-0",
		onAbsoluteSizeChanged = var5,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		}
	}, {
		ComposerScreenContainer = reactModule.createElement(view, {
			Size = if var6 then UDim2.fromOffset(math.min(var3.X, vector2.X), math.min(var3.Y, vector2.Y)) else UDim2.fromScale(1, 1),
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			tag = {
				["anchor-center-center bg-surface-200 position-center-center"] = true,
				["radius-large"] = var6
			}
		}, {
			ComposerContainer = reactModule.createElement(view, {
				tag = {
					["anchor-center-center bg-action-subtle position-center-center size-full-full"] = true,
					["padding-right-large"] = var6
				}
			}, {
				BackButtonContainer = reactModule.createElement(view, { tag = "auto-xy bg-action-subtle", ZIndex = 2 }, {
					Padding = reactModule.createElement("UIPadding", {
						PaddingBottom = UDim.new(0, var1.Padding.Large),
						PaddingLeft = UDim.new(0, var1.Padding.XXLarge),
						PaddingRight = UDim.new(0, var1.Padding.Large),
						PaddingTop = UDim.new(0, var1.Padding.XXLarge)
					}),
					BackButton = reactModule.createElement(view, {
						onActivated = p1.onCloseCallback,
						tag = {
							["auto-xy bg-over-media-300 padding-medium radius-circle"] = true
						}
					}, {
						BackIcon = reactModule.createElement(icon, {
							ZIndex = 2,
							AnchorPoint = Vector2.new(0.5, 0.5),
							IconSize = foundationModule.Enums.IconSize.Small,
							name = if var6 then "icons/navigation/close" else "icons/actions/cycleLeft",
							Position = UDim2.fromScale(0.5, 0.5),
							style = var1.Color.ActionEmphasis.Foreground
						})
					})
				}),
				CaptureContainer = reactModule.createElement(view, {
					ZIndex = 1,
					Size = if y < x then UDim2.new(var7, if var6 then var1.Padding.Large else 0, 1, 0) else UDim2.fromScale(1, var7),
					tag = {
						["bg-surface-100 clip"] = true,
						["padding-right-large"] = var6 and p1.children ~= nil,
						["radius-large"] = var6
					}
				}, {
					CapturePreviewFrame = reactModule.createElement(view, {
						LayoutOrder = 2,
						tag = "anchor-center-center bg-action-subtle position-center-center size-full-full"
					}, {
						CapturePreview = reactModule.createElement(captureItemModule, {
							isVideoPlaying = true,
							capture = p1.capture,
							onActivated = function() end,
							scaleType = Enum.ScaleType.Fit
						})
					})
				}),
				ComposerBody = p1.children
			})
		})
	})
end