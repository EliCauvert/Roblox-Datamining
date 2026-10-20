local Parent = script.Parent
local Parent1 = Parent.Parent
local CryoModule = require(Parent1.Cryo)
local RoactModule = require(Parent1.Roact)
local FlagsModule = require(Parent.Flags)
local Result1 = nil
local Success, Result = pcall(function()
	return game:GetEngineFeature("TextBoundsRoundUp")
end)
Result1 = Success and Result
local TextService = game:GetService("TextService")

local function getTextHeight(String, TextSize, PropsFont, X)
	-- upvalues: Result1 (ref), TextService (copy)
	return if Result1 then TextService:GetTextSize(String, TextSize, PropsFont, Vector2.new(X, 10000)).Y else TextService:GetTextSize(String, TextSize, PropsFont, Vector2.new(X, 10000)).Y + 2
end

local function getTextWidth(String, TextSize, PropsFont)
	-- upvalues: Result1 (ref), TextService (copy)
	return if Result1 then TextService:GetTextSize(String, TextSize, PropsFont, Vector2.new(10000, 10000)).X else TextService:GetTextSize(String, TextSize, PropsFont, Vector2.new(10000, 10000)).X + 2
end

local function getFontTextBoundsAsync(Text, TextSize, PropsFont, Width)
	-- upvalues: TextService (copy)
	local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
	GetTextBoundsParams.Text = Text
	GetTextBoundsParams.Font = PropsFont
	GetTextBoundsParams.Size = TextSize
	GetTextBoundsParams.Width = Width
	local Success, Result = pcall(function()
		-- upvalues: TextService (upval), GetTextBoundsParams (copy)
		return TextService:GetTextBoundsAsync(GetTextBoundsParams)
	end)
	GetTextBoundsParams:Destroy()
	
	return if Success and typeof(Result) == "Vector2" then Result else nil
end

local Width = { FitToText = {} }
local FitTextLabel = RoactModule.PureComponent:extend("FitTextLabel")
FitTextLabel.defaultProps = {
	Text = "Label",
	TextSize = 12,
	TextWrapped = true,
	maximumWidth = 1e999,
	Font = Enum.Font.SourceSans
}

function FitTextLabel.init(p1)
	-- upvalues: FlagsModule (copy), RoactModule (copy)
	if FlagsModule.RoactFitComponentsFontDatatypeSupport then
		p1.measurementId = 0
		p1.mounted = false
	end
	if RoactModule.Ref == "ref" then
		p1.frameRef = p1.props.forwardedRef or RoactModule.createRef()
	else
		p1.frameRef = p1.props[RoactModule.Ref] or RoactModule.createRef()
	end
	function p1.onResize()
		-- upvalues: p1 (copy), FlagsModule (upval)
		if not p1.frameRef.current then return end
		if FlagsModule.RoactFitComponentsFontDatatypeSupport and typeof(p1.props.Font) == "Font" then
			p1:__resizeForFont(p1.frameRef.current)
			
			return
		end
		if FlagsModule.RoactFitComponentsFontDatatypeSupport then
			p1.measurementId += 1
		end
		p1.frameRef.current.Size = p1:__getSize(p1.frameRef.current)
	end
end

