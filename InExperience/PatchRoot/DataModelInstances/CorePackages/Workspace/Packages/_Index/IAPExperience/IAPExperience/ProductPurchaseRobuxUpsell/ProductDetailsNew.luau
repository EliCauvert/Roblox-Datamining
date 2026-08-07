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
local fFlagPopularFillIconEnabledModule = require(parent.Flags.FFlagPopularFillIconEnabled)
local var7 = if fFlagPopularFillIconEnabledModule then images[require(parent.Flags.GetFStringPopularFillIconLocation)()] else nil
local var8 = if fFlagPopularFillIconEnabledModule then UDim2.new(0, 16, 0, 16) else UDim2.new(0, 0, 0, 0)
local name = roactModule.Component:extend(script.Name)

function name.init(p0) --[[ line: 57 ]]
	-- upvalues: roactModule (ref)
	p0.contentRef = roactModule.createRef()
	p0.state = { contentSize = Vector2.new(0, 0) }
	
	function p0.changeContentSize(p1) --[[ line: 62 ]]
		-- upvalues: p0 (ref)
		if p0.state.contentSize ~= p1.AbsoluteSize then
			p0:setState({ contentSize = p1.AbsoluteSize })
		end
	end
end

local function getPopularityThreshold(p2, p3) --[[ line: 91 ]]
	return if not (p3 ~= 1 and p3 ~= 2) then if p2 <= 2 then 0 elseif p2 <= 5 then 1 elseif p2 <= 7 then if p3 == 1 then 1 else 2 elseif p2 <= 9 then if p3 == 1 then 2 elseif p2 <= 8 then 2 else 3 elseif p2 <= 20 then if p3 == 1 then 2 else 4 elseif p2 <= 50 then if p3 == 1 then 3 else 5 elseif p2 <= 100 then if p3 == 1 then 4 else 7 elseif p3 == 1 then 7 else 12 else 0
end

local function createItemBadge(_, p4) --[[ line: 115 ]]
	-- upvalues: fFlagPopularFillIconEnabledModule (ref), roactModule (ref), imageSetLabel (ref), var8 (ref), var7 (ref)
	local var14 = if fFlagPopularFillIconEnabledModule and p4.isPopularItem then roactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = var8,
		Image = var7,
		ImageColor3 = Color3.fromRGB(0, 0, 0)
	}) else nil
	local t = {
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 1)
		}),
		TextLabel = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextSize = 12,
			LayoutOrder = 2,
			Text = p4.badgeText,
			Size = UDim2.new(0, 34, 0, 12),
			AutomaticSize = Enum.AutomaticSize.X,
			TextColor3 = Color3.fromRGB(25, 27, 29),
			Font = Enum.Font.BuilderSansBold,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		UIPadding = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 4),
			PaddingRight = UDim.new(0, 8),
			PaddingTop = UDim.new(0, 2),
			PaddingBottom = UDim.new(0, 2)
		}),
		UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 8) }),
		UIStroke = roactModule.createElement("UIStroke", { Thickness = 1, Color = Color3.fromRGB(206, 183, 115) })
	}
	
	if var14 then
		t.PopularIcon = var14
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		LayoutOrder = 3,
		Size = UDim2.new(0, 44, 0, 20),
		BackgroundColor3 = Color3.fromRGB(239, 215, 109),
		AutomaticSize = Enum.AutomaticSize.XY,
		AnchorPoint = Vector2.new(0, 1)
	}, t)
end

local function createItemIconComponent(p5, p6, p7, p8, _) --[[ line: 177 ]]
	-- upvalues: roactModule (ref), imageSetLabel (ref), imageunavailable (ref), fitFrameVertical (ref)
	return roactModule.createElement(fitFrameVertical, {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		width = UDim.new(1, 0),
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top
	}, {
		ItemImage = roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, p6, 0, p7),
			ScaleType = Enum.ScaleType.Stretch,
			Image = p5,
			ImageTransparency = if p5 == imageunavailable then p8.UIDefault.Transparency else 0,
			ImageColor3 = if p5 == imageunavailable then p8.UIDefault.Color else Color3.new(1, 1, 1)
		})
	})
