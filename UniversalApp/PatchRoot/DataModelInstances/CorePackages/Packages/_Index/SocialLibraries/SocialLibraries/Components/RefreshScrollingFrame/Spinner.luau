local runService = game:GetService("RunService")
local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local t = dependenciesModule.t
local cryo = dependenciesModule.Cryo
local withStyle = UIBlox.Style.withStyle
local images = UIBlox.App.ImageSet.Images
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local externalEventConnectionModule = require(script.Parent.ExternalEventConnection)
local spinner = roact.PureComponent:extend("Spinner")
spinner.defaultProps = { spinSpeed = 540, Size = UDim2.new(0, 20, 0, 20) }
spinner.validateProps = t.interface({
	isSpinning = t.optional(t.boolean),
	spinSpeed = t.optional(t.number),
	Size = t.optional(t.UDim2),
	Position = t.optional(t.UDim2),
	AnchorPoint = t.optional(t.Vector2),
	ImageColor3 = t.optional(t.Color3),
	ImageTransparency = t.optional(t.number),
	forwardRef = t.optional(t.table)
})

function spinner.init(p0)
	function p0.renderSteppedCallback(p1)
		-- upvalues: p0 (ref)
		local spinSpeed = p0.props.spinSpeed
		
		if p0.props.isSpinning and p0.ref.current then
			p0.ref.current.Rotation += spinSpeed * p1
		end
	end
end

function spinner.render(p2)
	-- upvalues: roact (ref), withStyle (ref), imageSetLabel (ref), images (ref), externalEventConnectionModule (ref), runService (ref)
	local size = p2.props.Size
	local position = p2.props.Position
	local anchorPoint = p2.props.AnchorPoint
	local imageColor3 = p2.props.ImageColor3
	local imageTransparency = p2.props.ImageTransparency
	local isSpinning = p2.props.isSpinning
	p2.ref = p2.props.forwardRef or (p2.ref or roact.createRef())
	
	return withStyle(function(p3)
		-- upvalues: roact (copy), imageSetLabel (copy), size (ref), position (ref), anchorPoint (ref), images (copy), imageColor3 (ref), imageTransparency (ref), p2 (ref), isSpinning (ref), externalEventConnectionModule (copy), runService (copy)
		return roact.createElement(imageSetLabel, {
			Size = size,
			Position = position,
			AnchorPoint = anchorPoint,
			BackgroundTransparency = 1,
			Image = images["icons/common/refresh"],
			ImageColor3 = imageColor3 or p3.Theme.SystemPrimaryDefault.Color,
			ImageTransparency = imageTransparency or p3.Theme.SystemPrimaryDefault.Transparency,
			[roact.Ref] = p2.ref
		}, {
			renderStepped = isSpinning and roact.createElement(externalEventConnectionModule, {
				event = runService.renderStepped,
				callback = p2.renderSteppedCallback
			})
		})
	end)
end

return roact.forwardRef(function(p4, p5)
	-- upvalues: roact (ref), spinner (ref), cryo (ref)
	return roact.createElement(spinner, cryo.Dictionary.join(p4, { forwardRef = p5 }))
end)