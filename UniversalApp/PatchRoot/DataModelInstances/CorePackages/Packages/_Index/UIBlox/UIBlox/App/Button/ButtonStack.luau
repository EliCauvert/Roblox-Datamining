local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local cryoModule = require(parent_2.Cryo)
local roactGamepadModule = require(parent_2.RoactGamepad)
local tModule = require(parent_2.t)
local buttonModule = require(parent.Button)
local buttonTypeModule = require(parent.Enum.ButtonType)
local getTextSizeModule = require(parent_1.Core.Text.GetTextSize)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local fitFrameOnAxis = require(parent_2.FitFrame).FitFrameOnAxis
local buttonStack = roactModule.PureComponent:extend("ButtonStack")
buttonStack.validateProps = tModule.strictInterface({
	buttons = tModule.array(tModule.strictInterface({
		buttonType = tModule.optional(buttonTypeModule.isEnumValue),
		props = buttonModule.validateProps,
		isDefaultChild = tModule.optional(tModule.boolean)
	})),
	buttonHeight = tModule.optional(tModule.numberMin(0)),
	forcedFillDirection = tModule.optional(tModule.enum(Enum.FillDirection)),
	marginBetween = tModule.optional(tModule.numberMin(0)),
	minHorizontalButtonPadding = tModule.optional(tModule.numberMin(0)),
	disableRoactGamepadButtonSelection = tModule.optional(tModule.boolean),
	disableGamepadRefs = tModule.optional(tModule.boolean),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	frameRef = tModule.optional(tModule.table),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
})
buttonStack.defaultProps = {
	buttonHeight = 36,
	marginBetween = 12,
	minHorizontalButtonPadding = 8,
	isRoactGamepadEnabled = true
}

function buttonStack.init(p0) --[[ line: 71 ]]
	-- upvalues: roactGamepadModule (ref)
	p0.buttonRefs = roactGamepadModule.createRefCache()
	p0.state = { frameWidth = 0 }
	
	function p0.updateFrameSize(p1) --[[ line: 78 ]]
		-- upvalues: p0 (ref)
		local x = p1.AbsoluteSize.X
		
		if x ~= p0.state.frameWidth then
			p0:setState({ frameWidth = x })
		end
	end
end

function buttonStack.render(p2) --[[ line: 88 ]]
	-- upvalues: withStyleModule (ref), getTextSizeModule (ref), buttonTypeModule (ref), cryoModule (ref), roactModule (ref), buttonModule (ref), roactGamepadModule (ref), fitFrameOnAxis (ref)
	return withStyleModule(function(p3) --[[ line: 89 ]]
		-- upvalues: p2 (ref), getTextSizeModule (copy), buttonTypeModule (copy), cryoModule (copy), roactModule (copy), buttonModule (copy), roactGamepadModule (copy), fitFrameOnAxis (copy)
		local var15
		local font = p3.Font
		local var10 = font.Body.RelativeSize * font.BaseSize
		local isRoactGamepadEnabled = p2.props.isRoactGamepadEnabled
		local buttons = p2.props.buttons
		local var11 = if #buttons > 1 then p2.props.marginBetween else 0
		local var12 = p2.state.frameWidth / #buttons - var11 * (#buttons - 1) / #buttons
		local var13 = false
		local _ = nil
		local var14 = nil
		
		if p2.props.forcedFillDirection then
			var13 = p2.props.forcedFillDirection == Enum.FillDirection.Vertical
			var15 = p2.props.forcedFillDirection
		else
			for i, v in ipairs(buttons) do
				if var12 - 2 * p2.props.minHorizontalButtonPadding < getTextSizeModule(v.props.text or "", var10, font.Body.Font, Vector2.new(p2.state.frameWidth, p2.props.buttonHeight), if v.props.buttonTextOverride then v.props.buttonTextOverride.RichText else false).X then
					var13 = true
					break
				end
			end
			var15 = if var13 then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal
		end
		local var16 = var13 and UDim2.new(1, 0, 0, p2.props.buttonHeight) or UDim2.new(0, var12, 0, p2.props.buttonHeight)
		local t = {}
		
		for i, v in ipairs(buttons) do
			local var18 = cryoModule.Dictionary.join({
				key = tostring(i),
				layoutOrder = if var13 then #buttons - i else i,
				size = var16,
				buttonType = v.buttonType or buttonTypeModule.Secondary,
				isRoactGamepadEnabled = isRoactGamepadEnabled
			}, v.props)
			
			if v.isDefaultChild then
				var14 = i
			end
			if not p2.props.disableGamepadRefs and isRoactGamepadEnabled then
				local t_1
				local _ = nil
				
				if p2.props.disableRoactGamepadButtonSelection then
					t_1 = { [roactModule.Ref] = p2.buttonRefs[i] }
				else
					local var21
					local t_2 = {
						[roactModule.Ref] = p2.buttonRefs[i],
						NextSelectionUp = var13 and (i <= 1 and (p2.buttonRefs[i - 1] or nil)),
						NextSelectionDown = var13 and (i >= #buttons and (p2.buttonRefs[i + 1] or nil))
					}
					
					if not var13 then
						var21 = i <= 1 and (p2.buttonRefs[i - 1] or nil)
					end
					local var22
					t_2.NextSelectionLeft = var21
					
					if not var13 then
						var22 = i >= #buttons and (p2.buttonRefs[i + 1] or nil)
					end
					t_2.NextSelectionRight = var22
					t_1 = t_2
				end
				var18 = cryoModule.Dictionary.join(var18, t_1)
			end
			table.insert(t, roactModule.createElement(buttonModule, var18))
		end
		return roactModule.createElement(if isRoactGamepadEnabled then roactGamepadModule.Focusable[fitFrameOnAxis] else fitFrameOnAxis, {
			BackgroundTransparency = 1,
			contentPadding = UDim.new(0, var11),
			FillDirection = var15,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			LayoutOrder = 3,
			minimumSize = UDim2.new(1, 0, 0, p2.props.buttonHeight),
			[roactModule.Ref] = p2.props.frameRef,
			[roactModule.Change.AbsoluteSize] = p2.updateFrameSize,
			NextSelectionLeft = if isRoactGamepadEnabled then p2.props.NextSelectionLeft else nil,
			NextSelectionRight = if isRoactGamepadEnabled then p2.props.NextSelectionRight else nil,
			NextSelectionUp = if isRoactGamepadEnabled then p2.props.NextSelectionUp else nil,
			NextSelectionDown = if isRoactGamepadEnabled then p2.props.NextSelectionDown else nil,
			defaultChild = if isRoactGamepadEnabled then if var14 then p2.buttonRefs[var14] else nil else nil
		}, t)
	end)
end

local var9 = roactModule.forwardRef(function(p4, p5) --[[ line: 190 ]]
	-- upvalues: roactModule (ref), buttonStack (ref), cryoModule (ref)
	return roactModule.createElement(buttonStack, cryoModule.Dictionary.join(p4, { frameRef = p5 }))
end)
var9.validateProps = buttonStack.validateProps

return var9