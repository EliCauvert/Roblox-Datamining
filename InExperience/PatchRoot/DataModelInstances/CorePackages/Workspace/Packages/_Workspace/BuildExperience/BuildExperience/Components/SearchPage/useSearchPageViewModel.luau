local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.Promise)
local reactModule = require(parent.React)
local _ = require(buildExperience.Components.SearchBar.SearchBarContainer)
local _ = require(script.Parent.SearchPageView)
local t = {
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	BackgroundTransparency = 1,
	CanvasSize = UDim2.new(1, 0, 1, 1),
	LayoutOrder = 2,
	ScrollBarThickness = 0,
	ScrollingDirection = Enum.ScrollingDirection.Y,
	Size = UDim2.fromScale(1, 1),
	[reactModule.Tag] = "fill"
}

return function(p1, p2)
	-- upvalues: reactModule (ref), cryoModule (ref), t (ref)
	return {
		children = p1.children,
		createFooter = p1.createFooter,
		onBack = p1.onBack,
		onCanvasPositionChangedCallback = p1.onCanvasPositionChangedCallback,
		onCanvasSizeChangedCallback = p1.onCanvasSizeChangedCallback,
		refresh = p1.refresh,
		scrollingElementProps = reactModule.useMemo(function()
			-- upvalues: cryoModule (copy), t (copy), p1 (ref)
			return cryoModule.Dictionary.join(t, p1.scrollingElementProps or {})
		end, { p1.scrollingElementProps }),
		scrollingFrameRef = p2,
		searchBarProps = p1.searchBarProps,
		showEmptyState = p1.showEmptyState
	}
end