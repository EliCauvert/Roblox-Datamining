local Parent = script:FindFirstAncestor("AppBlox").Parent
local UIBloxModule = require(Parent.UIBlox)
local TModule = require(Parent.t)
local RoactModule = require(Parent.Roact)
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local ActionBar = UIBloxModule.App.Button.ActionBar
local FFlagUIBloxEnableActionBarButtonOverride = require(Parent.SharedFlags).UIBlox.FFlagUIBloxEnableActionBarButtonOverride
local FFlagUIBloxEnableActionBarButtonOverride1 = game:DefineFastFlag("LuaAppFixUnifiedPlayButtonStickyActionBar", false) and FFlagUIBloxEnableActionBarButtonOverride
local IconSize = UIBloxModule.App.ImageSet.getIconSize(UIBloxModule.App.ImageSet.Enum.IconSize.Large)
local StickyActionBar = RoactModule.PureComponent:extend("StickyActionBar")
StickyActionBar.validateProps = TModule.strictInterface({
	actionBarProps = TModule.optional(TModule.table),
	actionBarWidth = TModule.optional(TModule.number),
	infoProps = TModule.optional(TModule.strictInterface({
		title = TModule.string,
		icon = TModule.optional(UIBloxModule.Core.ImageSet.Validator.validateImage),
		enableInfoAtStart = TModule.optional(TModule.boolean),
		infoSectionWidth = TModule.optional(TModule.integer)
	})),
	width = TModule.optional(TModule.integer),
	layoutOrder = TModule.optional(TModule.integer)
})
StickyActionBar.defaultProps = {
	actionBarProps = nil,
	actionBarWidth = 380,
	infoProps = nil,
	layoutOrder = 1,
	width = nil
}

function StickyActionBar.init(p1)
	-- upvalues: GetTextSizeFunction (copy)
	p1.state = { containerWidth = nil }
	
	function p1.onContainerSizeChange(Frame)
		-- upvalues: p1 (copy)
		p1:setState(function(_, _)
			-- upvalues: Frame (copy)
			return { containerWidth = Frame.AbsoluteSize.X }
		end)
	end
	
	local function _(): UDim2
		-- upvalues: p1 (copy)
		return UDim2.fromOffset(p1.props.actionBarWidth, 48)
	end
	
	local _ = function(p2: number, p3, p4)
		-- upvalues: p1 (copy)
		if p4 and p4.infoSectionWidth then
			return p4.infoSectionWidth
		else
			local Offset = UDim2.fromOffset(p1.props.actionBarWidth, 48).X.Offset
			
			return p3 and p2 - 80 - Offset or p2 - 80
		end
	end
	
	local function v13(p2: number, NewX: number, p3, p4)
		-- upvalues: p1 (copy)
		if p4 or not p3 then
			return {
				left = 24,
				right = 24,
				horizontalAlignment = Enum.HorizontalAlignment.Left
			}
		else
			local Offset = UDim2.fromOffset(p1.props.actionBarWidth, 48).X.Offset
			
			return {
				right = 24,
				left = math.max(Offset + (if p2 < 1280 then 24 else 80), (p2 - NewX) / 2) - Offset
			}
		end
	end
	
	local _ = function(p2, p3, p4)
		-- upvalues: GetTextSizeFunction (upval)
		return GetTextSizeFunction(p2, p3.RelativeSize * p4.Font.BaseSize, p3.Font, (Vector2.new(10000, 10000))).X
	end
	
	function p1.getLayoutConfig(p2: number, HasActionBarProps, InfoProps, XOffset: number, Title, Header, p3)
		-- upvalues: p1 (copy), GetTextSizeFunction (upval), v13 (copy)
		local v1: boolean = if p1.props.infoProps and p1.props.infoProps.enableInfoAtStart then true else false
		local NewX = GetTextSizeFunction(Title, Header.RelativeSize * p3.Font.BaseSize, Header.Font, (Vector2.new(10000, 10000))).X + XOffset + (if XOffset > 0 then 12 else 0)
		local config = {
			layoutOrder = v1 and { infoSection = 1, actionBarSection = 2 } or { infoSection = 2, actionBarSection = 1 },
			infoHorizontalAlignment = Enum.HorizontalAlignment.Left
		}
		local InfoSectionWidth = nil
		
		if InfoProps and InfoProps.infoSectionWidth then
			InfoSectionWidth = InfoProps.infoSectionWidth
		else
			local Offset = UDim2.fromOffset(p1.props.actionBarWidth, 48).X.Offset
			InfoSectionWidth = HasActionBarProps and p2 - 80 - Offset or p2 - 80
		end
		config.infoSectionWidth = InfoSectionWidth
		config.infoSectionPadding = v13(p2, NewX, HasActionBarProps, v1)
		config.actionBarSectionSize = UDim2.fromOffset(p1.props.actionBarWidth, 48)
		config.actionBarSectionMarginOverride = { left = 0, right = 0, top = 0, bottom = 0 }
		
		return config
	end
