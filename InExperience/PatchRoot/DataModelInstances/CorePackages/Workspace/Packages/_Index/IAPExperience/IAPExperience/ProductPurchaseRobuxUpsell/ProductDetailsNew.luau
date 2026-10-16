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
local FFlagPopularFillIconEnabledModule = require(Parent.Flags.FFlagPopularFillIconEnabled)
local GetFStringPopularFillIconLocationModule = require(Parent.Flags.GetFStringPopularFillIconLocation)
local Image = if FFlagPopularFillIconEnabledModule then Images[GetFStringPopularFillIconLocationModule()] else nil
local _UDim2: UDim2 = if FFlagPopularFillIconEnabledModule then UDim2.new(0, 16, 0, 16) else UDim2.new(0, 0, 0, 0)
local ExtendResult = RoactModule.Component:extend(script.Name)

function ExtendResult.init(p1) --[[ Line: 57 ]]
	-- upvalues: RoactModule (copy)
	p1.contentRef = RoactModule.createRef()
	p1.state = { contentSize = Vector2.new(0, 0) }
	
	function p1.changeContentSize(Frame: Frame) --[[ Line: 62 ]]
		-- upvalues: p1 (copy)
		if p1.state.contentSize ~= Frame.AbsoluteSize then
			p1:setState({ contentSize = Frame.AbsoluteSize })
		end
	end
end

local function getPopularityThreshold(CatalogSize: number, UserVariant): number --[[ Line: 91 ]]
	return if UserVariant == 1 or UserVariant == 2 then if CatalogSize <= 2 then 0 elseif CatalogSize <= 5 then 1 elseif CatalogSize <= 7 then if UserVariant == 1 then 1 else 2 elseif CatalogSize <= 9 then if UserVariant == 1 then 2 elseif CatalogSize <= 8 then 2 else 3 elseif CatalogSize <= 20 then if UserVariant == 1 then 2 else 4 elseif CatalogSize <= 50 then if UserVariant == 1 then 3 else 5 elseif CatalogSize <= 100 then if UserVariant == 1 then 4 else 7 elseif UserVariant == 1 then 7 else 12 else 0
end

local function createItemBadge(_, p1) --[[ Line: 115 ]]
	-- upvalues: FFlagPopularFillIconEnabledModule (copy), RoactModule (copy), ImageSetLabel (copy), _UDim2 (copy), Image (copy)
	local Element = if FFlagPopularFillIconEnabledModule and p1.isPopularItem then RoactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = _UDim2,
		Image = Image,
		ImageColor3 = Color3.fromRGB(0, 0, 0)
	}) else nil
	local config = {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 1)
		}),
		TextLabel = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextSize = 12,
			LayoutOrder = 2,
			Text = p1.badgeText,
			Size = UDim2.new(0, 34, 0, 12),
			AutomaticSize = Enum.AutomaticSize.X,
			TextColor3 = Color3.fromRGB(25, 27, 29),
			Font = Enum.Font.BuilderSansBold,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 4),
			PaddingRight = UDim.new(0, 8),
			PaddingTop = UDim.new(0, 2),
			PaddingBottom = UDim.new(0, 2)
		}),
		UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 8) }),
		UIStroke = RoactModule.createElement("UIStroke", { Thickness = 1, Color = Color3.fromRGB(206, 183, 115) })
	}
	
	if Element then
		config.PopularIcon = Element
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		LayoutOrder = 3,
		Size = UDim2.new(0, 44, 0, 20),
		BackgroundColor3 = Color3.fromRGB(239, 215, 109),
		AutomaticSize = Enum.AutomaticSize.XY,
		AnchorPoint = Vector2.new(0, 1)
	}, config)
end

