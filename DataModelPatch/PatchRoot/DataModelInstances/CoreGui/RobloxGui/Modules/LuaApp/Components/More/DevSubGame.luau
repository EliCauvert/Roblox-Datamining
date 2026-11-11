local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local DEPRECATEDImageSetLabelModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local DevSubGame = RoactModule.PureComponent:extend("DevSubGame")
DevSubGame.defaultProps = { layoutOrder = 0 }

function DevSubGame.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), DEPRECATEDImageSetLabelModule (copy)
	local Props = p1.props
	local Game1 = Props.game
	local SubNames = Props.subNames
	local ActiveSubs = Props.activeSubs
	local Active = Props.active
	local DividerDisabled = Props.dividerDisabled
	local OnActivated = Props.onActivated
	local LayoutOrder = Props.layoutOrder
	local MaxSize = Props.maxSize
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), MaxSize (copy), LayoutOrder (copy), OnActivated (copy), Game1 (copy), Active (copy), SubNames (copy), DEPRECATEDImageSetLabelModule (upval), ActiveSubs (copy), DividerDisabled (copy)
		return RoactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 0, MaxSize.Y),
			LayoutOrder = LayoutOrder,
			BackgroundTransparency = 1,
			Text = "",
			[RoactModule.Event.Activated] = OnActivated
		}, {
			SizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = MaxSize }),
			ContentFrame = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				Padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingTop = UDim.new(0, 13),
					PaddingBottom = UDim.new(0, 13),
					PaddingRight = UDim.new(0, 22)
				}),
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				Icon = RoactModule.createElement("ImageLabel", {
					LayoutOrder = 1,
					Size = UDim2.new(0, 44, 0, 44),
					BackgroundTransparency = if Game1.icon == nil then 0 else 1,
					Image = Game1.icon,
					ImageTransparency = if Active then 0 else 0.5
				}),
				TextFrame = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, -64, 1, 0)
				}, {
					Padding = RoactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, 12),
						PaddingRight = UDim.new(0, 12)
					}),
					Title = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 22),
						Font = p2.Font.Header2.Font,
						TextSize = p2.Font.BaseSize * p2.Font.Header2.RelativeSize,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextColor3 = p2.Theme.TextEmphasis.Color,
						TextTransparency = Active and p2.Theme.TextEmphasis.Transparency or p2.Theme.TextEmphasis.Transparency * 0.5,
						TextTruncate = Enum.TextTruncate.AtEnd,
						Text = Game1.name
					}),
					List = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0, 1),
						Position = UDim2.new(0, 0, 1, 0),
						Size = UDim2.new(1, 0, 0, 17),
						Font = p2.Font.Body.Font,
						TextSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextColor3 = p2.Theme.TextDefault.Color,
						TextTransparency = Active and p2.Theme.TextDefault.Transparency or p2.Theme.TextDefault.Transparency * 0.5,
						TextTruncate = Enum.TextTruncate.AtEnd,
						Text = table.concat(SubNames, ", ")
					})
				}),
				Circle = RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
					LayoutOrder = 3,
					Image = "LuaApp/graphic/gr-counter-slot-32x32",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 20, 0, 20),
					ImageTransparency = if Active then 0 else p2.Theme.UIDefault.Transparency,
					ImageColor3 = p2.Theme.UIDefault.Color
				}, {
					RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Visible = Active,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Size = UDim2.new(1, 0, 1, 0),
						Font = p2.Font.Footer.Font,
						TextSize = p2.Font.BaseSize * p2.Font.Footer.RelativeSize,
						TextColor3 = p2.Theme.TextDefault.Color,
						TextTransparency = p2.Theme.TextDefault.Transparency,
						Text = ActiveSubs
					})
				})
			}),
			Divider = not DividerDisabled and RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundColor3 = p2.Theme.Divider.Color,
				BackgroundTransparency = Active and p2.Theme.Divider.Transparency or 0.5,
				Size = UDim2.new(1, -80, 0, 1),
				AnchorPoint = Vector2.new(1, 1),
				Position = UDim2.new(1, 0, 1, 0)
			})
		})
	end)
end

return DevSubGame