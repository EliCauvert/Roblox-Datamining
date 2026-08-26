local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local assetsModule = require(parent.Resources.Assets)
local divideTransparencyModule = require(parent.Utility.divideTransparency)
local themedButtonModule = require(script.Parent.ThemedButton)
local themedTextLabelModule = require(script.Parent.ThemedTextLabel)
local dividerModule = require(script.Parent.Divider)
local barOnTopScrollingFrameModule = require(script.Parent.BarOnTopScrollingFrame)
local focusHandlerModule = require(script.Parent.Connection.FocusHandler)
local withLocalizationModule = require(parent.Localization.withLocalization)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local dropDownSelection = roact.PureComponent:extend("DropDownSelection")
dropDownSelection.validateProps = t.intersection(t.strictInterface({
	Size = t.UDim2,
	Position = t.optional(t.UDim2),
	LayoutOrder = t.optional(t.integer),
	placeHolderText = t.optional(t.string),
	selectedIndex = t.numberMin(0),
	selections = t.array(t.string),
	localize = t.boolean,
	enabled = t.boolean,
	truncate = t.optional(t.boolean),
	selectionChanged = t.callback,
	canOpen = t.optional(t.boolean),
	canCaptureFocus = t.optional(t.boolean),
	selectionParentName = t.optional(t.string),
	ButtonRef = t.optional(t.table)
}), function(p1)
	if #p1.selections < p1.selectedIndex then
		return false, "selectedIndex must not be greater than the number of selections"
	end
	return true
end)
dropDownSelection.defaultProps = { canOpen = true }

function dropDownSelection.init(p1)
	-- upvalues: roact (ref)
	p1.rootRef = roact.createRef()
	p1.firstOptionRef = roact.createRef()
	p1.openDropDownButtonRef = p1.props.ButtonRef or roact.createRef()
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

function dropDownSelection.getDerivedStateFromProps(p1)
	return if p1.canOpen then nil else { isOpen = false }
end

