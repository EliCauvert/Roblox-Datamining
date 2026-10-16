local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local UseCallbackFunction = ReactModule.useCallback
local UseScreenSizeModule = require(Parent.Hooks.useScreenSize)
local UseStateFunction = ReactModule.useState
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CaptureItemModule = require(Parent.Components.CaptureItem)
local _ = require(Parent.Types)
local _Vector2 = Vector2.new(700, 500)

return function(p1) --[[ Line: 31 ]]
	-- upvalues: UseTokensFunction (copy), UseScreenSizeModule (copy), UseStateFunction (copy), UseCallbackFunction (copy), _Vector2 (copy), ReactModule (copy), View (copy), FoundationModule (copy), Icon (copy), CaptureItemModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseScreenSizeModuleResult = UseScreenSizeModule()
	local UseStateResult, UseStateResult2 = UseStateFunction(UseScreenSizeModuleResult)
	local Y = UseScreenSizeModuleResult.Y
	local X = UseScreenSizeModuleResult.X
	local IsYBelow: boolean = p1.enableLargeScreenMode and (_Vector2.X < UseStateResult.X and _Vector2.Y < UseStateResult.Y)
	local XScale: number = if p1.children == nil then 1 else 0.6
	
	return ReactModule.createElement(View, {
		tag = "size-full-full bg-over-media-0",
		onAbsoluteSizeChanged = UseCallbackFunction(function(Frame) --[[ Line: 37 ]]
			-- upvalues: UseStateResult2 (copy), p1 (copy)
			UseStateResult2(Frame.AbsoluteSize)
			p1.onAbsoluteSizeChangedCallback(Frame)
		end, { p1.onAbsoluteSizeChangedCallback }),
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		}
	}, {
		ComposerScreenContainer = ReactModule.createElement(View, {
			Size = if IsYBelow then UDim2.fromOffset(math.min(UseStateResult.X, _Vector2.X), (math.min(UseStateResult.Y, _Vector2.Y))) else UDim2.fromScale(1, 1),
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			},
			tag = {
				["anchor-center-center bg-surface-200 position-center-center"] = true,
				["radius-large"] = IsYBelow
			}
		}, {
			ComposerContainer = ReactModule.createElement(View, {
				tag = {
					["anchor-center-center bg-action-subtle position-center-center size-full-full"] = true,
					["padding-right-large"] = IsYBelow
				}
			}, {
				BackButtonContainer = ReactModule.createElement(View, { tag = "auto-xy bg-action-subtle", ZIndex = 2 }, {
					Padding = ReactModule.createElement("UIPadding", {
						PaddingBottom = UDim.new(0, UseTokensResult.Padding.Large),
						PaddingLeft = UDim.new(0, UseTokensResult.Padding.XXLarge),
						PaddingRight = UDim.new(0, UseTokensResult.Padding.Large),
						PaddingTop = UDim.new(0, UseTokensResult.Padding.XXLarge)
					}),
					BackButton = ReactModule.createElement(View, {
						onActivated = p1.onCloseCallback,
						tag = {
							["auto-xy bg-over-media-300 padding-medium radius-circle"] = true
						}
					}, {
						BackIcon = ReactModule.createElement(Icon, {
							ZIndex = 2,
							AnchorPoint = Vector2.new(0.5, 0.5),
							IconSize = FoundationModule.Enums.IconSize.Small,
							name = if IsYBelow then "icons/navigation/close" else "icons/actions/cycleLeft",
							Position = UDim2.fromScale(0.5, 0.5),
							style = UseTokensResult.Color.ActionEmphasis.Foreground
						})
					})
				}),
				CaptureContainer = ReactModule.createElement(View, {
					ZIndex = 1,
					Size = if Y < X then UDim2.new(XScale, if IsYBelow then UseTokensResult.Padding.Large else 0, 1, 0) else UDim2.fromScale(1, XScale),
					tag = {
						["bg-surface-100 clip"] = true,
						["padding-right-large"] = IsYBelow and p1.children ~= nil,
						["radius-large"] = IsYBelow
					}
				}, {
					CapturePreviewFrame = ReactModule.createElement(View, {
						LayoutOrder = 2,
						tag = "anchor-center-center bg-action-subtle position-center-center size-full-full"
					}, {
						CapturePreview = ReactModule.createElement(CaptureItemModule, {
							isVideoPlaying = true,
							capture = p1.capture,
							onActivated = function() --[[ Line: 120 ]] end,
							scaleType = Enum.ScaleType.Fit
						})
					})
				}),
				ComposerBody = p1.children
			})
		})
	})
end