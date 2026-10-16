local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Constants)
local FrameHeight = ConstantsModule.UtilityBarFormatting.FrameHeight
local SmallFrameHeight = ConstantsModule.UtilityBarFormatting.SmallFrameHeight
local ClientServerButtonWidth = ConstantsModule.UtilityBarFormatting.ClientServerButtonWidth
local ClientServerDropDownWidth = ConstantsModule.UtilityBarFormatting.ClientServerDropDownWidth
local UtilBar = ConstantsModule.Font.UtilBar
local UtilBar1 = ConstantsModule.DefaultFontSize.UtilBar
local Text = ConstantsModule.Color.Text
local FullScreenDropDownButtonModule = require(script.Parent.FullScreenDropDownButton)
local DropDownModule = require(script.Parent.DropDown)
local _UDim2 = UDim2.new(0, ClientServerButtonWidth, 0, FrameHeight)
local DropDownList = { "Client", "Server" }
local ClientServerButton = RoactModule.Component:extend("ClientServerButton")

function ClientServerButton.init(p1) --[[ Line: 21 ]]
	function p1.dropDownCallback(p2) --[[ Line: 22 ]]
		-- upvalues: p1 (copy)
		if p2 == 1 then
			p1.props.onClientButton()
			
			return
		end
		if p2 == 2 then
			p1.props.onServerButton()
		end
	end
end

function ClientServerButton.render(p1) --[[ Line: 31 ]]
	-- upvalues: ConstantsModule (copy), RoactModule (copy), FullScreenDropDownButtonModule (copy), ClientServerDropDownWidth (copy), SmallFrameHeight (copy), DropDownList (copy), DropDownModule (copy), ClientServerButtonWidth (copy), FrameHeight (copy), UtilBar1 (copy), Text (copy), UtilBar (copy), _UDim2 (copy)
	local FormFactor = p1.props.formFactor
	local UseDropDown = p1.props.useDropDown
	local IsClientView = p1.props.isClientView
	local LayoutOrder = p1.props.layoutOrder
	local OnServerButton = p1.props.onServerButton
	local OnClientButton = p1.props.onClientButton
	local SelectedBlue = ConstantsModule.Color.SelectedBlue
	local UnselectedGray = ConstantsModule.Color.UnselectedGray
	
	if IsClientView then
		UnselectedGray = ConstantsModule.Color.SelectedBlue
		SelectedBlue = ConstantsModule.Color.UnselectedGray
	end
	return if FormFactor == ConstantsModule.FormFactor.Small then RoactModule.createElement(FullScreenDropDownButtonModule, {
		buttonSize = UDim2.new(0, ClientServerDropDownWidth, 0, SmallFrameHeight),
		dropDownList = DropDownList,
		selectedIndex = if IsClientView then 1 else 2,
		onSelection = p1.dropDownCallback,
		layoutOrder = LayoutOrder
	}) elseif UseDropDown then RoactModule.createElement(DropDownModule, {
		buttonSize = UDim2.new(0, ClientServerDropDownWidth, 0, SmallFrameHeight),
		dropDownList = DropDownList,
		selectedIndex = if IsClientView then 1 else 2,
		onSelection = p1.dropDownCallback,
		layoutOrder = LayoutOrder
	}) else RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 2 * ClientServerButtonWidth, 0, FrameHeight),
		LayoutOrder = LayoutOrder
	}, {
		ClientButton = RoactModule.createElement("TextButton", {
			Text = DropDownList[1],
			TextSize = UtilBar1,
			TextColor3 = Text,
			Font = UtilBar,
			Size = _UDim2,
			AutoButtonColor = false,
			BackgroundColor3 = UnselectedGray,
			BackgroundTransparency = 0,
			LayoutOrder = 1,
			[RoactModule.Event.Activated] = OnClientButton
		}),
		ServerButton = RoactModule.createElement("TextButton", {
			Text = DropDownList[2],
			TextSize = UtilBar1,
			TextColor3 = Text,
			Font = UtilBar,
			Size = _UDim2,
			AutoButtonColor = false,
			Position = UDim2.new(0, ClientServerButtonWidth, 0, 0),
			BackgroundColor3 = SelectedBlue,
			BackgroundTransparency = 0,
			LayoutOrder = 2,
			[RoactModule.Event.Activated] = OnServerButton
		})
	})
end

return ClientServerButton