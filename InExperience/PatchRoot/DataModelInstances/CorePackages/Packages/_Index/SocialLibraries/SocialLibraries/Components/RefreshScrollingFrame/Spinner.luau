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

function spinner.init(p1)
	function p0.renderSteppedCallback(p2)
		-- upvalues: p1 (ref)
		local spinSpeed = p1.props.spinSpeed
		
		if p1.props.isSpinning and p1.ref.current then
			p1.ref.current.Rotation += spinSpeed * p2
		end
	end
end

function spinner.render(p1)
	-- upvalues: roact (ref), withStyle (ref), imageSetLabel (ref), images (ref), externalEventConnectionModule (ref), runService (ref)
	local size = p1.props.Size
	local position = p1.props.Position
	local anchorPoint = p1.props.AnchorPoint
	local imageColor3 = p1.props.ImageColor3
	local imageTransparency = p1.props.ImageTransparency
	local isSpinning = p1.props.isSpinning
	p1.ref = p1.props.forwardRef or (p1.ref or roact.createRef())
	
	return withStyle(function(p2)
		-- upvalues: roact (copy), imageSetLabel (copy), size (ref), position (ref), anchorPoint (ref), images (copy), imageColor3 (ref), imageTransparency (ref), p1 (ref), isSpinning (ref), externalEventConnectionModule (copy), runService (copy)
		return roact.createElement(imageSetLabel, {
			Size = size,
			Position = position,
			AnchorPoint = anchorPoint,
			BackgroundTransparency = 1,
			Image = images["icons/common/refresh"],
			ImageColor3 = imageColor3 or p2.Theme.SystemPrimaryDefault.Color,
			ImageTransparency = imageTransparency or p2.Theme.SystemPrimaryDefault.Transparency,
			[roact.Ref] = p1.ref
		}, {
			renderStepped = isSpinning and roact.createElement(externalEventConnectionModule, {
				event = runService.renderStepped,
				callback = p1.renderSteppedCallback
			})
		})
	end)
end

return roact.forwardRef(function(p1, p2)
	-- upvalues: roact (ref), spinner (ref), cryo (ref)
	return roact.createElement(spinner, cryo.Dictionary.join(p1, { forwardRef = p2 }))
end)