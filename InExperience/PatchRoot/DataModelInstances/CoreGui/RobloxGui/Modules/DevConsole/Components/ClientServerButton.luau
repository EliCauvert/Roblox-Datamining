local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local frameHeight = constantsModule.UtilityBarFormatting.FrameHeight
local smallFrameHeight = constantsModule.UtilityBarFormatting.SmallFrameHeight
local clientServerButtonWidth = constantsModule.UtilityBarFormatting.ClientServerButtonWidth
local clientServerDropDownWidth = constantsModule.UtilityBarFormatting.ClientServerDropDownWidth
local utilBar = constantsModule.Font.UtilBar
local utilBar_1 = constantsModule.DefaultFontSize.UtilBar
local text = constantsModule.Color.Text
local fullScreenDropDownButtonModule = require(script.Parent.FullScreenDropDownButton)
local dropDownModule = require(script.Parent.DropDown)
local uDim2 = UDim2.new(0, clientServerButtonWidth, 0, frameHeight)
local list = { "Client", "Server" }
local clientServerButton = roactModule.Component:extend("ClientServerButton")

function clientServerButton.init(p0) --[[ line: 21 ]]
	function p0.dropDownCallback(p1) --[[ line: 22 ]]
		-- upvalues: p0 (ref)
		if p1 == 1 then
			p0.props.onClientButton()
			
			return
		elseif p1 == 2 then
			p0.props.onServerButton()
		end
	end
end

function clientServerButton.render(p2) --[[ line: 31 ]]
	-- upvalues: constantsModule (ref), roactModule (ref), fullScreenDropDownButtonModule (ref), clientServerDropDownWidth (ref), smallFrameHeight (ref), list (ref), dropDownModule (ref), clientServerButtonWidth (ref), frameHeight (ref), utilBar_1 (ref), text (ref), utilBar (ref), uDim2 (ref)
	local formFactor = p2.props.formFactor
	local useDropDown = p2.props.useDropDown
	local isClientView = p2.props.isClientView
	local layoutOrder = p2.props.layoutOrder
	local onServerButton = p2.props.onServerButton
	local onClientButton = p2.props.onClientButton
	local selectedBlue = constantsModule.Color.SelectedBlue
	local unselectedGray = constantsModule.Color.UnselectedGray
	
	if isClientView then
		unselectedGray = constantsModule.Color.SelectedBlue
		selectedBlue = constantsModule.Color.UnselectedGray
	end
	return if formFactor == constantsModule.FormFactor.Small then roactModule.createElement(fullScreenDropDownButtonModule, {
		buttonSize = UDim2.new(0, clientServerDropDownWidth, 0, smallFrameHeight),
		dropDownList = list,
		selectedIndex = if isClientView then 1 else 2,
		onSelection = p2.dropDownCallback,
		layoutOrder = layoutOrder
	}) elseif useDropDown then roactModule.createElement(dropDownModule, {
		buttonSize = UDim2.new(0, clientServerDropDownWidth, 0, smallFrameHeight),
		dropDownList = list,
		selectedIndex = if isClientView then 1 else 2,
		onSelection = p2.dropDownCallback,
		layoutOrder = layoutOrder
	}) else roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 2 * clientServerButtonWidth, 0, frameHeight),
		LayoutOrder = layoutOrder
	}, {
		ClientButton = roactModule.createElement("TextButton", {
			Text = list[1],
			TextSize = utilBar_1,
			TextColor3 = text,
			Font = utilBar,
			Size = uDim2,
			AutoButtonColor = false,
			BackgroundColor3 = unselectedGray,
			BackgroundTransparency = 0,
			LayoutOrder = 1,
			[roactModule.Event.Activated] = onClientButton
		}),
		ServerButton = roactModule.createElement("TextButton", {
			Text = list[2],
			TextSize = utilBar_1,
			TextColor3 = text,
			Font = utilBar,
			Size = uDim2,
			AutoButtonColor = false,
			Position = UDim2.new(0, clientServerButtonWidth, 0, 0),
			BackgroundColor3 = selectedBlue,
			BackgroundTransparency = 0,
			LayoutOrder = 2,
			[roactModule.Event.Activated] = onServerButton
		})
	})
end

return clientServerButton