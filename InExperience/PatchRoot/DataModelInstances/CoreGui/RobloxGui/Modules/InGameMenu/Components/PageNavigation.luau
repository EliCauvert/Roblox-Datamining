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
local var3 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var4 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
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

function navigationButton.init(p0, p1)
	-- upvalues: roact (ref), otter (ref)
	local var14 = if p1.selected then 1 else 0
	local var15, var16 = roact.createBinding(var14)
	p0.fillSize = var15:map(function(p2)
		return UDim2.new(p2, 0, 1, 0)
	end)
	local var17, var18 = roact.createBinding(0)
	p0.hoverTransparency = var17
	p0.setHoverTransparency = var18
	p0.motor = otter.createGroupMotor({ hoverTransparency = 0, fillProgress = var14 })
	p0.motor:onStep(function(p3)
		-- upvalues: var16 (ref), p0 (ref)
		var16(p3.fillProgress)
		p0.setHoverTransparency(p3.hoverTransparency)
	end)
	p0:setState({ hovering = false, pressing = false })
end

function navigationButton.renderWithSelectionCursor(p4, p5)
	-- upvalues: withLocalizationModule (ref), withFoundationOrUIBloxStyle (ref), roact (ref), var4 (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), icon (ref), iconSize (ref), divideTransparencyModule (ref), imageSetLabel (ref), themedTextLabelModule (ref)
	local props = p4.props
	
	return withLocalizationModule({ text = props.text })(function(p6)
		-- upvalues: withFoundationOrUIBloxStyle (copy), p4 (ref), props (ref), roact (copy), p5 (ref), var4 (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), icon (copy), iconSize (copy), divideTransparencyModule (copy), imageSetLabel (copy), themedTextLabelModule (copy)
		return withFoundationOrUIBloxStyle(function(p7)
			return {
				Theme = {
					BackgroundOnPress = {
						Color = p7.Color.State.Press.Color3,
						Transparency = p7.Color.State.Press.Transparency
					},
					BackgroundOnHover = {
						Color = p7.Color.State.Hover.Color3,
						Transparency = p7.Color.State.Hover.Transparency
					},
					IconEmphasis = {
						Color = p7.Color.Content.Emphasis.Color3,
						Transparency = p7.Color.Content.Emphasis.Transparency
					},
					TextEmphasis = {
						Color = p7.Color.Content.Emphasis.Color3,
						Transparency = p7.Color.Content.Emphasis.Transparency
					},
					BackgroundMuted = {
						Color = p7.Color.Surface.Surface_200.Color3,
						Transparency = p7.Color.Surface.Surface_200.Transparency
					}
				}
			}
		end, function(p8)
			-- upvalues: p4 (copy), props (copy), roact (copy), p5 (copy), var4 (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), icon (copy), iconSize (copy), divideTransparencyModule (copy), imageSetLabel (copy), themedTextLabelModule (copy), p6 (ref)
			local var19 = p4.state.pressing and not props.selected
			local t = { Transparency = 1, Color = Color3.new(1, 1, 1) }
			
			if p4.state.pressing then
				t = p8.Theme.BackgroundOnPress
			elseif p4.state.hovering then
				t = p8.Theme.BackgroundOnHover
			end
			return roact.createElement("TextButton", {
				AutoButtonColor = false,
				BackgroundTransparency = t.Transparency,
				BackgroundColor3 = t.Color,
				BorderSizePixel = 0,
				LayoutOrder = props.LayoutOrder,
				Size = UDim2.new(1, 0, 0, 70),
				Text = "",
				SelectionImageObject = p5(var4.Square),
				[roact.Event.Activated] = props.onActivated,
				[roact.Ref] = if props.LayoutOrder == 1 then props.mainPageFirstButtonRef else nil,
				[roact.Event.MouseEnter] = function()
					-- upvalues: p4 (copy)
					p4:setState({ hovering = true })
				end,
				[roact.Event.MouseLeave] = function()
					-- upvalues: p4 (copy)
					p4:setState({ hovering = false, pressing = false })
				end,
				[roact.Event.InputBegan] = function(_, p9)
					-- upvalues: p4 (copy)
					if p9.UserInputType == Enum.UserInputType.MouseButton1 or p9.UserInputType == Enum.UserInputType.Touch then
						p4:setState({ pressing = true })
					end
				end,
				[roact.Event.InputEnded] = function(_, p10)
					-- upvalues: p4 (copy)
					if p10.UserInputType == Enum.UserInputType.MouseButton1 or p10.UserInputType == Enum.UserInputType.Touch then
						p4:setState({ pressing = false })
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
							Color3 = p8.Theme.IconEmphasis.Color,
							Transparency = divideTransparencyModule(p8.Theme.IconEmphasis.Transparency, if var19 then 2 else 1)
						},
						Position = UDim2.new(0, 28, 0.5, 0)
					}) else roact.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						ZIndex = 3,
						AnchorPoint = Vector2.new(0, 0.5),
						Image = props.icon,
						ImageColor3 = p8.Theme.IconEmphasis.Color,
						ImageTransparency = divideTransparencyModule(p8.Theme.IconEmphasis.Transparency, if var19 then 2 else 1),
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
						Text = p6.text,
						TextTransparency = divideTransparencyModule(p8.Theme.TextEmphasis.Transparency, if var19 then 2 else 1),
						TextXAlignment = Enum.TextXAlignment.Left
					})
				}),
				SelectedFill = roact.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 2,
					Size = p4.fillSize,
					BackgroundColor3 = p8.Theme.BackgroundMuted.Color
				})
			})
		end)
	end)
