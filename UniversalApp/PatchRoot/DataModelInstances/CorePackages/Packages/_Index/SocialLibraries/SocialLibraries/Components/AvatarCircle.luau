local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Roact = DependenciesModule.Roact
local ImageSetLabel = DependenciesModule.UIBlox.Core.ImageSet.ImageSetLabel
local AvatarCircle = Roact.PureComponent:extend("AvatarCircle")
AvatarCircle.PresetSize = { Size36x36 = "Size36x36", Size48x48 = "Size48x48" }
local config = {
	[AvatarCircle.PresetSize.Size36x36] = "rbxasset://textures/ui/LuaChat/graphic/gr-profile-border-36x36.png",
	[AvatarCircle.PresetSize.Size48x48] = "rbxasset://textures/ui/LuaChat/graphic/gr-profile-border-48x48.png"
}
AvatarCircle.defaultProps = {
	onActivated = nil,
	circleTransparency = 0,
	circleInteriorBackgroundTransparency = 0,
	circleDividerTransparency = 0,
	presenceImage = nil,
	presenceIndicatorSize = 14,
	thumbnails = {},
	circleColor3 = Color3.new(0.9, 0.9, 0.9),
	circleInteriorBackgroundColor3 = Color3.new(0.8, 0.8, 0.8),
	circleDividerColor3 = Color3.new(0.7, 0.7, 0.7),
	overlaySize = AvatarCircle.PresetSize.Size48x48
}

local function createAlignedContainerElement(HorizontalAlignment) --[[ Line: 43 ]]
	-- upvalues: Roact (copy)
	return {
		layout = Roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = HorizontalAlignment,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
end

function AvatarCircle.generateThumbnails(p1, Thumbnails) --[[ Line: 54 ]]
	-- upvalues: Roact (copy), ImageSetLabel (copy), createAlignedContainerElement (copy)
	local CountThumbnails = #Thumbnails
	local Value = CountThumbnails / 2
	local Value1 = CountThumbnails % 2 == 0 and Value or math.floor(Value)
	local CountThumbnailsDelta = CountThumbnails - Value1
	local Element = if CountThumbnails == 1 then if p1.props.showNewPresenceImage then Roact.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, p1.props.presenceIndicatorSize, 0, p1.props.presenceIndicatorSize),
		Image = p1.props.presenceImage,
		ImageColor3 = p1.props.presenceImageColor3,
		ImageTransparency = p1.props.presenceImageTransparency
	}) else Roact.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, p1.props.presenceIndicatorSize, 0, p1.props.presenceIndicatorSize),
		Image = p1.props.presenceImage
	}) else nil
	local AlignedContainerElement = createAlignedContainerElement(Enum.HorizontalAlignment.Right)
	local AlignedContainerElement1 = createAlignedContainerElement(Enum.HorizontalAlignment.Left)
	local AlignedContainerElement2 = createAlignedContainerElement(Enum.HorizontalAlignment.Center)
	
	for i, thumbnail in ipairs(Thumbnails) do
		local XScale = 0
		local Frame = nil
		local _UDim2 = nil
		local Frames = nil
		
		if CountThumbnails == 1 then
			_UDim2 = UDim2.new(1, 0, 1, 0)
			Frames = AlignedContainerElement2
		elseif i <= Value1 then
			_UDim2 = UDim2.new(1 / Value1, 0, 1 / Value1, 0)
			Frames = AlignedContainerElement
			
			if CountThumbnails == 3 then
				XScale = 0.125
			elseif CountThumbnails == 2 then
				XScale = 0.125
			end
			Frame = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				border = Roact.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 2),
					Position = UDim2.new(0, 0, 1, -1),
					BackgroundColor3 = p1.props.circleDividerColor3,
					BackgroundTransparency = p1.props.circleDividerTransparency
				}),
				borderVertical = Roact.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, 2, 1, 0),
					Position = UDim2.new(0, -1, 0, 0),
					BackgroundColor3 = p1.props.circleDividerColor3,
					BackgroundTransparency = p1.props.circleDividerTransparency
				})
			})
		else
			_UDim2 = UDim2.new(1 / CountThumbnailsDelta, 0, 1 / CountThumbnailsDelta, 0)
			Frames = AlignedContainerElement1
			
			if CountThumbnails == 2 then
				XScale = -0.125
			end
			Frame = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				border = Roact.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 2),
					Position = UDim2.new(0, 0, 0, -1),
					BackgroundColor3 = p1.props.circleDividerColor3,
					BackgroundTransparency = p1.props.circleDividerTransparency
				}),
				borderVertical = Roact.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, 2, 1, 0),
					Position = UDim2.new(0, -1, 0, 0),
					BackgroundColor3 = p1.props.circleDividerColor3,
					BackgroundTransparency = p1.props.circleDividerTransparency
				})
			})
		end
		Frames["thumbnail-" .. tostring(i + 1)] = Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = _UDim2,
			LayoutOrder = #Frames + 1
		}, {
			headshotContainer = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(XScale, 0, 0, 0)
			}, {
				headshot = Roact.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Image = thumbnail
				})
			}),
			borderObject = Frame
		})
	end
	return {
		rightElements = AlignedContainerElement1,
		leftElements = AlignedContainerElement,
		centerElements = AlignedContainerElement2,
		presenceIndicator = Element
	}
end

function AvatarCircle.render(p2) --[[ Line: 195 ]]
	-- upvalues: config (copy), Roact (copy)
	local Thumbnails = p2:generateThumbnails(p2.props.thumbnails)
	
	return Roact.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = p2.props.circleInteriorBackgroundColor3,
		BackgroundTransparency = p2.props.circleInteriorBackgroundTransparency,
		BorderSizePixel = 0,
		Image = "",
		AutoButtonColor = false,
		ClipsDescendants = true,
		[Roact.Event.Activated] = p2.props.onActivated
	}, {
		imageMask = Roact.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Image = config[p2.props.overlaySize],
			ImageColor3 = p2.props.circleColor3,
			ImageTransparency = p2.props.circleTransparency,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			presenceFrame = Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				layout = Roact.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Bottom
				}),
				presenceIndicator = Thumbnails.presenceIndicator
			})
		}),
		center = Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			elementContainer = Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, Thumbnails.centerElements)
		}),
		left = Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -1, 1, 0),
			Position = UDim2.new(-0.5, 0, 0, 0)
		}, {
			elementContainer = Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, Thumbnails.leftElements)
		}),
		right = Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -1, 1, 0),
			Position = UDim2.new(0.5, -2, 0, 0)
		}, {
			elementContainer = Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, Thumbnails.rightElements)
		})
	})
end

return AvatarCircle