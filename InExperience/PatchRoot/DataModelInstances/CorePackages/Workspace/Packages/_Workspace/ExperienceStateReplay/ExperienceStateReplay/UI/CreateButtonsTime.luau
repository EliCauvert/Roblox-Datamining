local parent = script.Parent
local buttonAssetsModule = require(parent.ButtonAssets)
local secondsToTimeStrModule = require(parent.SecondsToTimeStr)
local t = {
	regularColor = Color3.fromRGB(255, 255, 255),
	hoverColor = Color3.fromRGB(200, 200, 200),
	clickColor = Color3.fromRGB(150, 150, 150)
}

function t.createButtonsTime(currentTimeLabel)
	-- upvalues: t (ref), buttonAssetsModule (ref), secondsToTimeStrModule (ref)
	function currentTimeLabel.createControlBarButton(p1, p2)
		-- upvalues: currentTimeLabel (ref), t (copy)
		local controlBarButton = Instance.new("ImageButton")
		controlBarButton.Name = "ControlBarButton"
		controlBarButton.Parent = currentTimeLabel.ButtonsTimeControlBar
		controlBarButton.BackgroundTransparency = 1
		controlBarButton.Image = p1
		controlBarButton.ImageColor3 = t.regularColor
		controlBarButton.AnchorPoint = Vector2.new(0, 0.5)
		controlBarButton.Size = UDim2.new(0.1, 0, 0.9, 0)
		controlBarButton.SizeConstraint = Enum.SizeConstraint.RelativeXY
		controlBarButton:SetAttribute("useHoverColor", true)
		controlBarButton.MouseEnter:Connect(function()
			-- upvalues: controlBarButton (ref), t (copy)
			if controlBarButton:GetAttribute("useHoverColor") then
				controlBarButton.ImageColor3 = t.hoverColor
			end
		end)
		controlBarButton.MouseLeave:Connect(function()
			-- upvalues: controlBarButton (ref), t (copy)
			if controlBarButton:GetAttribute("useHoverColor") then
				controlBarButton.ImageColor3 = t.regularColor
			end
		end)
		controlBarButton.MouseButton1Down:Connect(function()
			-- upvalues: controlBarButton (ref), t (copy)
			controlBarButton.ImageColor3 = t.clickColor
		end)
		
		if p2 then
			controlBarButton.MouseButton1Up:Connect(function()
				-- upvalues: controlBarButton (ref), t (copy)
				controlBarButton.ImageColor3 = t.hoverColor
			end)
		end
		local UISizeConstraint = Instance.new("UISizeConstraint")
		UISizeConstraint.MaxSize = Vector2.new(currentTimeLabel.maxControlBarHeight * 0.9, currentTimeLabel.maxControlBarHeight * 0.9)
		UISizeConstraint.Parent = controlBarButton
		
		return controlBarButton
	end
	
	currentTimeLabel.PlayButton = currentTimeLabel.createControlBarButton(buttonAssetsModule.PlayButton, true)
	currentTimeLabel.PlayButton.LayoutOrder = 2
	currentTimeLabel.StopButton = currentTimeLabel.createControlBarButton(buttonAssetsModule.StopButton, false)
	currentTimeLabel.StopButton.LayoutOrder = 3
	currentTimeLabel.ReverseButton = currentTimeLabel.createControlBarButton(buttonAssetsModule.ReverseButton, false)
	currentTimeLabel.ReverseButton.LayoutOrder = 4
	currentTimeLabel.CurrentTimeLabel = Instance.new("TextLabel")
	currentTimeLabel.CurrentTimeLabel.Name = "CurrentTimeLabel"
	currentTimeLabel.CurrentTimeLabel.Font = Enum.Font.SourceSans
	currentTimeLabel.CurrentTimeLabel.TextXAlignment = Enum.TextXAlignment.Left
	currentTimeLabel.CurrentTimeLabel.TextYAlignment = Enum.TextYAlignment.Center
	currentTimeLabel.CurrentTimeLabel.AnchorPoint = Vector2.new(0, 0.5)
	currentTimeLabel.CurrentTimeLabel.Size = UDim2.new(0.4, 0, 1.3, 0)
	currentTimeLabel.CurrentTimeLabel.SizeConstraint = Enum.SizeConstraint.RelativeXY
	currentTimeLabel.CurrentTimeLabel.BackgroundTransparency = 1
	currentTimeLabel.CurrentTimeLabel.Text = secondsToTimeStrModule.convertSecondsToTimeStr(0)
	currentTimeLabel.CurrentTimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	currentTimeLabel.CurrentTimeLabel.TextScaled = true
	currentTimeLabel.CurrentTimeLabel.LayoutOrder = 5
	currentTimeLabel.CurrentTimeLabel.Parent = currentTimeLabel.ButtonsTimeControlBar
	local UIPadding = Instance.new("UIPadding")
	UIPadding.PaddingBottom = UDim.new(0.05, 0)
	UIPadding.Parent = currentTimeLabel.CurrentTimeLabel
end

return t