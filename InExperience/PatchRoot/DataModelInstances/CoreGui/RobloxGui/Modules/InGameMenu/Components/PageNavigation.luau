local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local otter = inGameMenuDependenciesModule.Otter
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local UIBlox = inGameMenuDependenciesModule.UIBlox
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local foundationModule = require(corePackagesService.Packages.Foundation)
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local parent = script.Parent.Parent
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)
local pagesModule = require(script.Parent.Pages)
local themedTextLabelModule = require(script.Parent.ThemedTextLabel)
local dividerModule = require(script.Parent.Divider)
local withLocalizationModule = require(parent.Localization.withLocalization)
local divideTransparencyModule = require(parent.Utility.divideTransparency)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local navigationButton = roact.PureComponent:extend("NavigationButton")

function navigationButton.init(p1, p2)
	-- upvalues: roact (ref), otter (ref)
	local var3 = if p2.selected then 1 else 0
	local var4, var5 = roact.createBinding(var3)
	p1.fillSize = var4:map(function(p3)
		return UDim2.new(p3, 0, 1, 0)
	end)
	local var6, var7 = roact.createBinding(0)
	p1.hoverTransparency = var6
	p1.setHoverTransparency = var7
	p1.motor = otter.createGroupMotor({ hoverTransparency = 0, fillProgress = var3 })
	p1.motor:onStep(function(p3)
		-- upvalues: var5 (ref), p1 (ref)
		var5(p3.fillProgress)
		p1.setHoverTransparency(p3.hoverTransparency)
	end)
	p1:setState({ hovering = false, pressing = false })
end

function navigationButton.renderWithSelectionCursor(p1, p2)
	-- upvalues: withLocalizationModule (ref), withFoundationOrUIBloxStyle (ref), roact (ref), var2 (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), icon (ref), iconSize (ref), divideTransparencyModule (ref), imageSetLabel (ref), themedTextLabelModule (ref)
	local props = p1.props
	
	return withLocalizationModule({ text = props.text })(function(p3)
		-- upvalues: withFoundationOrUIBloxStyle (copy), p1 (ref), props (ref), roact (copy), p2 (ref), var2 (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), icon (copy), iconSize (copy), divideTransparencyModule (copy), imageSetLabel (copy), themedTextLabelModule (copy)
		return withFoundationOrUIBloxStyle(function(p4)
			return {
				Theme = {
					BackgroundOnPress = {
						Color = p4.Color.State.Press.Color3,
						Transparency = p4.Color.State.Press.Transparency
					},
					BackgroundOnHover = {
						Color = p4.Color.State.Hover.Color3,
						Transparency = p4.Color.State.Hover.Transparency
					},
					IconEmphasis = {
						Color = p4.Color.Content.Emphasis.Color3,
						Transparency = p4.Color.Content.Emphasis.Transparency
					},
					TextEmphasis = {
						Color = p4.Color.Content.Emphasis.Color3,
						Transparency = p4.Color.Content.Emphasis.Transparency
					},
					BackgroundMuted = {
						Color = p4.Color.Surface.Surface_200.Color3,
						Transparency = p4.Color.Surface.Surface_200.Transparency
					}
				}
			}
		end, function(p4)
			-- upvalues: p1 (copy), props (copy), roact (copy), p2 (copy), var2 (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), icon (copy), iconSize (copy), divideTransparencyModule (copy), imageSetLabel (copy), themedTextLabelModule (copy), p3 (ref)
			local var3 = p1.state.pressing and not props.selected
			local t = { Transparency = 1, Color = Color3.new(1, 1, 1) }
			
			if p1.state.pressing then
				t = p4.Theme.BackgroundOnPress
			elseif p1.state.hovering then
				t = p4.Theme.BackgroundOnHover
			end
			return roact.createElement("TextButton", {
				AutoButtonColor = false,
				BackgroundTransparency = t.Transparency,
				BackgroundColor3 = t.Color,
				BorderSizePixel = 0,
				LayoutOrder = props.LayoutOrder,
				Size = UDim2.new(1, 0, 0, 70),
				Text = "",
				SelectionImageObject = p2(var2.Square),
				[roact.Event.Activated] = props.onActivated,
				[roact.Ref] = if props.LayoutOrder == 1 then props.mainPageFirstButtonRef else nil,
				[roact.Event.MouseEnter] = function()
					-- upvalues: p1 (copy)
					p1:setState({ hovering = true })
				end,
				[roact.Event.MouseLeave] = function()
					-- upvalues: p1 (copy)
					p1:setState({ hovering = false, pressing = false })
				end,
				[roact.Event.InputBegan] = function(_, p5)
					-- upvalues: p1 (copy)
					if p5.UserInputType == Enum.UserInputType.MouseButton1 or p5.UserInputType == Enum.UserInputType.Touch then
						p1:setState({ pressing = true })
					end
				end,
				[roact.Event.InputEnded] = function(_, p5)
					-- upvalues: p1 (copy)
					if p5.UserInputType == Enum.UserInputType.MouseButton1 or p5.UserInputType == Enum.UserInputType.Touch then
						p1:setState({ pressing = false })
					end
				end
			}, {
				ContentContainer = roact.createElement("Frame", {
					ZIndex = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}, {
					Icon = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(icon, {
						ZIndex = 3,
						AnchorPoint = Vector2.new(0, 0.5),
						name = props.icon,
						size = iconSize.Medium,
						style = {
							Color3 = p4.Theme.IconEmphasis.Color,
							Transparency = divideTransparencyModule(p4.Theme.IconEmphasis.Transparency, if var3 then 2 else 1)
						},
						Position = UDim2.new(0, 28, 0.5, 0)
					}) else roact.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						ZIndex = 3,
						AnchorPoint = Vector2.new(0, 0.5),
						Image = props.icon,
						ImageColor3 = p4.Theme.IconEmphasis.Color,
						ImageTransparency = divideTransparencyModule(p4.Theme.IconEmphasis.Transparency, if var3 then 2 else 1),
						Position = UDim2.new(0, 28, 0.5, 0),
						Size = UDim2.new(0, 36, 0, 36)
					}),
					Text = roact.createElement(themedTextLabelModule, {
						fontKey = "Header1",
						themeKey = "TextEmphasis",
						ZIndex = 3,
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, 80, 0.5, 0),
						Size = UDim2.new(1, -104, 1, 0),
						Text = p3.text,
						TextTransparency = divideTransparencyModule(p4.Theme.TextEmphasis.Transparency, if var3 then 2 else 1),
						TextXAlignment = Enum.TextXAlignment.Left
					})
				}),
				SelectedFill = roact.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 2,
					Size = p1.fillSize,
					BackgroundColor3 = p4.Theme.BackgroundMuted.Color
				})
			})
		end)
	end)
