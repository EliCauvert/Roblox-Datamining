local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Parent = script:FindFirstAncestor("InGameAssetReporting").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local Images = UIBloxModule.App.ImageSet.Images

return function(p1)
	-- upvalues: RobloxGui (copy), ReactModule (copy), ImageSetButton (copy), Images (copy)
	local AbsoluteSize = RobloxGui.AbsoluteSize
	local XOffset = (AbsoluteSize.X < AbsoluteSize.Y and AbsoluteSize.X or AbsoluteSize.Y) / 5
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	local function v9(Frame: Frame, Position)
		-- upvalues: XOffset (copy), p1 (copy)
		p1.handleNewAnnotationPoint((Vector2.new(Position.X, Position.Y) - Frame.AbsolutePosition) / Frame.AbsoluteSize, XOffset * 0.5 / (if Frame.AbsoluteSize.Y < Frame.AbsoluteSize.X then Frame.AbsoluteSize.X else Frame.AbsoluteSize.Y))
	end
	
	local function v10(Frame, Input)
		-- upvalues: p1 (copy), UseStateResult2 (copy), v9 (copy)
		local IsUserInputTypeMatch = Input.UserInputType == Enum.UserInputType.Touch
		local IsUserInputTypeMatch1 = Input.UserInputType == Enum.UserInputType.MouseButton1
		
		if Input.UserInputState == Enum.UserInputState.Begin and (IsUserInputTypeMatch or IsUserInputTypeMatch1) then
			if #p1.annotationPoints < 5 then
				UseStateResult2(true)
				v9(Frame, Input.Position)
				
				return
			else
				p1.onExceedMaxAnnotationLimit()
			end
		end
	end
	
	local function v11(_, _) end
	
	local function v12(_, _)
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
		Active = false,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		[ReactModule.Event.InputBegan] = v10,
		[ReactModule.Event.InputChanged] = v11,
		[ReactModule.Event.InputEnded] = v12,
		ZIndex = 3
	}, Frames)
end