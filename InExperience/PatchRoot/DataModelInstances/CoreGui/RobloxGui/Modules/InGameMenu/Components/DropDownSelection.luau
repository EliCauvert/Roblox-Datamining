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
}), function(p0) --[[ line: 54 ]]
	if #p0.selections < p0.selectedIndex then
		return false, "selectedIndex must not be greater than the number of selections"
	end
	return true
end)
dropDownSelection.defaultProps = { canOpen = true }

function dropDownSelection.init(p1) --[[ line: 67 ]]
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

function dropDownSelection.getDerivedStateFromProps(p2) --[[ line: 86 ]]
	return if p2.canOpen then nil else { isOpen = false }
end

function dropDownSelection.renderDropDownList(p3, p4, p5) --[[ line: 95 ]]
	-- upvalues: roact (ref), themedButtonModule (ref), assetsModule (ref), divideTransparencyModule (ref), imageSetLabel (ref), themedTextLabelModule (ref), dividerModule (ref)
	local t = {
		Layout = roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	for i, v in ipairs(p3.props.selections) do
		local var14 = if p3.props.localize then p5[i] else v
		local var15 = if p3.props.truncate and i == 1 then -48 else -25
		t["button" .. i] = roact.createElement(themedButtonModule, {
			normalThemeKey = "BackgroundUIDefault",
			hoverThemeKey = "BackgroundOnHover",
			Size = UDim2.new(1, 0, 0, p3.state.dropDownItemHeight - 1),
			LayoutOrder = i * 2,
			onActivated = function() --[[ line: 119 ]]
				-- upvalues: p3 (ref), i (ref)
				p3:setState({ isOpen = false })
				p3.props.selectionChanged(i)
			end,
			ButtonRef = if i == 1 then p3.firstOptionRef else nil,
			imageProps = assetsModule.Images.WhiteSquare,
			renderChildren = function(_, p6, p7) --[[ line: 130 ]]
				-- upvalues: p4 (ref), divideTransparencyModule (copy), roact (copy), imageSetLabel (copy), assetsModule (copy), p3 (ref), i (ref), themedTextLabelModule (copy), var15 (write), var14 (write)
				local var16 = if p6 then p4.Theme.IconOnHover else p4.Theme.IconDefault
				
				return {
					SelectedIcon = roact.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(1, 0.5),
						Size = UDim2.new(0, 15, 0, 12),
						Position = UDim2.new(1, -25, 0.5, 0),
						Image = assetsModule.Images.SelectedCheck,
						ImageColor3 = var16.Color,
						ImageTransparency = divideTransparencyModule(var16.Transparency, if p7 then 2 else 1),
						Visible = p3.props.selectedIndex == i
					}),
					TextLabel = roact.createElement(themedTextLabelModule, {
						fontKey = "Header2",
						themeKey = "TextEmphasis",
						Position = UDim2.new(0, 25, 0, 0),
						Size = UDim2.new(1, var15, 1, 0),
						Text = var14,
						TextTruncate = if p3.props.truncate then Enum.TextTruncate.AtEnd else Enum.TextTruncate.None,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				}
			end
		})
		
		if i < #p3.props.selections then
			t["divider" .. i] = roact.createElement(dividerModule, { LayoutOrder = i * 2 + 1 })
		end
	end
	return t
end

function dropDownSelection.renderFocusHandler(p8) --[[ line: 170 ]]
	-- upvalues: roact (ref), focusHandlerModule (ref), contextActionService (ref), guiService (ref)
	return p8.props.selectionParentName and (roact.createElement(focusHandlerModule, {
		isFocused = p8.props.canOpen and p8.state.isOpen,
		didFocus = function() --[[ line: 175 ]]
			-- upvalues: contextActionService (copy), p8 (ref), guiService (copy)
			contextActionService:BindCoreAction("settings_dropdown_close_action", function(_, p9) --[[ line: 176 ]]
				-- upvalues: p8 (copy)
				if p9 == Enum.UserInputState.End then
					p8:setState({ isOpen = false })
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB)
			
			if p8.props.canCaptureFocus then
				guiService:RemoveSelectionGroup(p8.props.selectionParentName)
				guiService:AddSelectionParent(p8.props.selectionParentName, p8.rootRef.current)
				guiService.SelectedCoreObject = p8.firstOptionRef.current
			end
		end,
		didBlur = function() --[[ line: 191 ]]
			-- upvalues: contextActionService (copy), guiService (copy), p8 (ref)
			contextActionService:UnbindCoreAction("settings_dropdown_close_action")
			guiService:RemoveSelectionGroup(p8.props.selectionParentName)
			
			if p8.props.canOpen and not p8.state.isOpen and p8.props.canCaptureFocus then
				guiService.SelectedCoreObject = p8.openDropDownButtonRef.current
			end
		end
	}) or nil)
end

function dropDownSelection.render(p10) --[[ line: 203 ]]
	-- upvalues: withFoundationOrUIBloxStyle (ref), withLocalizationModule (ref), assetsModule (ref), roact (ref), themedButtonModule (ref), divideTransparencyModule (ref), imageSetLabel (ref), themedTextLabelModule (ref), barOnTopScrollingFrameModule (ref)
	return withFoundationOrUIBloxStyle(function(p11) --[[ line: 204 ]]
		return {
			Theme = {
				BackgroundUIDefault = {
					Color = p11.Color.Surface.Surface_300.Color3,
					Transparency = p11.Color.Surface.Surface_300.Transparency
				},
				IconDefault = {
					Color = p11.Color.Content.Default.Color3,
					Transparency = p11.Color.Content.Default.Transparency
				},
				IconOnHover = {
					Color = p11.Color.Content.Emphasis.Color3,
					Transparency = p11.Color.Content.Emphasis.Transparency
				}
			}
		}
	end, function(p12) --[[ line: 212 ]]
		-- upvalues: withLocalizationModule (copy), p10 (ref), assetsModule (copy), roact (copy), themedButtonModule (copy), divideTransparencyModule (copy), imageSetLabel (copy), themedTextLabelModule (copy), barOnTopScrollingFrameModule (copy)
		return withLocalizationModule(if p10.props.localize then p10.props.selections else {})(function(p13) --[[ line: 213 ]]
			-- upvalues: p10 (copy), assetsModule (copy), p12 (ref), roact (copy), themedButtonModule (copy), divideTransparencyModule (copy), imageSetLabel (copy), themedTextLabelModule (copy), barOnTopScrollingFrameModule (copy)
			local var17 = if p10.props.selectedIndex > 0 then if p10.props.localize then p13[p10.props.selectedIndex] else p10.props.selections[p10.props.selectedIndex] else p10.props.placeHolderText
			local size = assetsModule.Images.Shadow.Size
			
			return roact.createElement("Frame", {
				Size = p10.props.Size,
				Position = p10.props.Position,
				LayoutOrder = p10.props.LayoutOrder,
				BackgroundTransparency = 1,
				[roact.Ref] = p10.rootRef,
				[roact.Change.AbsoluteSize] = function(p14) --[[ line: 235 ]]
					-- upvalues: p10 (copy)
					p10:setState({ dropDownItemHeight = p14.AbsoluteSize.Y })
				end,
				[roact.Change.AbsolutePosition] = function(p15) --[[ line: 241 ]]
					-- upvalues: p10 (copy)
					p10:setState({
						absolutePositionX = p15.AbsolutePosition.X,
						absolutePositionY = p15.AbsolutePosition.Y
					})
				end
			}, {
				OpenDropDownButton = roact.createElement(themedButtonModule, {
					normalThemeKey = "SecondaryDefault",
					hoverThemeKey = "SecondaryOnHover",
					Size = UDim2.new(1, 0, 1, 0),
					Visible = not p10.state.isOpen,
					enabled = p10.props.enabled,
					onActivated = function() --[[ line: 252 ]]
						-- upvalues: p10 (copy)
						p10:setState({ isOpen = true })
					end,
					imageProps = assetsModule.Images.RoundedRectBorder,
					renderChildren = function(p16, p17, p18) --[[ line: 260 ]]
						-- upvalues: p12 (copy), divideTransparencyModule (copy), roact (copy), imageSetLabel (copy), assetsModule (copy), themedTextLabelModule (copy), var17 (write), p10 (copy)
						local var18 = if p17 then p12.Theme.IconOnHover else p12.Theme.IconDefault
						
						return {
							ButtonIcon = roact.createElement(imageSetLabel, {
								BackgroundTransparency = 1,
								Size = UDim2.new(0, 36, 0, 36),
								Position = UDim2.new(1, -16, 0.5, 0),
								AnchorPoint = Vector2.new(1, 0.5),
								Image = assetsModule.Images.ExpandArrow,
								ImageColor3 = var18.Color,
								ImageTransparency = divideTransparencyModule(var18.Transparency, if p18 then 2 else 1)
							}),
							ButtonText = roact.createElement(themedTextLabelModule, {
								themeKey = "SecondaryContent",
								fontKey = "Header2",
								Text = var17,
								Position = UDim2.new(0, 12, 0, 0),
								Size = UDim2.new(1, if p10.props.truncate then -48 else -12, 1, 0),
								TextTransparency = p16,
								TextTruncate = if p10.props.truncate then Enum.TextTruncate.AtEnd else Enum.TextTruncate.None,
								TextXAlignment = Enum.TextXAlignment.Left
							})
						}
					end,
					ButtonRef = p10.openDropDownButtonRef
				}),
				CloseDropDownArea = roact.createElement("TextButton", {
					BackgroundTransparency = 1,
					Text = "",
					Position = UDim2.new(0, -p10.state.absolutePositionX, 0, -p10.state.absolutePositionY),
					Size = UDim2.new(0, p10.state.screenSizeX, 0, p10.state.screenSizeY),
					Visible = p10.state.isOpen,
					Selectable = false,
					[roact.Event.Activated] = function() --[[ line: 299 ]]
						-- upvalues: p10 (copy)
						p10:setState({ isOpen = false })
					end,
					ZIndex = 2
				}),
				DropDownShadow = roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					ZIndex = 3,
					Image = assetsModule.Images.Shadow.Image,
					Position = UDim2.new(0, -size, 0, -size),
					Size = UDim2.new(1, size * 2, 0, size * 2 + 8 + math.min(#p10.props.selections, 7.5) * 44),
					ScaleType = assetsModule.Images.Shadow.ScaleType,
					SliceCenter = assetsModule.Images.Shadow.SliceCenter,
					Visible = p10.state.isOpen
				}, {
					FocusHandler = p10:renderFocusHandler(),
					DropDownBackground = roact.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						SliceScale = 0.5,
						Image = assetsModule.Images.RoundedRect.Image,
						ImageColor3 = p12.Theme.BackgroundUIDefault.Color,
						ImageTransparency = p12.Theme.BackgroundUIDefault.Transparency,
						ScaleType = assetsModule.Images.RoundedRect.ScaleType,
						Size = UDim2.new(1, -(size * 2), 1, -(size * 2)),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						SliceCenter = assetsModule.Images.RoundedRect.SliceCenter
					}, {
						DropDownList = roact.createElement(barOnTopScrollingFrameModule, {
							Position = UDim2.new(0, 0, 0, 4),
							Size = UDim2.new(1, 0, 1, -8),
							CanvasSize = UDim2.new(1, 0, 0, #p10.props.selections * p10.state.dropDownItemHeight)
						}, p10:renderDropDownList(p12, p13))
					})
				})
			})
		end)
	end)
