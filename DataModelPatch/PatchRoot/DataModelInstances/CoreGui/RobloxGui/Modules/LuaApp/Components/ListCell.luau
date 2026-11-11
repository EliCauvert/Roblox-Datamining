local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local LocalizedFitTextLabelModule = require(Modules.LuaApp.Components.LocalizedFitTextLabel)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local UIBloxModule = require(game:GetService("CorePackages").Packages.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithThemeDEPRECATEDModule = require(Modules.LuaApp.withTheme_DEPRECATED)
local ListCell = RoactModule.PureComponent:extend("ListCell")
ListCell.defaultProps = { textLocalization = false }

function ListCell.init(p1)
	p1.state = { cellPressed = false }
	
	function p1:onInputBegan(Input)
		-- upvalues: p1 (copy)
		if (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) and Input.UserInputState == Enum.UserInputState.Begin and not p1.state.cellPressed then
			p1:setState({ cellPressed = true })
		end
	end
	
	function p1.onInputEnd()
		-- upvalues: p1 (copy)
		if p1.state.cellPressed then
			p1:setState({ cellPressed = false })
		end
	end
	
	function p1.onActivated()
		-- upvalues: p1 (copy)
		p1.props.item.onActivated()
	end
end

function ListCell.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), FitChildrenModule (copy), ImageSetLabel (copy), DEPRECATEDImageSetLabelModule (copy), LocalizedFitTextLabelModule (copy), FitTextLabelModule (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), FitChildrenModule (upval), ImageSetLabel (upval), DEPRECATEDImageSetLabelModule (upval), LocalizedFitTextLabelModule (upval), FitTextLabelModule (upval)
		local Item = p1.props.item
		local LayoutOrder = p1.props.layoutOrder
		local CellPressed = p1.state.cellPressed
		local RenderRightSideGadgetFunction = Item.renderRightSideGadget
		local RightSideGadgetSize = Item.rightSideGadgetSize or Vector2.new(0, 0)
		local UseUIBloxImage = Item.useUIBloxImage
		local ContextualMenu = p1.props.appTheme.ContextualMenu
		local Transparency = ContextualMenu.Cells.Icon.Transparency
		
		if Item.checked then
			Transparency = ContextualMenu.Cells.Icon.OnTransparency
		elseif Item.disabled then
			CellPressed = false
			Transparency = ContextualMenu.Cells.Icon.DisabledTransparency
		end
		return RoactModule.createElement(FitChildrenModule.FitImageButton, {
			BackgroundTransparency = CellPressed and ContextualMenu.Cells.Background.OnPressTransparency or 1,
			BackgroundColor3 = ContextualMenu.Cells.Background.OnPressColor,
			BorderSizePixel = 0,
			fitAxis = FitChildrenModule.FitAxis.Height,
			ClipsDescendants = false,
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(1, 0, 0, 0),
			[RoactModule.Event.Activated] = p1.onActivated,
			[RoactModule.Event.InputBegan] = p1.onInputBegan,
			[RoactModule.Event.InputEnded] = p1.onInputEnd
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Icon = RoactModule.createElement(FitChildrenModule.FitFrame, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				fitAxis = FitChildrenModule.FitAxis.Height,
				Size = UDim2.new(0, 56, 0, 0)
			}, {
				Padding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 10) }),
				Image = UseUIBloxImage and RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Image = Item.checked and Item.displayIconChecked or Item.displayIcon,
					ImageColor3 = Item.checked and ContextualMenu.Cells.Icon.OnColor or ContextualMenu.Cells.Icon.Color,
					ImageTransparency = Transparency,
					Size = UDim2.new(0, 36, 0, 36)
				}) or RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Image = Item.checked and Item.displayIconChecked or Item.displayIcon,
					ImageColor3 = Item.checked and ContextualMenu.Cells.Icon.OnColor or ContextualMenu.Cells.Icon.Color,
					ImageTransparency = Transparency,
					Size = UDim2.new(0, 36, 0, 36)
				})
			}),
			Content = RoactModule.createElement(FitChildrenModule.FitFrame, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				fitAxis = FitChildrenModule.FitAxis.Height,
				Size = UDim2.new(1, -56 - RightSideGadgetSize.X, 0, 0)
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				TopPadding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 23) }),
				TextContent = RoactModule.createElement(Item.textLocalization and LocalizedFitTextLabelModule or FitTextLabelModule, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					TextWrapped = true,
					Font = p2.Font.Body.Font,
					Size = UDim2.new(1, -10, 0, 0),
					Text = Item.checked and Item.textChecked or Item.text,
					TextColor3 = ContextualMenu.Title.Color,
					TextTransparency = Item.disabled and ContextualMenu.Title.DisabledTransparency or ContextualMenu.Title.Transparency,
					TextSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					fitAxis = FitChildrenModule.FitAxis.Height
				}),
				UIBottomPadding = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, 23)
				})
			}),
			RightSideGadget = RenderRightSideGadgetFunction and RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 3,
				Size = UDim2.new(0, RightSideGadgetSize.X, 0, RightSideGadgetSize.Y)
			}, RenderRightSideGadgetFunction())
		})
	end)
end

return (WithThemeDEPRECATEDModule(ListCell))