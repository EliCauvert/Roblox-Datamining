local adPlayer = script:FindFirstAncestor("AdPlayer")

if require(adPlayer.Flags).GetEnableLuaRewardTimerUI() then
	local reactModule = require(adPlayer.Parent.React)
	
	local function transparencyGradient(p1)
		return NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(p1 - 0.001, 0),
			NumberSequenceKeypoint.new(p1 + 0.001, 1),
			NumberSequenceKeypoint.new(1, 1)
		})
	end
	
	local function rightRotation(p1)
		return math.clamp(p1 * 360, 0, 180)
	end
	
	local function _(p1)
		return math.clamp(p1 * 360 - 180, 0, 180)
	end
	
	return function(p1)
		-- upvalues: reactModule (ref), rightRotation (ref), transparencyGradient (ref)
		local thickness = p1.thickness or 3
		local var1 = if p1.children then table.clone(p1.children) else {}
		var1.rightClipper = reactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			ZIndex = 0,
			Size = UDim2.fromScale(0.5, 1),
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.fromScale(1, 0.5)
		}, {
			arc = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -thickness * 2, 1, -thickness * 2),
				SizeConstraint = Enum.SizeConstraint.RelativeYY,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0, 0.5)
			}, {
				corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
				stroke = reactModule.createElement("UIStroke", {
					Color = p1.ImageColor3,
					Transparency = p1.ImageTransparency,
					Thickness = thickness,
					Enabled = p1.alpha:map(function(p2)
						return math.clamp(p2 * 360, 0, 180) > 0
					end)
				}, {
					gradient = reactModule.createElement("UIGradient", {
						Rotation = p1.alpha:map(rightRotation),
						Transparency = transparencyGradient(0.5)
					})
				})
			})
		})
		var1.leftClipper = reactModule.createElement("Frame", {
			ClipsDescendants = true,
			BackgroundTransparency = 1,
			ZIndex = 0,
			Size = UDim2.fromScale(0.5, 1),
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5)
		}, {
			arc = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -thickness * 2, 1, -thickness * 2),
				SizeConstraint = Enum.SizeConstraint.RelativeYY,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(1, 0.5)
			}, {
				corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
				stroke = reactModule.createElement("UIStroke", {
					Color = p1.ImageColor3,
					Transparency = p1.ImageTransparency,
					Thickness = thickness,
					Enabled = p1.alpha:map(function(p2)
						return math.clamp(p2 * 360 - 180, 0, 180) > 0
					end)
				}, {
					gradient = reactModule.createElement("UIGradient", {
						Rotation = p1.alpha:map(function(p2)
							return math.clamp(p2 * 360 - 180, 0, 180) - 180
						end),
						Transparency = p1.alpha:map(function(p2)
							-- upvalues: transparencyGradient (copy)
							return transparencyGradient(math.clamp(math.clamp(p2 * 360 - 180, 0, 180) / 180, 0, 1) * 0.02 + 0.5)
						end)
					})
				})
			})
		})
		
		return reactModule.createElement("Frame", {
			Position = p1.Position,
			AnchorPoint = p1.AnchorPoint,
			Size = p1.Size,
			SizeConstraint = p1.SizeConstraint,
			BackgroundTransparency = p1.BackgroundTransparency,
			BackgroundColor3 = p1.BackgroundColor3,
			Rotation = p1.Rotation,
			ZIndex = p1.ZIndex,
			LayoutOrder = p1.LayoutOrder,
			Visible = p1.Visible
		}, var1)
	end
end
return nil