function dropDownSelection.renderDropDownList(p1, p2, p3)
	-- upvalues: roact (ref), themedButtonModule (ref), assetsModule (ref), divideTransparencyModule (ref), imageSetLabel (ref), themedTextLabelModule (ref), dividerModule (ref)
	local t = {
		Layout = roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	for i, v in ipairs(p1.props.selections) do
		local var1 = if p1.props.localize then p3[i] else v
		local var2 = if p1.props.truncate and i == 1 then -48 else -25
		t["button" .. i] = roact.createElement(themedButtonModule, {
			normalThemeKey = "BackgroundUIDefault",
			hoverThemeKey = "BackgroundOnHover",
			Size = UDim2.new(1, 0, 0, p1.state.dropDownItemHeight - 1),
			LayoutOrder = i * 2,
			onActivated = function()
				-- upvalues: p1 (ref), i (ref)
				p1:setState({ isOpen = false })
				p1.props.selectionChanged(i)
			end,
			ButtonRef = if i == 1 then p1.firstOptionRef else nil,
			imageProps = assetsModule.Images.WhiteSquare,
			renderChildren = function(_, p4, p5)
				-- upvalues: p2 (ref), divideTransparencyModule (copy), roact (copy), imageSetLabel (copy), assetsModule (copy), p1 (ref), i (ref), themedTextLabelModule (copy), var2 (write), var1 (write)
				local var3 = if p4 then p2.Theme.IconOnHover else p2.Theme.IconDefault
				
				return {
					SelectedIcon = roact.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(1, 0.5),
						Size = UDim2.new(0, 15, 0, 12),
						Position = UDim2.new(1, -25, 0.5, 0),
						Image = assetsModule.Images.SelectedCheck,
						ImageColor3 = var3.Color,
						ImageTransparency = divideTransparencyModule(var3.Transparency, if p5 then 2 else 1),
						Visible = p1.props.selectedIndex == i
					}),
					TextLabel = roact.createElement(themedTextLabelModule, {
						fontKey = "Header2",
						themeKey = "TextEmphasis",
						Position = UDim2.new(0, 25, 0, 0),
						Size = UDim2.new(1, var2, 1, 0),
						Text = var1,
						TextTruncate = if p1.props.truncate then Enum.TextTruncate.AtEnd else Enum.TextTruncate.None,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				}
			end
		})
		
		if i < #p1.props.selections then
			t["divider" .. i] = roact.createElement(dividerModule, { LayoutOrder = i * 2 + 1 })
		end
	end
	return t
end

function dropDownSelection.renderFocusHandler(p4)
	-- upvalues: roact (ref), focusHandlerModule (ref), contextActionService (ref), guiService (ref)
	return p4.props.selectionParentName and (roact.createElement(focusHandlerModule, {
		isFocused = p4.props.canOpen and p4.state.isOpen,
		didFocus = function()
			-- upvalues: contextActionService (copy), p4 (ref), guiService (copy)
			contextActionService:BindCoreAction("settings_dropdown_close_action", function(_, p5)
				-- upvalues: p4 (copy)
				if p5 == Enum.UserInputState.End then
					p4:setState({ isOpen = false })
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB)
			
			if p4.props.canCaptureFocus then
				guiService:RemoveSelectionGroup(p4.props.selectionParentName)
				guiService:AddSelectionParent(p4.props.selectionParentName, p4.rootRef.current)
				guiService.SelectedCoreObject = p4.firstOptionRef.current
			end
		end,
		didBlur = function()
			-- upvalues: contextActionService (copy), guiService (copy), p4 (ref)
			contextActionService:UnbindCoreAction("settings_dropdown_close_action")
			guiService:RemoveSelectionGroup(p4.props.selectionParentName)
			
			if p4.props.canOpen and not p4.state.isOpen and p4.props.canCaptureFocus then
				guiService.SelectedCoreObject = p4.openDropDownButtonRef.current
			end
		end
	}) or nil)
end

function dropDownSelection.render(p4)
	-- upvalues: withFoundationOrUIBloxStyle (ref), withLocalizationModule (ref), assetsModule (ref), roact (ref), themedButtonModule (ref), divideTransparencyModule (ref), imageSetLabel (ref), themedTextLabelModule (ref), barOnTopScrollingFrameModule (ref)
	return withFoundationOrUIBloxStyle(function(p5)
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
		-- upvalues: withLocalizationModule (copy), p4 (ref), assetsModule (copy), roact (copy), themedButtonModule (copy), divideTransparencyModule (copy), imageSetLabel (copy), themedTextLabelModule (copy), barOnTopScrollingFrameModule (copy)
		return withLocalizationModule(if p4.props.localize then p4.props.selections else {})(function(p6)
			-- upvalues: p4 (copy), assetsModule (copy), p5 (ref), roact (copy), themedButtonModule (copy), divideTransparencyModule (copy), imageSetLabel (copy), themedTextLabelModule (copy), barOnTopScrollingFrameModule (copy)
			local var3 = if p4.props.selectedIndex > 0 then if p4.props.localize then p6[p4.props.selectedIndex] else p4.props.selections[p4.props.selectedIndex] else p4.props.placeHolderText
			local size = assetsModule.Images.Shadow.Size
			
			return roact.createElement("Frame", {
				Size = p4.props.Size,
				Position = p4.props.Position,
				LayoutOrder = p4.props.LayoutOrder,
				BackgroundTransparency = 1,
				[roact.Ref] = p4.rootRef,
				[roact.Change.AbsoluteSize] = function(p7)
					-- upvalues: p4 (copy)
					p4:setState({ dropDownItemHeight = p7.AbsoluteSize.Y })
				end,
				[roact.Change.AbsolutePosition] = function(p7)
					-- upvalues: p4 (copy)
					p4:setState({
						absolutePositionX = p7.AbsolutePosition.X,
						absolutePositionY = p7.AbsolutePosition.Y
					})
				end
			}, {
				OpenDropDownButton = roact.createElement(themedButtonModule, {
					normalThemeKey = "SecondaryDefault",
					hoverThemeKey = "SecondaryOnHover",
					Size = UDim2.new(1, 0, 1, 0),
					Visible = not p4.state.isOpen,
					enabled = p4.props.enabled,
					onActivated = function()
						-- upvalues: p4 (copy)
						p4:setState({ isOpen = true })
					end,
					imageProps = assetsModule.Images.RoundedRectBorder,
					renderChildren = function(p7, p8, p9)
						-- upvalues: p5 (copy), divideTransparencyModule (copy), roact (copy), imageSetLabel (copy), assetsModule (copy), themedTextLabelModule (copy), var3 (write), p4 (copy)
						local var4 = if p8 then p5.Theme.IconOnHover else p5.Theme.IconDefault
						
						return {
							ButtonIcon = roact.createElement(imageSetLabel, {
								BackgroundTransparency = 1,
								Size = UDim2.new(0, 36, 0, 36),
								Position = UDim2.new(1, -16, 0.5, 0),
								AnchorPoint = Vector2.new(1, 0.5),
								Image = assetsModule.Images.ExpandArrow,
								ImageColor3 = var4.Color,
								ImageTransparency = divideTransparencyModule(var4.Transparency, if p9 then 2 else 1)
							}),
							ButtonText = roact.createElement(themedTextLabelModule, {
								themeKey = "SecondaryContent",
								fontKey = "Header2",
								Text = var3,
								Position = UDim2.new(0, 12, 0, 0),
								Size = UDim2.new(1, if p4.props.truncate then -48 else -12, 1, 0),
								TextTransparency = p7,
								TextTruncate = if p4.props.truncate then Enum.TextTruncate.AtEnd else Enum.TextTruncate.None,
								TextXAlignment = Enum.TextXAlignment.Left
							})
						}
					end,
					ButtonRef = p4.openDropDownButtonRef
				}),
				CloseDropDownArea = roact.createElement("TextButton", {
					BackgroundTransparency = 1,
					Text = "",
					Position = UDim2.new(0, -p4.state.absolutePositionX, 0, -p4.state.absolutePositionY),
					Size = UDim2.new(0, p4.state.screenSizeX, 0, p4.state.screenSizeY),
					Visible = p4.state.isOpen,
					Selectable = false,
					[roact.Event.Activated] = function()
						-- upvalues: p4 (copy)
						p4:setState({ isOpen = false })
					end,
					ZIndex = 2
				}),
				DropDownShadow = roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					ZIndex = 3,
					Image = assetsModule.Images.Shadow.Image,
					Position = UDim2.new(0, -size, 0, -size),
					Size = UDim2.new(1, size * 2, 0, size * 2 + 8 + math.min(#p4.props.selections, 7.5) * 44),
					ScaleType = assetsModule.Images.Shadow.ScaleType,
					SliceCenter = assetsModule.Images.Shadow.SliceCenter,
					Visible = p4.state.isOpen
				}, {
					FocusHandler = p4:renderFocusHandler(),
					DropDownBackground = roact.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						SliceScale = 0.5,
						Image = assetsModule.Images.RoundedRect.Image,
						ImageColor3 = p5.Theme.BackgroundUIDefault.Color,
						ImageTransparency = p5.Theme.BackgroundUIDefault.Transparency,
						ScaleType = assetsModule.Images.RoundedRect.ScaleType,
						Size = UDim2.new(1, -(size * 2), 1, -(size * 2)),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						SliceCenter = assetsModule.Images.RoundedRect.SliceCenter
					}, {
						DropDownList = roact.createElement(barOnTopScrollingFrameModule, {
							Position = UDim2.new(0, 0, 0, 4),
							Size = UDim2.new(1, 0, 1, -8),
							CanvasSize = UDim2.new(1, 0, 0, #p4.props.selections * p4.state.dropDownItemHeight)
						}, p4:renderDropDownList(p5, p6))
					})
				})
			})
		end)
	end)
