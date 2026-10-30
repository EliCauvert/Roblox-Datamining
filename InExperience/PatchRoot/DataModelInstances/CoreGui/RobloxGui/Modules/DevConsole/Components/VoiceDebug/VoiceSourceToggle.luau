local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local VoiceDebugSourceModule = require(script.Parent.VoiceDebugSource)
local list = {
	{
		label = "In-experience",
		source = VoiceDebugSourceModule.InExperience
	},
	{
		label = "Party voice",
		source = VoiceDebugSourceModule.Party
	}
}
local _UDim = UDim.new(0, 8)

local function _(p1, p2)
	return if p1 == p2 then nil else p2
end

local function Segment(p1, IsSourceMatch, LayoutOrder, p2)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), _UDim (copy)
	return RoactModule.createElement("TextButton", {
		Text = p1.label,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 20),
		LayoutOrder = LayoutOrder,
		Font = ConstantsModule.Font.MainWindow,
		TextSize = ConstantsModule.DefaultFontSize.MainWindow + -2,
		TextColor3 = IsSourceMatch and ConstantsModule.Color.Text or ConstantsModule.Color.BorderGray,
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		[RoactModule.Event.Activated] = p2
	}, {
		Padding = RoactModule.createElement("UIPadding", { PaddingLeft = _UDim, PaddingRight = _UDim }),
		Underline = IsSourceMatch and RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 1, 0),
			Size = UDim2.new(1, -8, 0, 2),
			BackgroundColor3 = ConstantsModule.Color.SelectedBlue
		}) or nil
	})
end

return function(p1)
	-- upvalues: RoactModule (copy), list (copy), Segment (copy)
	local config = {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	for i, value in list do
		config[value.source] = Segment(value, p1.source == value.source, i, function()
			-- upvalues: p1 (copy), value (copy)
			local Source = value.source
			local Source1 = if p1.source == Source then nil else Source
			
			if Source1 then
				p1.onSourceChanged(Source1)
			end
		end)
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 20),
		LayoutOrder = p1.layoutOrder
	}, config)
end