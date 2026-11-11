local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(Modules.Common.Roact)
local WithStyleFunction = require(game:GetService("CorePackages").Packages.UIBlox).Style.withStyle
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
game:DefineFastFlag("ListPickerIconNotNeeded", false)
local ListPickerItem = RoactModule.PureComponent:extend("ListPickerItem")

function ListPickerItem.init(p1)
	p1.state = { menuItemDown = false }
	
	function p1.onMenuItemActive(p2, p3)
		-- upvalues: p1 (copy)
		p1.props.onSelectItem(p2, p3)
	end
	
	function p1:onMenuItemInputBegan(Input)
		-- upvalues: p1 (copy)
		if (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) and Input.UserInputState == Enum.UserInputState.Begin then
			p1:onMenuItemDown()
		end
	end
	
	function p1:onMenuItemInputEnd(_)
		-- upvalues: p1 (copy)
		p1:onMenuItemUp()
	end
end

function ListPickerItem.onMenuItemDown(p1)
	-- upvalues: UserInputService (copy)
	if not p1.state.menuItemDown then
		p1:eventDisconnect()
		p1.userInputServiceCon = UserInputService.InputEnded:Connect(function()
			-- upvalues: p1 (copy)
			p1:onMenuItemUp()
		end)
		p1:setState({ menuItemDown = true })
	end
end

function ListPickerItem.onMenuItemUp(p1, MenuItemActive)
	if p1.state.menuItemDown or p1.state.menuItemActive ~= MenuItemActive then
		p1:setState({ menuItemDown = false })
	end
	p1:eventDisconnect()
end

function ListPickerItem.eventDisconnect(p1)
	if p1.userInputServiceCon then
		p1.userInputServiceCon:Disconnect()
		p1.userInputServiceCon = nil
	end
end

function ListPickerItem.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), FitChildrenModule (copy), DEPRECATEDImageSetLabelModule (copy), FitTextLabelModule (copy)
	local Item = p1.props.item
	local LayoutOrder = p1.props.layoutOrder
	local SeparatorEnabled = p1.props.separatorEnabled
	local MenuItemDown = p1.state.menuItemDown
	local Inverted: boolean = not game:GetFastFlag("ListPickerIconNotNeeded") or Item.displayIcon ~= nil and Item.displayIcon ~= ""
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), FitChildrenModule (upval), MenuItemDown (copy), LayoutOrder (copy), Item (copy), p1 (copy), Inverted (ref), DEPRECATEDImageSetLabelModule (upval), FitTextLabelModule (upval), SeparatorEnabled (copy)
		return RoactModule.createElement(FitChildrenModule.FitImageButton, {
			AutoButtonColor = false,
			BackgroundColor3 = MenuItemDown and p2.Theme.BackgroundOnPress.Color or p2.Theme.BackgroundUIDefault.Color,
			BackgroundTransparency = MenuItemDown and p2.Theme.BackgroundOnPress.Transparency or p2.Theme.BackgroundUIDefault.Transparency,
			BorderSizePixel = 0,
			fitAxis = FitChildrenModule.FitAxis.Height,
			ClipsDescendants = false,
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(1, 0, 0, 0),
			[RoactModule.Event.Activated] = Item.onSelect,
			[RoactModule.Event.InputBegan] = p1.onMenuItemInputBegan,
			[RoactModule.Event.InputEnded] = p1.onMenuItemInputEnd
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Icon = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Size = UDim2.new(0, if Inverted then 60 else 20, 0, 20)
			}, {
				Image = Inverted and RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(0, 20, 0, 20),
					Position = UDim2.new(0, 20, 0, 0),
					Image = Item.displayIcon,
					ImageColor3 = p2.Theme.IconDefault.Color,
					ImageTransparency = p2.Theme.IconDefault.Transparency
				})
			}),
			Content = RoactModule.createElement(FitChildrenModule.FitFrame, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				fitAxis = FitChildrenModule.FitAxis.Height,
				Size = UDim2.new(1, if Inverted then -60 else 0, 0, 0)
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				TopPadding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 15) }),
				TextContent = RoactModule.createElement(FitTextLabelModule, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					TextWrapped = true,
					Size = UDim2.new(1, -20, 0, 0),
					Text = Item.text,
					Font = p2.Font.Body.Font,
					TextSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize,
					TextColor3 = p2.Theme.TextDefault.Color,
					TextTransparency = p2.Theme.TextDefault.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					fitAxis = FitChildrenModule.FitAxis.Height
				}),
				UIBottomPadding = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, 15)
				}),
				Separator = SeparatorEnabled and RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 4,
					BackgroundColor3 = p2.Theme.Divider.Color,
					BackgroundTransparency = p2.Theme.Divider.Transparency,
					Size = UDim2.new(1, 0, 0, 1)
				})
			})
		})
	end)
end

function ListPickerItem.willUnmount(p1)
	p1:eventDisconnect()
end

return ListPickerItem