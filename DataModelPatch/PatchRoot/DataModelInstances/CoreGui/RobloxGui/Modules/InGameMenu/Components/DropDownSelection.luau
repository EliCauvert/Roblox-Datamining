local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local AssetsModule = require(Parent.Resources.Assets)
local DivideTransparencyModule = require(Parent.Utility.divideTransparency)
local ThemedButtonModule = require(script.Parent.ThemedButton)
local ThemedTextLabelModule = require(script.Parent.ThemedTextLabel)
local DividerModule = require(script.Parent.Divider)
local BarOnTopScrollingFrameModule = require(script.Parent.BarOnTopScrollingFrame)
local FocusHandlerModule = require(script.Parent.Connection.FocusHandler)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local ImageSetLabel = InGameMenuDependenciesModule.UIBlox.Core.ImageSet.ImageSetLabel
local DropDownSelection = Roact.PureComponent:extend("DropDownSelection")
DropDownSelection.validateProps = T.intersection(T.strictInterface({
	Size = T.UDim2,
	Position = T.optional(T.UDim2),
	LayoutOrder = T.optional(T.integer),
	placeHolderText = T.optional(T.string),
	selectedIndex = T.numberMin(0),
	selections = T.array(T.string),
	localize = T.boolean,
	enabled = T.boolean,
	truncate = T.optional(T.boolean),
	selectionChanged = T.callback,
	canOpen = T.optional(T.boolean),
	canCaptureFocus = T.optional(T.boolean),
	selectionParentName = T.optional(T.string),
	ButtonRef = T.optional(T.table)
}), function(p1)
	if #p1.selections < p1.selectedIndex then
		return false, "selectedIndex must not be greater than the number of selections"
	else
		return true
	end
end)
DropDownSelection.defaultProps = { canOpen = true }

function DropDownSelection.init(p1)
	-- upvalues: Roact (copy)
	p1.rootRef = Roact.createRef()
	p1.firstOptionRef = Roact.createRef()
	p1.openDropDownButtonRef = p1.props.ButtonRef or Roact.createRef()
	p1.state = {
		isOpen = false,
		dropDownItemHeight = 10,
		absolutePositionX = 0,
		absolutePositionY = 0,
		screenSizeX = 0,
		screenSizeY = 0
	}
	p1.ancestryConnection = nil
	p1.sizeConnection = nil
end

function DropDownSelection.getDerivedStateFromProps(p1)
	return if p1.canOpen then nil else { isOpen = false }
end

