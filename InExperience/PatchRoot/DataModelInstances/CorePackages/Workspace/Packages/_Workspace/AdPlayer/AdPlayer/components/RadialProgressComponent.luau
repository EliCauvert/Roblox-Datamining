local AdPlayer = script:FindFirstAncestor("AdPlayer")

if require(AdPlayer.Flags).GetEnableLuaRewardTimerUI() then
	local ReactModule = require(AdPlayer.Parent.React)
	
	local function transparencyGradient(NewClampedValue: number): NumberSequence --[[ Line: 33 ]]
		return NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(NewClampedValue - 0.001, 0),
			NumberSequenceKeypoint.new(NewClampedValue + 0.001, 1),
			NumberSequenceKeypoint.new(1, 1)
		})
	end
	
	local function rightRotation(p1: number): number --[[ Line: 42 ]]
		return (math.clamp(p1 * 360, 0, 180))
	end
	
	local function _(p1: number): number --[[ Line: 46 | Named "leftRotation" ]]
		return (math.clamp(p1 * 360 - 180, 0, 180))
	end
	
	return function(Frame: Frame) --[[ Line: 50 ]]
		-- upvalues: ReactModule (copy), rightRotation (copy), transparencyGradient (copy)
		local Thickness = Frame.thickness or 3
		local Copy = if Frame.children then table.clone(Frame.children) else {}
		Copy.rightClipper = ReactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			ZIndex = 0,
			Size = UDim2.fromScale(0.5, 1),
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.fromScale(1, 0.5)
		}, {
			arc = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -Thickness * 2, 1, -Thickness * 2),
				SizeConstraint = Enum.SizeConstraint.RelativeYY,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0, 0.5)
			}, {
				corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
				stroke = ReactModule.createElement("UIStroke", {
					Color = Frame.ImageColor3,
					Transparency = Frame.ImageTransparency,
					Thickness = Thickness,
					Enabled = Frame.alpha:map(function(p1: number): boolean --[[ Line: 76 ]]
						return math.clamp(p1 * 360, 0, 180) > 0
					end)
				}, {
					gradient = ReactModule.createElement("UIGradient", {
						Rotation = Frame.alpha:map(rightRotation),
						Transparency = transparencyGradient(0.5)
					})
				})
			})
		})
		Copy.leftClipper = ReactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			ZIndex = 0,
			Size = UDim2.fromScale(0.5, 1),
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5)
		}, {
			arc = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -Thickness * 2, 1, -Thickness * 2),
				SizeConstraint = Enum.SizeConstraint.RelativeYY,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(1, 0.5)
			}, {
				corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
				stroke = ReactModule.createElement("UIStroke", {
					Color = Frame.ImageColor3,
					Transparency = Frame.ImageTransparency,
					Thickness = Thickness,
					Enabled = Frame.alpha:map(function(p1: number): boolean --[[ Line: 110 ]]
						return math.clamp(p1 * 360 - 180, 0, 180) > 0
					end)
				}, {
					gradient = ReactModule.createElement("UIGradient", {
						Rotation = Frame.alpha:map(function(p1: number): number --[[ Line: 115 ]]
							return math.clamp(p1 * 360 - 180, 0, 180) - 180
						end),
						Transparency = Frame.alpha:map(function(p1: number) --[[ Line: 118 ]]
							-- upvalues: transparencyGradient (upval)
							return transparencyGradient(math.clamp(math.clamp(p1 * 360 - 180, 0, 180) / 180, 0, 1) * 0.02 + 0.5)
						end)
					})
				})
			})
		})
		
		return ReactModule.createElement("Frame", {
			Position = Frame.Position,
			AnchorPoint = Frame.AnchorPoint,
			Size = Frame.Size,
			SizeConstraint = Frame.SizeConstraint,
			BackgroundTransparency = Frame.BackgroundTransparency,
			BackgroundColor3 = Frame.BackgroundColor3,
			Rotation = Frame.Rotation,
			ZIndex = Frame.ZIndex,
			LayoutOrder = Frame.LayoutOrder,
			Visible = Frame.Visible
		}, Copy)
	end
else
	return nil
end