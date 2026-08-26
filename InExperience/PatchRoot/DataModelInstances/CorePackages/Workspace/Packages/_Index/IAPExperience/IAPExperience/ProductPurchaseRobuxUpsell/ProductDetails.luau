local parent = script.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local roactFitComponentsModule = require(parent_1.RoactFitComponents)
local fitFrameVertical = roactFitComponentsModule.FitFrameVertical
local fitTextLabel = roactFitComponentsModule.FitTextLabel
local UIBloxModule = require(parent_1.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local iconSize = UIBloxModule.App.Constant.IconSize
local withStyle = UIBloxModule.Core.Style.withStyle
local modelViewportModule = require(parent.Generic.ModelViewport)
local constantsModule = require(parent.Generic.Constants)
local getEnableCondenseRobuxUpsellModule = require(parent.Flags.getEnableCondenseRobuxUpsell)
local robux = images["icons/common/robux"]
local imageunavailable = images["icons/status/imageunavailable"]
local name = roactModule.Component:extend(script.Name)

function name.init(p1)
	-- upvalues: roactModule (ref)
	p1.contentRef = roactModule.createRef()
	p1.state = { contentSize = Vector2.new(0, 0) }
	
	function p0.changeContentSize(p2)
		-- upvalues: p1 (ref)
		if p1.state.contentSize ~= p2.AbsoluteSize then
			p1:setState({ contentSize = p2.AbsoluteSize })
		end
	end
end

function name.render(p1)
	-- upvalues: withStyle (ref), constantsModule (ref), iconSize (ref), getEnableCondenseRobuxUpsellModule (ref), roactModule (ref), imageSetLabel (ref), imageunavailable (ref), modelViewportModule (ref), fitFrameVertical (ref), fitTextLabel (ref), robux (ref)
	local props = p1.props
	
	return withStyle(function(p2)
		-- upvalues: props (ref), constantsModule (copy), iconSize (copy), getEnableCondenseRobuxUpsellModule (copy), roactModule (copy), imageSetLabel (copy), imageunavailable (copy), modelViewportModule (copy), fitFrameVertical (copy), p1 (ref), fitTextLabel (copy), robux (copy)
		local theme = p2.Theme
		local font = p2.Font
		local var1 = if props.model ~= nil then constantsModule.NORMAL_ICON_SIZE elseif props.itemIcon ~= nil then constantsModule.NORMAL_ICON_SIZE else iconSize.Large
		local var2 = var1
		local var3 = var1
		
		if getEnableCondenseRobuxUpsellModule() then
			var2 = if props.itemIconWidth == nil then var1 else props.itemIconWidth
			var3 = if props.itemIconHeight == nil then var1 else props.itemIconHeight
		end
		return roactModule.createElement(fitFrameVertical, {
			LayoutOrder = props.layoutOrder,
			BackgroundTransparency = 1,
			width = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			contentPadding = UDim.new(0, 6),
			[roactModule.Ref] = p1.contentRef,
			[roactModule.Change.AbsoluteSize] = p1.changeContentSize
		}, {
			ItemIconFrame = roactModule.createElement(fitFrameVertical, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				width = UDim.new(0.45, 0),
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				margin = { top = 0, bottom = 0, left = 0, right = 20 }
			}, {
				ItemIcon = if props.model ~= nil then roactModule.createElement(modelViewportModule, {
					model = props.model,
					Position = UDim2.fromOffset(5, 5),
					Size = UDim2.fromOffset(var2, var3)
				}) elseif props.itemIcon then roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Position = UDim2.new(0, 5, 0, 5),
					Size = UDim2.new(0, var2, 0, var3),
					ScaleType = Enum.ScaleType.Stretch,
					Image = props.itemIcon
				}) else roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 5, 0, 5),
					Size = UDim2.new(0, var2, 0, var3),
					ScaleType = Enum.ScaleType.Stretch,
					Image = imageunavailable,
					ImageColor3 = theme.UIDefault.Color,
					ImageTransparency = theme.UIDefault.Transparency
				})
			}),
			ItemDetailsFrame = roactModule.createElement(fitFrameVertical, {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				width = UDim.new(0.55, 0),
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				contentPadding = UDim.new(0, 5)
			}, {
				ItemName = roactModule.createElement(fitTextLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					TextWrapped = true,
					width = fitTextLabel.Width.FitToText,
					maximumWidth = p1.state.contentSize.X * 0.55,
					Font = font.Header2.Font,
					Text = props.itemName,
					TextSize = font.BaseSize * font.Header2.RelativeSize,
					TextColor3 = theme.TextEmphasis.Color,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				ItemCostFrame = roactModule.createElement(fitFrameVertical, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					width = UDim.new(0.5, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					contentPadding = UDim.new(0, 2)
				}, {
					RobuxIcon = roactModule.createElement(imageSetLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 5, 0, 5),
						Size = UDim2.new(0, 24, 0, 24),
						ScaleType = Enum.ScaleType.Stretch,
						Image = robux,
						ImageColor3 = theme.IconEmphasis.Color,
						ImageTransparency = theme.IconEmphasis.Transparency
					}),
					ItemCost = roactModule.createElement(fitTextLabel, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						TextWrapped = true,
						width = fitTextLabel.Width.FitToText,
						maximumWidth = p1.state.contentSize.X,
						Font = font.Header2.Font,
						Text = tostring(props.itemRobuxCost),
						TextSize = font.BaseSize * font.Header2.RelativeSize,
						TextColor3 = theme.TextEmphasis.Color
					})
				})
			})
		})
	end)
end

return name