local parent = script.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local roactModule = require(parent_1.Roact)
local flagsModule = require(parent.Flags)
local _ = nil
local ok, status = pcall(function()
	return game:GetEngineFeature("TextBoundsRoundUp")
end)
local status_1 = ok and status
local textService = game:GetService("TextService")

local function getTextHeight(p1, p2, p3, p4)
	-- upvalues: status_1 (write), textService (ref)
	return if status_1 then textService:GetTextSize(p1, p2, p3, Vector2.new(p4, 10000)).Y else textService:GetTextSize(p1, p2, p3, Vector2.new(p4, 10000)).Y + 2
end

local function getTextWidth(p1, p2, p3)
	-- upvalues: status_1 (write), textService (ref)
	return if status_1 then textService:GetTextSize(p1, p2, p3, Vector2.new(10000, 10000)).X else textService:GetTextSize(p1, p2, p3, Vector2.new(10000, 10000)).X + 2
end

local function getFontTextBoundsAsync(p1, p2, p3, p4)
	-- upvalues: textService (ref)
	local getTextBoundsParams = Instance.new("GetTextBoundsParams")
	getTextBoundsParams.Text = p1
	getTextBoundsParams.Font = p3
	getTextBoundsParams.Size = p2
	getTextBoundsParams.Width = p4
	local ok, status = pcall(function()
		-- upvalues: textService (copy), getTextBoundsParams (ref)
		return textService:GetTextBoundsAsync(getTextBoundsParams)
	end)
	getTextBoundsParams:Destroy()
	
	return if ok and typeof(status) == "Vector2" then status else nil
end

local t = { FitToText = {} }
local fitTextLabel = roactModule.PureComponent:extend("FitTextLabel")
fitTextLabel.defaultProps = {
	Text = "Label",
	TextSize = 12,
	TextWrapped = true,
	maximumWidth = 1e999,
	Font = Enum.Font.SourceSans
}

function fitTextLabel.init(p1)
	-- upvalues: flagsModule (ref), roactModule (ref)
	if flagsModule.RoactFitComponentsFontDatatypeSupport then
		p1.measurementId = 0
		p1.mounted = false
	end
	if roactModule.Ref == "ref" then
		p1.frameRef = p1.props.forwardedRef or roactModule.createRef()
	else
		p1.frameRef = p1.props[roactModule.Ref] or roactModule.createRef()
	end
	function p11.onResize()
		-- upvalues: p1 (ref), flagsModule (copy)
		if not p1.frameRef.current then return end
		if flagsModule.RoactFitComponentsFontDatatypeSupport and typeof(p1.props.Font) == "Font" then
			p1:__resizeForFont(p1.frameRef.current)
			
			return
		elseif flagsModule.RoactFitComponentsFontDatatypeSupport then
			p1.measurementId += 1
		end
		p1.frameRef.current.Size = p1:__getSize(p1.frameRef.current)
	end
end

function fitTextLabel.render(p1)
	-- upvalues: roactModule (ref)
	return roactModule.createElement(if p1.props.onActivated then "TextButton" else "TextLabel", p1:__getFilteredProps())
end

function fitTextLabel.didMount(p1)
	-- upvalues: flagsModule (ref)
	if flagsModule.RoactFitComponentsFontDatatypeSupport then
		p1.mounted = true
	end
	p1.onResize()
end

function fitTextLabel.didUpdate(p1)
	p1.onResize()
end

function fitTextLabel.willUnmount(p1)
	-- upvalues: flagsModule (ref)
	if flagsModule.RoactFitComponentsFontDatatypeSupport then
		p1.mounted = false
		p1.measurementId += 1
	end
end

function fitTextLabel.__getFilteredProps(p1)
	-- upvalues: cryoModule (ref), roactModule (ref), flagsModule (ref)
	local t = {
		width = cryoModule.None,
		maximumWidth = cryoModule.None,
		onActivated = cryoModule.None,
		forwardedRef = cryoModule.None,
		Size = UDim2.new(if typeof(p1.props.width) == "UDim" then p1.props.width else UDim.new(0, 0), UDim.new(0, 0)),
		[roactModule.Ref] = p1.frameRef,
		[roactModule.Children] = cryoModule.Dictionary.join(p1.props[roactModule.Children] or {}, {
			sizeConstraint = p1.props.maximumWidth < 1e999 and roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(p1.props.maximumWidth, 1e999) })
		}),
		[roactModule.Event.Activated] = p1.props.onActivated,
		[roactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: p1 (ref), roactModule (copy)
			if p1.props[roactModule.Change.AbsoluteSize] then
				p1.props[roactModule.Change.AbsoluteSize](p2)
			end
			p1.onResize()
		end
	}
	
	if flagsModule.RoactFitComponentsFontDatatypeSupport and typeof(p1.props.Font) == "Font" then
		t.Font = cryoModule.None
		t.FontFace = p1.props.Font
	end
	return cryoModule.Dictionary.join(p1.props, t)
end

function fitTextLabel.__resizeForFont(p1, p2)
	-- upvalues: t (ref), getFontTextBoundsAsync (ref)
	p1.measurementId += 1
	local measurementId = p1.measurementId
	local text = p1.props.Text
	local textSize = p1.props.TextSize
	local font = p1.props.Font
	local maximumWidth = p1.props.maximumWidth
	local width = p1.props.width
	local maxValue = math.max(if maximumWidth < 1e999 then maximumWidth else 0, p2.AbsoluteSize.X)
	task.spawn(function()
		-- upvalues: width (write), t (copy), getFontTextBoundsAsync (copy), text (ref), textSize (ref), font (ref), maximumWidth (ref), p1 (ref), measurementId (ref), maxValue (ref)
		if width == t.FitToText then
			local var1 = getFontTextBoundsAsync(text, textSize, font, 10000)
			width = UDim.new(0, var1 and math.min(math.ceil(var1.X), maximumWidth) or 0)
		end
		if not p1.mounted or p1.measurementId ~= measurementId then return end
		local var2 = getFontTextBoundsAsync(text, textSize, font, maxValue)
		local y = var2 and math.ceil(var2.Y) or textSize
		
		if p1.mounted and p1.measurementId == measurementId and p1.frameRef.current then
			p1.frameRef.current.Size = UDim2.new(width, UDim.new(0, y))
			
			return
		end
	end)
end

function fitTextLabel.__getSize(p1, p2)
	-- upvalues: t (ref), getTextWidth (ref), getTextHeight (ref)
	local maximumWidth = p1.props.maximumWidth
	local width = p1.props.width
	
	if width == t.FitToText then
		width = UDim.new(0, math.min(getTextWidth(p1.props.Text, p1.props.TextSize, p1.props.Font), maximumWidth))
	end
	return UDim2.new(width, UDim.new(0, getTextHeight(p1.props.Text, p1.props.TextSize, p1.props.Font, math.max(if maximumWidth < 1e999 then maximumWidth else 0, p2.AbsoluteSize.X))))
end

local var1 = if roactModule.Ref == "ref" then roactModule.forwardRef(function(p1, p2)
	-- upvalues: roactModule (ref), fitTextLabel (ref), cryoModule (ref)
	return roactModule.createElement(fitTextLabel, cryoModule.Dictionary.join(p1, { forwardedRef = p2 }))
end) else fitTextLabel
var1.Width = t

return var1