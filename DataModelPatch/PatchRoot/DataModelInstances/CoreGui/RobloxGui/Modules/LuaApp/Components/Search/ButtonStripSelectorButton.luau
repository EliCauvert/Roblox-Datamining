local CorePackages = game:GetService("CorePackages")
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local RoactModule = require(CorePackages.Packages.Roact)
local SearchSourceEvent = require(CorePackages.Workspace.Packages.DiscoveryTypes).SearchSourceEvent
local DEPRECATEDImageSetLabelModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local FFlagSearchTopResultsTabEnabledForAll = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSearchTopResultsTabEnabledForAll
local ButtonStripSelectorButton = RoactModule.PureComponent:extend("ButtonStripSelectorButton")

function ButtonStripSelectorButton.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), SearchSourceEvent (copy), FFlagSearchTopResultsTabEnabledForAll (copy), DEPRECATEDImageSetLabelModule (copy)
	local Text = p1.props.text
	local LayoutOrder = p1.props.layoutOrder
	local Selected = p1.props.selected
	
	return WithStyleFunction(function(p2)
		-- upvalues: Selected (copy), RoactModule (upval), LayoutOrder (copy), p1 (copy), SearchSourceEvent (upval), FFlagSearchTopResultsTabEnabledForAll (upval), DEPRECATEDImageSetLabelModule (upval), Text (copy)
		local Color = Selected and p2.Theme.TextEmphasis.Color or p2.Theme.TextDefault.Color
		local Transparency = Selected and p2.Theme.SystemPrimaryContent.Transparency or p2.Theme.TextDefault.Transparency
		local ScaledBaseSize = p2.Font.BaseSize * p2.Font.Header2.RelativeSize
		
		return RoactModule.createElement("ImageButton", {
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(0, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundTransparency = Selected and p2.Theme.BackgroundOnHover.Transparency or 1,
			BackgroundColor3 = p2.Theme.BackgroundOnHover.Color,
			BorderSizePixel = 0,
			[RoactModule.Event.Activated] = function()
				-- upvalues: p1 (upval), SearchSourceEvent (upval)
				if p1.props.handleClick then
					p1.props.handleClick(SearchSourceEvent.TabSwitch)
				end
			end
		}, {
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 1000) }),
			Padding = RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, if FFlagSearchTopResultsTabEnabledForAll or p1.props.newDesignEnabled then 12 else 6),
				PaddingRight = UDim.new(0, if FFlagSearchTopResultsTabEnabledForAll or p1.props.newDesignEnabled then 12 else 6),
				PaddingTop = UDim.new(0, if FFlagSearchTopResultsTabEnabledForAll or p1.props.newDesignEnabled then 6 else 6),
				PaddingBottom = UDim.new(0, if FFlagSearchTopResultsTabEnabledForAll or p1.props.newDesignEnabled then 6 else 6)
			}),
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 4)
			}),
			Image = p1.props.image and RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				BorderSizePixel = 0,
				Size = UDim2.new(0, ScaledBaseSize, 0, ScaledBaseSize),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = p1.props.image,
				ImageColor3 = Color,
				ImageTransparency = Transparency
			}) or nil,
			Label = RoactModule.createElement("TextLabel", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Text = Text,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextSize = ScaledBaseSize,
				Font = if FFlagSearchTopResultsTabEnabledForAll or p1.props.newDesignEnabled then p2.Font.Body.Font else p2.Font.Header2.Font,
				TextColor3 = Color,
				TextTransparency = Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			})
		})
	end)
end

return ButtonStripSelectorButton