function FitTextLabel.render(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement(if p1.props.onActivated then "TextButton" else "TextLabel", p1:__getFilteredProps())
end

function FitTextLabel.didMount(p1)
	-- upvalues: FlagsModule (copy)
	if FlagsModule.RoactFitComponentsFontDatatypeSupport then
		p1.mounted = true
	end
	p1.onResize()
end

function FitTextLabel.didUpdate(p1)
	p1.onResize()
end

function FitTextLabel.willUnmount(p1)
	-- upvalues: FlagsModule (copy)
	if FlagsModule.RoactFitComponentsFontDatatypeSupport then
		p1.mounted = false
		p1.measurementId += 1
	end
end

function FitTextLabel.__getFilteredProps(p1)
	-- upvalues: CryoModule (copy), RoactModule (copy), FlagsModule (copy)
	local Label = {
		width = CryoModule.None,
		maximumWidth = CryoModule.None,
		onActivated = CryoModule.None,
		forwardedRef = CryoModule.None,
		Size = UDim2.new(typeof(p1.props.width) == "UDim" and p1.props.width or UDim.new(0, 0), UDim.new(0, 0)),
		[RoactModule.Ref] = p1.frameRef,
		[RoactModule.Children] = CryoModule.Dictionary.join(p1.props[RoactModule.Children] or {}, {
			sizeConstraint = p1.props.maximumWidth < 1e999 and RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(p1.props.maximumWidth, 1e999) })
		}),
		[RoactModule.Event.Activated] = p1.props.onActivated,
		[RoactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: p1 (copy), RoactModule (upval)
			if p1.props[RoactModule.Change.AbsoluteSize] then
				p1.props[RoactModule.Change.AbsoluteSize](p2)
			end
			p1.onResize()
		end
	}
	
	if FlagsModule.RoactFitComponentsFontDatatypeSupport and typeof(p1.props.Font) == "Font" then
		Label.Font = CryoModule.None
		Label.FontFace = p1.props.Font
	end
	return CryoModule.Dictionary.join(p1.props, Label)
end

function FitTextLabel.__resizeForFont(p1, Frame)
	-- upvalues: Width (copy), getFontTextBoundsAsync (copy)
	p1.measurementId += 1
	local MeasurementId = p1.measurementId
	local Text = p1.props.Text
	local TextSize = p1.props.TextSize
	local PropsFont = p1.props.Font
	local MaximumWidth: number = p1.props.maximumWidth
	local Width1 = p1.props.width
	local Largest = math.max(MaximumWidth < 1e999 and MaximumWidth or 0, Frame.AbsoluteSize.X)
	task.spawn(function()
		-- upvalues: Width1 (ref), Width (upval), getFontTextBoundsAsync (upval), Text (copy), TextSize (copy), PropsFont (copy), MaximumWidth (copy), p1 (copy), MeasurementId (copy), Largest (copy)
		if Width1 == Width.FitToText then
			local FontTextBoundsAsync = getFontTextBoundsAsync(Text, TextSize, PropsFont, 10000)
			Width1 = UDim.new(0, FontTextBoundsAsync and math.min(math.ceil(FontTextBoundsAsync.X), MaximumWidth) or 0)
		end
		if not p1.mounted or p1.measurementId ~= MeasurementId then return end
		local FontTextBoundsAsync = getFontTextBoundsAsync(Text, TextSize, PropsFont, Largest)
		local Ceiled = FontTextBoundsAsync and math.ceil(FontTextBoundsAsync.Y) or TextSize
		
		if p1.mounted and p1.measurementId == MeasurementId and p1.frameRef.current then
			p1.frameRef.current.Size = UDim2.new(Width1, UDim.new(0, Ceiled))
			
			return
		end
	end)
end

function FitTextLabel.__getSize(p1, Frame): UDim2
	-- upvalues: Width (copy), getTextWidth (copy), getTextHeight (copy)
	local MaximumWidth: number = p1.props.maximumWidth
	local Width1 = p1.props.width
	
	if Width1 == Width.FitToText then
		Width1 = UDim.new(0, (math.min(getTextWidth(p1.props.Text, p1.props.TextSize, p1.props.Font), MaximumWidth)))
	end
	return UDim2.new(Width1, UDim.new(0, (getTextHeight(p1.props.Text, p1.props.TextSize, p1.props.Font, (math.max(MaximumWidth < 1e999 and MaximumWidth or 0, Frame.AbsoluteSize.X))))))
end

local ForwardRefResult = if RoactModule.Ref == "ref" then RoactModule.forwardRef(function(p1, ForwardedRef)
	-- upvalues: RoactModule (copy), FitTextLabel (copy), CryoModule (copy)
	return RoactModule.createElement(FitTextLabel, CryoModule.Dictionary.join(p1, { forwardedRef = ForwardedRef }))
end) else FitTextLabel
ForwardRefResult.Width = Width

return ForwardRefResult