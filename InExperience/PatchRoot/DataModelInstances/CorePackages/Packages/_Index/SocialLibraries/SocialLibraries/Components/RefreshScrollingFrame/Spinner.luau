local RunService = game:GetService("RunService")
local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local T = DependenciesModule.t
local Cryo = DependenciesModule.Cryo
local WithStyleFunction = UIBlox.Style.withStyle
local Images = UIBlox.App.ImageSet.Images
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local ExternalEventConnectionModule = require(script.Parent.ExternalEventConnection)
local Spinner = Roact.PureComponent:extend("Spinner")
Spinner.defaultProps = { spinSpeed = 540, Size = UDim2.new(0, 20, 0, 20) }
Spinner.validateProps = T.interface({
	isSpinning = T.optional(T.boolean),
	spinSpeed = T.optional(T.number),
	Size = T.optional(T.UDim2),
	Position = T.optional(T.UDim2),
	AnchorPoint = T.optional(T.Vector2),
	ImageColor3 = T.optional(T.Color3),
	ImageTransparency = T.optional(T.number),
	forwardRef = T.optional(T.table)
})

function Spinner.init(p1) --[[ Line: 37 ]]
	function p1.renderSteppedCallback(p2) --[[ Line: 38 ]]
		-- upvalues: p1 (copy)
		local SpinSpeed = p1.props.spinSpeed
		
		if p1.props.isSpinning and p1.ref.current then
			p1.ref.current.Rotation += SpinSpeed * p2
		end
	end
end

function Spinner.render(p1) --[[ Line: 48 ]]
	-- upvalues: Roact (copy), WithStyleFunction (copy), ImageSetLabel (copy), Images (copy), ExternalEventConnectionModule (copy), RunService (copy)
	local Size = p1.props.Size
	local Position = p1.props.Position
	local AnchorPoint = p1.props.AnchorPoint
	local ImageColor3 = p1.props.ImageColor3
	local ImageTransparency = p1.props.ImageTransparency
	local IsSpinning = p1.props.isSpinning
	p1.ref = p1.props.forwardRef or (p1.ref or Roact.createRef())
	
	return WithStyleFunction(function(p2) --[[ Line: 60 ]]
		-- upvalues: Roact (upval), ImageSetLabel (upval), Size (copy), Position (copy), AnchorPoint (copy), Images (upval), ImageColor3 (copy), ImageTransparency (copy), p1 (copy), IsSpinning (copy), ExternalEventConnectionModule (upval), RunService (upval)
		return Roact.createElement(ImageSetLabel, {
			Size = Size,
			Position = Position,
			AnchorPoint = AnchorPoint,
			BackgroundTransparency = 1,
			Image = Images["icons/common/refresh"],
			ImageColor3 = ImageColor3 or p2.Theme.SystemPrimaryDefault.Color,
			ImageTransparency = ImageTransparency or p2.Theme.SystemPrimaryDefault.Transparency,
			[Roact.Ref] = p1.ref
		}, {
			renderStepped = IsSpinning and Roact.createElement(ExternalEventConnectionModule, {
				event = RunService.renderStepped,
				callback = p1.renderSteppedCallback
			})
		})
	end)
end

return Roact.forwardRef(function(p1, ForwardRef) --[[ Line: 79 ]]
	-- upvalues: Roact (copy), Spinner (copy), Cryo (copy)
	return Roact.createElement(Spinner, Cryo.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)