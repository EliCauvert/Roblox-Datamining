local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local getFIntRAMaxAnnotationCountModule = require(script.Parent.Parent.Parent.Flags.GetFIntRAMaxAnnotationCount)
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local images = UIBloxModule.App.ImageSet.Images

return function(p0)
	-- upvalues: robloxGui (ref), reactModule (ref), getFIntRAMaxAnnotationCountModule (ref), imageSetButton (ref), images (ref)
	local absoluteSize = robloxGui.AbsoluteSize
	local var5 = (if absoluteSize.X < absoluteSize.Y then absoluteSize.X else absoluteSize.Y) / 5
	local var6, var7 = reactModule.useState(false)
	
	local var8 = function(p1, p2)
		-- upvalues: p0 (ref), var5 (ref)
		table.insert(p0.annotationPoints, (Vector2.new(p2.X, p2.Y) - p1.AbsolutePosition) / p1.AbsoluteSize)
		p0.setAnnotationCircleRadius(var5 * 0.5 / (if p1.AbsoluteSize.Y < p1.AbsoluteSize.X then p1.AbsoluteSize.X else p1.AbsoluteSize.Y))
		p0.setAspectRatioDimensions(p1.AbsoluteSize.X, p1.AbsoluteSize.Y)
		p0.handleAnnotationPoints(p0.annotationPoints)
	end
	
	local var9 = function(p3, p4)
		-- upvalues: p0 (ref), getFIntRAMaxAnnotationCountModule (copy), var7 (ref), var8 (ref)
		if p4.UserInputState == Enum.UserInputState.Begin and (p4.UserInputType == Enum.UserInputType.Touch or p4.UserInputType == Enum.UserInputType.MouseButton1) and #p0.annotationPoints < getFIntRAMaxAnnotationCountModule() then
			var7(true)
			var8(p3, p4.Position)
		end
	end
	
	local var10 = function(_, _) end
	
	local var11 = function(_, _)
		-- upvalues: var6 (ref), var7 (ref)
		if var6 then
			var7(false)
		end
	end
	
	local t = {}
	
	for i, v in ipairs(p0.annotationPoints) do
		t["point" .. i] = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(v.X, v.Y),
			Size = UDim2.fromOffset(var5, var5)
		}, {
			Border = reactModule.createElement(imageSetButton, {
				ImageTransparency = 0,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var5, var5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = images["component_assets/circle_49_stroke_1"],
				ImageColor3 = Color3.fromHex("#3CF3E9")
			}),
			Background = reactModule.createElement(imageSetButton, {
				ImageTransparency = 0.6,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var5, var5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = images["component_assets/circle_49"],
				ImageColor3 = Color3.fromHex("#3CF3E9")
			})
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		[reactModule.Event.InputBegan] = var9,
		[reactModule.Event.InputChanged] = var10,
		[reactModule.Event.InputEnded] = var11,
		ZIndex = 3
	}, t)
end