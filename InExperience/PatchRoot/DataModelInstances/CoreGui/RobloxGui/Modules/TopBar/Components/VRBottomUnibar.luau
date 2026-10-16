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
local InExperienceTopBarModule = require(CorePackages.Workspace.Packages.InExperienceTopBar)
local ExperienceAgeRatingBadgeModule = require(CorePackages.Workspace.Packages.InExperienceTopBar.ExperienceAgeRatingBadge)
local FFlagExperienceAgeRatingBadge = InExperienceTopBarModule.Flags.FFlagExperienceAgeRatingBadge
local FFlagShowGameAgeRating = require(CorePackages.Workspace.Packages.SharedFlags).FFlagShowGameAgeRating
local FFlagShowGameAgeRating1 = FFlagExperienceAgeRatingBadge and FFlagShowGameAgeRating
local FFlagTopBarRefactor = InExperienceTopBarModule.Flags.FFlagTopBarRefactor

local function MenuIconWrapper(p1) --[[ Line: 31 ]]
	-- upvalues: FFlagTopBarSignalizeKeepOutAreas (copy), CoreGuiCommonModule (copy), UseSelectorFunction (copy), FFlagTopBarRefactor (copy), ReactModule (copy), MenuIconModule1 (copy), MenuIconModule (copy)
	local KeepOutAreasStore = if FFlagTopBarSignalizeKeepOutAreas then CoreGuiCommonModule.Stores.GetKeepOutAreasStore(false) else nil
	local IconScale: number = if UseSelectorFunction(function(p2) --[[ Line: 37 ]]
		return if p2 and p2.displayOptions then p2.displayOptions.menuOpen else false
	end) then 1.5 else 1
	
	return if FFlagTopBarRefactor then ReactModule.createElement(MenuIconModule1, { showBadgeOver12 = p1.showBadgeOver12 }) else ReactModule.createElement(MenuIconModule, {
		layout = p1.layout,
		iconScale = IconScale,
		showBadgeOver12 = p1.showBadgeOver12,
		onAreaChanged = if FFlagTopBarSignalizeKeepOutAreas then KeepOutAreasStore.setKeepOutArea else nil
	})
end

return ReactModule.memo(function(p1) --[[ Line: 53 | Named "VRBottomUnibar" ]]
	-- upvalues: FFlagShowGameAgeRating1 (copy), FFlagExperienceAgeRatingBadge (copy), FFlagShowGameAgeRating (copy), ReactModule (copy), Panel3DInSpatialUI (copy), PanelType (copy), FFlagTopBarRefactor (copy), FoundationModule (copy), MenuIconWrapper (copy), UnibarModule (copy), ExperienceAgeRatingBadgeModule (copy)
	local IsShowBadgeOver: boolean = FFlagShowGameAgeRating1 and p1.showBadgeOver12 == true
	local v1 = nil
	local UseBindingResult2 = nil
	local UseResult = nil
	
	if FFlagExperienceAgeRatingBadge and FFlagShowGameAgeRating then
		v1, UseBindingResult2 = ReactModule.useBinding(true)
		UseResult = ReactModule.useCallback(function(p2) --[[ Line: 59 ]]
			-- upvalues: UseBindingResult2 (ref)
			UseBindingResult2(p2.GroupTransparency < 1)
		end, { UseBindingResult2 })
	end
	return if Panel3DInSpatialUI then ReactModule.createElement(Panel3DInSpatialUI, {
		panelType = PanelType.BottomBar,
		keepVisibleWhenTopBarHidden = if FFlagShowGameAgeRating1 then IsShowBadgeOver else nil,
		controlsVisible = if FFlagShowGameAgeRating1 then v1 else nil,
		renderFunction = function(p2) --[[ Line: 70 ]]
			-- upvalues: ReactModule (upval), FFlagShowGameAgeRating1 (upval), v1 (ref), UseResult (ref), FFlagTopBarRefactor (upval), FoundationModule (upval), MenuIconWrapper (upval), p1 (copy), IsShowBadgeOver (copy), UnibarModule (upval), ExperienceAgeRatingBadgeModule (upval)
			local Element = ReactModule.createElement(if FFlagShowGameAgeRating1 then "CanvasGroup" else "Frame", {
				Name = if FFlagShowGameAgeRating1 then "AnimatablePanelManagedContent" else nil,
				Visible = if FFlagShowGameAgeRating1 then v1 else nil,
				[ReactModule.Change.GroupTransparency] = UseResult,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = if FFlagShowGameAgeRating1 then UDim2.fromOffset(0, p2.Y) elseif FFlagTopBarRefactor then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, 0),
				AutomaticSize = if FFlagShowGameAgeRating1 then Enum.AutomaticSize.X elseif FFlagTopBarRefactor then Enum.AutomaticSize.Y else nil
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
					MenuIcon = ReactModule.createElement(MenuIconWrapper, {
						layout = 1,
						showBadgeOver12 = p1.showBadgeOver12 and not IsShowBadgeOver
					})
				}) else ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = Enum.AutomaticSize.X
				}, {
					MenuIcon = ReactModule.createElement(MenuIconWrapper, {
						layout = 1,
						showBadgeOver12 = p1.showBadgeOver12 and not IsShowBadgeOver
					})
				}),
				UnibarFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(0, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					Unibar = ReactModule.createElement(UnibarModule, {
						layoutOrder = 1,
						onAreaChanged = function() --[[ Line: 126 ]] end,
						onMinWidthChanged = function() --[[ Line: 127 ]] end
					})
				})
			})
			
			return if FFlagShowGameAgeRating1 then ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 8)
				}),
				Controls = Element,
				AgeRating = if IsShowBadgeOver then ReactModule.createElement(ExperienceAgeRatingBadgeModule, { layoutOrder = 1, universeId = tostring(game.GameId) }) else nil
			}) else Element
		end,
		requireCanvasGroup = not FFlagShowGameAgeRating1
	}) else nil
end)