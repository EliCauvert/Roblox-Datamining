local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local roactModule = require(parent.Roact)
local immutable = require(parent.AppCommonLib).Immutable
local text = require(parent.AppCommonLib).Text
local getTextSize = require(parent.Style).GetTextSize
local foundationModule = require(parent.Foundation)
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local fitChildrenModule = require(authCommon.Components.FitChildren)
local fitTextLabel = roactModule.PureComponent:extend("FitTextLabel")
fitTextLabel.defaultProps = {
	maxWidth = nil,
	fitAxis = fitChildrenModule.FitAxis.Height
}

function fitTextLabel.init(p1)
	-- upvalues: fitChildrenModule (ref), foundationFontFaceMigration (ref), getTextSize (ref), text (ref)
	function p0.onRef(p2)
		-- upvalues: p1 (ref)
		p1.ref = p2
	end
	
	function p0.resize(p2)
		-- upvalues: p1 (ref), fitChildrenModule (copy), foundationFontFaceMigration (copy), getTextSize (copy), text (copy)
		local fitAxis = p1.props.fitAxis
		local maxWidth = p1.props.maxWidth
		
		if fitAxis ~= fitChildrenModule.FitAxis.Width and fitAxis ~= fitChildrenModule.FitAxis.Both then
			p1:setState({
				width = p2.Size.Width,
				height = UDim.new(0, if foundationFontFaceMigration then getTextSize(p2.Text, p2.TextSize, p2.FontFace, Vector2.new(p2.AbsoluteSize.X, 10000)).Y else text.GetTextHeight(p2.Text, p2.Font, p2.TextSize, p2.AbsoluteSize.X))
			})
			
			return
		end
		local uDim_1
		local uDim = UDim.new(0, if foundationFontFaceMigration then getTextSize(p2.Text, p2.TextSize, p2.FontFace, Vector2.new(10000, 10000)).X else text.GetTextWidth(p2.Text, p2.Font, p2.TextSize))
		local _ = nil
		
		if maxWidth == nil or maxWidth >= uDim.Offset then
			uDim_1 = fitAxis == fitChildrenModule.FitAxis.Both and UDim.new(0, p2.TextSize) or p2.Size.Height
		else
			uDim = UDim.new(0, maxWidth)
			uDim_1 = UDim.new(0, if foundationFontFaceMigration then getTextSize(p2.Text, p2.TextSize, p2.FontFace, Vector2.new(uDim.Offset, 10000)).Y else text.GetTextHeight(p2.Text, p2.Font, p2.TextSize, uDim.Offset))
		end
		p1:setState({ width = uDim, height = uDim_1 })
	end
	
	p1:setState({ width = nil, height = nil })
end

function fitTextLabel.render(p1)
	-- upvalues: fitChildrenModule (ref), foundationFontFaceMigration (ref), immutable (ref), roactModule (ref), normalizeFontFace (ref)
	local fitAxis = p1.props.fitAxis or fitChildrenModule.FitAxis.Height
	local var1 = if foundationFontFaceMigration then immutable.RemoveFromDictionary(p1.props, "fitAxis", "maxWidth", "Font", "FontFace") else immutable.RemoveFromDictionary(p1.props, "fitAxis", "maxWidth")
	local width = p1.state.width
	local height = p1.state.height
	
	if width and height then
		var1 = immutable.JoinDictionaries(var1, { Size = UDim2.new(width, height) })
	end
	return if foundationFontFaceMigration then roactModule.createElement("TextLabel", immutable.JoinDictionaries(var1, {
		FontFace = if p1.props.FontFace or p1.props.Font then normalizeFontFace(p1.props.FontFace or p1.props.Font) else nil
	}, {
		[roactModule.Ref] = p1.onRef,
		[roactModule.Change.Text] = p1.resize,
		[roactModule.Change.TextSize] = p1.resize,
		[roactModule.Change.AbsoluteSize] = if fitAxis == fitChildrenModule.FitAxis.Height then p1.resize else nil,
		[roactModule.Change.FontFace] = p1.resize
	})) else roactModule.createElement("TextLabel", immutable.JoinDictionaries(var1, {
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