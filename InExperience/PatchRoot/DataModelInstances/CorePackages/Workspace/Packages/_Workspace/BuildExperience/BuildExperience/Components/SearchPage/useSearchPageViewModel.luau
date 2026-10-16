local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.Promise)
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Components.SearchBar.SearchBarContainer)
local _ = require(script.Parent.SearchPageView)
local config = {
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	BackgroundTransparency = 1,
	CanvasSize = UDim2.new(1, 0, 1, 1),
	LayoutOrder = 2,
	ScrollBarThickness = 0,
	ScrollingDirection = Enum.ScrollingDirection.Y,
	Size = UDim2.fromScale(1, 1),
	[ReactModule.Tag] = "fill"
}

return function(p1, ScrollingFrameRef) --[[ Line: 42 | Named "useSearchPageViewModel" ]]
	-- upvalues: ReactModule (copy), CryoModule (copy), config (copy)
	return {
		children = p1.children,
		createFooter = p1.createFooter,
		onBack = p1.onBack,
		onCanvasPositionChangedCallback = p1.onCanvasPositionChangedCallback,
		onCanvasSizeChangedCallback = p1.onCanvasSizeChangedCallback,
		refresh = p1.refresh,
		scrollingElementProps = ReactModule.useMemo(function() --[[ Line: 43 ]]
			-- upvalues: CryoModule (upval), config (upval), p1 (copy)
			return CryoModule.Dictionary.join(config, p1.scrollingElementProps or {})
		end, { p1.scrollingElementProps }),
		scrollingFrameRef = ScrollingFrameRef,
		searchBarProps = p1.searchBarProps,
		showEmptyState = p1.showEmptyState
	}
end