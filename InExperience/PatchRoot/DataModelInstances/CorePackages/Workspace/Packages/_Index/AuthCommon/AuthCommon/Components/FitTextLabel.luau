local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local RoactModule = require(Parent.Roact)
local Immutable = require(Parent.AppCommonLib).Immutable
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local NormalizeFontFaceFunction = require(Parent.Foundation).Utility.normalizeFontFace
local FitChildrenModule = require(AuthCommon.Components.FitChildren)
local FitTextLabel = RoactModule.PureComponent:extend("FitTextLabel")
FitTextLabel.defaultProps = {
	maxWidth = nil,
	fitAxis = FitChildrenModule.FitAxis.Height
}

function FitTextLabel.init(p1)
	-- upvalues: FitChildrenModule (copy), GetTextSizeFunction (copy)
	function p1.onRef(Ref)
		-- upvalues: p1 (copy)
		p1.ref = Ref
	end
	
	function p1.resize(Label)
		-- upvalues: p1 (copy), FitChildrenModule (upval), GetTextSizeFunction (upval)
		local FitAxis = p1.props.fitAxis
		local MaxWidth = p1.props.maxWidth
		
		if FitAxis ~= FitChildrenModule.FitAxis.Width and FitAxis ~= FitChildrenModule.FitAxis.Both then
			p1:setState({
				width = Label.Size.Width,
				height = UDim.new(0, GetTextSizeFunction(Label.Text, Label.TextSize, Label.FontFace, Vector2.new(Label.AbsoluteSize.X, 10000)).Y)
			})
			
			return
		end
		local _UDim = UDim.new(0, GetTextSizeFunction(Label.Text, Label.TextSize, Label.FontFace, Vector2.new(10000, 10000)).X)
		local _UDim1 = nil
		
		if MaxWidth == nil or MaxWidth >= _UDim.Offset then
			_UDim1 = FitAxis == FitChildrenModule.FitAxis.Both and UDim.new(0, Label.TextSize) or Label.Size.Height
		else
			_UDim = UDim.new(0, MaxWidth)
			_UDim1 = UDim.new(0, GetTextSizeFunction(Label.Text, Label.TextSize, Label.FontFace, Vector2.new(_UDim.Offset, 10000)).Y)
		end
		p1:setState({ width = _UDim, height = _UDim1 })
	end
	
	p1:setState({ width = nil, height = nil })
end

function FitTextLabel.render(p1)
	-- upvalues: FitChildrenModule (copy), Immutable (copy), RoactModule (copy), NormalizeFontFaceFunction (copy)
	local FitAxis = p1.props.fitAxis or FitChildrenModule.FitAxis.Height
	local FitAxis1 = Immutable.RemoveFromDictionary(p1.props, "fitAxis", "maxWidth", "Font", "FontFace")
	local Width = p1.state.width
	local Height = p1.state.height
	
	if Width and Height then
		FitAxis1 = Immutable.JoinDictionaries(FitAxis1, { Size = UDim2.new(Width, Height) })
	end
	return RoactModule.createElement("TextLabel", Immutable.JoinDictionaries(FitAxis1, {
		FontFace = if p1.props.FontFace or p1.props.Font then NormalizeFontFaceFunction(p1.props.FontFace or p1.props.Font) else nil
	}, {
		[RoactModule.Ref] = p1.onRef,
		[RoactModule.Change.Text] = p1.resize,
		[RoactModule.Change.TextSize] = p1.resize,
		[RoactModule.Change.AbsoluteSize] = FitAxis == FitChildrenModule.FitAxis.Height and p1.resize or nil,
		[RoactModule.Change.FontFace] = p1.resize
	}))
end

function FitTextLabel.didMount(p1)
	p1.resize(p1.ref)
end

return FitTextLabel