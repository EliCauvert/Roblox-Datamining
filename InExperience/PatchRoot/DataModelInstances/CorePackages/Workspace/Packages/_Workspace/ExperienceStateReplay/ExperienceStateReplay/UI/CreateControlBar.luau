return {
	createControlBar = function(helpBar) --[[ line: 4 ]]
		helpBar.ControlBarContainer = Instance.new("Frame")
		helpBar.ControlBarContainer.Name = "ControlBarContainer"
		helpBar.ControlBarContainer.BackgroundTransparency = 1
		helpBar.ControlBarContainer.BorderSizePixel = 0
		helpBar.ControlBarContainer.AnchorPoint = Vector2.new(0, 1)
		helpBar.ControlBarContainerVisiblePosition = UDim2.new(0, 0, 1, 0)
		helpBar.ControlBarContainerNonVisiblePosition = UDim2.new(0, 0, 1.2, 0)
		helpBar.ControlBarContainer.Position = helpBar.ControlBarContainerVisiblePosition
		helpBar.maxControlBarHeight = 45
		helpBar.ControlBarContainer.Size = UDim2.new(1, 0, 0, helpBar.maxControlBarHeight)
		helpBar.ControlBarContainer.Parent = helpBar.screenGui
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		UIAspectRatioConstraint.AspectRatio = 30
		UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
		UIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Width
		UIAspectRatioConstraint.Parent = helpBar.ControlBarContainer
		helpBar.defaultBackgroundColor3 = Color3.fromRGB(20, 20, 20)
		helpBar.defaultBackgroundTransparency = 0.15
		helpBar.defaultButtonsTimeControlBarXSize = 0.275
		helpBar.defaultHelpBarXSize = 0.025
		helpBar.defaultScrubberControlBarXSize = 1 - helpBar.defaultButtonsTimeControlBarXSize - helpBar.defaultHelpBarXSize
		helpBar.ButtonsTimeControlBar = Instance.new("Frame")
		helpBar.ButtonsTimeControlBar.Name = "ButtonsTimeControlBar"
		helpBar.ButtonsTimeControlBar.BackgroundColor3 = helpBar.defaultBackgroundColor3
		helpBar.ButtonsTimeControlBar.BackgroundTransparency = helpBar.defaultBackgroundTransparency
		helpBar.ButtonsTimeControlBar.BorderSizePixel = 0
		helpBar.ButtonsTimeControlBar.SizeConstraint = Enum.SizeConstraint.RelativeXY
		helpBar.ButtonsTimeControlBar.Size = UDim2.new(helpBar.defaultButtonsTimeControlBarXSize, 0, 1, 0)
		helpBar.ButtonsTimeControlBar.Parent = helpBar.ControlBarContainer
		local UIPadding = Instance.new("UIPadding")
		UIPadding.PaddingLeft = UDim.new(0.02, 0)
		UIPadding.Parent = helpBar.ButtonsTimeControlBar
		helpBar.ScrubberControlBar = Instance.new("Frame")
		helpBar.ScrubberControlBar.Name = "ScrubberControlBar"
		helpBar.ScrubberControlBar.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		helpBar.ScrubberControlBar.BackgroundTransparency = 0.5
		helpBar.ScrubberControlBar.BorderSizePixel = 0
		helpBar.ScrubberControlBar.SizeConstraint = Enum.SizeConstraint.RelativeXY
		helpBar.ScrubberControlBar.Size = UDim2.new(helpBar.defaultScrubberControlBarXSize, 0, 1, 0)
		helpBar.ScrubberControlBar.Parent = helpBar.ControlBarContainer
		local UIFlexItem = Instance.new("UIFlexItem")
		UIFlexItem.FlexMode = Enum.UIFlexMode.Fill
		UIFlexItem.Parent = helpBar.ScrubberControlBar
		helpBar.HelpBar = Instance.new("Frame")
		helpBar.HelpBar.Name = "HelpBar"
		helpBar.HelpBar.BackgroundColor3 = helpBar.defaultBackgroundColor3
		helpBar.HelpBar.BackgroundTransparency = helpBar.defaultBackgroundTransparency
		helpBar.HelpBar.BorderSizePixel = 0
		helpBar.HelpBar.SizeConstraint = Enum.SizeConstraint.RelativeXY
		helpBar.HelpBar.Size = UDim2.new(helpBar.defaultHelpBarXSize, 0, 1, 0)
		helpBar.HelpBar.Parent = helpBar.ControlBarContainer
		helpBar.maxViewportScalingWidth = helpBar.maxControlBarHeight * UIAspectRatioConstraint.AspectRatio
		
		local function setupControlBarScaling() --[[ line: 73 ]]
			-- upvalues: helpBar (ref), UIAspectRatioConstraint (ref), UIPadding (ref)
			helpBar.firstThresholdCheck = true
			helpBar.lastCheckAboveThreshold = false
			local currentCamera = workspace.CurrentCamera
			
			if currentCamera then
				currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ line: 81 ]]
					-- upvalues: currentCamera (ref), helpBar (copy), UIAspectRatioConstraint (copy), UIPadding (copy)
					if helpBar.maxViewportScalingWidth < currentCamera.ViewportSize.X then
						if not helpBar.firstBoundaryCheck and helpBar.lastCheckAboveThreshold then return end
						helpBar.lastCheckAboveThreshold = true
						UIAspectRatioConstraint.Parent = nil
						UIPadding.PaddingLeft = UDim.new(0, helpBar.ButtonsTimeControlBar.AbsoluteSize.X * UIPadding.PaddingLeft.Scale + UIPadding.PaddingLeft.Offset)
						helpBar.ButtonsTimeControlBar.Size = UDim2.new(0, helpBar.ButtonsTimeControlBar.AbsoluteSize.X, 1, 0)
						helpBar.HelpBar.Size = UDim2.new(0, helpBar.HelpBar.AbsoluteSize.X, 1, 0)
					elseif not helpBar.firstBoundaryCheck and not helpBar.lastCheckAboveThreshold then return end
					helpBar.lastCheckAboveThreshold = false
					UIAspectRatioConstraint.Parent = helpBar.ControlBarContainer
					UIPadding.PaddingLeft = UDim.new(0.02, 0)
					helpBar.ButtonsTimeControlBar.Size = UDim2.new(helpBar.defaultButtonsTimeControlBarXSize, 0, 1, 0)
					helpBar.HelpBar.Size = UDim2.new(helpBar.defaultHelpBarXSize, 0, 1, 0)
					helpBar.firstBoundaryCheck = false
				end)
				
				return
			end
			warn("No current camera found in workspace")
		end
		
		setupControlBarScaling()
		workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(setupControlBarScaling)
		
		function helpBar.createUIListLayout(p1, p2) --[[ line: 124 ]]
			local UIListLayout = Instance.new("UIListLayout")
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			UIListLayout.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout.Padding = UDim.new(0, p2)
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Parent = p1
			
			return UIListLayout
		end
		
		helpBar.createUIListLayout(helpBar.ControlBarContainer, 0)
		helpBar.createUIListLayout(helpBar.ButtonsTimeControlBar, 7.5)
	end
}