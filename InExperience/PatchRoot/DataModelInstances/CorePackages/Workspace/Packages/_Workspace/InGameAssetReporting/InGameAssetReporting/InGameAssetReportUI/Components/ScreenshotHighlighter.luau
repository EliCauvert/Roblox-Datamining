local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local parent = script:FindFirstAncestor("InGameAssetReporting").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local images = UIBloxModule.App.ImageSet.Images

return function(p0)
	-- upvalues: robloxGui (ref), reactModule (ref), imageSetButton (ref), images (ref)
	local absoluteSize = robloxGui.AbsoluteSize
	local var3 = (if absoluteSize.X < absoluteSize.Y then absoluteSize.X else absoluteSize.Y) / 5
	local var4, var5 = reactModule.useState(false)
	
	local var6 = function(p1, p2)
		-- upvalues: var3 (ref), p0 (ref)
		p0.handleNewAnnotationPoint((Vector2.new(p2.X, p2.Y) - p1.AbsolutePosition) / p1.AbsoluteSize, var3 * 0.5 / (if p1.AbsoluteSize.Y < p1.AbsoluteSize.X then p1.AbsoluteSize.X else p1.AbsoluteSize.Y))
	end
	
	local var7 = function(p3, p4)
		-- upvalues: p0 (ref), var5 (ref), var6 (ref)
		if p4.UserInputState == Enum.UserInputState.Begin and (p4.UserInputType == Enum.UserInputType.Touch or p4.UserInputType == Enum.UserInputType.MouseButton1) then
			if #p0.annotationPoints < 5 then
				var5(true)
				var6(p3, p4.Position)
				
				return
			end
			p0.onExceedMaxAnnotationLimit()
		end
	end
	
	local var8 = function(_, _) end
	
	local var9 = function(_, _)
		-- upvalues: var4 (ref), var5 (ref)
		if var4 then
			var5(false)
		end
	end
	
	local t = {}
	
	for i, v in ipairs(p0.annotationPoints) do
		t["point" .. i] = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(v.X, v.Y),
			Size = UDim2.fromOffset(var3, var3)
		}, {
			Border = reactModule.createElement(imageSetButton, {
				ImageTransparency = 0,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var3, var3),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = images["component_assets/circle_49_stroke_1"],
				ImageColor3 = Color3.fromHex("#3CF3E9")
			}),
			Background = reactModule.createElement(imageSetButton, {
				ImageTransparency = 0.6,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var3, var3),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = images["component_assets/circle_49"],
				ImageColor3 = Color3.fromHex("#3CF3E9")
			})
		})
	end
	return reactModule.createElement("Frame", {
		Active = false,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		[reactModule.Event.InputBegan] = var7,
		[reactModule.Event.InputChanged] = var8,
		[reactModule.Event.InputEnded] = var9,
		ZIndex = 3
	}, t)
end