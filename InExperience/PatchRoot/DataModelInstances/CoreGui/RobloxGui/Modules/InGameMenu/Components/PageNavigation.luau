local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Otter = InGameMenuDependenciesModule.Otter
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local UIBlox = InGameMenuDependenciesModule.UIBlox
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local FoundationModule = require(CorePackages.Packages.Foundation)
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local WithCursorMigration = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorType = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local Parent = script.Parent.Parent
local SetCurrentPageModule = require(Parent.Actions.SetCurrentPage)
local PagesModule = require(script.Parent.Pages)
local ThemedTextLabelModule = require(script.Parent.ThemedTextLabel)
local DividerModule = require(script.Parent.Divider)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local DivideTransparencyModule = require(Parent.Utility.divideTransparency)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)
local NavigationButton = Roact.PureComponent:extend("NavigationButton")

function NavigationButton.init(p1, p2) --[[ Line: 55 ]]
	-- upvalues: Roact (copy), Otter (copy)
	local FillProgress: number = if p2.selected then 1 else 0
	local Binding, Binding2 = Roact.createBinding(FillProgress)
	p1.fillSize = Binding:map(function(XScale): UDim2 --[[ Line: 59 ]]
		return UDim2.new(XScale, 0, 1, 0)
	end)
	p1.hoverTransparency, p1.setHoverTransparency = Roact.createBinding(0)
	p1.motor = Otter.createGroupMotor({ hoverTransparency = 0, fillProgress = FillProgress })
	p1.motor:onStep(function(p3) --[[ Line: 71 ]]
		-- upvalues: Binding2 (copy), p1 (copy)
		Binding2(p3.fillProgress)
		p1.setHoverTransparency(p3.hoverTransparency)
	end)
	p1:setState({ hovering = false, pressing = false })
end

function NavigationButton.renderWithSelectionCursor(p1, Callback) --[[ Line: 82 ]]
	-- upvalues: WithLocalizationModule (copy), WithFoundationOrUIBloxStyleFunction (copy), Roact (copy), CursorType (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Icon (copy), IconSize (copy), DivideTransparencyModule (copy), ImageSetLabel (copy), ThemedTextLabelModule (copy)
	local Props = p1.props
	
	return WithLocalizationModule({ text = Props.text })(function(p2) --[[ Line: 87 ]]
		-- upvalues: WithFoundationOrUIBloxStyleFunction (upval), p1 (copy), Props (copy), Roact (upval), Callback (copy), CursorType (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), Icon (upval), IconSize (upval), DivideTransparencyModule (upval), ImageSetLabel (upval), ThemedTextLabelModule (upval)
		return WithFoundationOrUIBloxStyleFunction(function(p3) --[[ Line: 88 ]]
			return {
				Theme = {
					BackgroundOnPress = {
						Color = p3.Color.State.Press.Color3,
						Transparency = p3.Color.State.Press.Transparency
					},
					BackgroundOnHover = {
						Color = p3.Color.State.Hover.Color3,
						Transparency = p3.Color.State.Hover.Transparency
					},
					IconEmphasis = {
						Color = p3.Color.Content.Emphasis.Color3,
						Transparency = p3.Color.Content.Emphasis.Transparency
					},
					TextEmphasis = {
						Color = p3.Color.Content.Emphasis.Color3,
						Transparency = p3.Color.Content.Emphasis.Transparency
					},
					BackgroundMuted = {
						Color = p3.Color.Surface.Surface_200.Color3,
						Transparency = p3.Color.Surface.Surface_200.Transparency
					}
				}
			}
		end, function(p3) --[[ Line: 98 ]]
			-- upvalues: p1 (upval), Props (upval), Roact (upval), Callback (upval), CursorType (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), Icon (upval), IconSize (upval), DivideTransparencyModule (upval), ImageSetLabel (upval), ThemedTextLabelModule (upval), p2 (copy)
			local NoSelected: boolean = p1.state.pressing and not Props.selected
			local BackgroundOnPress = if p1.state.pressing then p3.Theme.BackgroundOnPress elseif p1.state.hovering then p3.Theme.BackgroundOnHover else { Transparency = 1, Color = Color3.new(1, 1, 1) }
			
			return Roact.createElement("TextButton", {
				AutoButtonColor = false,
				BackgroundTransparency = BackgroundOnPress.Transparency,
				BackgroundColor3 = BackgroundOnPress.Color,
				BorderSizePixel = 0,
				LayoutOrder = Props.LayoutOrder,
				Size = UDim2.new(1, 0, 0, 70),
				Text = "",
				SelectionImageObject = Callback(CursorType.Square),
				[Roact.Event.Activated] = Props.onActivated,
				[Roact.Ref] = Props.LayoutOrder == 1 and Props.mainPageFirstButtonRef or nil,
				[Roact.Event.MouseEnter] = function() --[[ Line: 122 ]]
					-- upvalues: p1 (upval)
					p1:setState({ hovering = true })
				end,
				[Roact.Event.MouseLeave] = function() --[[ Line: 127 ]]
					-- upvalues: p1 (upval)
					p1:setState({ hovering = false, pressing = false })
				end,
				[Roact.Event.InputBegan] = function(_, Input) --[[ Line: 133 ]]
					-- upvalues: p1 (upval)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
						p1:setState({ pressing = true })
					end
				end,
				[Roact.Event.InputEnded] = function(_, Input) --[[ Line: 143 ]]
					-- upvalues: p1 (upval)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
						p1:setState({ pressing = false })
					end
				end
			}, {
				ContentContainer = Roact.createElement("Frame", {
					ZIndex = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}, {
					Icon = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Icon, {
						ZIndex = 3,
						AnchorPoint = Vector2.new(0, 0.5),
						name = Props.icon,
						size = IconSize.Medium,
						style = {
							Color3 = p3.Theme.IconEmphasis.Color,
							Transparency = DivideTransparencyModule(p3.Theme.IconEmphasis.Transparency, if NoSelected then 2 else 1)
						},
						Position = UDim2.new(0, 28, 0.5, 0)
					}) else Roact.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						ZIndex = 3,
						AnchorPoint = Vector2.new(0, 0.5),
						Image = Props.icon,
						ImageColor3 = p3.Theme.IconEmphasis.Color,
						ImageTransparency = DivideTransparencyModule(p3.Theme.IconEmphasis.Transparency, if NoSelected then 2 else 1),
						Position = UDim2.new(0, 28, 0.5, 0),
						Size = UDim2.new(0, 36, 0, 36)
					}),
					Text = Roact.createElement(ThemedTextLabelModule, {
						fontKey = "Header1",
						themeKey = "TextEmphasis",
						ZIndex = 3,
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, 80, 0.5, 0),
						Size = UDim2.new(1, -104, 1, 0),
						Text = p2.text,
						TextTransparency = DivideTransparencyModule(p3.Theme.TextEmphasis.Transparency, if NoSelected then 2 else 1),
						TextXAlignment = Enum.TextXAlignment.Left
					})
				}),
				SelectedFill = Roact.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 2,
					Size = p1.fillSize,
					BackgroundColor3 = p3.Theme.BackgroundMuted.Color
				})
			})
		end)
	end)
