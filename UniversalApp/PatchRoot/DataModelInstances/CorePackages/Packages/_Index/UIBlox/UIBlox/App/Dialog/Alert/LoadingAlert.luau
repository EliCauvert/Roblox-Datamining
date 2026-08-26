local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local alertModule = require(parent.Alert)
local alertTypeModule = require(parent.Enum.AlertType)
local fitFrameOnAxis = require(parent_2.FitFrame).FitFrameOnAxis
local foundationModule = require(parent_2.Foundation)
local loading = foundationModule.Loading
local iconSize = foundationModule.Enums.IconSize
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local loadingAlert = roactModule.PureComponent:extend("LoadingAlert")
loadingAlert.validateProps = tModule.strictInterface({
	anchorPoint = tModule.optional(tModule.Vector2),
	position = tModule.optional(tModule.UDim2),
	screenSize = tModule.Vector2,
	onMounted = tModule.optional(tModule.callback),
	titleIcon = tModule.optional(tModule.union(tModule.table, tModule.string)),
	title = tModule.string
})

function loadingAlert.init(p1)
	-- upvalues: roactModule (ref), loading (ref), iconSize (ref)
	function p0.renderMiddleContent()
		-- upvalues: roactModule (copy), loading (copy), iconSize (copy)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 48)
		}, {
			Spinner = roactModule.createElement(loading, {
				size = iconSize.Large,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
		})
	end
end

function loadingAlert.render(p1)
	-- upvalues: withStyleModule (ref), roactModule (ref), alertModule (ref), alertTypeModule (ref), fitFrameOnAxis (ref), imageSetComponentModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: roactModule (copy), alertModule (copy), p1 (ref), alertTypeModule (copy), fitFrameOnAxis (copy), imageSetComponentModule (copy)
		local theme = p2.Theme
		
		return roactModule.createElement(alertModule, {
			maxWidth = 400,
			minWidth = 272,
			anchorPoint = p1.props.anchorPoint,
			alertType = alertTypeModule.Loading,
			margin = { top = 0, bottom = 24, left = 24, right = 24 },
			middleContent = p1.renderMiddleContent,
			onMounted = p1.props.onMounted,
			position = p1.props.position,
			screenSize = p1.props.screenSize,
			title = p1.props.title,
			titleContent = if p1.props.titleIcon then function()
				-- upvalues: roactModule (copy), fitFrameOnAxis (copy), imageSetComponentModule (copy), p1 (copy), theme (ref)
				return roactModule.createElement(fitFrameOnAxis, {
					BackgroundTransparency = 1,
					contentPadding = UDim.new(0, 8),
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					margin = { top = 12, bottom = 0, left = 0, right = 0 },
					minimumSize = UDim2.new(1, 0, 0, 0)
				}, {
					Icon = roactModule.createElement(imageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						Image = p1.props.titleIcon,
						ImageColor3 = theme.IconEmphasis.Color,
						ImageTransparency = theme.IconEmphasis.Transparency,
						Size = UDim2.new(0, 48, 0, 48)
					})
				})
			end else nil
		})
	end)
end

return loadingAlert