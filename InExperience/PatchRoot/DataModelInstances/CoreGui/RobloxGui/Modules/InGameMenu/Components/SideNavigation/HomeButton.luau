local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local t = inGameMenuDependenciesModule.t
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local images = UIBlox.App.ImageSet.Images
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local homeOn = images["icons/menu/home_on"]
local homeOff = images["icons/menu/home_off"]
local homeButton = roact.PureComponent:extend("HomeButton")
homeButton.validateProps = t.strictInterface({
	on = t.optional(t.boolean),
	anchorPoint = t.optional(t.Vector2),
	position = t.optional(t.UDim2),
	layoutOrder = t.optional(t.integer),
	onActivated = t.callback
})
homeButton.defaultProps = { on = false }

function homeButton.renderWithSelectionCursor(p0, p1) --[[ line: 34 ]]
	-- upvalues: homeOn (ref), homeOff (ref), roact (ref), imageSetButton (ref), cursorKind (ref)
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = p0.props.anchorPoint,
		Position = p0.props.position,
		Size = UDim2.fromOffset(64, 64),
		LayoutOrder = p0.props.layoutOrder
	}, {
		HomeButton = roact.createElement(imageSetButton, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Image = if p0.props.on then homeOn else homeOff,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(32, 32),
			SelectionImageObject = p1(cursorKind.RoundedRect),
			[roact.Event.Activated] = p0.props.onActivated
		})
	})
end

function homeButton.render(p2) --[[ line: 55 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p3) --[[ line: 56 ]]
		-- upvalues: p2 (ref)
		return p2:renderWithSelectionCursor(p3)
	end)
end

return homeButton