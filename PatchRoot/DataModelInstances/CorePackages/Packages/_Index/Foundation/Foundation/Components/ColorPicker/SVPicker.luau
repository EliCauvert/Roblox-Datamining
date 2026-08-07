-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:01 2026 Pacific Standard Time.

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

return function(p0) --[[ line: 31 | named "SVPicker" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), colorUtilsModule (ref), viewModule (ref), withCommonPropsModule (ref), knobModule (ref), inputSizeModule (ref)
	local var10 = withDefaultsModule(p0, t)
	local hue = var10.hue
	local saturation = var10.saturation
	local value = var10.value
	local onChanged = var10.onChanged
	local onDragStarted = var10.onDragStarted
	local onDragEnded = var10.onDragEnded
	local var11 = useTokensModule()
	local var12 = hue:map(function(p1) --[[ line: 40 ]]
		return Color3.fromHSV(p1, 1, 1)
	end)
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useCallback(function(p2) --[[ line: 45 ]]
		-- upvalues: var13 (ref), colorUtilsModule (copy), onChanged (ref)
		local current = var13.current
		
		if current then
			local var15, var16 = colorUtilsModule.calculateSVFromPosition(p2, current.AbsolutePosition, current.AbsoluteSize)
			onChanged(var15, var16)
			
			return
		end
	end, { onChanged })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var10, {
		tag = "size-full radius-small",
		ClipsDescendants = true,
		ref = var13
	}), {
		DragDetector = reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = reactModule.useCallback(function(_, p3) --[[ line: 57 ]]
				-- upvalues: onDragStarted (ref), var14 (ref)
				if onDragStarted then
					onDragStarted()
				end
				var14(p3)
			end, { var14, onDragStarted }),
			[reactModule.Event.DragContinue] = reactModule.useCallback(function(_, p4) --[[ line: 64 ]]
				-- upvalues: var14 (ref)
				var14(p4)
			end, { var14 }),
			[reactModule.Event.DragEnd] = onDragEnded
		}),
		Base = reactModule.createElement("Frame", {
			ZIndex = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = var11.Color.Extended.White.White_100.Color3
		}),
		Saturation = reactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = var12
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
			BackgroundColor3 = var11.Color.Extended.Black.Black_100.Color3
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			})
		}),
		Knob = if var10.showSelectionKnob then reactModule.createElement(knobModule, {
			hasShadow = true,
			ZIndex = 4,
			size = inputSizeModule.Medium,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = reactModule.joinBindings({ saturation, value }):map(function(p5) --[[ line: 119 ]]
				return UDim2.fromScale(p5[1], 1 - p5[2])
			end),
			style = reactModule.joinBindings({ hue, saturation, value }):map(function(p6) --[[ line: 124 ]]
				return {
					Transparency = 0,
					Color3 = Color3.fromHSV(p6[1], p6[2], p6[3])
				}
			end),
			stroke = {
				Color = var11.Color.System.Contrast.Color3,
				Thickness = var11.Stroke.Thicker,
				Transparency = var11.Color.System.Contrast.Transparency
			}
		}) else nil
	})
end