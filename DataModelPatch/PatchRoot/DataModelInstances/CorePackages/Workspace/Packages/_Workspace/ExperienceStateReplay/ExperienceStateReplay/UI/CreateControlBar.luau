return {
	createControlBar = function(p1)
		p1.ControlBarContainer = Instance.new("Frame")
		p1.ControlBarContainer.Name = "ControlBarContainer"
		p1.ControlBarContainer.BackgroundTransparency = 1
		p1.ControlBarContainer.BorderSizePixel = 0
		p1.ControlBarContainer.AnchorPoint = Vector2.new(0, 1)
		p1.ControlBarContainerVisiblePosition = UDim2.new(0, 0, 1, 0)
		p1.ControlBarContainerNonVisiblePosition = UDim2.new(0, 0, 1.2, 0)
		p1.ControlBarContainer.Position = p1.ControlBarContainerVisiblePosition
		p1.maxControlBarHeight = 45
		p1.ControlBarContainer.Size = UDim2.new(1, 0, 0, p1.maxControlBarHeight)
		p1.ControlBarContainer.Parent = p1.screenGui
		local AspectRatio = Instance.new("UIAspectRatioConstraint")
		AspectRatio.AspectRatio = 30
		AspectRatio.AspectType = Enum.AspectType.ScaleWithParentSize
		AspectRatio.DominantAxis = Enum.DominantAxis.Width
		AspectRatio.Parent = p1.ControlBarContainer
		p1.defaultBackgroundColor3 = Color3.fromRGB(20, 20, 20)
		p1.defaultBackgroundTransparency = 0.15
		p1.defaultButtonsTimeControlBarXSize = 0.275
		p1.defaultHelpBarXSize = 0.025
		p1.defaultScrubberControlBarXSize = 1 - p1.defaultButtonsTimeControlBarXSize - p1.defaultHelpBarXSize
		p1.ButtonsTimeControlBar = Instance.new("Frame")
		p1.ButtonsTimeControlBar.Name = "ButtonsTimeControlBar"
		p1.ButtonsTimeControlBar.BackgroundColor3 = p1.defaultBackgroundColor3
		p1.ButtonsTimeControlBar.BackgroundTransparency = p1.defaultBackgroundTransparency
		p1.ButtonsTimeControlBar.BorderSizePixel = 0
		p1.ButtonsTimeControlBar.SizeConstraint = Enum.SizeConstraint.RelativeXY
		p1.ButtonsTimeControlBar.Size = UDim2.new(p1.defaultButtonsTimeControlBarXSize, 0, 1, 0)
		p1.ButtonsTimeControlBar.Parent = p1.ControlBarContainer
		local Padding = Instance.new("UIPadding")
		Padding.PaddingLeft = UDim.new(0.02, 0)
		Padding.Parent = p1.ButtonsTimeControlBar
		p1.ScrubberControlBar = Instance.new("Frame")
		p1.ScrubberControlBar.Name = "ScrubberControlBar"
		p1.ScrubberControlBar.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		p1.ScrubberControlBar.BackgroundTransparency = 0.5
		p1.ScrubberControlBar.BorderSizePixel = 0
		p1.ScrubberControlBar.SizeConstraint = Enum.SizeConstraint.RelativeXY
		p1.ScrubberControlBar.Size = UDim2.new(p1.defaultScrubberControlBarXSize, 0, 1, 0)
		p1.ScrubberControlBar.Parent = p1.ControlBarContainer
		local FlexItem = Instance.new("UIFlexItem")
		FlexItem.FlexMode = Enum.UIFlexMode.Fill
		FlexItem.Parent = p1.ScrubberControlBar
		p1.HelpBar = Instance.new("Frame")
		p1.HelpBar.Name = "HelpBar"
		p1.HelpBar.BackgroundColor3 = p1.defaultBackgroundColor3
		p1.HelpBar.BackgroundTransparency = p1.defaultBackgroundTransparency
		p1.HelpBar.BorderSizePixel = 0
		p1.HelpBar.SizeConstraint = Enum.SizeConstraint.RelativeXY
		p1.HelpBar.Size = UDim2.new(p1.defaultHelpBarXSize, 0, 1, 0)
		p1.HelpBar.Parent = p1.ControlBarContainer
		p1.maxViewportScalingWidth = p1.maxControlBarHeight * AspectRatio.AspectRatio
		
		local function setupControlBarScaling()
			-- upvalues: p1 (copy), AspectRatio (copy), Padding (copy)
			p1.firstThresholdCheck = true
			p1.lastCheckAboveThreshold = false
			local CurrentCamera = workspace.CurrentCamera
			
			if CurrentCamera then
				CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
					-- upvalues: CurrentCamera (copy), p1 (upval), AspectRatio (upval), Padding (upval)
					if p1.maxViewportScalingWidth < CurrentCamera.ViewportSize.X then
						if not p1.firstBoundaryCheck and p1.lastCheckAboveThreshold then return end
						p1.lastCheckAboveThreshold = true
						AspectRatio.Parent = nil
						Padding.PaddingLeft = UDim.new(0, p1.ButtonsTimeControlBar.AbsoluteSize.X * Padding.PaddingLeft.Scale + Padding.PaddingLeft.Offset)
						p1.ButtonsTimeControlBar.Size = UDim2.new(0, p1.ButtonsTimeControlBar.AbsoluteSize.X, 1, 0)
						p1.HelpBar.Size = UDim2.new(0, p1.HelpBar.AbsoluteSize.X, 1, 0)
					else
						if not p1.firstBoundaryCheck and not p1.lastCheckAboveThreshold then return end
						p1.lastCheckAboveThreshold = false
						AspectRatio.Parent = p1.ControlBarContainer
						Padding.PaddingLeft = UDim.new(0.02, 0)
						p1.ButtonsTimeControlBar.Size = UDim2.new(p1.defaultButtonsTimeControlBarXSize, 0, 1, 0)
						p1.HelpBar.Size = UDim2.new(p1.defaultHelpBarXSize, 0, 1, 0)
					end
					p1.firstBoundaryCheck = false
				end)
				
				return
			else
				warn("No current camera found in workspace")
			end
		end
		
		setupControlBarScaling()
		workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(setupControlBarScaling)
		
		function p1.createUIListLayout(Parent, Offset)
			local ListLayout = Instance.new("UIListLayout")
			ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
			ListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			ListLayout.FillDirection = Enum.FillDirection.Horizontal
			ListLayout.Padding = UDim.new(0, Offset)
			ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			ListLayout.Parent = Parent
			
			return ListLayout
		end
		
		p1.createUIListLayout(p1.ControlBarContainer, 0)
		p1.createUIListLayout(p1.ButtonsTimeControlBar, 7.5)
	end
}