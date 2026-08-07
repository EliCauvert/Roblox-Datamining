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

function name.init(p0) --[[ line: 39 ]]
	-- upvalues: roactModule (ref)
	p0.contentRef = roactModule.createRef()
	p0.state = { contentSize = Vector2.new(0, 0) }
	
	function p0.changeContentSize(p1) --[[ line: 45 ]]
		-- upvalues: p0 (ref)
		if p0.state.contentSize ~= p1.AbsoluteSize then
			p0:setState({ contentSize = p1.AbsoluteSize })
		end
	end
end

function name.render(p2) --[[ line: 54 ]]
	-- upvalues: withStyle (ref), constantsModule (ref), iconSize (ref), getEnableCondenseRobuxUpsellModule (ref), roactModule (ref), imageSetLabel (ref), imageunavailable (ref), modelViewportModule (ref), fitFrameVertical (ref), fitTextLabel (ref), robux (ref)
	local props = p2.props
	
	return withStyle(function(p3) --[[ line: 57 ]]
		-- upvalues: props (ref), constantsModule (copy), iconSize (copy), getEnableCondenseRobuxUpsellModule (copy), roactModule (copy), imageSetLabel (copy), imageunavailable (copy), modelViewportModule (copy), fitFrameVertical (copy), p2 (ref), fitTextLabel (copy), robux (copy)
		local theme = p3.Theme
		local font = p3.Font
		local var7 = if props.model ~= nil then constantsModule.NORMAL_ICON_SIZE elseif props.itemIcon ~= nil then constantsModule.NORMAL_ICON_SIZE else iconSize.Large
		local var8 = var7
		local var9 = var7
		
		if getEnableCondenseRobuxUpsellModule() then
			var8 = if props.itemIconWidth == nil then var7 else props.itemIconWidth
			var9 = if props.itemIconHeight == nil then var7 else props.itemIconHeight
		end
		return roactModule.createElement(fitFrameVertical, {
			LayoutOrder = props.layoutOrder,
			BackgroundTransparency = 1,
			width = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			contentPadding = UDim.new(0, 6),
			[roactModule.Ref] = p2.contentRef,
			[roactModule.Change.AbsoluteSize] = p2.changeContentSize
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
					Size = UDim2.fromOffset(var8, var9)
				}) elseif props.itemIcon then roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Position = UDim2.new(0, 5, 0, 5),
					Size = UDim2.new(0, var8, 0, var9),
					ScaleType = Enum.ScaleType.Stretch,
					Image = props.itemIcon
				}) else roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 5, 0, 5),
					Size = UDim2.new(0, var8, 0, var9),
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
					maximumWidth = p2.state.contentSize.X * 0.55,
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
						maximumWidth = p2.state.contentSize.X,
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