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
local var1 = if fFlagPopularFillIconEnabledModule then images[require(parent.Flags.GetFStringPopularFillIconLocation)()] else nil
local var2 = if fFlagPopularFillIconEnabledModule then UDim2.new(0, 16, 0, 16) else UDim2.new(0, 0, 0, 0)
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

local function getPopularityThreshold(p1, p2)
	return if not (p2 ~= 1 and p2 ~= 2) then if p1 <= 2 then 0 elseif p1 <= 5 then 1 elseif p1 <= 7 then if p2 == 1 then 1 else 2 elseif p1 <= 9 then if p2 == 1 then 2 elseif p1 <= 8 then 2 else 3 elseif p1 <= 20 then if p2 == 1 then 2 else 4 elseif p1 <= 50 then if p2 == 1 then 3 else 5 elseif p1 <= 100 then if p2 == 1 then 4 else 7 elseif p2 == 1 then 7 else 12 else 0
end

local function createItemBadge(_, p1)
	-- upvalues: fFlagPopularFillIconEnabledModule (ref), roactModule (ref), imageSetLabel (ref), var2 (ref), var1 (ref)
	local var3 = if fFlagPopularFillIconEnabledModule and p1.isPopularItem then roactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = var2,
		Image = var1,
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
			Text = p1.badgeText,
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
	
	if var3 then
		t.PopularIcon = var3
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

local function createItemIconComponent(p1, p2, p3, p4, _)
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
			Size = UDim2.new(0, p2, 0, p3),
			ScaleType = Enum.ScaleType.Stretch,
			Image = p1,
			ImageTransparency = if p1 == imageunavailable then p4.UIDefault.Transparency else 0,
			ImageColor3 = if p1 == imageunavailable then p4.UIDefault.Color else Color3.new(1, 1, 1)
		})
	})
end

local function createItemDetailsComponent(p1, p2, p3, p4)
	-- upvalues: roactModule (ref), fitTextLabel (ref), fitFrameVertical (ref), imageSetLabel (ref), robux (ref), getPopularityThreshold (ref), createItemBadge (ref)
	local t = {
		ItemName = roactModule.createElement(fitTextLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			TextWrapped = true,
			width = fitTextLabel.Width.FitToText,
			maximumWidth = p2 * 0.55,
			Font = p4.Header2.Font,
			Text = p1.itemName,
			TextSize = p4.BaseSize * p4.Header2.RelativeSize,
			TextColor3 = p3.TextEmphasis.Color,
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
				ImageColor3 = p3.IconEmphasis.Color,
				ImageTransparency = p3.IconEmphasis.Transparency
			}),
			ItemCost = roactModule.createElement(fitTextLabel, {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				TextWrapped = true,
				width = fitTextLabel.Width.FitToText,
				maximumWidth = p2,
				Font = p4.Header2.Font,
				Text = tostring(p1.itemRobuxCost),
				TextSize = p4.BaseSize * p4.Header2.RelativeSize,
				TextColor3 = p3.TextEmphasis.Color
			})
		})
	}
	
	if p1.userVariant and p1.catalogSize and (p1.salesRank and p1.salesRank <= getPopularityThreshold(p1.catalogSize, p1.userVariant)) then
		t.ItemBadge = createItemBadge(p4, p1)
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

function name.render(p1)
	-- upvalues: withStyle (ref), constantsModule (ref), iconSize (ref), getEnableCondenseRobuxUpsellModule (ref), roactModule (ref), modelViewportModule (ref), imageunavailable (ref), createItemIconComponent (ref), createItemDetailsComponent (ref), fitFrameVertical (ref)
	local props = p1.props
	
	return withStyle(function(p2)
		-- upvalues: constantsModule (copy), props (ref), iconSize (copy), getEnableCondenseRobuxUpsellModule (copy), roactModule (copy), modelViewportModule (copy), imageunavailable (copy), createItemIconComponent (copy), createItemDetailsComponent (copy), p1 (ref), fitFrameVertical (copy)
		local theme = p2.Theme
		local font = p2.Font
		local var3 = if props.model == nil and props.itemIcon == nil then iconSize.Large else constantsModule.NORMAL_ICON_SIZE
		local var4 = if getEnableCondenseRobuxUpsellModule() then props.itemIconWidth or var3 else var3
		local var5 = if getEnableCondenseRobuxUpsellModule() then props.itemIconHeight or var3 else var3
		local _ = nil
		
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
				ItemIcon = if props.model == nil then createItemIconComponent(props.itemIcon or imageunavailable, var4, var5, theme, props) else roactModule.createElement(modelViewportModule, {
					model = props.model,
					Position = UDim2.fromOffset(5, 5),
					Size = UDim2.fromOffset(var4, var5)
				})
			}),
			ItemDetailsFrame = createItemDetailsComponent(props, p1.state.contentSize.X, theme, font)
		})
	end)
end

return name