function DropDownSelection.renderDropDownList(p1, p2, p3)
	-- upvalues: Roact (copy), ThemedButtonModule (copy), AssetsModule (copy), DivideTransparencyModule (copy), ImageSetLabel (copy), ThemedTextLabelModule (copy), DividerModule (copy)
	local Elements = {
		Layout = Roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	for i, selection in ipairs(p1.props.selections) do
		local Text = if p1.props.localize then p3[i] else selection
		local XOffset: number = if p1.props.truncate and i == 1 then -48 else -25
		Elements["button" .. i] = Roact.createElement(ThemedButtonModule, {
			normalThemeKey = "BackgroundUIDefault",
			hoverThemeKey = "BackgroundOnHover",
			Size = UDim2.new(1, 0, 0, p1.state.dropDownItemHeight - 1),
			LayoutOrder = i * 2,
			onActivated = function()
				-- upvalues: p1 (copy), i (copy)
				p1:setState({ isOpen = false })
				p1.props.selectionChanged(i)
			end,
			ButtonRef = i == 1 and p1.firstOptionRef or nil,
			imageProps = AssetsModule.Images.WhiteSquare,
			renderChildren = function(_, p4, p5)
				-- upvalues: p2 (copy), DivideTransparencyModule (upval), Roact (upval), ImageSetLabel (upval), AssetsModule (upval), p1 (copy), i (copy), ThemedTextLabelModule (upval), XOffset (ref), Text (ref)
				local IconOnHover = p4 and p2.Theme.IconOnHover or p2.Theme.IconDefault
				
				return {
					SelectedIcon = Roact.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(1, 0.5),
						Size = UDim2.new(0, 15, 0, 12),
						Position = UDim2.new(1, -25, 0.5, 0),
						Image = AssetsModule.Images.SelectedCheck,
						ImageColor3 = IconOnHover.Color,
						ImageTransparency = DivideTransparencyModule(IconOnHover.Transparency, if p5 then 2 else 1),
						Visible = p1.props.selectedIndex == i
					}),
					TextLabel = Roact.createElement(ThemedTextLabelModule, {
						fontKey = "Header2",
						themeKey = "TextEmphasis",
						Position = UDim2.new(0, 25, 0, 0),
						Size = UDim2.new(1, XOffset, 1, 0),
						Text = Text,
						TextTruncate = if p1.props.truncate then Enum.TextTruncate.AtEnd else Enum.TextTruncate.None,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				}
			end
		})
		
		if i < #p1.props.selections then
			Elements["divider" .. i] = Roact.createElement(DividerModule, { LayoutOrder = i * 2 + 1 })
		end
	end
	return Elements
end

function DropDownSelection.renderFocusHandler(p4)
	-- upvalues: Roact (copy), FocusHandlerModule (copy), ContextActionService (copy), GuiService (copy)
	return p4.props.selectionParentName and Roact.createElement(FocusHandlerModule, {
		isFocused = p4.props.canOpen and p4.state.isOpen,
		didFocus = function()
			-- upvalues: ContextActionService (upval), p4 (copy), GuiService (upval)
			ContextActionService:BindCoreAction("settings_dropdown_close_action", function(_, UserInputState)
				-- upvalues: p4 (upval)
				if UserInputState == Enum.UserInputState.End then
					p4:setState({ isOpen = false })
					
					return Enum.ContextActionResult.Sink
				else
					return Enum.ContextActionResult.Pass
				end
			end, false, Enum.KeyCode.ButtonB)
			
			if p4.props.canCaptureFocus then
				GuiService:RemoveSelectionGroup(p4.props.selectionParentName)
				GuiService:AddSelectionParent(p4.props.selectionParentName, p4.rootRef.current)
				GuiService.SelectedCoreObject = p4.firstOptionRef.current
			end
		end,
		didBlur = function()
			-- upvalues: ContextActionService (upval), GuiService (upval), p4 (copy)
			ContextActionService:UnbindCoreAction("settings_dropdown_close_action")
			GuiService:RemoveSelectionGroup(p4.props.selectionParentName)
			
			if p4.props.canOpen and not p4.state.isOpen and p4.props.canCaptureFocus then
				GuiService.SelectedCoreObject = p4.openDropDownButtonRef.current
			end
		end
	}) or nil
end

function DropDownSelection.render(p4)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), WithLocalizationModule (copy), AssetsModule (copy), Roact (copy), ThemedButtonModule (copy), DivideTransparencyModule (copy), ImageSetLabel (copy), ThemedTextLabelModule (copy), BarOnTopScrollingFrameModule (copy)
	return WithFoundationOrUIBloxStyleFunction(function(p5)
		return {
			Theme = {
				BackgroundUIDefault = {
					Color = p5.Color.Surface.Surface_300.Color3,
					Transparency = p5.Color.Surface.Surface_300.Transparency
				},
				IconDefault = {
					Color = p5.Color.Content.Default.Color3,
					Transparency = p5.Color.Content.Default.Transparency
				},
				IconOnHover = {
					Color = p5.Color.Content.Emphasis.Color3,
					Transparency = p5.Color.Content.Emphasis.Transparency
				}
			}
		}
	end, function(p5)
		-- upvalues: WithLocalizationModule (upval), p4 (copy), AssetsModule (upval), Roact (upval), ThemedButtonModule (upval), DivideTransparencyModule (upval), ImageSetLabel (upval), ThemedTextLabelModule (upval), BarOnTopScrollingFrameModule (upval)
		return WithLocalizationModule(p4.props.localize and p4.props.selections or {})(function(p6)
			-- upvalues: p4 (upval), AssetsModule (upval), p5 (copy), Roact (upval), ThemedButtonModule (upval), DivideTransparencyModule (upval), ImageSetLabel (upval), ThemedTextLabelModule (upval), BarOnTopScrollingFrameModule (upval)
			local Selection = if p4.props.selectedIndex > 0 then if p4.props.localize then p6[p4.props.selectedIndex] else p4.props.selections[p4.props.selectedIndex] else p4.props.placeHolderText
			local Size: number = AssetsModule.Images.Shadow.Size
			
			return Roact.createElement("Frame", {
				Size = p4.props.Size,
				Position = p4.props.Position,
				LayoutOrder = p4.props.LayoutOrder,
				BackgroundTransparency = 1,
				[Roact.Ref] = p4.rootRef,
				[Roact.Change.AbsoluteSize] = function(Frame)
					-- upvalues: p4 (upval)
					p4:setState({ dropDownItemHeight = Frame.AbsoluteSize.Y })
				end,
				[Roact.Change.AbsolutePosition] = function(Frame: Frame)
					-- upvalues: p4 (upval)
					p4:setState({
						absolutePositionX = Frame.AbsolutePosition.X,
						absolutePositionY = Frame.AbsolutePosition.Y
					})
				end
			}, {
				OpenDropDownButton = Roact.createElement(ThemedButtonModule, {
					normalThemeKey = "SecondaryDefault",
					hoverThemeKey = "SecondaryOnHover",
					Size = UDim2.new(1, 0, 1, 0),
					Visible = not p4.state.isOpen,
					enabled = p4.props.enabled,
					onActivated = function()
						-- upvalues: p4 (upval)
						p4:setState({ isOpen = true })
					end,
					imageProps = AssetsModule.Images.RoundedRectBorder,
					renderChildren = function(TextTransparency, p7, p8)
						-- upvalues: p5 (upval), DivideTransparencyModule (upval), Roact (upval), ImageSetLabel (upval), AssetsModule (upval), ThemedTextLabelModule (upval), Selection (ref), p4 (upval)
						local IconOnHover = p7 and p5.Theme.IconOnHover or p5.Theme.IconDefault
						
						return {
							ButtonIcon = Roact.createElement(ImageSetLabel, {
								BackgroundTransparency = 1,
								Size = UDim2.new(0, 36, 0, 36),
								Position = UDim2.new(1, -16, 0.5, 0),
								AnchorPoint = Vector2.new(1, 0.5),
								Image = AssetsModule.Images.ExpandArrow,
								ImageColor3 = IconOnHover.Color,
								ImageTransparency = DivideTransparencyModule(IconOnHover.Transparency, if p8 then 2 else 1)
							}),
							ButtonText = Roact.createElement(ThemedTextLabelModule, {
								themeKey = "SecondaryContent",
								fontKey = "Header2",
								Text = Selection,
								Position = UDim2.new(0, 12, 0, 0),
								Size = UDim2.new(1, if p4.props.truncate then -48 else -12, 1, 0),
								TextTransparency = TextTransparency,
								TextTruncate = if p4.props.truncate then Enum.TextTruncate.AtEnd else Enum.TextTruncate.None,
								TextXAlignment = Enum.TextXAlignment.Left
							})
						}
					end,
					ButtonRef = p4.openDropDownButtonRef
				}),
				CloseDropDownArea = Roact.createElement("TextButton", {
					BackgroundTransparency = 1,
					Text = "",
					Position = UDim2.new(0, -p4.state.absolutePositionX, 0, -p4.state.absolutePositionY),
					Size = UDim2.new(0, p4.state.screenSizeX, 0, p4.state.screenSizeY),
					Visible = p4.state.isOpen,
					Selectable = false,
					[Roact.Event.Activated] = function()
						-- upvalues: p4 (upval)
						p4:setState({ isOpen = false })
					end,
					ZIndex = 2
				}),
				DropDownShadow = Roact.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					ZIndex = 3,
					Image = AssetsModule.Images.Shadow.Image,
					Position = UDim2.new(0, -Size, 0, -Size),
					Size = UDim2.new(1, Size * 2, 0, Size * 2 + 8 + math.min(#p4.props.selections, 7.5) * 44),
					ScaleType = AssetsModule.Images.Shadow.ScaleType,
					SliceCenter = AssetsModule.Images.Shadow.SliceCenter,
					Visible = p4.state.isOpen
				}, {
					FocusHandler = p4:renderFocusHandler(),
					DropDownBackground = Roact.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						SliceScale = 0.5,
						Image = AssetsModule.Images.RoundedRect.Image,
						ImageColor3 = p5.Theme.BackgroundUIDefault.Color,
						ImageTransparency = p5.Theme.BackgroundUIDefault.Transparency,
						ScaleType = AssetsModule.Images.RoundedRect.ScaleType,
						Size = UDim2.new(1, -(Size * 2), 1, -(Size * 2)),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						SliceCenter = AssetsModule.Images.RoundedRect.SliceCenter
					}, {
						DropDownList = Roact.createElement(BarOnTopScrollingFrameModule, {
							Position = UDim2.new(0, 0, 0, 4),
							Size = UDim2.new(1, 0, 1, -8),
							CanvasSize = UDim2.new(1, 0, 0, #p4.props.selections * p4.state.dropDownItemHeight)
						}, (p4:renderDropDownList(p5, p6)))
					})
				})
			})
		end)
	end)
