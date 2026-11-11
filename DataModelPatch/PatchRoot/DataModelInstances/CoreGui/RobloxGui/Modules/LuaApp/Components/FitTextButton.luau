local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local RoactModule = require(Modules.Common.Roact)
local ImmutableModule = require(Modules.Common.Immutable)
local TextModule = require(Modules.Common.Text)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextButton = RoactModule.PureComponent:extend("FitTextButton")
FitTextButton.defaultProps = { fitAxis = FitChildrenModule.FitAxis.Height }

function FitTextButton.init(p1)
	-- upvalues: RoactModule (copy), FitChildrenModule (copy), TextModule (copy)
	p1.ref = p1.props.forwardRef or RoactModule.createRef()
	
	function p1.resize(Label)
		-- upvalues: p1 (copy), FitChildrenModule (upval), TextModule (upval)
		local FitAxis = p1.props.fitAxis
		
		if FitAxis == FitChildrenModule.FitAxis.Width or FitAxis == FitChildrenModule.FitAxis.Both then
			Label.Size = UDim2.new(UDim.new(0, TextModule.GetTextWidth(Label.Text, Label.Font, Label.TextSize)), FitAxis == FitChildrenModule.FitAxis.Both and UDim.new(0, Label.TextSize) or Label.Size.Height)
			
			return
		else
			Label.Size = UDim2.new(Label.Size.Width, (UDim.new(0, TextModule.GetTextHeight(Label.Text, Label.Font, Label.TextSize, Label.AbsoluteSize.X))))
		end
	end
end

function FitTextButton.render(p1)
	-- upvalues: FitChildrenModule (copy), ImmutableModule (copy), RoactModule (copy)
	return RoactModule.createElement("TextButton", ImmutableModule.JoinDictionaries(ImmutableModule.RemoveFromDictionary(p1.props, "fitAxis", "forwardRef"), {
		[RoactModule.Ref] = p1.ref,
		[RoactModule.Change.Text] = p1.resize,
		[RoactModule.Change.TextSize] = p1.resize,
		[RoactModule.Change.AbsoluteSize] = (p1.props.fitAxis or FitChildrenModule.FitAxis.Height) == FitChildrenModule.FitAxis.Height and p1.resize or nil
	}))
end

function FitTextButton.didMount(p1)
	p1.resize(p1.ref.current)
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), FitTextButton (copy), CryoModule (copy)
	return RoactModule.createElement(FitTextButton, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)