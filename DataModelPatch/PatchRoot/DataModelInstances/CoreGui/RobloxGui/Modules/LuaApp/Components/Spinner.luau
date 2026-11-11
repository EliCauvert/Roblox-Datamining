local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ExternalEventConnectionModule = require(game:GetService("CoreGui").RobloxGui.Modules.Common.RoactUtilities.ExternalEventConnection)
local Spinner = RoactModule.PureComponent:extend("Spinner")
Spinner.defaultProps = { spinSpeed = 540, Size = UDim2.new(0, 20, 0, 20) }

function Spinner.init(p1)
	function p1.renderSteppedCallback(p2)
		-- upvalues: p1 (copy)
		local SpinSpeed = p1.props.spinSpeed
		
		if p1.props.isSpinning and p1.ref.current then
			p1.ref.current.Rotation += SpinSpeed * p2
		end
	end
end

function Spinner.render(p1)
	-- upvalues: RoactModule (copy), WithStyleFunction (copy), ImageSetLabel (copy), Images (copy), ExternalEventConnectionModule (copy), RunService (copy)
	local Size = p1.props.Size
	local Position = p1.props.Position
	local AnchorPoint = p1.props.AnchorPoint
	local ImageColor3 = p1.props.ImageColor3
	local ImageTransparency = p1.props.ImageTransparency
	local IsSpinning = p1.props.isSpinning
	p1.ref = p1.props.forwardRef or (p1.ref or RoactModule.createRef())
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), ImageSetLabel (upval), Size (copy), Position (copy), AnchorPoint (copy), Images (upval), ImageColor3 (copy), ImageTransparency (copy), p1 (copy), IsSpinning (copy), ExternalEventConnectionModule (upval), RunService (upval)
		return RoactModule.createElement(ImageSetLabel, {
			Size = Size,
			Position = Position,
			AnchorPoint = AnchorPoint,
			BackgroundTransparency = 1,
			Image = Images["icons/common/refresh"],
			ImageColor3 = ImageColor3 or p2.Theme.SystemPrimaryDefault.Color,
			ImageTransparency = ImageTransparency or p2.Theme.SystemPrimaryDefault.Transparency,
			[RoactModule.Ref] = p1.ref
		}, {
			renderStepped = IsSpinning and RoactModule.createElement(ExternalEventConnectionModule, {
				event = RunService.renderStepped,
				callback = p1.renderSteppedCallback
			})
		})
	end)
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), Spinner (copy), CryoModule (copy)
	return RoactModule.createElement(Spinner, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)