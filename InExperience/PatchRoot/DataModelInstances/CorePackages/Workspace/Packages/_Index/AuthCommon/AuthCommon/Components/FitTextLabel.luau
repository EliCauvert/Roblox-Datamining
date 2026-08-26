local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local roactModule = require(parent.Roact)
local immutable = require(parent.AppCommonLib).Immutable
local text = require(parent.AppCommonLib).Text
local fitChildrenModule = require(authCommon.Components.FitChildren)
local fitTextLabel = roactModule.PureComponent:extend("FitTextLabel")
fitTextLabel.defaultProps = {
	maxWidth = nil,
	fitAxis = fitChildrenModule.FitAxis.Height
}

function fitTextLabel.init(p1)
	-- upvalues: fitChildrenModule (ref), text (ref)
	function p0.onRef(p2)
		-- upvalues: p1 (ref)
		p1.ref = p2
	end
	
	function p0.resize(p2)
		-- upvalues: p1 (ref), fitChildrenModule (copy), text (copy)
		local fitAxis = p1.props.fitAxis
		local maxWidth = p1.props.maxWidth
		
		if fitAxis ~= fitChildrenModule.FitAxis.Width and fitAxis ~= fitChildrenModule.FitAxis.Both then
			p1:setState({
				width = p2.Size.Width,
				height = UDim.new(0, text.GetTextHeight(p2.Text, p2.Font, p2.TextSize, p2.AbsoluteSize.X))
			})
			
			return
		end
		local uDim_1
		local uDim = UDim.new(0, text.GetTextWidth(p2.Text, p2.Font, p2.TextSize))
		local _ = nil
		
		if maxWidth == nil or maxWidth >= uDim.Offset then
			uDim_1 = fitAxis == fitChildrenModule.FitAxis.Both and UDim.new(0, p2.TextSize) or p2.Size.Height
		else
			uDim = UDim.new(0, maxWidth)
			uDim_1 = UDim.new(0, text.GetTextHeight(p2.Text, p2.Font, p2.TextSize, uDim.Offset))
		end
		p1:setState({ width = uDim, height = uDim_1 })
	end
	
	p1:setState({ width = nil, height = nil })
end

function fitTextLabel.render(p1)
	-- upvalues: fitChildrenModule (ref), immutable (ref), roactModule (ref)
	local fitAxis = p1.props.fitAxis or fitChildrenModule.FitAxis.Height
	local fitAxis_1 = immutable.RemoveFromDictionary(p1.props, "fitAxis", "maxWidth")
	local width = p1.state.width
	local height = p1.state.height
	
	if width and height then
		fitAxis_1 = immutable.JoinDictionaries(fitAxis_1, { Size = UDim2.new(width, height) })
	end
	return roactModule.createElement("TextLabel", immutable.JoinDictionaries(fitAxis_1, {
		[roactModule.Ref] = p1.onRef,
		[roactModule.Change.Text] = p1.resize,
		[roactModule.Change.TextSize] = p1.resize,
		[roactModule.Change.AbsoluteSize] = if fitAxis == fitChildrenModule.FitAxis.Height then p1.resize else nil
	}))
end

function fitTextLabel.didMount(p1)
	p1.resize(p1.ref)
end

return fitTextLabel