end

function DropDownSelection.watchLayerCollector(p4, Frame: Frame)
	p4:setState({
		screenSizeX = Frame.AbsoluteSize.X,
		screenSizeY = Frame.AbsoluteSize.Y
	})
	p4.sizeConnection = Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: p4 (copy), Frame (copy)
		p4:setState({
			screenSizeX = Frame.AbsoluteSize.X,
			screenSizeY = Frame.AbsoluteSize.Y
		})
	end)
end

function DropDownSelection.didMount(p4)
	local Current = p4.rootRef.current
	local LayerCollector = Current:FindFirstAncestorWhichIsA("LayerCollector")
	
	if LayerCollector == nil then
		p4.ancestryConnection = Current.AncestryChanged:Connect(function()
			-- upvalues: LayerCollector (ref), Current (copy), p4 (copy)
			LayerCollector = Current:FindFirstAncestorWhichIsA("LayerCollector")
			
			if LayerCollector ~= nil then
				p4.ancestryConnection:Disconnect()
				p4.ancestryConnection = nil
				p4:watchLayerCollector(LayerCollector)
			end
		end)
	else
		p4:watchLayerCollector(LayerCollector)
	end
end

function DropDownSelection.didUpdate(p4, p5)
	-- upvalues: Roact (copy)
	if p5.ButtonRef ~= p4.props.ButtonRef then
		p4.openDropDownButtonRef = p4.props.ButtonRef or Roact.createRef()
	end
	if p4.state.isOpen and p5.canCaptureFocus ~= p4.props.canCaptureFocus then
		p4:setState({ isOpen = false })
	end
end

function DropDownSelection.willUnmount(p4)
	if p4.ancestryConnection then
		p4.ancestryConnection:Disconnect()
	end
	if p4.sizeConnection then
		p4.sizeConnection:Disconnect()
	end
end

return DropDownSelection