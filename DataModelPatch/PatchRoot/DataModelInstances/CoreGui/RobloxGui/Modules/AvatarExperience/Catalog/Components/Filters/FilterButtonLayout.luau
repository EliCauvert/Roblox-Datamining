local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local FilterButtonModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Components.Filters.FilterButton)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXSlotsDesktopRedesign = AvatarExperienceFlagsModule.FFlagAXSlotsDesktopRedesign
local FFlagAXMoveCatalogFilterToL1Navigation = AvatarExperienceFlagsModule.FFlagAXMoveCatalogFilterToL1Navigation
local FFlagAXReduceCatalogFilterWidth = AvatarExperienceFlagsModule.FFlagAXReduceCatalogFilterWidth

return function(Gui)
	-- upvalues: ReactModule (copy), Focusable (copy), FFlagAXSlotsDesktopRedesign (copy), FFlagAXMoveCatalogFilterToL1Navigation (copy), FFlagAXReduceCatalogFilterWidth (copy), FilterButtonModule (copy)
	local ShowFilterButton = Gui.showFilterButton
	local XOffset: number = if ShowFilterButton then 52 else 0
	local UseRefResult = ReactModule.useRef(nil)
	
	return ReactModule.createElement(Focusable.Frame, {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, Gui.height),
		LayoutOrder = Gui.layoutOrder,
		ref = Gui.layoutRef,
		defaultChild = if ShowFilterButton then UseRefResult else nil,
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionDown = Gui.NextSelectionDown,
		NextSelectionLeft = Gui.NextSelectionLeft,
		NextSelectionRight = Gui.NextSelectionRight
	}, {
		Layout = if FFlagAXSlotsDesktopRedesign or FFlagAXMoveCatalogFilterToL1Navigation then ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = if FFlagAXReduceCatalogFilterWidth then Enum.VerticalAlignment.Center else nil
		}) else nil,
		FilterButton = ShowFilterButton and ReactModule.createElement(FilterButtonModule, {
			anchorPoint = Vector2.new(0, 0.5),
			position = UDim2.new(0, 8, 0.5, 0),
			buttonRef = UseRefResult
		}),
		ContentFrame = ReactModule.createElement(Focusable.Frame, {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, -XOffset, 1, 0),
			Position = UDim2.new(0, XOffset, 0, 0),
			LayoutOrder = if FFlagAXSlotsDesktopRedesign or FFlagAXMoveCatalogFilterToL1Navigation then if Gui.showFilterRight then 0 else 1 else nil
		}, Gui.children)
	})
end