end

local function createItemDetailsComponent(p9, p10, p11, p12) --[[ line: 198 ]]
	-- upvalues: roactModule (ref), fitTextLabel (ref), fitFrameVertical (ref), imageSetLabel (ref), robux (ref), getPopularityThreshold (ref), createItemBadge (ref)
	local t = {
		ItemName = roactModule.createElement(fitTextLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			TextWrapped = true,
			width = fitTextLabel.Width.FitToText,
			maximumWidth = p10 * 0.55,
			Font = p12.Header2.Font,
			Text = p9.itemName,
			TextSize = p12.BaseSize * p12.Header2.RelativeSize,
			TextColor3 = p11.TextEmphasis.Color,
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
				Size = UDim2.new(0, 24, 0, 24),
				ScaleType = Enum.ScaleType.Stretch,
				Image = robux,
				ImageColor3 = p11.IconEmphasis.Color,
				ImageTransparency = p11.IconEmphasis.Transparency
			}),
			ItemCost = roactModule.createElement(fitTextLabel, {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				TextWrapped = true,
				width = fitTextLabel.Width.FitToText,
				maximumWidth = p10,
				Font = p12.Header2.Font,
				Text = tostring(p9.itemRobuxCost),
				TextSize = p12.BaseSize * p12.Header2.RelativeSize,
				TextColor3 = p11.TextEmphasis.Color
			})
		})
	}
	
	if p9.userVariant and p9.catalogSize and (p9.salesRank and p9.salesRank <= getPopularityThreshold(p9.catalogSize, p9.userVariant)) then
		t.ItemBadge = createItemBadge(p12, p9)
	end
	return roactModule.createElement(fitFrameVertical, {
		LayoutOrder = 2,
		BackgroundTransparency = 1,
		width = UDim.new(0.45, 0),
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		contentPadding = UDim.new(0, 5)
	}, t)
end

function name.render(p13) --[[ line: 262 ]]
	-- upvalues: withStyle (ref), constantsModule (ref), iconSize (ref), getEnableCondenseRobuxUpsellModule (ref), roactModule (ref), modelViewportModule (ref), imageunavailable (ref), createItemIconComponent (ref), createItemDetailsComponent (ref), fitFrameVertical (ref)
	local props = p13.props
	
	return withStyle(function(p14) --[[ line: 265 ]]
		-- upvalues: constantsModule (copy), props (ref), iconSize (copy), getEnableCondenseRobuxUpsellModule (copy), roactModule (copy), modelViewportModule (copy), imageunavailable (copy), createItemIconComponent (copy), createItemDetailsComponent (copy), p13 (ref), fitFrameVertical (copy)
		local theme = p14.Theme
		local font = p14.Font
		local var17 = if props.model == nil and props.itemIcon == nil then iconSize.Large else constantsModule.NORMAL_ICON_SIZE
		local var18 = if getEnableCondenseRobuxUpsellModule() then props.itemIconWidth or var17 else var17
		local var19 = if getEnableCondenseRobuxUpsellModule() then props.itemIconHeight or var17 else var17
		local _ = nil
		
		return roactModule.createElement(fitFrameVertical, {
			LayoutOrder = props.layoutOrder,
			BackgroundTransparency = 1,
			width = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			contentPadding = UDim.new(0, 6),
			[roactModule.Ref] = p13.contentRef,
			[roactModule.Change.AbsoluteSize] = p13.changeContentSize
		}, {
			ItemIconFrame = roactModule.createElement(fitFrameVertical, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				width = UDim.new(0.45, 0),
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				margin = { top = 0, bottom = 0, left = 0, right = 20 }
			}, {
				ItemIcon = if props.model == nil then createItemIconComponent(props.itemIcon or imageunavailable, var18, var19, theme, props) else roactModule.createElement(modelViewportModule, {
					model = props.model,
					Position = UDim2.fromOffset(5, 5),
					Size = UDim2.fromOffset(var18, var19)
				})
			}),
			ItemDetailsFrame = createItemDetailsComponent(props, p13.state.contentSize.X, theme, font)
		})
	end)
end

return name