end

function navigationButton.render(p1)
	-- upvalues: var1 (ref)
	return var1(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function navigationButton.didUpdate(p1)
	-- upvalues: otter (ref)
	p1.motor:setGoal({
		fillProgress = otter.spring(if p1.props.selected then 1 else 0, { frequency = 2.5 }),
		hoverTransparency = otter.spring(if p1.state.hovering then 1 else 0, { frequency = 5 })
	})
end

return roactRodux.UNSTABLE_connect2(function(p1, _)
	return { currentPage = p1.menuPage }
end, function(p1)
	-- upvalues: setCurrentPageModule (ref), sendAnalyticsModule (ref), constantsModule (ref)
	return {
		setCurrentPage = function(value)
			-- upvalues: p1 (ref), setCurrentPageModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p1(setCurrentPageModule(value))
			sendAnalyticsModule("open_" .. value .. "_tab", constantsModule.AnalyticsMenuActionName, {})
		end
	}
end)(function(p1)
	-- upvalues: roact (ref), pagesModule (ref), constantsModule (ref), navigationButton (ref), dividerModule (ref)
	local t = {
		Layout = roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		})
	}
	local pagesByIndexCount = #pagesModule.pagesByIndex
	local var3 = 1
	
	for i, v in ipairs(pagesModule.pagesByIndex) do
		if v.parentPage == constantsModule.MainPagePageKey then
			t["Page" .. v.key] = roact.createElement(navigationButton, {
				icon = v.icon,
				LayoutOrder = var3,
				selected = p1.currentPage == v.key,
				text = v.title,
				onActivated = function()
					-- upvalues: p1 (ref), v (ref)
					p1.setCurrentPage(v.key)
				end,
				mainPageFirstButtonRef = if var3 == 1 then p1.mainPageFirstButtonRef else nil
			})
			var3 += 1
			
			if i < pagesByIndexCount then
				t["Divider" .. var23] = roact.createElement(dividerModule, { LayoutOrder = var3, Size = UDim2.new(1, -24, 0, 1) })
				var3 += 1
			end
		end
	end
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = p1.Position,
		Size = UDim2.new(1, -constantsModule.Zone.ContentOffset, 0, pagesByIndexCount * 70 + (pagesByIndexCount - 1))
	}, t)
end)