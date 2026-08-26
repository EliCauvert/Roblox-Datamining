local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local images = UIBloxModule.App.ImageSet.Images

return function(p1)
	-- upvalues: robloxGui (ref), reactModule (ref), imageSetButton (ref), images (ref)
	local absoluteSize = robloxGui.AbsoluteSize
	local var1 = (if absoluteSize.X < absoluteSize.Y then absoluteSize.X else absoluteSize.Y) / 5
	local var2, var3 = reactModule.useState(false)
	
	local var4 = function(p2, p3)
		-- upvalues: p1 (ref), var1 (ref)
		table.insert(p1.annotationPoints, (Vector2.new(p3.X, p3.Y) - p2.AbsolutePosition) / p2.AbsoluteSize)
		p1.setAnnotationCircleRadius(var1 * 0.5 / (if p2.AbsoluteSize.Y < p2.AbsoluteSize.X then p2.AbsoluteSize.X else p2.AbsoluteSize.Y))
		p1.setAnnotationAreaDimensions(p2.AbsoluteSize.X, p2.AbsoluteSize.Y)
		p1.handleAnnotationPoints(p1.annotationPoints)
	end
	
	local var5 = function(p2, p3)
		-- upvalues: p1 (ref), var3 (ref), var4 (ref)
		if p3.UserInputState == Enum.UserInputState.Begin and (p3.UserInputType == Enum.UserInputType.Touch or p3.UserInputType == Enum.UserInputType.MouseButton1) and #p1.annotationPoints < 25 then
			var3(true)
			var4(p2, p3.Position)
		end
	end
	
	local var6 = function(_, _) end
	
	local var7 = function(_, _)
		-- upvalues: var2 (ref), var3 (ref)
		if var2 then
			var3(false)
		end
	end
	
	local t = {}
	
	for i, v in ipairs(p1.annotationPoints) do
		t["point" .. i] = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(v.X, v.Y),
			Size = UDim2.fromOffset(var1, var1)
		}, {
			Border = reactModule.createElement(imageSetButton, {
				ImageTransparency = 0,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var1, var1),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = images["component_assets/circle_49_stroke_1"],
				ImageColor3 = Color3.fromHex("#3CF3E9")
			}),
			Background = reactModule.createElement(imageSetButton, {
				ImageTransparency = 0.6,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var1, var1),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = images["component_assets/circle_49"],
				ImageColor3 = Color3.fromHex("#3CF3E9")
			})
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		[reactModule.Event.InputBegan] = var5,
		[reactModule.Event.InputChanged] = var6,
		[reactModule.Event.InputEnded] = var7,
		ZIndex = 3
	}, t)
end