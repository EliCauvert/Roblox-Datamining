local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local imagesModule = require(parent.App.ImageSet.Images)
local emptyStateModule = require(parent.App.Indicator.EmptyState)
local buttonModule = require(parent.App.Button.Button)
local buttonTypeModule = require(parent.App.Button.Enum.ButtonType)
local renderOnFailedStyleModule = require(parent.App.Loading.Enum.RenderOnFailedStyle)
local failedStatePage = roactModule.PureComponent:extend("FailedStatePage")
failedStatePage.validateProps = tModule.strictInterface({
	onRetry = tModule.optional(tModule.callback),
	renderOnFailed = tModule.optional(renderOnFailedStyleModule.isEnumValue),
	text = tModule.optional(tModule.string)
})
failedStatePage.defaultProps = { renderOnFailed = renderOnFailedStyleModule.RetryButton }

function failedStatePage.render(p0) --[[ line: 36 ]]
	-- upvalues: renderOnFailedStyleModule (ref), roactModule (ref), emptyStateModule (ref), imagesModule (ref), buttonModule (ref), buttonTypeModule (ref)
	if p0.props.renderOnFailed == renderOnFailedStyleModule.EmptyStatePage then
		return roactModule.createElement(emptyStateModule, {
			position = UDim2.fromScale(0.5, 0.5),
			anchorPoint = Vector2.new(0.5, 0.5),
			onActivated = p0.props.onRetry,
			icon = imagesModule["icons/status/noconnection_large"],
			text = p0.props.text
		})
	elseif p0.props.renderOnFailed ~= renderOnFailedStyleModule.RetryButton then
		error("Failed to provide proper RenderOnFailedStyle")
		
		return
	elseif p0.props.onRetry then
		return roactModule.createElement(buttonModule, {
			buttonType = buttonTypeModule.Secondary,
			size = UDim2.fromOffset(44, 44),
			position = UDim2.fromScale(0.5, 0.5),
			anchorPoint = Vector2.new(0.5, 0.5),
			onActivated = p0.props.onRetry,
			icon = imagesModule["icons/common/refresh"]
		})
	end
	error("OnRetry callback empty. OnRetry needs to be a function to render the RetryButton")
end

return failedStatePage