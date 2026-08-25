local parent = script.Parent.Parent
local cryoModule = require(parent.Cryo)
local roactModule = require(parent.Roact)
local _ = nil
local ok, status = pcall(function()
	return game:GetEngineFeature("TextBoundsRoundUp")
end)
local status_1 = ok and status
local textService = game:GetService("TextService")

local function getTextHeight(p0, p1, p2, p3)
	-- upvalues: status_1 (write), textService (ref)
	return if status_1 then textService:GetTextSize(p0, p1, p2, Vector2.new(p3, 10000)).Y else textService:GetTextSize(p0, p1, p2, Vector2.new(p3, 10000)).Y + 2
end

local function getTextWidth(p4, p5, p6)
	-- upvalues: status_1 (write), textService (ref)
	return if status_1 then textService:GetTextSize(p4, p5, p6, Vector2.new(10000, 10000)).X else textService:GetTextSize(p4, p5, p6, Vector2.new(10000, 10000)).X + 2
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

function fitTextLabel.init(p7)
	-- upvalues: roactModule (ref)
	if roactModule.Ref == "ref" then
		p7.frameRef = p7.props.forwardedRef or roactModule.createRef()
	else
		p7.frameRef = p7.props[roactModule.Ref] or roactModule.createRef()
	end
	function p7.onResize()
		-- upvalues: p7 (ref)
		if p7.frameRef.current then
			p7.frameRef.current.Size = p7:__getSize(p7.frameRef.current)
			
			return
		end
	end
end

function fitTextLabel.render(p8)
	-- upvalues: roactModule (ref)
	return roactModule.createElement(if p8.props.onActivated then "TextButton" else "TextLabel", p8:__getFilteredProps())
end

function fitTextLabel.didMount(p9)
	p9.onResize()
end

function fitTextLabel.didUpdate(p10)
	p10.onResize()
end

function fitTextLabel.__getFilteredProps(p11)
	-- upvalues: cryoModule (ref), roactModule (ref)
	return cryoModule.Dictionary.join(p11.props, {
		width = cryoModule.None,
		maximumWidth = cryoModule.None,
		onActivated = cryoModule.None,
		forwardedRef = cryoModule.None,
		Size = UDim2.new(p11.props.width, UDim.new(0, 0)),
		[roactModule.Ref] = p11.frameRef,
		[roactModule.Children] = cryoModule.Dictionary.join(p11.props[roactModule.Children] or {}, {
			sizeConstraint = p11.props.maximumWidth < 1e999 and roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(p11.props.maximumWidth, 1e999) })
		}),
		[roactModule.Event.Activated] = p11.props.onActivated,
		[roactModule.Change.AbsoluteSize] = function(p12)
			-- upvalues: p11 (ref), roactModule (copy)
			if p11.props[roactModule.Change.AbsoluteSize] then
				p11.props[roactModule.Change.AbsoluteSize](p12)
			end
			p11.onResize()
		end
	})
end

function fitTextLabel.__getSize(p13, p14)
	-- upvalues: t (ref), getTextWidth (ref), getTextHeight (ref)
	local maximumWidth = p13.props.maximumWidth
	local width = p13.props.width
	
	if width == t.FitToText then
		width = UDim.new(0, math.min(getTextWidth(p13.props.Text, p13.props.TextSize, p13.props.Font), maximumWidth))
	end
	return UDim2.new(width, UDim.new(0, getTextHeight(p13.props.Text, p13.props.TextSize, p13.props.Font, math.max(if maximumWidth < 1e999 then maximumWidth else 0, p14.AbsoluteSize.X))))
end

local var8 = if roactModule.Ref == "ref" then roactModule.forwardRef(function(p15, p16)
	-- upvalues: roactModule (ref), fitTextLabel (ref), cryoModule (ref)
	return roactModule.createElement(fitTextLabel, cryoModule.Dictionary.join(p15, { forwardedRef = p16 }))
end) else fitTextLabel
var8.Width = t

return var8