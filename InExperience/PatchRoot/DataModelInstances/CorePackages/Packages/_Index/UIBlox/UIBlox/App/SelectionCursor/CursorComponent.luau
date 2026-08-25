local runService = game:GetService("RunService")
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local eventConnection = require(parent_1.ReactUtils).EventConnection
local useStyleModule = require(parent.Core.Style.useStyle)

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: useStyleModule (ref), reactModule (ref), eventConnection (ref), runService (ref)
	local var3 = useStyleModule()
	local selectionCursor = var3.Tokens.Component.SelectionCursor
	local reducedMotion = var3.Settings.ReducedMotion
	local colorSequence = ColorSequence.new({
		ColorSequenceKeypoint.new(0, selectionCursor.Gradient.Start.Color3),
		ColorSequenceKeypoint.new(1, selectionCursor.Gradient.End.Color3)
	})
	local numberSequence = NumberSequence.new({
		NumberSequenceKeypoint.new(0, selectionCursor.Gradient.Start.Transparency),
		NumberSequenceKeypoint.new(1, selectionCursor.Gradient.End.Transparency)
	})
	local var6, var7 = reactModule.useBinding(0)
	local var8, var9 = reactModule.useBinding(colorSequence)
	local var10, var11 = reactModule.useBinding(numberSequence)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(-p0.offset, -p0.offset),
		Size = UDim2.new(1, p0.offset * 2, 1, p0.offset * 2),
		ref = p1
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = p0.cornerRadius }),
		UIStroke = reactModule.createElement("UIStroke", {
			Transparency = 0,
			Color = Color3.new(1, 1, 1),
			Thickness = p0.borderWidth
		}, {
			UIGradient = reactModule.createElement("UIGradient", { Rotation = var6, Color = var8, Transparency = var10 })
		}),
		HeartbeatConnection = p0.isVisible and reactModule.createElement(eventConnection, {
			event = runService.Heartbeat,
			callback = function(_)
				-- upvalues: var6 (ref), colorSequence (ref), numberSequence (ref), reducedMotion (ref), var7 (ref), var9 (ref), var11 (ref)
				local var12 = var6:getValue() + 2
				local var13 = colorSequence
				local var14 = numberSequence
				
				if reducedMotion then
					local var15 = (math.sin(math.rad(var12)) + 1) / 2
					var13 = ColorSequence.new(var13.Keypoints[1].Value:Lerp(var13.Keypoints[#var13.Keypoints].Value, var15))
					local value = var14.Keypoints[1].Value
					var14 = NumberSequence.new(value + (var14.Keypoints[#var14.Keypoints].Value - value) * var15)
				end
				var7(var12)
				var9(var13)
				var11(var14)
			end
		})
	})
end))