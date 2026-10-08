local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local archiveGameDialogModule = require(buildExperience.Components.GameConfigurations.ArchiveGameDialog)
local experienceShareOverlaysModule = require(buildExperience.Components.ShareAudience.ExperienceShareOverlays)
local menu = foundationModule.Menu
local inputSize = foundationModule.Enums.InputSize
local popoverSide = foundationModule.Enums.PopoverSide

return function(p1)
	-- upvalues: reactModule (ref), menu (ref), popoverSide (ref), inputSize (ref), experienceShareOverlaysModule (ref), archiveGameDialogModule (ref)
	return reactModule.createElement(reactModule.Fragment, nil, {
		Menu = reactModule.createElement(menu, {
			testId = "ExperienceRowActionsMenuView",
			ref = p1.focusRootRef,
			isOpen = p1.isOpen,
			items = p1.items,
			anchorRef = p1.anchorRef,
			side = popoverSide.Bottom,
			align = p1.align,
			size = inputSize.Large,
			width = p1.width,
			onActivated = p1.onItemActivated,
			onPressedOutside = p1.onPressedOutside
		}),
		ShareOverlays = reactModule.createElement(experienceShareOverlaysModule, p1.shareOverlays),
		ArchiveDialog = reactModule.createElement(archiveGameDialogModule, p1.archiveDialog)
	})
end