local function createItemIconComponent(IconsStatusImageunavailable1, XOffset, YOffset, Theme, _) --[[ Line: 177 ]]
	-- upvalues: RoactModule (copy), ImageSetLabel (copy), IconsStatusImageunavailable (copy), FitFrameVertical (copy)
	return RoactModule.createElement(FitFrameVertical, {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		width = UDim.new(1, 0),
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top
	}, {
		ItemImage = RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, XOffset, 0, YOffset),
			ScaleType = Enum.ScaleType.Stretch,
			Image = IconsStatusImageunavailable1,
			ImageTransparency = IconsStatusImageunavailable1 == IconsStatusImageunavailable and Theme.UIDefault.Transparency or 0,
			ImageColor3 = IconsStatusImageunavailable1 == IconsStatusImageunavailable and Theme.UIDefault.Color or Color3.new(1, 1, 1)
		})
	})
end

local function createItemDetailsComponent(Props, MaximumWidth: number, Theme, p1) --[[ Line: 198 ]]
	-- upvalues: RoactModule (copy), FitTextLabel (copy), FitFrameVertical (copy), ImageSetLabel (copy), IconsCommonRobux (copy), getPopularityThreshold (copy), createItemBadge (copy)
	local config = {
		ItemName = RoactModule.createElement(FitTextLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			TextWrapped = true,
			width = FitTextLabel.Width.FitToText,
			maximumWidth = MaximumWidth * 0.55,
			Font = p1.Header2.Font,
			Text = Props.itemName,
			TextSize = p1.BaseSize * p1.Header2.RelativeSize,
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
				maximumWidth = MaximumWidth,
				Font = p1.Header2.Font,
				Text = tostring(Props.itemRobuxCost),
				TextSize = p1.BaseSize * p1.Header2.RelativeSize,
				TextColor3 = Theme.TextEmphasis.Color
			})
		})
	}
	
	if Props.userVariant and Props.catalogSize and Props.salesRank and Props.salesRank <= getPopularityThreshold(Props.catalogSize, Props.userVariant) then
		config.ItemBadge = createItemBadge(p1, Props)
	end
	return RoactModule.createElement(FitFrameVertical, {
		LayoutOrder = 2,
		BackgroundTransparency = 1,
		width = UDim.new(0.45, 0),
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		contentPadding = UDim.new(0, 5)
	}, config)
end

function ExtendResult.render(p1) --[[ Line: 262 ]]
	-- upvalues: WithStyleFunction (copy), ConstantsModule (copy), IconSize (copy), GetEnableCondenseRobuxUpsellModule (copy), RoactModule (copy), ModelViewportModule (copy), IconsStatusImageunavailable (copy), createItemIconComponent (copy), createItemDetailsComponent (copy), FitFrameVertical (copy)
	local Props = p1.props
	
	return WithStyleFunction(function(p2) --[[ Line: 265 ]]
		-- upvalues: ConstantsModule (upval), Props (copy), IconSize (upval), GetEnableCondenseRobuxUpsellModule (upval), RoactModule (upval), ModelViewportModule (upval), IconsStatusImageunavailable (upval), createItemIconComponent (upval), createItemDetailsComponent (upval), p1 (copy), FitFrameVertical (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local Large = if Props.model == nil and Props.itemIcon == nil then IconSize.Large else ConstantsModule.NORMAL_ICON_SIZE
		local ItemIconWidth = GetEnableCondenseRobuxUpsellModule() and Props.itemIconWidth or Large
		local ItemIconHeight = GetEnableCondenseRobuxUpsellModule() and Props.itemIconHeight or Large
		
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
				ItemIcon = if Props.model == nil then createItemIconComponent(Props.itemIcon or IconsStatusImageunavailable, ItemIconWidth, ItemIconHeight, Theme, Props) else RoactModule.createElement(ModelViewportModule, {
					model = Props.model,
					Position = UDim2.fromOffset(5, 5),
					Size = UDim2.fromOffset(ItemIconWidth, ItemIconHeight)
				})
			}),
			ItemDetailsFrame = createItemDetailsComponent(Props, p1.state.contentSize.X, Theme, _Font)
		})
	end)
end

return ExtendResult