local CorePackages = game:GetService("CorePackages")
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local VrSpatialUiModule = require(CorePackages.Workspace.Packages.VrSpatialUi)
local PanelType = VrSpatialUiModule.Constants.PanelType
local Panel3DInSpatialUI = VrSpatialUiModule.Panel3DInSpatialUI
local Parent = script.Parent.Parent.Parent
local UnibarModule = require(Parent.Chrome.ChromeShared.Unibar)
local MenuIconModule = require(Parent.TopBar.Components.Presentation.MenuIcon)
local MenuIconModule1 = require(Parent.TopBar.ComponentsV2.MenuIcon)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local FFlagTopBarSignalizeKeepOutAreas = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local FFlagTopBarRefactor = require(CorePackages.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarRefactor

local function MenuIconWrapper(p1)
	-- upvalues: FFlagTopBarSignalizeKeepOutAreas (copy), CoreGuiCommonModule (copy), UseSelectorFunction (copy), FFlagTopBarRefactor (copy), ReactModule (copy), MenuIconModule1 (copy), MenuIconModule (copy)
	local KeepOutAreasStore = if FFlagTopBarSignalizeKeepOutAreas then CoreGuiCommonModule.Stores.GetKeepOutAreasStore(false) else nil
	local IconScale: number = if UseSelectorFunction(function(p2)
		return if p2 and p2.displayOptions then p2.displayOptions.menuOpen else false
	end) then 1.5 else 1
	
	return if FFlagTopBarRefactor then ReactModule.createElement(MenuIconModule1, { showBadgeOver12 = p1.showBadgeOver12 }) else ReactModule.createElement(MenuIconModule, {
		layout = p1.layout,
		iconScale = IconScale,
		showBadgeOver12 = p1.showBadgeOver12,
		onAreaChanged = if FFlagTopBarSignalizeKeepOutAreas then KeepOutAreasStore.setKeepOutArea else nil
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: Panel3DInSpatialUI (copy), ReactModule (copy), PanelType (copy), FFlagTopBarRefactor (copy), FoundationModule (copy), MenuIconWrapper (copy), UnibarModule (copy)
	return if Panel3DInSpatialUI then ReactModule.createElement(Panel3DInSpatialUI, {
		requireCanvasGroup = true,
		panelType = PanelType.BottomBar,
		renderFunction = function()
			-- upvalues: ReactModule (upval), FFlagTopBarRefactor (upval), FoundationModule (upval), MenuIconWrapper (upval), p1 (copy), UnibarModule (upval)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = if FFlagTopBarRefactor then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, 0),
				AutomaticSize = if FFlagTopBarRefactor then Enum.AutomaticSize.Y else nil
			}, {
				ListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 8)
				}),
				MenuIconFrame = if FFlagTopBarRefactor then ReactModule.createElement(FoundationModule.View, {
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = Enum.AutomaticSize.X,
					aspectRatio = {
						AspectRatio = 1,
						AspectType = Enum.AspectType.ScaleWithParentSize,
						DominantAxis = Enum.DominantAxis.Height
					}
				}, {
					MenuIcon = ReactModule.createElement(MenuIconWrapper, { layout = 1, showBadgeOver12 = p1.showBadgeOver12 })
				}) else ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = Enum.AutomaticSize.X
				}, {
					MenuIcon = ReactModule.createElement(MenuIconWrapper, { layout = 1, showBadgeOver12 = p1.showBadgeOver12 })
				}),
				UnibarFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(0, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					Unibar = ReactModule.createElement(UnibarModule, {
						layoutOrder = 1,
						onAreaChanged = function() end,
						onMinWidthChanged = function() end
					})
				})
			})
		end
	}) else nil
end)