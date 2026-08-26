local runService = game:GetService("RunService")
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local eventConnection = require(parent_1.ReactUtils).EventConnection
local useStyleModule = require(parent.Core.Style.useStyle)

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useStyleModule (ref), reactModule (ref), eventConnection (ref), runService (ref)
	local var1 = useStyleModule()
	local selectionCursor = var1.Tokens.Component.SelectionCursor
	local reducedMotion = var1.Settings.ReducedMotion
	local colorSequence = ColorSequence.new({
		ColorSequenceKeypoint.new(0, selectionCursor.Gradient.Start.Color3),
		ColorSequenceKeypoint.new(1, selectionCursor.Gradient.End.Color3)
	})
	local numberSequence = NumberSequence.new({
		NumberSequenceKeypoint.new(0, selectionCursor.Gradient.Start.Transparency),
		NumberSequenceKeypoint.new(1, selectionCursor.Gradient.End.Transparency)
	})
	local var2, var3 = reactModule.useBinding(0)
	local var4, var5 = reactModule.useBinding(colorSequence)
	local var6, var7 = reactModule.useBinding(numberSequence)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(-p1.offset, -p1.offset),
		Size = UDim2.new(1, p1.offset * 2, 1, p1.offset * 2),
		ref = p2
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = p1.cornerRadius }),
		UIStroke = reactModule.createElement("UIStroke", {
			Transparency = 0,
			Color = Color3.new(1, 1, 1),
			Thickness = p1.borderWidth
		}, {
			UIGradient = reactModule.createElement("UIGradient", { Rotation = var2, Color = var4, Transparency = var6 })
		}),
		HeartbeatConnection = p1.isVisible and reactModule.createElement(eventConnection, {
			event = runService.Heartbeat,
			callback = function(_)
				-- upvalues: var2 (ref), colorSequence (ref), numberSequence (ref), reducedMotion (ref), var3 (ref), var5 (ref), var7 (ref)
				local var8 = var2:getValue() + 2
				local var9 = colorSequence
				local var10 = numberSequence
				
				if reducedMotion then
					local var11 = (math.sin(math.rad(var8)) + 1) / 2
					var9 = ColorSequence.new(var9.Keypoints[1].Value:Lerp(var9.Keypoints[#var9.Keypoints].Value, var11))
					local value = var10.Keypoints[1].Value
					var10 = NumberSequence.new(value + (var10.Keypoints[#var10.Keypoints].Value - value) * var11)
				end
				var3(var8)
				var5(var9)
				var7(var10)
			end
		})
	})
end))