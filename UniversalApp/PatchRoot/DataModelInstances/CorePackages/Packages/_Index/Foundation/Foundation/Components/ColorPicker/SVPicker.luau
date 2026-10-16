local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local InputSizeModule = require(Foundation.Enums.InputSize)
local KnobModule = require(Foundation.Components.Knob)
local ViewModule = require(Foundation.Components.View)
local ColorUtilsModule = require(Foundation.Components.ColorPicker.colorUtils)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(Foundation.Components.Types)
local config = { showSelectionKnob = true }

return function(p1) --[[ Line: 31 | Named "SVPicker" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), ColorUtilsModule (copy), ViewModule (copy), WithCommonPropsModule (copy), KnobModule (copy), InputSizeModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local Hue = WithDefaultsModuleResult.hue
	local Saturation = WithDefaultsModuleResult.saturation
	local Value = WithDefaultsModuleResult.value
	local OnChangedFunction = WithDefaultsModuleResult.onChanged
	local OnDragStartedFunction = WithDefaultsModuleResult.onDragStarted
	local OnDragEnded = WithDefaultsModuleResult.onDragEnded
	local UseTokensModuleResult = UseTokensModule()
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 45 ]]
		-- upvalues: UseRefResult (copy), ColorUtilsModule (upval), OnChangedFunction (copy)
		local Current = UseRefResult.current
		
		if Current then
			local SVFromPosition, SVFromPosition2 = ColorUtilsModule.calculateSVFromPosition(p2, Current.AbsolutePosition, Current.AbsoluteSize)
			OnChangedFunction(SVFromPosition, SVFromPosition2)
			
			return
		end
	end, { OnChangedFunction })
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = "size-full radius-small",
		ClipsDescendants = true,
		ref = UseRefResult
	}), {
		DragDetector = ReactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[ReactModule.Event.DragStart] = ReactModule.useCallback(function(_, p2) --[[ Line: 57 ]]
				-- upvalues: OnDragStartedFunction (copy), UseResult (copy)
				if OnDragStartedFunction then
					OnDragStartedFunction()
				end
				UseResult(p2)
			end, { UseResult, OnDragStartedFunction }),
			[ReactModule.Event.DragContinue] = ReactModule.useCallback(function(_, p2) --[[ Line: 64 ]]
				-- upvalues: UseResult (copy)
				UseResult(p2)
			end, { UseResult }),
			[ReactModule.Event.DragEnd] = OnDragEnded
		}),
		Base = ReactModule.createElement("Frame", {
			ZIndex = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = UseTokensModuleResult.Color.Extended.White.White_100.Color3
		}),
		Saturation = ReactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Hue:map(function(Hue): Color3 --[[ Line: 40 ]]
				return Color3.fromHSV(Hue, 1, 1)
			end)
		}, {
			Gradient = ReactModule.createElement("UIGradient", {
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			})
		}),
		Value = ReactModule.createElement("Frame", {
			ZIndex = 3,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = UseTokensModuleResult.Color.Extended.Black.Black_100.Color3
		}, {
			Gradient = ReactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			})
		}),
		Knob = if WithDefaultsModuleResult.showSelectionKnob then ReactModule.createElement(KnobModule, {
			hasShadow = true,
			ZIndex = 4,
			size = InputSizeModule.Medium,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = ReactModule.joinBindings({ Saturation, Value }):map(function(Entry): UDim2 --[[ Line: 119 ]]
				return UDim2.fromScale(Entry[1], 1 - Entry[2])
			end),
			style = ReactModule.joinBindings({ Hue, Saturation, Value }):map(function(Entry) --[[ Line: 124 ]]
				return {
					Transparency = 0,
					Color3 = Color3.fromHSV(Entry[1], Entry[2], Entry[3])
				}
			end),
			stroke = {
				Color = UseTokensModuleResult.Color.System.Contrast.Color3,
				Thickness = UseTokensModuleResult.Stroke.Thicker,
				Transparency = UseTokensModuleResult.Color.System.Contrast.Transparency
			}
		}) else nil
	})
end