end

function dropDownSelection.watchLayerCollector(p19, p20) --[[ line: 342 ]]
	p19:setState({
		screenSizeX = p20.AbsoluteSize.X,
		screenSizeY = p20.AbsoluteSize.Y
	})
	p19.sizeConnection = p20:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 348 ]]
		-- upvalues: p19 (ref), p20 (ref)
		p19:setState({
			screenSizeX = p20.AbsoluteSize.X,
			screenSizeY = p20.AbsoluteSize.Y
		})
	end)
end

function dropDownSelection.didMount(p21) --[[ line: 356 ]]
	local current = p21.rootRef.current
	local layerCollector = current:FindFirstAncestorWhichIsA("LayerCollector")
	
	if layerCollector == nil then
		p21.ancestryConnection = current.AncestryChanged:Connect(function() --[[ line: 361 ]]
			-- upvalues: layerCollector (write), current (ref), p21 (ref)
			layerCollector = current:FindFirstAncestorWhichIsA("LayerCollector")
			
			if layerCollector ~= nil then
				p21.ancestryConnection:Disconnect()
				p21.ancestryConnection = nil
				p21:watchLayerCollector(layerCollector)
			end
		end)
	else
		p21:watchLayerCollector(layerCollector)
	end
end

function dropDownSelection.didUpdate(p22, p23) --[[ line: 374 ]]
	-- upvalues: roact (ref)
	if p23.ButtonRef ~= p22.props.ButtonRef then
		p22.openDropDownButtonRef = p22.props.ButtonRef or roact.createRef()
	end
	if p22.state.isOpen and p23.canCaptureFocus ~= p22.props.canCaptureFocus then
		p22:setState({ isOpen = false })
	end
end

function dropDownSelection.willUnmount(p24) --[[ line: 385 ]]
	if p24.ancestryConnection then
		p24.ancestryConnection:Disconnect()
	end
	if p24.sizeConnection then
		p24.sizeConnection:Disconnect()
	end
end

return dropDownSelection