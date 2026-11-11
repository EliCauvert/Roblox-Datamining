local Parent = script.Parent.Parent
local CryoModule = require(Parent.Cryo)
local RoactModule = require(Parent.Roact)
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
	-- upvalues: RoactModule (copy)
	if RoactModule.Ref == "ref" then
		p1.frameRef = p1.props.forwardedRef or RoactModule.createRef()
	else
		p1.frameRef = p1.props[RoactModule.Ref] or RoactModule.createRef()
	end
	function p1.onResize()
		-- upvalues: p1 (copy)
		if p1.frameRef.current then
			p1.frameRef.current.Size = p1:__getSize(p1.frameRef.current)
			
			return
		end
	end
end

function FitTextLabel.render(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement(if p1.props.onActivated then "TextButton" else "TextLabel", p1:__getFilteredProps())
end

function FitTextLabel.didMount(p1)
	p1.onResize()
end

function FitTextLabel.didUpdate(p1)
	p1.onResize()
end

function FitTextLabel.__getFilteredProps(p1)
	-- upvalues: CryoModule (copy), RoactModule (copy)
	return CryoModule.Dictionary.join(p1.props, {
		width = CryoModule.None,
		maximumWidth = CryoModule.None,
		onActivated = CryoModule.None,
		forwardedRef = CryoModule.None,
		Size = UDim2.new(p1.props.width, UDim.new(0, 0)),
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
	})
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