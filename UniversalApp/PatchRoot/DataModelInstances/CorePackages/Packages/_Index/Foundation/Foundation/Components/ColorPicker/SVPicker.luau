local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local inputSizeModule = require(foundation.Enums.InputSize)
local knobModule = require(foundation.Components.Knob)
local viewModule = require(foundation.Components.View)
local colorUtilsModule = require(foundation.Components.ColorPicker.colorUtils)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(foundation.Components.Types)
local t = { showSelectionKnob = true }

return function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), colorUtilsModule (ref), viewModule (ref), withCommonPropsModule (ref), knobModule (ref), inputSizeModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local hue = var1.hue
	local saturation = var1.saturation
	local value = var1.value
	local onChanged = var1.onChanged
	local onDragStarted = var1.onDragStarted
	local onDragEnded = var1.onDragEnded
	local var2 = useTokensModule()
	local var3 = hue:map(function(p2)
		return Color3.fromHSV(p2, 1, 1)
	end)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), colorUtilsModule (copy), onChanged (ref)
		local current = var4.current
		
		if current then
			local var6, var7 = colorUtilsModule.calculateSVFromPosition(p2, current.AbsolutePosition, current.AbsoluteSize)
			onChanged(var6, var7)
			
			return
		end
	end, { onChanged })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = "size-full radius-small",
		ClipsDescendants = true,
		ref = var4
	}), {
		DragDetector = reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = reactModule.useCallback(function(_, p2)
				-- upvalues: onDragStarted (ref), var5 (ref)
				if onDragStarted then
					onDragStarted()
				end
				var5(p2)
			end, { var5, onDragStarted }),
			[reactModule.Event.DragContinue] = reactModule.useCallback(function(_, p2)
				-- upvalues: var5 (ref)
				var5(p2)
			end, { var5 }),
			[reactModule.Event.DragEnd] = onDragEnded
		}),
		Base = reactModule.createElement("Frame", {
			ZIndex = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = var2.Color.Extended.White.White_100.Color3
		}),
		Saturation = reactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = var3
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			})
		}),
		Value = reactModule.createElement("Frame", {
			ZIndex = 3,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = var2.Color.Extended.Black.Black_100.Color3
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			})
		}),
		Knob = if var1.showSelectionKnob then reactModule.createElement(knobModule, {
			hasShadow = true,
			ZIndex = 4,
			size = inputSizeModule.Medium,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = reactModule.joinBindings({ saturation, value }):map(function(p2)
				return UDim2.fromScale(p2[1], 1 - p2[2])
			end),
			style = reactModule.joinBindings({ hue, saturation, value }):map(function(p2)
				return {
					Transparency = 0,
					Color3 = Color3.fromHSV(p2[1], p2[2], p2[3])
				}
			end),
			stroke = {
				Color = var2.Color.System.Contrast.Color3,
				Thickness = var2.Stroke.Thicker,
				Transparency = var2.Color.System.Contrast.Transparency
			}
		}) else nil
	})
end