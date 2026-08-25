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

function fitTextLabel.init(p0)
	-- upvalues: fitChildrenModule (ref), text (ref)
	function p0.onRef(p1)
		-- upvalues: p0 (ref)
		p0.ref = p1
	end
	
	function p0.resize(p2)
		-- upvalues: p0 (ref), fitChildrenModule (copy), text (copy)
		local fitAxis = p0.props.fitAxis
		local maxWidth = p0.props.maxWidth
		
		if fitAxis ~= fitChildrenModule.FitAxis.Width and fitAxis ~= fitChildrenModule.FitAxis.Both then
			p0:setState({
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
		p0:setState({ width = uDim, height = uDim_1 })
	end
	
	p0:setState({ width = nil, height = nil })
end

function fitTextLabel.render(p3)
	-- upvalues: fitChildrenModule (ref), immutable (ref), roactModule (ref)
	local fitAxis = p3.props.fitAxis or fitChildrenModule.FitAxis.Height
	local fitAxis_1 = immutable.RemoveFromDictionary(p3.props, "fitAxis", "maxWidth")
	local width = p3.state.width
	local height = p3.state.height
	
	if width and height then
		fitAxis_1 = immutable.JoinDictionaries(fitAxis_1, { Size = UDim2.new(width, height) })
	end
	return roactModule.createElement("TextLabel", immutable.JoinDictionaries(fitAxis_1, {
		[roactModule.Ref] = p3.onRef,
		[roactModule.Change.Text] = p3.resize,
		[roactModule.Change.TextSize] = p3.resize,
		[roactModule.Change.AbsoluteSize] = if fitAxis == fitChildrenModule.FitAxis.Height then p3.resize else nil
	}))
end

function fitTextLabel.didMount(p4)
	p4.resize(p4.ref)
end

return fitTextLabel