end

function dropDownSelection.watchLayerCollector(p4, p5)
	p4:setState({
		screenSizeX = p5.AbsoluteSize.X,
		screenSizeY = p5.AbsoluteSize.Y
	})
	p4.sizeConnection = p5:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: p4 (ref), p5 (ref)
		p4:setState({
			screenSizeX = p5.AbsoluteSize.X,
			screenSizeY = p5.AbsoluteSize.Y
		})
	end)
end

function dropDownSelection.didMount(p4)
	local current = p4.rootRef.current
	local layerCollector = current:FindFirstAncestorWhichIsA("LayerCollector")
	
	if layerCollector == nil then
		p4.ancestryConnection = current.AncestryChanged:Connect(function()
			-- upvalues: layerCollector (write), current (ref), p4 (ref)
			layerCollector = current:FindFirstAncestorWhichIsA("LayerCollector")
			
			if layerCollector ~= nil then
				p4.ancestryConnection:Disconnect()
				p4.ancestryConnection = nil
				p4:watchLayerCollector(layerCollector)
			end
		end)
	else
		p4:watchLayerCollector(layerCollector)
	end
end

function dropDownSelection.didUpdate(p4, p5)
	-- upvalues: roact (ref)
	if p5.ButtonRef ~= p4.props.ButtonRef then
		p4.openDropDownButtonRef = p4.props.ButtonRef or roact.createRef()
	end
	if p4.state.isOpen and p5.canCaptureFocus ~= p4.props.canCaptureFocus then
		p4:setState({ isOpen = false })
	end
end

function dropDownSelection.willUnmount(p4)
	if p4.ancestryConnection then
		p4.ancestryConnection:Disconnect()
	end
	if p4.sizeConnection then
		p4.sizeConnection:Disconnect()
	end
end

return dropDownSelection