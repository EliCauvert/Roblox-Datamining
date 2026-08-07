local adPlayer = script:FindFirstAncestor("AdPlayer")

if require(adPlayer.Flags).GetEnableLuaRewardTimerUI() then
	local reactModule = require(adPlayer.Parent.React)
	
	local function transparencyGradient(p0) --[[ line: 33 ]]
		return NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(p0 - 0.001, 0),
			NumberSequenceKeypoint.new(p0 + 0.001, 1),
			NumberSequenceKeypoint.new(1, 1)
		})
	end
	
	local function rightRotation(p1) --[[ line: 42 ]]
		return math.clamp(p1 * 360, 0, 180)
	end
	
	local function _(p2) --[[ line: 46 | named "leftRotation" ]]
		return math.clamp(p2 * 360 - 180, 0, 180)
	end
	
	return function(p3) --[[ line: 50 ]]
		-- upvalues: reactModule (ref), rightRotation (ref), transparencyGradient (ref)
		local thickness = p3.thickness or 3
		local var5 = if p3.children then table.clone(p3.children) else {}
		var5.rightClipper = reactModule.createElement("Frame", {
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
					Color = p3.ImageColor3,
					Transparency = p3.ImageTransparency,
					Thickness = thickness,
					Enabled = p3.alpha:map(function(p4) --[[ line: 76 ]]
						return math.clamp(p4 * 360, 0, 180) > 0
					end)
				}, {
					gradient = reactModule.createElement("UIGradient", {
						Rotation = p3.alpha:map(rightRotation),
						Transparency = transparencyGradient(0.5)
					})
				})
			})
		})
		var5.leftClipper = reactModule.createElement("Frame", {
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
					Color = p3.ImageColor3,
					Transparency = p3.ImageTransparency,
					Thickness = thickness,
					Enabled = p3.alpha:map(function(p5) --[[ line: 110 ]]
						return math.clamp(p5 * 360 - 180, 0, 180) > 0
					end)
				}, {
					gradient = reactModule.createElement("UIGradient", {
						Rotation = p3.alpha:map(function(p6) --[[ line: 115 ]]
							return math.clamp(p6 * 360 - 180, 0, 180) - 180
						end),
						Transparency = p3.alpha:map(function(p7) --[[ line: 118 ]]
							-- upvalues: transparencyGradient (copy)
							return transparencyGradient(math.clamp(math.clamp(p7 * 360 - 180, 0, 180) / 180, 0, 1) * 0.02 + 0.5)
						end)
					})
				})
			})
		})
		
		return reactModule.createElement("Frame", {
			Position = p3.Position,
			AnchorPoint = p3.AnchorPoint,
			Size = p3.Size,
			SizeConstraint = p3.SizeConstraint,
			BackgroundTransparency = p3.BackgroundTransparency,
			BackgroundColor3 = p3.BackgroundColor3,
			Rotation = p3.Rotation,
			ZIndex = p3.ZIndex,
			LayoutOrder = p3.LayoutOrder,
			Visible = p3.Visible
		}, var5)
	end
end
return nil