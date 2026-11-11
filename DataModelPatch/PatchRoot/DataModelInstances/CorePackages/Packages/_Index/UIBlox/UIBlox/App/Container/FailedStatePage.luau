local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local ImagesModule = require(Parent.App.ImageSet.Images)
local EmptyStateModule = require(Parent.App.Indicator.EmptyState)
local ButtonModule = require(Parent.App.Button.Button)
local ButtonTypeModule = require(Parent.App.Button.Enum.ButtonType)
local RenderOnFailedStyleModule = require(Parent.App.Loading.Enum.RenderOnFailedStyle)
local FailedStatePage = RoactModule.PureComponent:extend("FailedStatePage")
FailedStatePage.validateProps = TModule.strictInterface({
	onRetry = TModule.optional(TModule.callback),
	renderOnFailed = TModule.optional(RenderOnFailedStyleModule.isEnumValue),
	text = TModule.optional(TModule.string)
})
FailedStatePage.defaultProps = { renderOnFailed = RenderOnFailedStyleModule.RetryButton }

function FailedStatePage.render(p1)
	-- upvalues: RenderOnFailedStyleModule (copy), RoactModule (copy), EmptyStateModule (copy), ImagesModule (copy), ButtonModule (copy), ButtonTypeModule (copy)
	if p1.props.renderOnFailed == RenderOnFailedStyleModule.EmptyStatePage then
		return RoactModule.createElement(EmptyStateModule, {
			position = UDim2.fromScale(0.5, 0.5),
			anchorPoint = Vector2.new(0.5, 0.5),
			onActivated = p1.props.onRetry,
			icon = ImagesModule["icons/status/noconnection_large"],
			text = p1.props.text
		})
	elseif p1.props.renderOnFailed ~= RenderOnFailedStyleModule.RetryButton then
		error("Failed to provide proper RenderOnFailedStyle")
		
		return
	else
		if p1.props.onRetry then
			return RoactModule.createElement(ButtonModule, {
				buttonType = ButtonTypeModule.Secondary,
				size = UDim2.fromOffset(44, 44),
				position = UDim2.fromScale(0.5, 0.5),
				anchorPoint = Vector2.new(0.5, 0.5),
				onActivated = p1.props.onRetry,
				icon = ImagesModule["icons/common/refresh"]
			})
		else
			error("OnRetry callback empty. OnRetry needs to be a function to render the RetryButton")
		end
	end
end

return FailedStatePage