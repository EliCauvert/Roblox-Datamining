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
local inExperienceTopBarModule = require(corePackagesService.Workspace.Packages.InExperienceTopBar)
local experienceAgeRatingBadgeModule = require(corePackagesService.Workspace.Packages.InExperienceTopBar.ExperienceAgeRatingBadge)
local fFlagExperienceAgeRatingBadge = inExperienceTopBarModule.Flags.FFlagExperienceAgeRatingBadge
local fFlagShowGameAgeRating = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagShowGameAgeRating
local fFlagShowGameAgeRating_1 = fFlagExperienceAgeRatingBadge and fFlagShowGameAgeRating
local fFlagTopBarRefactor = inExperienceTopBarModule.Flags.FFlagTopBarRefactor

local function MenuIconWrapper(p1)
	-- upvalues: fFlagTopBarSignalizeKeepOutAreas (ref), coreGuiCommonModule (ref), useSelector (ref), fFlagTopBarRefactor (ref), reactModule (ref), menuIconModule_1 (ref), menuIconModule (ref)
	return if fFlagTopBarRefactor then reactModule.createElement(menuIconModule_1, { showBadgeOver12 = p1.showBadgeOver12 }) else reactModule.createElement(menuIconModule, {
		layout = p1.layout,
		iconScale = if useSelector(function(p2)
			return if p2 and p2.displayOptions then p2.displayOptions.menuOpen else false
		end) then 1.5 else 1,
		showBadgeOver12 = p1.showBadgeOver12,
		onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then (if fFlagTopBarSignalizeKeepOutAreas then coreGuiCommonModule.Stores.GetKeepOutAreasStore(false) else nil).setKeepOutArea else nil
	})
end

return reactModule.memo(function(p1)
	-- upvalues: fFlagShowGameAgeRating_1 (ref), fFlagExperienceAgeRatingBadge (ref), fFlagShowGameAgeRating (ref), reactModule (ref), panel3DInSpatialUI (ref), panelType (ref), fFlagTopBarRefactor (ref), foundationModule (ref), MenuIconWrapper (ref), unibarModule (ref), experienceAgeRatingBadgeModule (ref)
	local var1 = fFlagShowGameAgeRating_1 and p1.showBadgeOver12 == true
	local var2 = nil
	local _ = nil
	local var3 = nil
	
	if fFlagExperienceAgeRatingBadge and fFlagShowGameAgeRating then
		local var4, var5 = reactModule.useBinding(true)
		var2 = var4
		local var6 = var5
		var3 = reactModule.useCallback(function(p2)
			-- upvalues: var6 (write)
			var6(p2.GroupTransparency < 1)
		end, { var6 })
	end
	return if panel3DInSpatialUI then reactModule.createElement(panel3DInSpatialUI, {
		panelType = panelType.BottomBar,
		keepVisibleWhenTopBarHidden = if fFlagShowGameAgeRating_1 then var1 else nil,
		controlsVisible = if fFlagShowGameAgeRating_1 then var2 else nil,
		renderFunction = function(p2)
			-- upvalues: reactModule (copy), fFlagShowGameAgeRating_1 (copy), var2 (write), var3 (write), fFlagTopBarRefactor (copy), foundationModule (copy), MenuIconWrapper (copy), p1 (ref), var1 (ref), unibarModule (copy), experienceAgeRatingBadgeModule (copy)
			local var7 = reactModule.createElement(if fFlagShowGameAgeRating_1 then "CanvasGroup" else "Frame", {
				Name = if fFlagShowGameAgeRating_1 then "AnimatablePanelManagedContent" else nil,
				Visible = if fFlagShowGameAgeRating_1 then var2 else nil,
				[reactModule.Change.GroupTransparency] = var3,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = if fFlagShowGameAgeRating_1 then UDim2.fromOffset(0, p2.Y) elseif fFlagTopBarRefactor then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, 0),
				AutomaticSize = if fFlagShowGameAgeRating_1 then Enum.AutomaticSize.X elseif fFlagTopBarRefactor then Enum.AutomaticSize.Y else nil
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
					MenuIcon = reactModule.createElement(MenuIconWrapper, {
						layout = 1,
						showBadgeOver12 = p1.showBadgeOver12 and not var1
					})
				}) else reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = Enum.AutomaticSize.X
				}, {
					MenuIcon = reactModule.createElement(MenuIconWrapper, {
						layout = 1,
						showBadgeOver12 = p1.showBadgeOver12 and not var1
					})
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
			
			return if fFlagShowGameAgeRating_1 then reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 8)
				}),
				Controls = var7,
				AgeRating = if var1 then reactModule.createElement(experienceAgeRatingBadgeModule, { layoutOrder = 1, universeId = tostring(game.GameId) }) else nil
			}) else var7
		end,
		requireCanvasGroup = not fFlagShowGameAgeRating_1
	}) else nil
end)