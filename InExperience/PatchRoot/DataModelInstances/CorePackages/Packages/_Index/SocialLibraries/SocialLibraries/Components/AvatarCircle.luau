local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local imageSetLabel = dependenciesModule.UIBlox.Core.ImageSet.ImageSetLabel
local avatarCircle = roact.PureComponent:extend("AvatarCircle")
avatarCircle.PresetSize = { Size36x36 = "Size36x36", Size48x48 = "Size48x48" }
local t = {
	[avatarCircle.PresetSize.Size36x36] = "rbxasset://textures/ui/LuaChat/graphic/gr-profile-border-36x36.png",
	[avatarCircle.PresetSize.Size48x48] = "rbxasset://textures/ui/LuaChat/graphic/gr-profile-border-48x48.png"
}
avatarCircle.defaultProps = {
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
	overlaySize = avatarCircle.PresetSize.Size48x48
}

local function createAlignedContainerElement(p0) --[[ line: 43 ]]
	-- upvalues: roact (ref)
	return {
		layout = roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = p0,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
end

function avatarCircle.generateThumbnails(p1, p2) --[[ line: 54 ]]
	-- upvalues: roact (ref), imageSetLabel (ref), createAlignedContainerElement (ref)
	local p2Count = #p2
	local var5 = p2Count / 2
	local var6 = if p2Count % 2 == 0 then var5 else math.floor(var5)
	local var7 = p2Count - var6
	local var8 = if p2Count == 1 then if p1.props.showNewPresenceImage then roact.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, p1.props.presenceIndicatorSize, 0, p1.props.presenceIndicatorSize),
		Image = p1.props.presenceImage,
		ImageColor3 = p1.props.presenceImageColor3,
		ImageTransparency = p1.props.presenceImageTransparency
	}) else roact.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, p1.props.presenceIndicatorSize, 0, p1.props.presenceIndicatorSize),
		Image = p1.props.presenceImage
	}) else nil
	local var9 = createAlignedContainerElement(Enum.HorizontalAlignment.Right)
	local var10 = createAlignedContainerElement(Enum.HorizontalAlignment.Left)
	local var11 = createAlignedContainerElement(Enum.HorizontalAlignment.Center)
	
	for i, v in ipairs(p2) do
		local uDim2, var15
		local _ = nil
		local var12 = 0
		local _ = nil
		local frame = nil
		
		if p2Count == 1 then
			uDim2 = UDim2.new(1, 0, 1, 0)
			var15 = var11
			var15["thumbnail-" .. tostring(i + 1)] = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = uDim2,
				LayoutOrder = #var15 + 1
			}, {
				headshotContainer = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Position = UDim2.new(var12, 0, 0, 0)
				}, {
					headshot = roact.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 1, 0),
						Image = v
					})
				}),
				borderObject = frame
			})
		end
		if i <= var6 then
			uDim2 = UDim2.new(1 / var6, 0, 1 / var6, 0)
			var15 = var9
			
			if p2Count == 3 then
				var12 = 0.125
			elseif p2Count == 2 then
				var12 = 0.125
			end
			frame = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				border = roact.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 2),
					Position = UDim2.new(0, 0, 1, -1),
					BackgroundColor3 = p1.props.circleDividerColor3,
					BackgroundTransparency = p1.props.circleDividerTransparency
				}),
				borderVertical = roact.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, 2, 1, 0),
					Position = UDim2.new(0, -1, 0, 0),
					BackgroundColor3 = p1.props.circleDividerColor3,
					BackgroundTransparency = p1.props.circleDividerTransparency
				})
			})
		else
			uDim2 = UDim2.new(1 / var7, 0, 1 / var7, 0)
			var15 = var10
			
			if p2Count == 2 then
				var12 = -0.125
			end
			frame = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				border = roact.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 2),
					Position = UDim2.new(0, 0, 0, -1),
					BackgroundColor3 = p1.props.circleDividerColor3,
					BackgroundTransparency = p1.props.circleDividerTransparency
				}),
				borderVertical = roact.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, 2, 1, 0),
					Position = UDim2.new(0, -1, 0, 0),
					BackgroundColor3 = p1.props.circleDividerColor3,
					BackgroundTransparency = p1.props.circleDividerTransparency
				})
			})
		end
	end
	return {
		rightElements = var10,
		leftElements = var9,
		centerElements = var11,
		presenceIndicator = var8
	}
end

function avatarCircle.render(p3) --[[ line: 195 ]]
	-- upvalues: t (ref), roact (ref)
	local thumbnails = p3:generateThumbnails(p3.props.thumbnails)
	
	return roact.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = p3.props.circleInteriorBackgroundColor3,
		BackgroundTransparency = p3.props.circleInteriorBackgroundTransparency,
		BorderSizePixel = 0,
		Image = "",
		AutoButtonColor = false,
		ClipsDescendants = true,
		[roact.Event.Activated] = p3.props.onActivated
	}, {
		imageMask = roact.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Image = t[p3.props.overlaySize],
			ImageColor3 = p3.props.circleColor3,
			ImageTransparency = p3.props.circleTransparency,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			presenceFrame = roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				layout = roact.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Bottom
				}),
				presenceIndicator = thumbnails.presenceIndicator
			})
		}),
		center = roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			elementContainer = roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, thumbnails.centerElements)
		}),
		left = roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -1, 1, 0),
			Position = UDim2.new(-0.5, 0, 0, 0)
		}, {
			elementContainer = roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, thumbnails.leftElements)
		}),
		right = roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -1, 1, 0),
			Position = UDim2.new(0.5, -2, 0, 0)
		}, {
			elementContainer = roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, thumbnails.rightElements)
		})
	})
end

return avatarCircle