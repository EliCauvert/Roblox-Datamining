local corePackagesService = game:GetService("CorePackages")
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local vrSpatialUiModule = require(corePackagesService.Workspace.Packages.VrSpatialUi)
local panelType = vrSpatialUiModule.Constants.PanelType
local panel3DInSpatialUI = vrSpatialUiModule.Panel3DInSpatialUI
local parent = script.Parent.Parent.Parent
local unibarModule = require(parent.Chrome.ChromeShared.Unibar)
local menuIconModule = require(parent.TopBar.Components.Presentation.MenuIcon)
local menuIconModule_1 = require(parent.TopBar.ComponentsV2.MenuIcon)
local useSelector = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local fFlagTopBarSignalizeKeepOutAreas = coreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local fFlagTopBarRefactor = require(corePackagesService.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarRefactor

local function MenuIconWrapper(p0)
	-- upvalues: fFlagTopBarSignalizeKeepOutAreas (ref), coreGuiCommonModule (ref), useSelector (ref), fFlagTopBarRefactor (ref), reactModule (ref), menuIconModule_1 (ref), menuIconModule (ref)
	return if fFlagTopBarRefactor then reactModule.createElement(menuIconModule_1, { showBadgeOver12 = p0.showBadgeOver12 }) else reactModule.createElement(menuIconModule, {
		layout = p0.layout,
		iconScale = if useSelector(function(p1)
			return if p1 and p1.displayOptions then p1.displayOptions.menuOpen else false
		end) then 1.5 else 1,
		showBadgeOver12 = p0.showBadgeOver12,
		onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then (if fFlagTopBarSignalizeKeepOutAreas then coreGuiCommonModule.Stores.GetKeepOutAreasStore(false) else nil).setKeepOutArea else nil
	})
end

return reactModule.memo(function(p2)
	-- upvalues: panel3DInSpatialUI (ref), reactModule (ref), panelType (ref), fFlagTopBarRefactor (ref), foundationModule (ref), MenuIconWrapper (ref), unibarModule (ref)
	return if panel3DInSpatialUI then reactModule.createElement(panel3DInSpatialUI, {
		requireCanvasGroup = true,
		panelType = panelType.BottomBar,
		renderFunction = function()
			-- upvalues: reactModule (copy), fFlagTopBarRefactor (copy), foundationModule (copy), MenuIconWrapper (copy), p2 (ref), unibarModule (copy)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = if fFlagTopBarRefactor then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, 0),
				AutomaticSize = if fFlagTopBarRefactor then Enum.AutomaticSize.Y else nil
			}, {
				ListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 8)
				}),
				MenuIconFrame = if fFlagTopBarRefactor then reactModule.createElement(foundationModule.View, {
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = Enum.AutomaticSize.X,
					aspectRatio = {
						AspectRatio = 1,
						AspectType = Enum.AspectType.ScaleWithParentSize,
						DominantAxis = Enum.DominantAxis.Height
					}
				}, {
					MenuIcon = reactModule.createElement(MenuIconWrapper, { layout = 1, showBadgeOver12 = p2.showBadgeOver12 })
				}) else reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = Enum.AutomaticSize.X
				}, {
					MenuIcon = reactModule.createElement(MenuIconWrapper, { layout = 1, showBadgeOver12 = p2.showBadgeOver12 })
				}),
				UnibarFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(0, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					Unibar = reactModule.createElement(unibarModule, {
						layoutOrder = 1,
						onAreaChanged = function() end,
						onMinWidthChanged = function() end
					})
				})
			})
		end
	}) else nil
end)