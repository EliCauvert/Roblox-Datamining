local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local roactModule = require(parent_3.Roact)
local reactModule = require(parent_3.React)
local cryoModule = require(parent_3.Cryo)
local roactGamepadModule = require(parent_3.RoactGamepad)
local tModule = require(parent_3.t)
local fitFrameOnAxis = require(parent_3.FitFrame).FitFrameOnAxis
local buttonModule = require(parent.Button)
local comboButtonModule = require(parent.ComboButton)
local iconButtonModule = require(parent.IconButton)
local textButtonModule = require(parent.TextButton)
local buttonTypeModule = require(parent.Enum.ButtonType)
local withStyleModule = require(parent_2.Core.Style.withStyle)
local iconSizeModule = require(parent_1.ImageSet.Enum.IconSize)
local getPageMarginModule = require(parent_1.Container.getPageMargin)
local constantsModule = require(parent_1.Style.Constants)
local UIBloxConfigModule = require(parent_2.UIBloxConfig)
local actionBar = roactModule.PureComponent:extend("ActionBar")

function actionBar.init(p0) --[[ line: 33 ]]
	-- upvalues: roactGamepadModule (ref), roactModule (ref)
	p0.buttonRefs = p0.props.isRoactGamepadEnabled and roactGamepadModule.createRefCache() or {}
	p0.state = { frameWidth = 0 }
	p0.frameRef = p0.props.frameRef or roactModule.createRef()
	
	function p0.updateFrameSize(p1) --[[ line: 42 ]]
		-- upvalues: p0 (ref)
		local x = p1.AbsoluteSize.X
		
		if x ~= p0.state.frameWidth then
			p0:setState({ frameWidth = x })
		end
		if p0.props.onAbsoluteSizeChanged then
			p0.props.onAbsoluteSizeChanged(p1.AbsoluteSize)
		end
	end
	
	function p0.getGamepadNextSelectionLeft(p2, _) --[[ line: 55 ]]
		-- upvalues: p0 (ref)
		return if p2 > 1 then p0.buttonRefs[p2 - 1] else nil
	end
	
	function p0.getGamepadNextSelectionRight(p3, p4) --[[ line: 59 ]]
		-- upvalues: p0 (ref)
		return if p3 < p4 then p0.buttonRefs[p3 + 1] else nil
	end
end

actionBar.validateProps = tModule.strictInterface({
	button = tModule.optional(tModule.union(tModule.strictInterface({ props = buttonModule.validateProps }), tModule.strictInterface({ props = comboButtonModule.validateProps }))),
	buttonOverride = tModule.optional(tModule.table),
	iconSize = tModule.optional(tModule.number),
	buttonHeight = tModule.optional(tModule.number),
	buttonPadding = tModule.optional(tModule.number),
	enableButtonAtStart = tModule.optional(tModule.boolean),
	icons = tModule.optional(tModule.array(tModule.strictInterface({ props = iconButtonModule.validateProps }))),
	marginOverride = tModule.optional(tModule.strictInterface({
		left = tModule.number,
		right = tModule.number,
		top = tModule.number,
		bottom = tModule.number
	})),
	horizontalAlignment = tModule.optional(tModule.enum(Enum.HorizontalAlignment)),
	onAbsoluteSizeChanged = tModule.optional(tModule.callback),
	[roactModule.Children] = tModule.optional(tModule.table),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	frameRef = tModule.optional(tModule.table),
	textButtons = tModule.optional(tModule.array(tModule.strictInterface({ props = textButtonModule.validateProps }))),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean),
	testId = tModule.optional(tModule.string)
})
actionBar.defaultProps = {
	iconSize = 36,
	buttonHeight = 48,
	buttonPadding = 12,
	isRoactGamepadEnabled = true,
	testId = "--uiblox-action-bar",
	horizontalAlignment = Enum.HorizontalAlignment.Center
}

