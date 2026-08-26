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

function actionBar.init(p1)
	-- upvalues: roactGamepadModule (ref), roactModule (ref)
	p1.buttonRefs = p1.props.isRoactGamepadEnabled and roactGamepadModule.createRefCache() or {}
	p1.state = { frameWidth = 0 }
	p1.frameRef = p1.props.frameRef or roactModule.createRef()
	
	function p0.updateFrameSize(p2)
		-- upvalues: p1 (ref)
		local x = p2.AbsoluteSize.X
		
		if x ~= p1.state.frameWidth then
			p1:setState({ frameWidth = x })
		end
		if p1.props.onAbsoluteSizeChanged then
			p1.props.onAbsoluteSizeChanged(p2.AbsoluteSize)
		end
	end
	
	function p0.getGamepadNextSelectionLeft(p2, _)
		-- upvalues: p1 (ref)
		return if p2 > 1 then p1.buttonRefs[p2 - 1] else nil
	end
	
	function p0.getGamepadNextSelectionRight(p2, p3)
		-- upvalues: p1 (ref)
		return if p2 < p3 then p1.buttonRefs[p2 + 1] else nil
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

function actionBar.render(p1)
	-- upvalues: withStyleModule (ref), getPageMarginModule (ref), iconSizeModule (ref), constantsModule (ref), UIBloxConfigModule (ref), cryoModule (ref), roactModule (ref), roactGamepadModule (ref), reactModule (ref), iconButtonModule (ref), textButtonModule (ref), comboButtonModule (ref), buttonTypeModule (ref), buttonModule (ref), fitFrameOnAxis (ref)
	return withStyleModule(function(_)
		-- upvalues: getPageMarginModule (copy), p1 (ref), iconSizeModule (copy), constantsModule (copy), UIBloxConfigModule (copy), cryoModule (copy), roactModule (copy), roactGamepadModule (copy), reactModule (copy), iconButtonModule (copy), textButtonModule (copy), comboButtonModule (copy), buttonTypeModule (copy), buttonModule (copy), fitFrameOnAxis (copy)
		local var1 = getPageMarginModule(p1.state.frameWidth)
		local var2 = p1.state.frameWidth - var1 * 2
		local medium = iconSizeModule.Medium
		local var3 = if p1.props.marginOverride then p1.props.marginOverride else {
			top = 0,
			left = var1,
			right = var1,
			bottom = constantsModule.Layout.ActionBar.PositionOffset
		}
		local var4 = if p1.props.icons and #p1.props.icons then #p1.props.icons else 0
		local var5 = if p1.props.textButtons and #p1.props.textButtons then #p1.props.textButtons else 0
		local var6 = if p1.props.button == nil and (not UIBloxConfigModule.enableActionBarButtonOverride or p1.props.buttonOverride == nil) then 0 else 1
		local var7 = p1.props.enableButtonAtStart == true and var6 ~= 0
		local var8 = var5 + var4 + var6
		local t = {}
		
		if var4 ~= 0 then
			for i, v in ipairs(p1.props.icons) do
				local var9 = if var7 then i + var6 else i
				local var10 = cryoModule.Dictionary.join({ layoutOrder = var9, iconSize = medium }, v.props)
				
				if not p1.props.isRoactGamepadEnabled then
					p1.buttonRefs[var9] = p1.buttonRefs[var9] or roactModule.createRef()
				end
				table.insert(t, roactModule.createElement(if p1.props.isRoactGamepadEnabled then roactGamepadModule.Focusable.Frame else "Frame", {
					key = "Button" .. tostring(var9),
					Size = UDim2.fromOffset(p1.props.iconSize, p1.props.iconSize),
					BackgroundTransparency = 1,
					[roactModule.Ref] = p1.buttonRefs[var9],
					NextSelectionUp = nil,
					NextSelectionDown = nil,
					NextSelectionLeft = p1.getGamepadNextSelectionLeft(var9, var8),
					NextSelectionRight = p1.getGamepadNextSelectionRight(var9, var8),
					inputBindings = if p1.props.isRoactGamepadEnabled then {
						Activated = var10.onActivated and roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, var10.onActivated) or nil
					} else nil,
					[reactModule.Tag] = if p1.props.testId then `data-testid={p1.props.testId}--icon-button` else nil
				}, {
					Icon = roactModule.createElement(iconButtonModule, var10)
				}))
			end
		end
		if var5 ~= 0 then
			for i, v in ipairs(p1.props.textButtons) do
				local var11 = (if var7 then i + var6 else i) + var4
				local var12 = cryoModule.Dictionary.join({ layoutOrder = var11 }, v.props)
				
				if not p1.props.isRoactGamepadEnabled then
					p1.buttonRefs[var11] = p1.buttonRefs[var11] or roactModule.createRef()
				end
				table.insert(t, roactModule.createElement(if p1.props.isRoactGamepadEnabled then roactGamepadModule.Focusable.Frame else "Frame", {
					key = "Button" .. tostring(var11),
					Size = UDim2.fromOffset(0, p1.props.iconSize),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundTransparency = 1,
					[roactModule.Ref] = p1.buttonRefs[var11],
					NextSelectionUp = nil,
					NextSelectionDown = nil,
					NextSelectionLeft = p1.getGamepadNextSelectionLeft(var11, var8),
					NextSelectionRight = p1.getGamepadNextSelectionRight(var11, var8),
					inputBindings = if p1.props.isRoactGamepadEnabled then {
						Activated = var12.onActivated and roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, var12.onActivated) or nil
					} else nil
				}, {
					TextButton = roactModule.createElement(textButtonModule, var12)
				}))
			end
		end
		if var6 ~= 0 then
			local uDim2 = UDim2.fromOffset(var2 - var4 * (p1.props.iconSize + p1.props.buttonPadding), p1.props.buttonHeight)
			local var13 = if var7 then 1 else var4 + 1
			local var14 = nil
			local var15 = nil
			
			if not UIBloxConfigModule.enableActionBarButtonOverride or not p1.props.buttonOverride then
				var14 = comboButtonModule.validateProps(p1.props.button.props)
				var15 = cryoModule.Dictionary.join({ layoutOrder = var13, size = uDim2 }, p1.props.button.props)
				
				if not var14 and var15.buttonType == nil then
					var15.buttonType = if var4 == 0 then buttonTypeModule.PrimarySystem else buttonTypeModule.PrimaryContextual
				end
			end
			if not p1.props.isRoactGamepadEnabled then
				p1.buttonRefs[var13] = p1.buttonRefs[var13] or roactModule.createRef()
			end
			table.insert(t, if var7 then 1 else var8, roactModule.createElement(if p1.props.isRoactGamepadEnabled then roactGamepadModule.Focusable.Frame else "Frame", {
				key = "Button" .. var31,
				Size = uDim2,
				BackgroundTransparency = 1,
				[roactModule.Ref] = p1.buttonRefs[var13],
				NextSelectionUp = nil,
				NextSelectionDown = nil,
				NextSelectionLeft = p1.getGamepadNextSelectionLeft(var13, var8),
				NextSelectionRight = p1.getGamepadNextSelectionRight(var13, var8),
				inputBindings = if p1.props.isRoactGamepadEnabled then {
					Activated = if var14 or UIBloxConfigModule.enableActionBarButtonOverride and p1.props.buttonOverride then nil else roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, var15.onActivated)
				} else nil,
				[reactModule.Tag] = if p1.props.testId then `data-testid={p1.props.testId}--primary-button` else nil
			}, {
				Icon = if UIBloxConfigModule.enableActionBarButtonOverride and p1.props.buttonOverride then p1.props.buttonOverride else roactModule.createElement(if var14 then comboButtonModule else buttonModule, var15)
			}))
		end
		if p1.props[roactModule.Children] then
			t = p1.props[roactModule.Children]
		end
		return roactModule.createElement(if p1.props.isRoactGamepadEnabled then roactGamepadModule.Focusable[fitFrameOnAxis] else fitFrameOnAxis, {
			BackgroundTransparency = 1,
			minimumSize = UDim2.new(1, 0, 0, p1.props.buttonHeight),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = p1.props.horizontalAlignment,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			contentPadding = UDim.new(0, 12),
			[roactModule.Ref] = p1.frameRef,
			[roactModule.Change.AbsoluteSize] = p1.updateFrameSize,
			margin = var3,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown
		}, t)
	end)
end

function actionBar.didMount(p2)
	if p2.frameRef.current then
		p2.updateFrameSize(p2.frameRef.current)
	end
end

local var16 = roactModule.forwardRef(function(p2, p3)
	-- upvalues: roactModule (ref), actionBar (ref), cryoModule (ref)
	return roactModule.createElement(actionBar, cryoModule.Dictionary.join(p2, { frameRef = p3 }))
end)
var16.validateProps = actionBar.validateProps

return var16