end

function navigationButton.render(p11)
	-- upvalues: var3 (ref)
	return var3(function(p12)
		-- upvalues: p11 (ref)
		return p11:renderWithSelectionCursor(p12)
	end)
end

function navigationButton.didUpdate(p13)
	-- upvalues: otter (ref)
	p13.motor:setGoal({
		fillProgress = otter.spring(if p13.props.selected then 1 else 0, { frequency = 2.5 }),
		hoverTransparency = otter.spring(if p13.state.hovering then 1 else 0, { frequency = 5 })
	})
end

return roactRodux.UNSTABLE_connect2(function(p15, _)
	return { currentPage = p15.menuPage }
end, function(p16)
	-- upvalues: setCurrentPageModule (ref), sendAnalyticsModule (ref), constantsModule (ref)
	return {
		setCurrentPage = function(value)
			-- upvalues: p16 (ref), setCurrentPageModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p16(setCurrentPageModule(value))
			sendAnalyticsModule("open_" .. value .. "_tab", constantsModule.AnalyticsMenuActionName, {})
		end
	}
end)(function(p14)
	-- upvalues: roact (ref), pagesModule (ref), constantsModule (ref), navigationButton (ref), dividerModule (ref)
	local t = {
		Layout = roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		})
	}
	local pagesByIndexCount = #pagesModule.pagesByIndex
	local var23 = 1
	
	for i, v in ipairs(pagesModule.pagesByIndex) do
		if v.parentPage == constantsModule.MainPagePageKey then
			t["Page" .. v.key] = roact.createElement(navigationButton, {
				icon = v.icon,
				LayoutOrder = var23,
				selected = p14.currentPage == v.key,
				text = v.title,
				onActivated = function()
					-- upvalues: p14 (ref), v (ref)
					p14.setCurrentPage(v.key)
				end,
				mainPageFirstButtonRef = if var23 == 1 then p14.mainPageFirstButtonRef else nil
			})
			var23 += 1
			
			if i < pagesByIndexCount then
				t["Divider" .. var23] = roact.createElement(dividerModule, { LayoutOrder = var23, Size = UDim2.new(1, -24, 0, 1) })
				var23 += 1
			end
		end
	end
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = p14.Position,
		Size = UDim2.new(1, -constantsModule.Zone.ContentOffset, 0, pagesByIndexCount * 70 + (pagesByIndexCount - 1))
	}, t)
end)