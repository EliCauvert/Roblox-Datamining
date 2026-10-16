local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ReactModule = require(CorePackages.Packages.React)
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local Images = UIBloxModule.App.ImageSet.Images

return function(p1) --[[ Line: 25 | Named "ScreenshotHighlighter" ]]
	-- upvalues: RobloxGui (copy), ReactModule (copy), ImageSetButton (copy), Images (copy)
	local AbsoluteSize = RobloxGui.AbsoluteSize
	local XOffset = (AbsoluteSize.X < AbsoluteSize.Y and AbsoluteSize.X or AbsoluteSize.Y) / 5
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	local function v9(Frame: Frame, Position) --[[ Line: 35 ]]
		-- upvalues: p1 (copy), XOffset (copy)
		table.insert(p1.annotationPoints, (Vector2.new(Position.X, Position.Y) - Frame.AbsolutePosition) / Frame.AbsoluteSize)
		p1.setAnnotationCircleRadius(XOffset * 0.5 / (if Frame.AbsoluteSize.Y < Frame.AbsoluteSize.X then Frame.AbsoluteSize.X else Frame.AbsoluteSize.Y))
		p1.setAnnotationAreaDimensions(Frame.AbsoluteSize.X, Frame.AbsoluteSize.Y)
		p1.handleAnnotationPoints(p1.annotationPoints)
	end
	
	local function v10(Frame, Input) --[[ Line: 47 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy), v9 (copy)
		local IsUserInputTypeMatch = Input.UserInputType == Enum.UserInputType.Touch
		local IsUserInputTypeMatch1 = Input.UserInputType == Enum.UserInputType.MouseButton1
		
		if Input.UserInputState == Enum.UserInputState.Begin and (IsUserInputTypeMatch or IsUserInputTypeMatch1) and #p1.annotationPoints < 25 then
			UseStateResult2(true)
			v9(Frame, Input.Position)
		end
	end
	
	local function v11(_, _) --[[ Line: 57 ]] end
	
	local function v12(_, _) --[[ Line: 69 ]]
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
		if UseStateResult then
			UseStateResult2(false)
		end
	end
	
	local Frames = {}
	
	for i, annotationPoint in ipairs(p1.annotationPoints) do
		Frames["point" .. i] = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(annotationPoint.X, annotationPoint.Y),
			Size = UDim2.fromOffset(XOffset, XOffset)
		}, {
			Border = ReactModule.createElement(ImageSetButton, {
				ImageTransparency = 0,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(XOffset, XOffset),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = Images["component_assets/circle_49_stroke_1"],
				ImageColor3 = Color3.fromHex("#3CF3E9")
			}),
			Background = ReactModule.createElement(ImageSetButton, {
				ImageTransparency = 0.6,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(XOffset, XOffset),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = Images["component_assets/circle_49"],
				ImageColor3 = Color3.fromHex("#3CF3E9")
			})
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		[ReactModule.Event.InputBegan] = v10,
		[ReactModule.Event.InputChanged] = v11,
		[ReactModule.Event.InputEnded] = v12,
		ZIndex = 3
	}, Frames)
end