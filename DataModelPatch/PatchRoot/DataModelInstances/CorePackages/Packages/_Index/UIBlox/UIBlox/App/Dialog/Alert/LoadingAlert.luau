local Parent = script.Parent
local Parent1 = Parent.Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local AlertModule = require(Parent.Alert)
local AlertTypeModule = require(Parent.Enum.AlertType)
local FitFrameOnAxis = require(Parent2.FitFrame).FitFrameOnAxis
local FoundationModule = require(Parent2.Foundation)
local Loading = FoundationModule.Loading
local IconSize = FoundationModule.Enums.IconSize
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local LoadingAlert = RoactModule.PureComponent:extend("LoadingAlert")
LoadingAlert.validateProps = TModule.strictInterface({
	anchorPoint = TModule.optional(TModule.Vector2),
	position = TModule.optional(TModule.UDim2),
	screenSize = TModule.Vector2,
	onMounted = TModule.optional(TModule.callback),
	titleIcon = TModule.optional(TModule.union(TModule.table, TModule.string)),
	title = TModule.string
})

function LoadingAlert.init(p1)
	-- upvalues: RoactModule (copy), Loading (copy), IconSize (copy)
	function p1.renderMiddleContent()
		-- upvalues: RoactModule (upval), Loading (upval), IconSize (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 48)
		}, {
			Spinner = RoactModule.createElement(Loading, {
				size = IconSize.Large,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
		})
	end
end

function LoadingAlert.render(p1)
	-- upvalues: WithStyleModule (copy), RoactModule (copy), AlertModule (copy), AlertTypeModule (copy), FitFrameOnAxis (copy), ImageSetComponentModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: RoactModule (upval), AlertModule (upval), p1 (copy), AlertTypeModule (upval), FitFrameOnAxis (upval), ImageSetComponentModule (upval)
		local Theme = p2.Theme
		
		return RoactModule.createElement(AlertModule, {
			maxWidth = 400,
			minWidth = 272,
			anchorPoint = p1.props.anchorPoint,
			alertType = AlertTypeModule.Loading,
			margin = { top = 0, bottom = 24, left = 24, right = 24 },
			middleContent = p1.renderMiddleContent,
			onMounted = p1.props.onMounted,
			position = p1.props.position,
			screenSize = p1.props.screenSize,
			title = p1.props.title,
			titleContent = p1.props.titleIcon and function()
				-- upvalues: RoactModule (upval), FitFrameOnAxis (upval), ImageSetComponentModule (upval), p1 (upval), Theme (copy)
				return RoactModule.createElement(FitFrameOnAxis, {
					BackgroundTransparency = 1,
					contentPadding = UDim.new(0, 8),
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					margin = { top = 12, bottom = 0, left = 0, right = 0 },
					minimumSize = UDim2.new(1, 0, 0, 0)
				}, {
					Icon = RoactModule.createElement(ImageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						Image = p1.props.titleIcon,
						ImageColor3 = Theme.IconEmphasis.Color,
						ImageTransparency = Theme.IconEmphasis.Transparency,
						Size = UDim2.new(0, 48, 0, 48)
					})
				})
			end or nil
		})
	end)
end

return LoadingAlert