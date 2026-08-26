local parent = script:FindFirstAncestor("AppBlox").Parent
local UIBloxModule = require(parent.UIBlox)
local tModule = require(parent.t)
local roactModule = require(parent.Roact)
local getTextSize = require(parent.Style).GetTextSize
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local validateImage = UIBloxModule.Core.ImageSet.Validator.validateImage
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local getIconSize = UIBloxModule.App.ImageSet.getIconSize
local withStyle = UIBloxModule.Core.Style.withStyle
local actionBar = UIBloxModule.App.Button.ActionBar
local fFlagUIBloxEnableActionBarButtonOverride = game:DefineFastFlag("LuaAppFixUnifiedPlayButtonStickyActionBar", false) and require(parent.SharedFlags).UIBlox.FFlagUIBloxEnableActionBarButtonOverride
local var1 = getIconSize(iconSize.Large)
local stickyActionBar = roactModule.PureComponent:extend("StickyActionBar")
stickyActionBar.validateProps = tModule.strictInterface({
	actionBarProps = tModule.optional(tModule.table),
	actionBarWidth = tModule.optional(tModule.number),
	infoProps = tModule.optional(tModule.strictInterface({
		title = tModule.string,
		icon = tModule.optional(validateImage),
		enableInfoAtStart = tModule.optional(tModule.boolean),
		infoSectionWidth = tModule.optional(tModule.integer)
	})),
	width = tModule.optional(tModule.integer),
	layoutOrder = tModule.optional(tModule.integer)
})
stickyActionBar.defaultProps = {
	actionBarProps = nil,
	actionBarWidth = 380,
	infoProps = nil,
	layoutOrder = 1,
	width = nil
}

function stickyActionBar.init(p1)
	-- upvalues: getTextSize (ref)
	p1.state = { containerWidth = nil }
	
	function p0.onContainerSizeChange(p2)
		-- upvalues: p1 (ref)
		p1:setState(function(_, _)
			-- upvalues: p2 (ref)
			return { containerWidth = p2.AbsoluteSize.X }
		end)
	end
	
	local _ = function()
		-- upvalues: p1 (ref)
		return UDim2.fromOffset(p1.props.actionBarWidth, 48)
	end
	
	local _ = function(p2, p3, p4)
		-- upvalues: p1 (ref)
		return if p4 and p4.infoSectionWidth then p4.infoSectionWidth elseif p3 then p2 - 80 - UDim2.fromOffset(p1.props.actionBarWidth, 48).X.Offset else p2 - 80
	end
	
	local var2 = function(p2, p3, p4, p5)
		-- upvalues: p1 (ref)
		if p5 or not p4 then
			return {
				left = 24,
				right = 24,
				horizontalAlignment = Enum.HorizontalAlignment.Left
			}
		end
		local offset = UDim2.fromOffset(p1.props.actionBarWidth, 48).X.Offset
		
		return {
			right = 24,
			left = math.max(offset + (if p2 < 1280 then 24 else 80), (p2 - p3) / 2) - offset
		}
	end
	
	local _ = function(p2, p3, p4)
		-- upvalues: getTextSize (copy)
		return getTextSize(p2, p3.RelativeSize * p4.Font.BaseSize, p3.Font, Vector2.new(10000, 10000)).X
	end
	
	function p0.getLayoutConfig(p2, p3, p4, p5, p6, p7, p8)
		-- upvalues: p1 (ref), getTextSize (copy), var2 (ref)
		local var3 = if p1.props.infoProps and p1.props.infoProps.enableInfoAtStart then true else false
		
		return {
			layoutOrder = if var3 then { infoSection = 1, actionBarSection = 2 } else { infoSection = 2, actionBarSection = 1 },
			infoHorizontalAlignment = Enum.HorizontalAlignment.Left,
			infoSectionWidth = if p4 and p4.infoSectionWidth then p4.infoSectionWidth elseif p3 then p2 - 80 - UDim2.fromOffset(p1.props.actionBarWidth, 48).X.Offset else p2 - 80,
			infoSectionPadding = var2(p2, getTextSize(p6, p7.RelativeSize * p8.Font.BaseSize, p7.Font, Vector2.new(10000, 10000)).X + p5 + (if p5 > 0 then 12 else 0), p3, var3),
			actionBarSectionSize = UDim2.fromOffset(p1.props.actionBarWidth, 48),
			actionBarSectionMarginOverride = { left = 0, right = 0, top = 0, bottom = 0 }
		}
	end
