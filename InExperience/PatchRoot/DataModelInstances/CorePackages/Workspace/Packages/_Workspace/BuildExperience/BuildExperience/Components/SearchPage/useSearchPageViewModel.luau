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

return function(p0, p1) --[[ line: 42 | named "useSearchPageViewModel" ]]
	-- upvalues: reactModule (ref), cryoModule (ref), t (ref)
	return {
		children = p0.children,
		createFooter = p0.createFooter,
		onBack = p0.onBack,
		onCanvasPositionChangedCallback = p0.onCanvasPositionChangedCallback,
		onCanvasSizeChangedCallback = p0.onCanvasSizeChangedCallback,
		refresh = p0.refresh,
		scrollingElementProps = reactModule.useMemo(function() --[[ line: 43 ]]
			-- upvalues: cryoModule (copy), t (copy), p0 (ref)
			return cryoModule.Dictionary.join(t, p0.scrollingElementProps or {})
		end, { p0.scrollingElementProps }),
		scrollingFrameRef = p1,
		searchBarProps = p0.searchBarProps,
		showEmptyState = p0.showEmptyState
	}
end