local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local RoactModule = require(Parent3.Roact)
local ReactModule = require(Parent3.React)
local CryoModule = require(Parent3.Cryo)
local RoactGamepadModule = require(Parent3.RoactGamepad)
local TModule = require(Parent3.t)
local FitFrameOnAxis = require(Parent3.FitFrame).FitFrameOnAxis
local ButtonModule = require(Parent.Button)
local ComboButtonModule = require(Parent.ComboButton)
local IconButtonModule = require(Parent.IconButton)
local TextButtonModule = require(Parent.TextButton)
local ButtonTypeModule = require(Parent.Enum.ButtonType)
local WithStyleModule = require(Parent2.Core.Style.withStyle)
local IconSizeModule = require(Parent1.ImageSet.Enum.IconSize)
local GetPageMarginModule = require(Parent1.Container.getPageMargin)
local ConstantsModule = require(Parent1.Style.Constants)
local UIBloxConfigModule = require(Parent2.UIBloxConfig)
local ActionBar = RoactModule.PureComponent:extend("ActionBar")

function ActionBar.init(p1)
	-- upvalues: RoactGamepadModule (copy), RoactModule (copy)
	p1.buttonRefs = p1.props.isRoactGamepadEnabled and RoactGamepadModule.createRefCache() or {}
	p1.state = { frameWidth = 0 }
	p1.frameRef = p1.props.frameRef or RoactModule.createRef()
	
	function p1.updateFrameSize(Frame: Frame)
		-- upvalues: p1 (copy)
		local X = Frame.AbsoluteSize.X
		
		if X ~= p1.state.frameWidth then
			p1:setState({ frameWidth = X })
		end
		if p1.props.onAbsoluteSizeChanged then
			p1.props.onAbsoluteSizeChanged(Frame.AbsoluteSize)
		end
	end
	
	function p1.getGamepadNextSelectionLeft(LayoutOrder: number, _)
		-- upvalues: p1 (copy)
		return LayoutOrder > 1 and p1.buttonRefs[LayoutOrder - 1] or nil
	end
	
	function p1.getGamepadNextSelectionRight(LayoutOrder: number, p2)
		-- upvalues: p1 (copy)
		return LayoutOrder < p2 and p1.buttonRefs[LayoutOrder + 1] or nil
	end
end

ActionBar.validateProps = TModule.strictInterface({
	button = TModule.optional(TModule.union(TModule.strictInterface({ props = ButtonModule.validateProps }), TModule.strictInterface({ props = ComboButtonModule.validateProps }))),
	buttonOverride = TModule.optional(TModule.table),
	iconSize = TModule.optional(TModule.number),
	buttonHeight = TModule.optional(TModule.number),
	buttonPadding = TModule.optional(TModule.number),
	enableButtonAtStart = TModule.optional(TModule.boolean),
	icons = TModule.optional(TModule.array(TModule.strictInterface({ props = IconButtonModule.validateProps }))),
	marginOverride = TModule.optional(TModule.strictInterface({
		left = TModule.number,
		right = TModule.number,
		top = TModule.number,
		bottom = TModule.number
	})),
	horizontalAlignment = TModule.optional(TModule.enum(Enum.HorizontalAlignment)),
	onAbsoluteSizeChanged = TModule.optional(TModule.callback),
	[RoactModule.Children] = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	frameRef = TModule.optional(TModule.table),
	textButtons = TModule.optional(TModule.array(TModule.strictInterface({ props = TextButtonModule.validateProps }))),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean),
	testId = TModule.optional(TModule.string)
})
ActionBar.defaultProps = {
	iconSize = 36,
	buttonHeight = 48,
	buttonPadding = 12,
	isRoactGamepadEnabled = true,
	testId = "--uiblox-action-bar",
	horizontalAlignment = Enum.HorizontalAlignment.Center
}

