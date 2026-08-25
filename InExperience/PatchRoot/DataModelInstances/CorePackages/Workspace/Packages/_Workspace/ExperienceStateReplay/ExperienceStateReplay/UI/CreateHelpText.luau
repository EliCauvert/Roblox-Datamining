local t = {}
local createButtonsTimeModule = require(script.Parent.CreateButtonsTime)

function t.createHelpText(helpDescription)
	-- upvalues: createButtonsTimeModule (ref)
	helpDescription.HelpRevealer = Instance.new("TextLabel")
	helpDescription.HelpRevealer.Name = "HelpRevealer"
	helpDescription.HelpRevealer.Font = Enum.Font.SourceSans
	helpDescription.HelpRevealer.TextXAlignment = Enum.TextXAlignment.Center
	helpDescription.HelpRevealer.TextYAlignment = Enum.TextYAlignment.Center
	helpDescription.HelpRevealer.Size = UDim2.new(0.5, 0, 1.3, 0)
	helpDescription.HelpRevealer.SizeConstraint = Enum.SizeConstraint.RelativeXY
	helpDescription.HelpRevealer.AnchorPoint = Vector2.new(0.5, 0.5)
	helpDescription.HelpRevealer.Position = UDim2.new(0.5, 0, 0.5, 0)
	helpDescription.HelpRevealer.BackgroundTransparency = 1
	helpDescription.HelpRevealer.Text = "?"
	helpDescription.HelpRevealer.TextColor3 = createButtonsTimeModule.regularColor
	helpDescription.HelpRevealer.TextScaled = true
	helpDescription.HelpRevealer.Parent = helpDescription.HelpBar
	local UIPadding = Instance.new("UIPadding")
	UIPadding.PaddingBottom = UDim.new(0.05, 0)
	UIPadding.Parent = helpDescription.HelpRevealer
	helpDescription.HelpDescription = Instance.new("TextLabel")
	helpDescription.HelpDescription.Name = "HelpDescription"
	helpDescription.HelpDescription.Font = Enum.Font.SourceSans
	helpDescription.HelpDescription.TextXAlignment = Enum.TextXAlignment.Left
	helpDescription.HelpDescription.TextYAlignment = Enum.TextYAlignment.Top
	helpDescription.HelpDescription.AnchorPoint = Vector2.new(1, 1)
	helpDescription.HelpDescription.Position = UDim2.new(1, 0, 0, 0)
	helpDescription.HelpDescription.Size = UDim2.new(5.3, 0, 2.5, 0)
	helpDescription.HelpDescription.SizeConstraint = Enum.SizeConstraint.RelativeXY
	helpDescription.HelpDescription.BorderSizePixel = 0
	helpDescription.HelpDescription.BackgroundColor3 = helpDescription.defaultBackgroundColor3
	helpDescription.HelpDescription.BackgroundTransparency = helpDescription.defaultBackgroundTransparency
	helpDescription.HelpDescription.RichText = true
	helpDescription.HelpDescription.Text = "<b>Shortcuts</b>\n<u>space</u> - play/pause\n<u>r</u> - rewind\n<u>s</u> - stop"
	helpDescription.HelpDescription.TextColor3 = Color3.fromRGB(255, 255, 255)
	helpDescription.HelpDescription.TextScaled = Enum.AutomaticSize.XY
	helpDescription.HelpDescription.Parent = helpDescription.HelpBar
	helpDescription.HelpDescription.Visible = false
	local UIPadding_1 = Instance.new("UIPadding")
	UIPadding_1.PaddingLeft = UDim.new(0.02, 0)
	UIPadding_1.PaddingBottom = UDim.new(0.02, 0)
	UIPadding_1.Parent = helpDescription.HelpDescription
	helpDescription.HelpRevealer.MouseEnter:Connect(function()
		-- upvalues: helpDescription (ref), createButtonsTimeModule (copy)
		helpDescription.HelpRevealer.TextColor3 = createButtonsTimeModule.hoverColor
		helpDescription.HelpDescription.Visible = true
	end)
	helpDescription.HelpRevealer.MouseLeave:Connect(function()
		-- upvalues: helpDescription (ref), createButtonsTimeModule (copy)
		helpDescription.HelpRevealer.TextColor3 = createButtonsTimeModule.regularColor
		helpDescription.HelpDescription.Visible = false
	end)
end

return t