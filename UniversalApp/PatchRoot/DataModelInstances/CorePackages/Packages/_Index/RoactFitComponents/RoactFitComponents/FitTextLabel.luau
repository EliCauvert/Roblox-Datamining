local parent = script.Parent.Parent
local cryoModule = require(parent.Cryo)
local roactModule = require(parent.Roact)
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
	-- upvalues: roactModule (ref)
	if roactModule.Ref == "ref" then
		p1.frameRef = p1.props.forwardedRef or roactModule.createRef()
	else
		p1.frameRef = p1.props[roactModule.Ref] or roactModule.createRef()
	end
	function p7.onResize()
		-- upvalues: p1 (ref)
		if p1.frameRef.current then
			p1.frameRef.current.Size = p1:__getSize(p1.frameRef.current)
			
			return
		end
	end
end

function fitTextLabel.render(p1)
	-- upvalues: roactModule (ref)
	return roactModule.createElement(if p1.props.onActivated then "TextButton" else "TextLabel", p1:__getFilteredProps())
end

function fitTextLabel.didMount(p1)
	p1.onResize()
end

function fitTextLabel.didUpdate(p1)
	p1.onResize()
end

function fitTextLabel.__getFilteredProps(p1)
	-- upvalues: cryoModule (ref), roactModule (ref)
	return cryoModule.Dictionary.join(p1.props, {
		width = cryoModule.None,
		maximumWidth = cryoModule.None,
		onActivated = cryoModule.None,
		forwardedRef = cryoModule.None,
		Size = UDim2.new(p1.props.width, UDim.new(0, 0)),
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
	})
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