end

function StickyActionBar.render(p1)
	-- upvalues: WithStyleFunction (copy), IconSize (copy), RoactModule (copy), ActionBar (copy), FFlagUIBloxEnableActionBarButtonOverride1 (copy), ImageSetLabel (copy), StyledTextLabel (copy)
	local HasActionBarProps = p1.props.actionBarProps ~= nil
	local HasInfoProps = p1.props.infoProps ~= nil
	local Width = p1.props.width or p1.state.containerWidth
	assert(HasActionBarProps or HasInfoProps, "Either actionbar or info should be present!")
	
	return WithStyleFunction(function(p2)
		-- upvalues: HasInfoProps (copy), p1 (copy), IconSize (upval), Width (copy), HasActionBarProps (copy), RoactModule (upval), ActionBar (upval), FFlagUIBloxEnableActionBarButtonOverride1 (upval), ImageSetLabel (upval), StyledTextLabel (upval)
		local IconSize1 = HasInfoProps and p1.props.infoProps.icon and IconSize or 0
		local Title = HasInfoProps and p1.props.infoProps.title or ""
		local Header2 = p2.Font.Header2
		local LayoutConfig = p1.getLayoutConfig(Width or 0, HasActionBarProps, p1.props.infoProps, IconSize1, Title, Header2, p2)
		
		return p1:renderHorizontalLayout({
			layoutOrder = p1.props.layoutOrder,
			size = p1.props.width and UDim2.new(0, p1.props.width, 1, 0) or UDim2.fromScale(1, 1),
			onContainerSizeChange = p1.onContainerSizeChange,
			horizontalAlignment = Enum.HorizontalAlignment.Left,
			padding = { left = 56, right = 24 }
		}, {
			ActionBarSection = HasActionBarProps and p1:renderHorizontalLayout({
				layoutOrder = LayoutConfig.layoutOrder.actionBarSection,
				size = LayoutConfig.actionBarSectionSize,
				horizontalAlignment = Enum.HorizontalAlignment.Left
			}, {
				ActionBar = RoactModule.createElement(ActionBar, {
					enableButtonAtStart = true,
					button = p1.props.actionBarProps.button,
					buttonOverride = if FFlagUIBloxEnableActionBarButtonOverride1 then p1.props.actionBarProps.buttonOverride else nil,
					icons = p1.props.actionBarProps.icons,
					marginOverride = LayoutConfig.actionBarSectionMarginOverride
				})
			}) or nil,
			InfoSection = HasInfoProps and (Width ~= nil and p1:renderHorizontalLayout({
				internalSpacing = 12,
				layoutOrder = LayoutConfig.layoutOrder.infoSection,
				width = LayoutConfig.infoSectionWidth,
				horizontalAlignment = LayoutConfig.infoHorizontalAlignment,
				padding = LayoutConfig.infoSectionPadding
			}, {
				Icon = p1.props.infoProps.icon and RoactModule.createElement(ImageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, IconSize1, 0, IconSize1),
					Position = UDim2.new(0, 0, 0, 0),
					Image = p1.props.infoProps.icon,
					ScaleType = Enum.ScaleType.Crop
				}, {
					RoundCorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
				}) or nil,
				Title = RoactModule.createElement(StyledTextLabel, {
					layoutOrder = 2,
					fluidSizing = false,
					textWrapped = true,
					size = UDim2.new(0, 0, 0, 48),
					automaticSize = Enum.AutomaticSize.X,
					text = Title,
					textXAlignment = Enum.TextXAlignment.Left,
					colorStyle = p2.Theme.TextEmphasis,
					fontStyle = Header2,
					textTruncate = Enum.TextTruncate.AtEnd
				})
			}))
		})
	end)
end

function StickyActionBar:renderHorizontalLayout(p1, p2)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Frame", {
		Size = p1.size and p1.size or UDim2.new(0, p1.width, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		[RoactModule.Change.AbsoluteSize] = p1.onContainerSizeChange
	}, {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = p1.horizontalAlignment,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, p1.internalSpacing or 0)
		}),
		Padding = if p1.padding then RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p1.padding.left or 0),
			PaddingRight = UDim.new(0, p1.padding.right or 0),
			PaddingTop = UDim.new(0, p1.padding.top or 0),
			PaddingBottom = UDim.new(0, p1.padding.bottom or 0)
		}) else nil,
		Elements = RoactModule.createFragment(p2)
	})
end

return StickyActionBar