end

function stickyActionBar.render(p1)
	-- upvalues: withStyle (ref), var1 (ref), roactModule (ref), actionBar (ref), fFlagUIBloxEnableActionBarButtonOverride (ref), imageSetLabel (ref), styledTextLabel (ref)
	local var2 = p1.props.actionBarProps ~= nil
	local var3 = p1.props.infoProps ~= nil
	local width = p1.props.width or p1.state.containerWidth
	assert(var2 or var3, "Either actionbar or info should be present!")
	
	return withStyle(function(p2)
		-- upvalues: var3 (ref), p1 (ref), var1 (copy), width (ref), var2 (ref), roactModule (copy), actionBar (copy), fFlagUIBloxEnableActionBarButtonOverride (copy), imageSetLabel (copy), styledTextLabel (copy)
		local var4 = var3 and (p1.props.infoProps.icon and (var1 or 0))
		local var5 = if var3 then p1.props.infoProps.title else ""
		local header2 = p2.Font.Header2
		local layoutConfig = p1.getLayoutConfig(width or 0, var2, p1.props.infoProps, var4, var5, header2, p2)
		
		return p1:renderHorizontalLayout({
			layoutOrder = p1.props.layoutOrder,
			size = p1.props.width and UDim2.new(0, p1.props.width, 1, 0) or UDim2.fromScale(1, 1),
			onContainerSizeChange = p1.onContainerSizeChange,
			horizontalAlignment = Enum.HorizontalAlignment.Left,
			padding = { left = 56, right = 24 }
		}, {
			ActionBarSection = var2 and (p1:renderHorizontalLayout({
				layoutOrder = layoutConfig.layoutOrder.actionBarSection,
				size = layoutConfig.actionBarSectionSize,
				horizontalAlignment = Enum.HorizontalAlignment.Left
			}, {
				ActionBar = roactModule.createElement(actionBar, {
					enableButtonAtStart = true,
					button = p1.props.actionBarProps.button,
					buttonOverride = if fFlagUIBloxEnableActionBarButtonOverride then p1.props.actionBarProps.buttonOverride else nil,
					icons = p1.props.actionBarProps.icons,
					marginOverride = layoutConfig.actionBarSectionMarginOverride
				})
			}) or nil),
			InfoSection = var3 and (width ~= nil and p1:renderHorizontalLayout({
				internalSpacing = 12,
				layoutOrder = layoutConfig.layoutOrder.infoSection,
				width = layoutConfig.infoSectionWidth,
				horizontalAlignment = layoutConfig.infoHorizontalAlignment,
				padding = layoutConfig.infoSectionPadding
			}, {
				Icon = p1.props.infoProps.icon and roactModule.createElement(imageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, var4, 0, var4),
					Position = UDim2.new(0, 0, 0, 0),
					Image = p1.props.infoProps.icon,
					ScaleType = Enum.ScaleType.Crop
				}, {
					RoundCorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
				}) or nil,
				Title = roactModule.createElement(styledTextLabel, {
					layoutOrder = 2,
					fluidSizing = false,
					textWrapped = true,
					size = UDim2.new(0, 0, 0, 48),
					automaticSize = Enum.AutomaticSize.X,
					text = var5,
					textXAlignment = Enum.TextXAlignment.Left,
					colorStyle = p2.Theme.TextEmphasis,
					fontStyle = header2,
					textTruncate = Enum.TextTruncate.AtEnd
				})
			}))
		})
	end)
end

function stickyActionBar.renderHorizontalLayout(_, p1, p2)
	-- upvalues: roactModule (ref)
	return roactModule.createElement("Frame", {
		Size = if p1.size then p1.size else UDim2.new(0, p1.width, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		[roactModule.Change.AbsoluteSize] = p1.onContainerSizeChange
	}, {
		Layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = p1.horizontalAlignment,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, p1.internalSpacing or 0)
		}),
		Padding = if p1.padding then roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p1.padding.left or 0),
			PaddingRight = UDim.new(0, p1.padding.right or 0),
			PaddingTop = UDim.new(0, p1.padding.top or 0),
			PaddingBottom = UDim.new(0, p1.padding.bottom or 0)
		}) else nil,
		Elements = roactModule.createFragment(p2)
	})
end

return stickyActionBar