end

function NavigationButton.render(p1) --[[ Line: 213 ]]
	-- upvalues: WithCursorMigration (copy)
	return WithCursorMigration(function(p2) --[[ Line: 214 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function NavigationButton.didUpdate(p1) --[[ Line: 219 ]]
	-- upvalues: Otter (copy)
	p1.motor:setGoal({
		fillProgress = Otter.spring(if p1.props.selected then 1 else 0, { frequency = 2.5 }),
		hoverTransparency = Otter.spring(if p1.state.hovering then 1 else 0, { frequency = 5 })
	})
end

return RoactRodux.UNSTABLE_connect2(function(p1, _) --[[ Line: 275 ]]
	return { currentPage = p1.menuPage }
end, function(Callback) --[[ Line: 279 ]]
	-- upvalues: SetCurrentPageModule (copy), SendAnalyticsModule (copy), ConstantsModule (copy)
	return {
		setCurrentPage = function(Key) --[[ Line: 281 ]]
			-- upvalues: Callback (copy), SetCurrentPageModule (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
			Callback(SetCurrentPageModule(Key))
			SendAnalyticsModule("open_" .. Key .. "_tab", ConstantsModule.AnalyticsMenuActionName, {})
		end
	}
end)(function(p1) --[[ Line: 230 | Named "PageNavigation" ]]
	-- upvalues: Roact (copy), PagesModule (copy), ConstantsModule (copy), NavigationButton (copy), DividerModule (copy)
	local Elements = {
		Layout = Roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		})
	}
	local CountPagesByIndex = #PagesModule.pagesByIndex
	local LayoutOrder = 1
	
	for i, value in ipairs(PagesModule.pagesByIndex) do
		if value.parentPage == ConstantsModule.MainPagePageKey then
			Elements["Page" .. value.key] = Roact.createElement(NavigationButton, {
				icon = value.icon,
				LayoutOrder = LayoutOrder,
				selected = p1.currentPage == value.key,
				text = value.title,
				onActivated = function() --[[ Line: 248 ]]
					-- upvalues: p1 (copy), value (copy)
					p1.setCurrentPage(value.key)
				end,
				mainPageFirstButtonRef = LayoutOrder == 1 and p1.mainPageFirstButtonRef or nil
			})
			LayoutOrder += 1
			
			if i < CountPagesByIndex then
				Elements["Divider" .. LayoutOrder] = Roact.createElement(DividerModule, {
					LayoutOrder = LayoutOrder,
					Size = UDim2.new(1, -24, 0, 1)
				})
				LayoutOrder += 1
			end
		end
	end
	return Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = p1.Position,
		Size = UDim2.new(1, -ConstantsModule.Zone.ContentOffset, 0, CountPagesByIndex * 70 + (CountPagesByIndex - 1))
	}, Elements)
end)