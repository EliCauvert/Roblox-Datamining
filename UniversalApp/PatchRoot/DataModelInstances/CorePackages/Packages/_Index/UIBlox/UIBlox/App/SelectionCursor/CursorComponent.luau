local RunService = game:GetService("RunService")
local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local EventConnection = require(Parent1.ReactUtils).EventConnection
local UseStyleModule = require(Parent.Core.Style.useStyle)

return ReactModule.memo((ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseStyleModule (copy), ReactModule (copy), EventConnection (copy), RunService (copy)
	local UseStyleModuleResult = UseStyleModule()
	local Selection = UseStyleModuleResult.Tokens.Color.Selection
	local ReducedMotion = UseStyleModuleResult.Settings.ReducedMotion
	local ColorSequence1 = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Selection.Start.Color3),
		ColorSequenceKeypoint.new(1, Selection.End.Color3)
	})
	local NumberSequence1 = NumberSequence.new({
		NumberSequenceKeypoint.new(0, Selection.Start.Transparency),
		NumberSequenceKeypoint.new(1, Selection.End.Transparency)
	})
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(ColorSequence1)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(NumberSequence1)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(-p1.offset, -p1.offset),
		Size = UDim2.new(1, p1.offset * 2, 1, p1.offset * 2),
		ref = Ref
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = p1.cornerRadius }),
		UIStroke = ReactModule.createElement("UIStroke", {
			Transparency = 0,
			Color = Color3.new(1, 1, 1),
			Thickness = p1.borderWidth
		}, {
			UIGradient = ReactModule.createElement("UIGradient", {
				Rotation = UseBindingResult,
				Color = UseBindingResult1,
				Transparency = UseBindingResult3
			})
		}),
		HeartbeatConnection = p1.isVisible and ReactModule.createElement(EventConnection, {
			event = RunService.Heartbeat,
			callback = function(_)
				-- upvalues: UseBindingResult (copy), ColorSequence1 (copy), NumberSequence1 (copy), ReducedMotion (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy), UseBindingResult2_2 (copy)
				local NewValue = UseBindingResult:getValue() + 2
				local ColorSequence2: ColorSequence = ColorSequence1
				local NumberSequence2: NumberSequence = NumberSequence1
				
				if ReducedMotion then
					local SineRatio = (math.sin((math.rad(NewValue))) + 1) / 2
					ColorSequence2 = ColorSequence.new(ColorSequence2.Keypoints[1].Value:Lerp(ColorSequence2.Keypoints[#ColorSequence2.Keypoints].Value, SineRatio))
					local Value = NumberSequence2.Keypoints[1].Value
					NumberSequence2 = NumberSequence.new(Value + (NumberSequence2.Keypoints[#NumberSequence2.Keypoints].Value - Value) * SineRatio)
				end
				UseBindingResult2(NewValue)
				UseBindingResult2_1(ColorSequence2)
				UseBindingResult2_2(NumberSequence2)
			end
		})
	})
end)))