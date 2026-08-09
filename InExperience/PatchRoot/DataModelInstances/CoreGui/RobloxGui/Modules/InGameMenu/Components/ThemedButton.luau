local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local divideTransparencyModule = require(parent.Utility.divideTransparency)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local withStyle = UIBlox.Core.Style.withStyle
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local themedButton = roact.PureComponent:extend("ThemedButton")
themedButton.validateProps = t.strictInterface({
	normalThemeKey = t.string,
	hoverThemeKey = t.string,
	imageProps = t.strictInterface({
		Image = t.union(t.string, t.table),
		ScaleType = t.enum(Enum.ScaleType),
		SliceCenter = t.Rect
	}),
	enabled = t.optional(t.boolean),
	renderChildren = t.callback,
	onActivated = t.callback,
	AnchorPoint = t.optional(t.Vector2),
	LayoutOrder = t.optional(t.integer),
	Position = t.optional(t.UDim2),
	Size = t.optional(t.UDim2),
	Visible = t.optional(t.boolean),
	ButtonRef = t.optional(t.union(t.callback, t.table))
})
themedButton.defaultProps = {
	enabled = true,
	imageProps = assetsModule.Images.RoundedRect
}

function themedButton.init(p0) --[[ line: 67 ]]
	p0:setState({ hover = false, press = false })
end

function themedButton.renderWithSelectionCursor(p1, p2) --[[ line: 74 ]]
	-- upvalues: withStyle (ref), divideTransparencyModule (ref), roact (ref), imageSetButton (ref), cursorKind (ref)
	local props = p1.props
	local var4 = if props.enabled and p1.state.hover then props.hoverThemeKey else props.normalThemeKey
	
	return withStyle(function(p3) --[[ line: 82 ]]
		-- upvalues: var4 (write), divideTransparencyModule (copy), p1 (ref), props (ref), roact (copy), imageSetButton (copy), p2 (ref), cursorKind (copy)
		local var5 = p3.Theme[var4]
		assert(var5 ~= nil, "theme key " .. var4 .. " is nil")
		local var6 = if not props.enabled then 0.5 else divideTransparencyModule(var5.Transparency, if p1.state.press then 2 else 1)
		
		return roact.createElement(imageSetButton, {
			Visible = props.Visible,
			BackgroundTransparency = 1,
			ImageColor3 = var5.Color,
			Position = props.Position,
			Size = props.Size,
			AnchorPoint = props.AnchorPoint,
			ImageTransparency = var6,
			LayoutOrder = props.LayoutOrder,
			ScaleType = props.imageProps.ScaleType,
			SliceCenter = props.imageProps.SliceCenter,
			Image = props.imageProps.Image,
			SelectionImageObject = p2(cursorKind.RoundedRectNoInset),
			[roact.Event.Activated] = function() --[[ line: 102 ]]
				-- upvalues: props (copy)
				if props.enabled then
					props.onActivated()
				end
			end,
			[roact.Event.MouseEnter] = function() --[[ line: 107 ]]
				-- upvalues: p1 (copy)
				p1:setState({ hover = true })
			end,
			[roact.Event.MouseLeave] = function() --[[ line: 112 ]]
				-- upvalues: p1 (copy)
				p1:setState({ hover = false, press = false })
			end,
			[roact.Event.InputBegan] = function(_, p4) --[[ line: 118 ]]
				-- upvalues: p1 (copy)
				if p4.UserInputType == Enum.UserInputType.MouseButton1 or p4.UserInputType == Enum.UserInputType.Touch then
					p1:setState({ press = true })
				end
			end,
			[roact.Event.InputEnded] = function(_, p5) --[[ line: 128 ]]
				-- upvalues: p1 (copy)
				if p5.UserInputType == Enum.UserInputType.MouseButton1 or p5.UserInputType == Enum.UserInputType.Touch then
					p1:setState({ press = false })
				end
			end,
			[roact.Ref] = p1.props.ButtonRef
		}, props.renderChildren(var6, props.enabled and p1.state.hover, props.enabled and p1.state.press))
	end)
end

function themedButton.render(p6) --[[ line: 143 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p7) --[[ line: 144 ]]
		-- upvalues: p6 (ref)
		return p6:renderWithSelectionCursor(p7)
	end)
end

return themedButton