function ActionBar.render(p1)
	-- upvalues: WithStyleModule (copy), GetPageMarginModule (copy), IconSizeModule (copy), ConstantsModule (copy), UIBloxConfigModule (copy), CryoModule (copy), RoactModule (copy), RoactGamepadModule (copy), ReactModule (copy), IconButtonModule (copy), TextButtonModule (copy), ComboButtonModule (copy), ButtonTypeModule (copy), ButtonModule (copy), FitFrameOnAxis (copy)
	return WithStyleModule(function(_)
		-- upvalues: GetPageMarginModule (upval), p1 (copy), IconSizeModule (upval), ConstantsModule (upval), UIBloxConfigModule (upval), CryoModule (upval), RoactModule (upval), RoactGamepadModule (upval), ReactModule (upval), IconButtonModule (upval), TextButtonModule (upval), ComboButtonModule (upval), ButtonTypeModule (upval), ButtonModule (upval), FitFrameOnAxis (upval)
		local PageMarginModule: number = GetPageMarginModule(p1.state.frameWidth)
		local FrameWidthDelta = p1.state.frameWidth - PageMarginModule * 2
		local Medium = IconSizeModule.Medium
		local MarginOverride = if p1.props.marginOverride then p1.props.marginOverride else {
			top = 0,
			left = PageMarginModule,
			right = PageMarginModule,
			bottom = ConstantsModule.Layout.ActionBar.PositionOffset
		}
		local CountIcons: number = if p1.props.icons and #p1.props.icons then #p1.props.icons else 0
		local CountTextButtons: number = if p1.props.textButtons and #p1.props.textButtons then #p1.props.textButtons else 0
		local v1: number = if p1.props.button == nil and (not UIBloxConfigModule.enableActionBarButtonOverride or p1.props.buttonOverride == nil) then 0 else 1
		local v2: boolean = p1.props.enableButtonAtStart == true and v1 ~= 0
		local NewCountTextButtons = CountTextButtons + CountIcons + v1
		local Elements = {}
		
		if CountIcons ~= 0 then
			for i, icon in ipairs(p1.props.icons) do
				local LayoutOrder = v2 and i + v1 or i
				local JoinResult = CryoModule.Dictionary.join({ layoutOrder = LayoutOrder, iconSize = Medium }, icon.props)
				
				if not p1.props.isRoactGamepadEnabled then
					p1.buttonRefs[LayoutOrder] = p1.buttonRefs[LayoutOrder] or RoactModule.createRef()
				end
				table.insert(Elements, RoactModule.createElement(if p1.props.isRoactGamepadEnabled then RoactGamepadModule.Focusable.Frame else "Frame", {
					key = "Button" .. tostring(LayoutOrder),
					Size = UDim2.fromOffset(p1.props.iconSize, p1.props.iconSize),
					BackgroundTransparency = 1,
					[RoactModule.Ref] = p1.buttonRefs[LayoutOrder],
					NextSelectionUp = nil,
					NextSelectionDown = nil,
					NextSelectionLeft = p1.getGamepadNextSelectionLeft(LayoutOrder, NewCountTextButtons),
					NextSelectionRight = p1.getGamepadNextSelectionRight(LayoutOrder, NewCountTextButtons),
					inputBindings = if p1.props.isRoactGamepadEnabled then {
						Activated = JoinResult.onActivated and RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, JoinResult.onActivated) or nil
					} else nil,
					[ReactModule.Tag] = if p1.props.testId then `data-testid={p1.props.testId}--icon-button` else nil
				}, {
					Icon = RoactModule.createElement(IconButtonModule, JoinResult)
				}))
			end
		end
		if CountTextButtons ~= 0 then
			for i1, textButton in ipairs(p1.props.textButtons) do
				local NewCountIcons = (if v2 then i1 + v1 else i1) + CountIcons
				local JoinResult = CryoModule.Dictionary.join({ layoutOrder = NewCountIcons }, textButton.props)
				
				if not p1.props.isRoactGamepadEnabled then
					p1.buttonRefs[NewCountIcons] = p1.buttonRefs[NewCountIcons] or RoactModule.createRef()
				end
				table.insert(Elements, RoactModule.createElement(if p1.props.isRoactGamepadEnabled then RoactGamepadModule.Focusable.Frame else "Frame", {
					key = "Button" .. tostring(NewCountIcons),
					Size = UDim2.fromOffset(0, p1.props.iconSize),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundTransparency = 1,
					[RoactModule.Ref] = p1.buttonRefs[NewCountIcons],
					NextSelectionUp = nil,
					NextSelectionDown = nil,
					NextSelectionLeft = p1.getGamepadNextSelectionLeft(NewCountIcons, NewCountTextButtons),
					NextSelectionRight = p1.getGamepadNextSelectionRight(NewCountIcons, NewCountTextButtons),
					inputBindings = if p1.props.isRoactGamepadEnabled then {
						Activated = JoinResult.onActivated and RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, JoinResult.onActivated) or nil
					} else nil
				}, {
					TextButton = RoactModule.createElement(TextButtonModule, JoinResult)
				}))
			end
		end
		if v1 ~= 0 then
			local _UDim2 = UDim2.fromOffset(FrameWidthDelta - CountIcons * (p1.props.iconSize + p1.props.buttonPadding), p1.props.buttonHeight)
			local NewCountIcons: number = if v2 then 1 else CountIcons + 1
			local ValidatePropsResult = nil
			local JoinResult = nil
			
			if not UIBloxConfigModule.enableActionBarButtonOverride or not p1.props.buttonOverride then
				ValidatePropsResult = ComboButtonModule.validateProps(p1.props.button.props)
				JoinResult = CryoModule.Dictionary.join({ layoutOrder = NewCountIcons, size = _UDim2 }, p1.props.button.props)
				
				if not ValidatePropsResult and JoinResult.buttonType == nil then
					JoinResult.buttonType = if CountIcons == 0 then ButtonTypeModule.PrimarySystem else ButtonTypeModule.PrimaryContextual
				end
			end
			if not p1.props.isRoactGamepadEnabled then
				p1.buttonRefs[NewCountIcons] = p1.buttonRefs[NewCountIcons] or RoactModule.createRef()
			end
			table.insert(Elements, if v2 then 1 else NewCountTextButtons, RoactModule.createElement(if p1.props.isRoactGamepadEnabled then RoactGamepadModule.Focusable.Frame else "Frame", {
				key = "Button" .. NewCountIcons,
				Size = _UDim2,
				BackgroundTransparency = 1,
				[RoactModule.Ref] = p1.buttonRefs[NewCountIcons],
				NextSelectionUp = nil,
				NextSelectionDown = nil,
				NextSelectionLeft = p1.getGamepadNextSelectionLeft(NewCountIcons, NewCountTextButtons),
				NextSelectionRight = p1.getGamepadNextSelectionRight(NewCountIcons, NewCountTextButtons),
				inputBindings = if p1.props.isRoactGamepadEnabled then {
					Activated = if ValidatePropsResult or UIBloxConfigModule.enableActionBarButtonOverride and p1.props.buttonOverride then nil else RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, JoinResult.onActivated)
				} else nil,
				[ReactModule.Tag] = if p1.props.testId then `data-testid={p1.props.testId}--primary-button` else nil
			}, {
				Icon = if UIBloxConfigModule.enableActionBarButtonOverride and p1.props.buttonOverride then p1.props.buttonOverride else RoactModule.createElement(if ValidatePropsResult then ComboButtonModule else ButtonModule, JoinResult)
			}))
		end
		if p1.props[RoactModule.Children] then
			Elements = p1.props[RoactModule.Children]
		end
		return RoactModule.createElement(if p1.props.isRoactGamepadEnabled then RoactGamepadModule.Focusable[FitFrameOnAxis] else FitFrameOnAxis, {
			BackgroundTransparency = 1,
			minimumSize = UDim2.new(1, 0, 0, p1.props.buttonHeight),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = p1.props.horizontalAlignment,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			contentPadding = UDim.new(0, 12),
			[RoactModule.Ref] = p1.frameRef,
			[RoactModule.Change.AbsoluteSize] = p1.updateFrameSize,
			margin = MarginOverride,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown
		}, Elements)
	end)
end

function ActionBar.didMount(p2)
	if p2.frameRef.current then
		p2.updateFrameSize(p2.frameRef.current)
	end
end

local ForwardRefResult = RoactModule.forwardRef(function(p2, FrameRef)
	-- upvalues: RoactModule (copy), ActionBar (copy), CryoModule (copy)
	return RoactModule.createElement(ActionBar, CryoModule.Dictionary.join(p2, { frameRef = FrameRef }))
end)
ForwardRefResult.validateProps = ActionBar.validateProps

return ForwardRefResult