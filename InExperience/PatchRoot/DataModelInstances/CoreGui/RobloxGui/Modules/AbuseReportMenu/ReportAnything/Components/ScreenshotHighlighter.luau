local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local images = UIBloxModule.App.ImageSet.Images

return function(p0) --[[ line: 25 | named "ScreenshotHighlighter" ]]
	-- upvalues: robloxGui (ref), reactModule (ref), imageSetButton (ref), images (ref)
	local absoluteSize = robloxGui.AbsoluteSize
	local var4 = (if absoluteSize.X < absoluteSize.Y then absoluteSize.X else absoluteSize.Y) / 5
	local var5, var6 = reactModule.useState(false)
	
	local var7 = function(p1, p2) --[[ line: 35 ]]
		-- upvalues: p0 (ref), var4 (ref)
		table.insert(p0.annotationPoints, (Vector2.new(p2.X, p2.Y) - p1.AbsolutePosition) / p1.AbsoluteSize)
		p0.setAnnotationCircleRadius(var4 * 0.5 / (if p1.AbsoluteSize.Y < p1.AbsoluteSize.X then p1.AbsoluteSize.X else p1.AbsoluteSize.Y))
		p0.setAnnotationAreaDimensions(p1.AbsoluteSize.X, p1.AbsoluteSize.Y)
		p0.handleAnnotationPoints(p0.annotationPoints)
	end
	
	local var8 = function(p3, p4) --[[ line: 47 ]]
		-- upvalues: p0 (ref), var6 (ref), var7 (ref)
		if p4.UserInputState == Enum.UserInputState.Begin and (p4.UserInputType == Enum.UserInputType.Touch or p4.UserInputType == Enum.UserInputType.MouseButton1) and #p0.annotationPoints < 25 then
			var6(true)
			var7(p3, p4.Position)
		end
	end
	
	local var9 = function(_, _) --[[ line: 57 ]] end
	
	local var10 = function(_, _) --[[ line: 69 ]]
		-- upvalues: var5 (ref), var6 (ref)
		if var5 then
			var6(false)
		end
	end
	
	local t = {}
	
	for i, v in ipairs(p0.annotationPoints) do
		t["point" .. i] = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(v.X, v.Y),
			Size = UDim2.fromOffset(var4, var4)
		}, {
			Border = reactModule.createElement(imageSetButton, {
				ImageTransparency = 0,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var4, var4),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = images["component_assets/circle_49_stroke_1"],
				ImageColor3 = Color3.fromHex("#3CF3E9")
			}),
			Background = reactModule.createElement(imageSetButton, {
				ImageTransparency = 0.6,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var4, var4),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = images["component_assets/circle_49"],
				ImageColor3 = Color3.fromHex("#3CF3E9")
			})
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		[reactModule.Event.InputBegan] = var8,
		[reactModule.Event.InputChanged] = var9,
		[reactModule.Event.InputEnded] = var10,
		ZIndex = 3
	}, t)
end