local Parent = script.Parent
local ButtonAssetsModule = require(Parent.ButtonAssets)
local SecondsToTimeStrModule = require(Parent.SecondsToTimeStr)
local CreateButtonsTimeModule = {
	regularColor = Color3.fromRGB(255, 255, 255),
	hoverColor = Color3.fromRGB(200, 200, 200),
	clickColor = Color3.fromRGB(150, 150, 150)
}

function CreateButtonsTimeModule.createButtonsTime(p1) --[[ Line: 12 ]]
	-- upvalues: CreateButtonsTimeModule (copy), ButtonAssetsModule (copy), SecondsToTimeStrModule (copy)
	function p1.createControlBarButton(Image, p2) --[[ Line: 14 ]]
		-- upvalues: p1 (copy), CreateButtonsTimeModule (upval)
		local ControlBarButton = Instance.new("ImageButton")
		ControlBarButton.Name = "ControlBarButton"
		ControlBarButton.Parent = p1.ButtonsTimeControlBar
		ControlBarButton.BackgroundTransparency = 1
		ControlBarButton.Image = Image
		ControlBarButton.ImageColor3 = CreateButtonsTimeModule.regularColor
		ControlBarButton.AnchorPoint = Vector2.new(0, 0.5)
		ControlBarButton.Size = UDim2.new(0.1, 0, 0.9, 0)
		ControlBarButton.SizeConstraint = Enum.SizeConstraint.RelativeXY
		ControlBarButton:SetAttribute("useHoverColor", true)
		ControlBarButton.MouseEnter:Connect(function() --[[ Line: 26 ]]
			-- upvalues: ControlBarButton (copy), CreateButtonsTimeModule (upval)
			if ControlBarButton:GetAttribute("useHoverColor") then
				ControlBarButton.ImageColor3 = CreateButtonsTimeModule.hoverColor
			end
		end)
		ControlBarButton.MouseLeave:Connect(function() --[[ Line: 31 ]]
			-- upvalues: ControlBarButton (copy), CreateButtonsTimeModule (upval)
			if ControlBarButton:GetAttribute("useHoverColor") then
				ControlBarButton.ImageColor3 = CreateButtonsTimeModule.regularColor
			end
		end)
		ControlBarButton.MouseButton1Down:Connect(function() --[[ Line: 36 ]]
			-- upvalues: ControlBarButton (copy), CreateButtonsTimeModule (upval)
			ControlBarButton.ImageColor3 = CreateButtonsTimeModule.clickColor
		end)
		
		if p2 then
			ControlBarButton.MouseButton1Up:Connect(function() --[[ Line: 40 ]]
				-- upvalues: ControlBarButton (copy), CreateButtonsTimeModule (upval)
				ControlBarButton.ImageColor3 = CreateButtonsTimeModule.hoverColor
			end)
		end
		local SizeConstraint = Instance.new("UISizeConstraint")
		SizeConstraint.MaxSize = Vector2.new(p1.maxControlBarHeight * 0.9, p1.maxControlBarHeight * 0.9)
		SizeConstraint.Parent = ControlBarButton
		
		return ControlBarButton
	end
	
	p1.PlayButton = p1.createControlBarButton(ButtonAssetsModule.PlayButton, true)
	p1.PlayButton.LayoutOrder = 2
	p1.StopButton = p1.createControlBarButton(ButtonAssetsModule.StopButton, false)
	p1.StopButton.LayoutOrder = 3
	p1.ReverseButton = p1.createControlBarButton(ButtonAssetsModule.ReverseButton, false)
	p1.ReverseButton.LayoutOrder = 4
	p1.CurrentTimeLabel = Instance.new("TextLabel")
	p1.CurrentTimeLabel.Name = "CurrentTimeLabel"
	p1.CurrentTimeLabel.Font = Enum.Font.SourceSans
	p1.CurrentTimeLabel.TextXAlignment = Enum.TextXAlignment.Left
	p1.CurrentTimeLabel.TextYAlignment = Enum.TextYAlignment.Center
	p1.CurrentTimeLabel.AnchorPoint = Vector2.new(0, 0.5)
	p1.CurrentTimeLabel.Size = UDim2.new(0.4, 0, 1.3, 0)
	p1.CurrentTimeLabel.SizeConstraint = Enum.SizeConstraint.RelativeXY
	p1.CurrentTimeLabel.BackgroundTransparency = 1
	p1.CurrentTimeLabel.Text = SecondsToTimeStrModule.convertSecondsToTimeStr(0)
	p1.CurrentTimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	p1.CurrentTimeLabel.TextScaled = true
	p1.CurrentTimeLabel.LayoutOrder = 5
	p1.CurrentTimeLabel.Parent = p1.ButtonsTimeControlBar
	local Padding = Instance.new("UIPadding")
	Padding.PaddingBottom = UDim.new(0.05, 0)
	Padding.Parent = p1.CurrentTimeLabel
end

return CreateButtonsTimeModule