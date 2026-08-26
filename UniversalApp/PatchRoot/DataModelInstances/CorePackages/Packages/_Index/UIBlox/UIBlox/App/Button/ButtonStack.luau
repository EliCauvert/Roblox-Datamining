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

function buttonStack.init(p1)
	-- upvalues: roactGamepadModule (ref)
	p1.buttonRefs = roactGamepadModule.createRefCache()
	p1.state = { frameWidth = 0 }
	
	function p0.updateFrameSize(p2)
		-- upvalues: p1 (ref)
		local x = p2.AbsoluteSize.X
		
		if x ~= p1.state.frameWidth then
			p1:setState({ frameWidth = x })
		end
	end
end

function buttonStack.render(p1)
	-- upvalues: withStyleModule (ref), getTextSizeModule (ref), buttonTypeModule (ref), cryoModule (ref), roactModule (ref), buttonModule (ref), roactGamepadModule (ref), fitFrameOnAxis (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), getTextSizeModule (copy), buttonTypeModule (copy), cryoModule (copy), roactModule (copy), buttonModule (copy), roactGamepadModule (copy), fitFrameOnAxis (copy)
		local var1
		local font = p2.Font
		local var2 = font.Body.RelativeSize * font.BaseSize
		local isRoactGamepadEnabled = p1.props.isRoactGamepadEnabled
		local buttons = p1.props.buttons
		local var3 = if #buttons > 1 then p1.props.marginBetween else 0
		local var4 = p1.state.frameWidth / #buttons - var3 * (#buttons - 1) / #buttons
		local var5 = false
		local _ = nil
		local var6 = nil
		
		if p1.props.forcedFillDirection then
			var5 = p1.props.forcedFillDirection == Enum.FillDirection.Vertical
			var1 = p1.props.forcedFillDirection
		else
			for i, v in ipairs(buttons) do
				if var4 - 2 * p1.props.minHorizontalButtonPadding < getTextSizeModule(v.props.text or "", var2, font.Body.Font, Vector2.new(p1.state.frameWidth, p1.props.buttonHeight), if v.props.buttonTextOverride then v.props.buttonTextOverride.RichText else false).X then
					var5 = true
					break
				end
			end
			var1 = if var5 then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal
		end
		local var7 = var5 and UDim2.new(1, 0, 0, p1.props.buttonHeight) or UDim2.new(0, var4, 0, p1.props.buttonHeight)
		local t = {}
		
		for i, v in ipairs(buttons) do
			local var8 = cryoModule.Dictionary.join({
				key = tostring(i),
				layoutOrder = if var5 then #buttons - i else i,
				size = var7,
				buttonType = v.buttonType or buttonTypeModule.Secondary,
				isRoactGamepadEnabled = isRoactGamepadEnabled
			}, v.props)
			
			if v.isDefaultChild then
				var6 = i
			end
			if not p1.props.disableGamepadRefs and isRoactGamepadEnabled then
				local t_1
				local _ = nil
				
				if p1.props.disableRoactGamepadButtonSelection then
					t_1 = { [roactModule.Ref] = p1.buttonRefs[i] }
				else
					local var9
					local t_2 = {
						[roactModule.Ref] = p1.buttonRefs[i],
						NextSelectionUp = var5 and (i <= 1 and (p1.buttonRefs[i - 1] or nil)),
						NextSelectionDown = var5 and (i >= #buttons and (p1.buttonRefs[i + 1] or nil))
					}
					
					if not var5 then
						var9 = i <= 1 and (p1.buttonRefs[i - 1] or nil)
					end
					local var10
					t_2.NextSelectionLeft = var9
					
					if not var5 then
						var10 = i >= #buttons and (p1.buttonRefs[i + 1] or nil)
					end
					t_2.NextSelectionRight = var10
					t_1 = t_2
				end
				var8 = cryoModule.Dictionary.join(var8, t_1)
			end
			table.insert(t, roactModule.createElement(buttonModule, var8))
		end
		return roactModule.createElement(if isRoactGamepadEnabled then roactGamepadModule.Focusable[fitFrameOnAxis] else fitFrameOnAxis, {
			BackgroundTransparency = 1,
			contentPadding = UDim.new(0, var3),
			FillDirection = var1,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			LayoutOrder = 3,
			minimumSize = UDim2.new(1, 0, 0, p1.props.buttonHeight),
			[roactModule.Ref] = p1.props.frameRef,
			[roactModule.Change.AbsoluteSize] = p1.updateFrameSize,
			NextSelectionLeft = if isRoactGamepadEnabled then p1.props.NextSelectionLeft else nil,
			NextSelectionRight = if isRoactGamepadEnabled then p1.props.NextSelectionRight else nil,
			NextSelectionUp = if isRoactGamepadEnabled then p1.props.NextSelectionUp else nil,
			NextSelectionDown = if isRoactGamepadEnabled then p1.props.NextSelectionDown else nil,
			defaultChild = if isRoactGamepadEnabled then if var6 then p1.buttonRefs[var6] else nil else nil
		}, t)
	end)
end

local var11 = roactModule.forwardRef(function(p3, p4)
	-- upvalues: roactModule (ref), buttonStack (ref), cryoModule (ref)
	return roactModule.createElement(buttonStack, cryoModule.Dictionary.join(p3, { frameRef = p4 }))
end)
var11.validateProps = buttonStack.validateProps

return var11