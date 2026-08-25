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
local var4 = getIconSize(iconSize.Large)
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

function stickyActionBar.init(p0)
	-- upvalues: getTextSize (ref)
	p0.state = { containerWidth = nil }
	
	function p0.onContainerSizeChange(p1)
		-- upvalues: p0 (ref)
		p0:setState(function(_, _)
			-- upvalues: p1 (ref)
			return { containerWidth = p1.AbsoluteSize.X }
		end)
	end
	
	local _ = function()
		-- upvalues: p0 (ref)
		return UDim2.fromOffset(p0.props.actionBarWidth, 48)
	end
	
	local _ = function(p2, p3, p4)
		-- upvalues: p0 (ref)
		return if p4 and p4.infoSectionWidth then p4.infoSectionWidth elseif p3 then p2 - 80 - UDim2.fromOffset(p0.props.actionBarWidth, 48).X.Offset else p2 - 80
	end
	
	local var6 = function(p5, p6, p7, p8)
		-- upvalues: p0 (ref)
		if p8 or not p7 then
			return {
				left = 24,
				right = 24,
				horizontalAlignment = Enum.HorizontalAlignment.Left
			}
		end
		local offset = UDim2.fromOffset(p0.props.actionBarWidth, 48).X.Offset
		
		return {
			right = 24,
			left = math.max(offset + (if p5 < 1280 then 24 else 80), (p5 - p6) / 2) - offset
		}
	end
	
	local _ = function(p9, p10, p11)
		-- upvalues: getTextSize (copy)
		return getTextSize(p9, p10.RelativeSize * p11.Font.BaseSize, p10.Font, Vector2.new(10000, 10000)).X
	end
	
	function p0.getLayoutConfig(p12, p13, p14, p15, p16, p17, p18)
		-- upvalues: p0 (ref), getTextSize (copy), var6 (ref)
		local var7 = if p0.props.infoProps and p0.props.infoProps.enableInfoAtStart then true else false
		
		return {
			layoutOrder = if var7 then { infoSection = 1, actionBarSection = 2 } else { infoSection = 2, actionBarSection = 1 },
			infoHorizontalAlignment = Enum.HorizontalAlignment.Left,
			infoSectionWidth = if p14 and p14.infoSectionWidth then p14.infoSectionWidth elseif p13 then p12 - 80 - UDim2.fromOffset(p0.props.actionBarWidth, 48).X.Offset else p12 - 80,
			infoSectionPadding = var6(p12, getTextSize(p16, p17.RelativeSize * p18.Font.BaseSize, p17.Font, Vector2.new(10000, 10000)).X + p15 + (if p15 > 0 then 12 else 0), p13, var7),
			actionBarSectionSize = UDim2.fromOffset(p0.props.actionBarWidth, 48),
			actionBarSectionMarginOverride = { left = 0, right = 0, top = 0, bottom = 0 }
		}
	end
end

function stickyActionBar.render(p19)
	-- upvalues: withStyle (ref), var4 (ref), roactModule (ref), actionBar (ref), fFlagUIBloxEnableActionBarButtonOverride (ref), imageSetLabel (ref), styledTextLabel (ref)
	local var8 = p19.props.actionBarProps ~= nil
	local var9 = p19.props.infoProps ~= nil
	local width = p19.props.width or p19.state.containerWidth
	assert(var8 or var9, "Either actionbar or info should be present!")
	
	return withStyle(function(p20)
		-- upvalues: var9 (ref), p19 (ref), var4 (copy), width (ref), var8 (ref), roactModule (copy), actionBar (copy), fFlagUIBloxEnableActionBarButtonOverride (copy), imageSetLabel (copy), styledTextLabel (copy)
		local var4_1 = var9 and (p19.props.infoProps.icon and (var4 or 0))
		local var12 = if var9 then p19.props.infoProps.title else ""
		local header2 = p20.Font.Header2
		local layoutConfig = p19.getLayoutConfig(width or 0, var8, p19.props.infoProps, var4_1, var12, header2, p20)
		
		return p19:renderHorizontalLayout({
			layoutOrder = p19.props.layoutOrder,
			size = p19.props.width and UDim2.new(0, p19.props.width, 1, 0) or UDim2.fromScale(1, 1),
			onContainerSizeChange = p19.onContainerSizeChange,
			horizontalAlignment = Enum.HorizontalAlignment.Left,
			padding = { left = 56, right = 24 }
		}, {
			ActionBarSection = var8 and (p19:renderHorizontalLayout({
				layoutOrder = layoutConfig.layoutOrder.actionBarSection,
				size = layoutConfig.actionBarSectionSize,
				horizontalAlignment = Enum.HorizontalAlignment.Left
			}, {
				ActionBar = roactModule.createElement(actionBar, {
					enableButtonAtStart = true,
					button = p19.props.actionBarProps.button,
					buttonOverride = if fFlagUIBloxEnableActionBarButtonOverride then p19.props.actionBarProps.buttonOverride else nil,
					icons = p19.props.actionBarProps.icons,
					marginOverride = layoutConfig.actionBarSectionMarginOverride
				})
			}) or nil),
			InfoSection = var9 and (width ~= nil and p19:renderHorizontalLayout({
				internalSpacing = 12,
				layoutOrder = layoutConfig.layoutOrder.infoSection,
				width = layoutConfig.infoSectionWidth,
				horizontalAlignment = layoutConfig.infoHorizontalAlignment,
				padding = layoutConfig.infoSectionPadding
			}, {
				Icon = p19.props.infoProps.icon and roactModule.createElement(imageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, var4_1, 0, var4_1),
					Position = UDim2.new(0, 0, 0, 0),
					Image = p19.props.infoProps.icon,
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
					text = var12,
					textXAlignment = Enum.TextXAlignment.Left,
					colorStyle = p20.Theme.TextEmphasis,
					fontStyle = header2,
					textTruncate = Enum.TextTruncate.AtEnd
				})
			}))
		})
	end)
end

function stickyActionBar.renderHorizontalLayout(_, p21, p22)
	-- upvalues: roactModule (ref)
	return roactModule.createElement("Frame", {
		Size = if p21.size then p21.size else UDim2.new(0, p21.width, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p21.layoutOrder,
		[roactModule.Change.AbsoluteSize] = p21.onContainerSizeChange
	}, {
		Layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = p21.horizontalAlignment,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, p21.internalSpacing or 0)
		}),
		Padding = if p21.padding then roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p21.padding.left or 0),
			PaddingRight = UDim.new(0, p21.padding.right or 0),
			PaddingTop = UDim.new(0, p21.padding.top or 0),
			PaddingBottom = UDim.new(0, p21.padding.bottom or 0)
		}) else nil,
		Elements = roactModule.createFragment(p22)
	})
end

return stickyActionBar