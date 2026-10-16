local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local RoactFitComponentsModule = require(Parent1.RoactFitComponents)
local FitFrameVertical = RoactFitComponentsModule.FitFrameVertical
local FitTextLabel = RoactFitComponentsModule.FitTextLabel
local UIBloxModule = require(Parent1.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconSize = UIBloxModule.App.Constant.IconSize
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local ModelViewportModule = require(Parent.Generic.ModelViewport)
local ConstantsModule = require(Parent.Generic.Constants)
local GetEnableCondenseRobuxUpsellModule = require(Parent.Flags.getEnableCondenseRobuxUpsell)
local IconsCommonRobux = Images["icons/common/robux"]
local IconsStatusImageunavailable = Images["icons/status/imageunavailable"]
local ExtendResult = RoactModule.Component:extend(script.Name)

function ExtendResult.init(p1) --[[ Line: 39 ]]
	-- upvalues: RoactModule (copy)
	p1.contentRef = RoactModule.createRef()
	p1.state = { contentSize = Vector2.new(0, 0) }
	
	function p1.changeContentSize(Frame: Frame) --[[ Line: 45 ]]
		-- upvalues: p1 (copy)
		if p1.state.contentSize ~= Frame.AbsoluteSize then
			p1:setState({ contentSize = Frame.AbsoluteSize })
		end
	end
end

function ExtendResult.render(p1) --[[ Line: 54 ]]
	-- upvalues: WithStyleFunction (copy), ConstantsModule (copy), IconSize (copy), GetEnableCondenseRobuxUpsellModule (copy), RoactModule (copy), ImageSetLabel (copy), IconsStatusImageunavailable (copy), ModelViewportModule (copy), FitFrameVertical (copy), FitTextLabel (copy), IconsCommonRobux (copy)
	local Props = p1.props
	
	return WithStyleFunction(function(p2) --[[ Line: 57 ]]
		-- upvalues: Props (copy), ConstantsModule (upval), IconSize (upval), GetEnableCondenseRobuxUpsellModule (upval), RoactModule (upval), ImageSetLabel (upval), IconsStatusImageunavailable (upval), ModelViewportModule (upval), FitFrameVertical (upval), p1 (copy), FitTextLabel (upval), IconsCommonRobux (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local Large = if Props.itemIcon == nil then if Props.model == nil then IconSize.Large else ConstantsModule.NORMAL_ICON_SIZE elseif Props.model == nil then ConstantsModule.NORMAL_ICON_SIZE or IconSize.Large else ConstantsModule.NORMAL_ICON_SIZE
		local XOffset = Large
		local YOffset = Large
		
		if GetEnableCondenseRobuxUpsellModule() then
			XOffset = Props.itemIconWidth == nil and Large or Props.itemIconWidth
			YOffset = Props.itemIconHeight == nil and Large or Props.itemIconHeight
		end
		return RoactModule.createElement(FitFrameVertical, {
			LayoutOrder = Props.layoutOrder,
			BackgroundTransparency = 1,
			width = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			contentPadding = UDim.new(0, 6),
			[RoactModule.Ref] = p1.contentRef,
			[RoactModule.Change.AbsoluteSize] = p1.changeContentSize
		}, {
			ItemIconFrame = RoactModule.createElement(FitFrameVertical, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				width = UDim.new(0.45, 0),
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				margin = { top = 0, bottom = 0, left = 0, right = 20 }
			}, {
				ItemIcon = if Props.model == nil then if Props.itemIcon then RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Position = UDim2.new(0, 5, 0, 5),
					Size = UDim2.new(0, XOffset, 0, YOffset),
					ScaleType = Enum.ScaleType.Stretch,
					Image = Props.itemIcon
				}) else RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 5, 0, 5),
					Size = UDim2.new(0, XOffset, 0, YOffset),
					ScaleType = Enum.ScaleType.Stretch,
					Image = IconsStatusImageunavailable,
					ImageColor3 = Theme.UIDefault.Color,
					ImageTransparency = Theme.UIDefault.Transparency
				}) else RoactModule.createElement(ModelViewportModule, {
					model = Props.model,
					Position = UDim2.fromOffset(5, 5),
					Size = UDim2.fromOffset(XOffset, YOffset)
				})
			}),
			ItemDetailsFrame = RoactModule.createElement(FitFrameVertical, {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				width = UDim.new(0.55, 0),
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				contentPadding = UDim.new(0, 5)
			}, {
				ItemName = RoactModule.createElement(FitTextLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					TextWrapped = true,
					width = FitTextLabel.Width.FitToText,
					maximumWidth = p1.state.contentSize.X * 0.55,
					Font = _Font.Header2.Font,
					Text = Props.itemName,
					TextSize = _Font.BaseSize * _Font.Header2.RelativeSize,
					TextColor3 = Theme.TextEmphasis.Color,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				ItemCostFrame = RoactModule.createElement(FitFrameVertical, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					width = UDim.new(0.5, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					contentPadding = UDim.new(0, 2)
				}, {
					RobuxIcon = RoactModule.createElement(ImageSetLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 5, 0, 5),
						Size = UDim2.new(0, 24, 0, 24),
						ScaleType = Enum.ScaleType.Stretch,
						Image = IconsCommonRobux,
						ImageColor3 = Theme.IconEmphasis.Color,
						ImageTransparency = Theme.IconEmphasis.Transparency
					}),
					ItemCost = RoactModule.createElement(FitTextLabel, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						TextWrapped = true,
						width = FitTextLabel.Width.FitToText,
						maximumWidth = p1.state.contentSize.X,
						Font = _Font.Header2.Font,
						Text = tostring(Props.itemRobuxCost),
						TextSize = _Font.BaseSize * _Font.Header2.RelativeSize,
						TextColor3 = Theme.TextEmphasis.Color
					})
				})
			})
		})
	end)
end

return ExtendResult