function actionBar.render(p5) --[[ line: 136 ]]
	-- upvalues: withStyleModule (ref), getPageMarginModule (ref), iconSizeModule (ref), constantsModule (ref), UIBloxConfigModule (ref), cryoModule (ref), roactModule (ref), roactGamepadModule (ref), reactModule (ref), iconButtonModule (ref), textButtonModule (ref), comboButtonModule (ref), buttonTypeModule (ref), buttonModule (ref), fitFrameOnAxis (ref)
	return withStyleModule(function(_) --[[ line: 137 ]]
		-- upvalues: getPageMarginModule (copy), p5 (ref), iconSizeModule (copy), constantsModule (copy), UIBloxConfigModule (copy), cryoModule (copy), roactModule (copy), roactGamepadModule (copy), reactModule (copy), iconButtonModule (copy), textButtonModule (copy), comboButtonModule (copy), buttonTypeModule (copy), buttonModule (copy), fitFrameOnAxis (copy)
		local var17 = getPageMarginModule(p5.state.frameWidth)
		local var18 = p5.state.frameWidth - var17 * 2
		local medium = iconSizeModule.Medium
		local var19 = if p5.props.marginOverride then p5.props.marginOverride else {
			top = 0,
			left = var17,
			right = var17,
			bottom = constantsModule.Layout.ActionBar.PositionOffset
		}
		local var20 = if p5.props.icons and #p5.props.icons then #p5.props.icons else 0
		local var21 = if p5.props.textButtons and #p5.props.textButtons then #p5.props.textButtons else 0
		local var22 = if p5.props.button == nil and (not UIBloxConfigModule.enableActionBarButtonOverride or p5.props.buttonOverride == nil) then 0 else 1
		local var23 = p5.props.enableButtonAtStart == true and var22 ~= 0
		local var24 = var21 + var20 + var22
		local t = {}
		
		if var20 ~= 0 then
			for i, v in ipairs(p5.props.icons) do
				local var26 = if var23 then i + var22 else i
				local var27 = cryoModule.Dictionary.join({ layoutOrder = var26, iconSize = medium }, v.props)
				
				if not p5.props.isRoactGamepadEnabled then
					p5.buttonRefs[var26] = p5.buttonRefs[var26] or roactModule.createRef()
				end
				table.insert(t, roactModule.createElement(if p5.props.isRoactGamepadEnabled then roactGamepadModule.Focusable.Frame else "Frame", {
					key = "Button" .. tostring(var26),
					Size = UDim2.fromOffset(p5.props.iconSize, p5.props.iconSize),
					BackgroundTransparency = 1,
					[roactModule.Ref] = p5.buttonRefs[var26],
					NextSelectionUp = nil,
					NextSelectionDown = nil,
					NextSelectionLeft = p5.getGamepadNextSelectionLeft(var26, var24),
					NextSelectionRight = p5.getGamepadNextSelectionRight(var26, var24),
					inputBindings = if p5.props.isRoactGamepadEnabled then {
						Activated = var27.onActivated and roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, var27.onActivated) or nil
					} else nil,
					[reactModule.Tag] = if p5.props.testId then `data-testid={p5.props.testId}--icon-button` else nil
				}, {
					Icon = roactModule.createElement(iconButtonModule, var27)
				}))
			end
		end
		if var21 ~= 0 then
			for i, v in ipairs(p5.props.textButtons) do
				local var28 = (if var23 then i + var22 else i) + var20
				local var29 = cryoModule.Dictionary.join({ layoutOrder = var28 }, v.props)
				
				if not p5.props.isRoactGamepadEnabled then
					p5.buttonRefs[var28] = p5.buttonRefs[var28] or roactModule.createRef()
				end
				table.insert(t, roactModule.createElement(if p5.props.isRoactGamepadEnabled then roactGamepadModule.Focusable.Frame else "Frame", {
					key = "Button" .. tostring(var28),
					Size = UDim2.fromOffset(0, p5.props.iconSize),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundTransparency = 1,
					[roactModule.Ref] = p5.buttonRefs[var28],
					NextSelectionUp = nil,
					NextSelectionDown = nil,
					NextSelectionLeft = p5.getGamepadNextSelectionLeft(var28, var24),
					NextSelectionRight = p5.getGamepadNextSelectionRight(var28, var24),
					inputBindings = if p5.props.isRoactGamepadEnabled then {
						Activated = var29.onActivated and roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, var29.onActivated) or nil
					} else nil
				}, {
					TextButton = roactModule.createElement(textButtonModule, var29)
				}))
			end
		end
		if var22 ~= 0 then
			local uDim2 = UDim2.fromOffset(var18 - var20 * (p5.props.iconSize + p5.props.buttonPadding), p5.props.buttonHeight)
			local var31 = if var23 then 1 else var20 + 1
			local var32 = nil
			local var33 = nil
			
			if not UIBloxConfigModule.enableActionBarButtonOverride or not p5.props.buttonOverride then
				var32 = comboButtonModule.validateProps(p5.props.button.props)
				var33 = cryoModule.Dictionary.join({ layoutOrder = var31, size = uDim2 }, p5.props.button.props)
				
				if not var32 and var33.buttonType == nil then
					var33.buttonType = if var20 == 0 then buttonTypeModule.PrimarySystem else buttonTypeModule.PrimaryContextual
				end
			end
			if not p5.props.isRoactGamepadEnabled then
				p5.buttonRefs[var31] = p5.buttonRefs[var31] or roactModule.createRef()
			end
			table.insert(t, if var23 then 1 else var24, roactModule.createElement(if p5.props.isRoactGamepadEnabled then roactGamepadModule.Focusable.Frame else "Frame", {
				key = "Button" .. var31,
				Size = uDim2,
				BackgroundTransparency = 1,
				[roactModule.Ref] = p5.buttonRefs[var31],
				NextSelectionUp = nil,
				NextSelectionDown = nil,
				NextSelectionLeft = p5.getGamepadNextSelectionLeft(var31, var24),
				NextSelectionRight = p5.getGamepadNextSelectionRight(var31, var24),
				inputBindings = if p5.props.isRoactGamepadEnabled then {
					Activated = if var32 or UIBloxConfigModule.enableActionBarButtonOverride and p5.props.buttonOverride then nil else roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, var33.onActivated)
				} else nil,
				[reactModule.Tag] = if p5.props.testId then `data-testid={p5.props.testId}--primary-button` else nil
			}, {
				Icon = if UIBloxConfigModule.enableActionBarButtonOverride and p5.props.buttonOverride then p5.props.buttonOverride else roactModule.createElement(if var32 then comboButtonModule else buttonModule, var33)
			}))
		end
		if p5.props[roactModule.Children] then
			t = p5.props[roactModule.Children]
		end
		return roactModule.createElement(if p5.props.isRoactGamepadEnabled then roactGamepadModule.Focusable[fitFrameOnAxis] else fitFrameOnAxis, {
			BackgroundTransparency = 1,
			minimumSize = UDim2.new(1, 0, 0, p5.props.buttonHeight),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = p5.props.horizontalAlignment,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			contentPadding = UDim.new(0, 12),
			[roactModule.Ref] = p5.frameRef,
			[roactModule.Change.AbsoluteSize] = p5.updateFrameSize,
			margin = var19,
			NextSelectionLeft = p5.props.NextSelectionLeft,
			NextSelectionRight = p5.props.NextSelectionRight,
			NextSelectionUp = p5.props.NextSelectionUp,
			NextSelectionDown = p5.props.NextSelectionDown
		}, t)
	end)
end

function actionBar.didMount(p6) --[[ line: 352 ]]
	if p6.frameRef.current then
		p6.updateFrameSize(p6.frameRef.current)
	end
end

local var16 = roactModule.forwardRef(function(p7, p8) --[[ line: 358 ]]
	-- upvalues: roactModule (ref), actionBar (ref), cryoModule (ref)
	return roactModule.createElement(actionBar, cryoModule.Dictionary.join(p7, { frameRef = p8 }))
end)
var16.validateProps = actionBar.validateProps

return var16