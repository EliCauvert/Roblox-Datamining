local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local otter = inGameMenuDependenciesModule.Otter
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local UIBlox = inGameMenuDependenciesModule.UIBlox
local withStyle = UIBlox.Core.Style.withStyle
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
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

function navigationButton.init(p0, p1) --[[ line: 45 ]]
	-- upvalues: roact (ref), otter (ref)
	local var10 = if p1.selected then 1 else 0
	local var11, var12 = roact.createBinding(var10)
	p0.fillSize = var11:map(function(p2) --[[ line: 49 ]]
		return UDim2.new(p2, 0, 1, 0)
	end)
	local var13, var14 = roact.createBinding(0)
	p0.hoverTransparency = var13
	p0.setHoverTransparency = var14
	p0.motor = otter.createGroupMotor({ hoverTransparency = 0, fillProgress = var10 })
	p0.motor:onStep(function(p3) --[[ line: 61 ]]
		-- upvalues: var12 (ref), p0 (ref)
		var12(p3.fillProgress)
		p0.setHoverTransparency(p3.hoverTransparency)
	end)
	p0:setState({ hovering = false, pressing = false })
end

function navigationButton.renderWithSelectionCursor(p4, p5) --[[ line: 72 ]]
	-- upvalues: withLocalizationModule (ref), withStyle (ref), roact (ref), cursorKind (ref), imageSetLabel (ref), divideTransparencyModule (ref), themedTextLabelModule (ref)
	local props = p4.props
	
	return withLocalizationModule({ text = props.text })(function(p6) --[[ line: 77 ]]
		-- upvalues: withStyle (copy), p4 (ref), props (ref), roact (copy), p5 (ref), cursorKind (copy), imageSetLabel (copy), divideTransparencyModule (copy), themedTextLabelModule (copy)
		return withStyle(function(p7) --[[ line: 78 ]]
			-- upvalues: p4 (copy), props (copy), roact (copy), p5 (copy), cursorKind (copy), imageSetLabel (copy), divideTransparencyModule (copy), themedTextLabelModule (copy), p6 (ref)
			local var15 = p4.state.pressing and not props.selected
			local t = { Transparency = 1, Color = Color3.new(1, 1, 1) }
			
			if p4.state.pressing then
				t = p7.Theme.BackgroundOnPress
			elseif p4.state.hovering then
				t = p7.Theme.BackgroundOnHover
			end
			return roact.createElement("TextButton", {
				AutoButtonColor = false,
				BackgroundTransparency = t.Transparency,
				BackgroundColor3 = t.Color,
				BorderSizePixel = 0,
				LayoutOrder = props.LayoutOrder,
				Size = UDim2.new(1, 0, 0, 70),
				Text = "",
				SelectionImageObject = p5(cursorKind.Square),
				[roact.Event.Activated] = props.onActivated,
				[roact.Ref] = if props.LayoutOrder == 1 then props.mainPageFirstButtonRef else nil,
				[roact.Event.MouseEnter] = function() --[[ line: 102 ]]
					-- upvalues: p4 (copy)
					p4:setState({ hovering = true })
				end,
				[roact.Event.MouseLeave] = function() --[[ line: 107 ]]
					-- upvalues: p4 (copy)
					p4:setState({ hovering = false, pressing = false })
				end,
				[roact.Event.InputBegan] = function(_, p8) --[[ line: 113 ]]
					-- upvalues: p4 (copy)
					if p8.UserInputType == Enum.UserInputType.MouseButton1 or p8.UserInputType == Enum.UserInputType.Touch then
						p4:setState({ pressing = true })
					end
				end,
				[roact.Event.InputEnded] = function(_, p9) --[[ line: 123 ]]
					-- upvalues: p4 (copy)
					if p9.UserInputType == Enum.UserInputType.MouseButton1 or p9.UserInputType == Enum.UserInputType.Touch then
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
					Icon = roact.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						ZIndex = 3,
						AnchorPoint = Vector2.new(0, 0.5),
						Image = props.image,
						ImageColor3 = p7.Theme.IconEmphasis.Color,
						ImageTransparency = divideTransparencyModule(p7.Theme.IconEmphasis.Transparency, if var15 then 2 else 1),
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
						TextTransparency = divideTransparencyModule(p7.Theme.TextEmphasis.Transparency, if var15 then 2 else 1),
						TextXAlignment = Enum.TextXAlignment.Left
					})
				}),
				SelectedFill = roact.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 2,
					Size = p4.fillSize,
					BackgroundColor3 = p7.Theme.BackgroundMuted.Color
				})
			})
		end)
	end)
end

function navigationButton.render(p10) --[[ line: 181 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p11) --[[ line: 182 ]]
		-- upvalues: p10 (ref)
		return p10:renderWithSelectionCursor(p11)
	end)
end

function navigationButton.didUpdate(p12) --[[ line: 187 ]]
	-- upvalues: otter (ref)
	p12.motor:setGoal({
		fillProgress = otter.spring(if p12.props.selected then 1 else 0, { frequency = 2.5 }),
		hoverTransparency = otter.spring(if p12.state.hovering then 1 else 0, { frequency = 5 })
	})
end

return roactRodux.UNSTABLE_connect2(function(p14, _) --[[ line: 243 ]]
	return { currentPage = p14.menuPage }
end, function(p15) --[[ line: 247 ]]
	-- upvalues: setCurrentPageModule (ref), sendAnalyticsModule (ref), constantsModule (ref)
	return {
		setCurrentPage = function(value) --[[ line: 249 ]]
			-- upvalues: p15 (ref), setCurrentPageModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p15(setCurrentPageModule(value))
			sendAnalyticsModule("open_" .. value .. "_tab", constantsModule.AnalyticsMenuActionName, {})
		end
	}
end)(function(p13) --[[ line: 198 | named "PageNavigation" ]]
	-- upvalues: roact (ref), pagesModule (ref), constantsModule (ref), navigationButton (ref), dividerModule (ref)
	local t = {
		Layout = roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		})
	}
	local pagesByIndexCount = #pagesModule.pagesByIndex
	local var19 = 1
	
	for i, v in ipairs(pagesModule.pagesByIndex) do
		if v.parentPage == constantsModule.MainPagePageKey then
			t["Page" .. v.key] = roact.createElement(navigationButton, {
				image = v.icon,
				LayoutOrder = var19,
				selected = p13.currentPage == v.key,
				text = v.title,
				onActivated = function() --[[ line: 216 ]]
					-- upvalues: p13 (ref), v (ref)
					p13.setCurrentPage(v.key)
				end,
				mainPageFirstButtonRef = if var19 == 1 then p13.mainPageFirstButtonRef else nil
			})
			var19 += 1
			
			if i < pagesByIndexCount then
				t["Divider" .. var19] = roact.createElement(dividerModule, { LayoutOrder = var19, Size = UDim2.new(1, -24, 0, 1) })
				var19 += 1
			end
		end
	end
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = p13.Position,
		Size = UDim2.new(1, -constantsModule.Zone.ContentOffset, 0, pagesByIndexCount * 70 + (pagesByIndexCount - 1))
	}, t)
end)