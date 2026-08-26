local corePackagesService = game:GetService("CorePackages")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent

if require(parent.Flags.FFlagTopBarDeprecateDisplayOptionsRodux) then
	return nil
end
local actions = parent.Actions
local setMenuOpenModule = require(actions.SetMenuOpen)
local setTopBarEnabledModule = require(actions.SetTopBarEnabled)
local setSmallTouchDeviceModule = require(actions.SetSmallTouchDevice)
local setScreenSizeModule = require(actions.SetScreenSize)
local setKeepOutAreaModule = require(actions.SetKeepOutArea)
local removeKeepOutAreaModule = require(actions.RemoveKeepOutArea)
local _ = require(actions.SetInputType)
local setInspectMenuOpenModule = require(actions.SetInspectMenuOpen)
local setGamepadMenuOpenModule = require(actions.SetGamepadMenuOpen)
local setGamepadNavigationDialogOpenModule = require(actions.SetGamepadNavigationDialogOpen)
local fFlagGamepadNavigationDialogABTestModule = require(script.Parent.Parent.Flags.FFlagGamepadNavigationDialogABTest)
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local fFlagTopBarSignalizeMenuOpen = coreGuiCommonModule.Flags.FFlagTopBarSignalizeMenuOpen
local fFlagTopBarSignalizeKeepOutAreas = coreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local fFlagTopBarSignalizeScreenSize = coreGuiCommonModule.Flags.FFlagTopBarSignalizeScreenSize
local _ = require(parent.Constants).InputType
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")

return roduxModule.createReducer({
	menuOpen = false,
	inspectMenuOpen = false,
	topbarEnabled = true,
	isSmallTouchDevice = false,
	isGamepadMenuOpen = false,
	screenSize = Vector2.new(0, 0),
	isGamepadNavigationDialogOpen = if fFlagGamepadNavigationDialogABTestModule then false else nil,
	keepOutAreas = {}
}, {
	[if fFlagTopBarSignalizeMenuOpen then "" else setMenuOpenModule.name] = if fFlagTopBarSignalizeMenuOpen then nil else function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			menuOpen = p2.menuOpen,
			isGamepadMenuOpen = if not (p1.menuOpen or not p2.menuOpen) then false else p1.isGamepadMenuOpen
		})
	end,
	[setTopBarEnabledModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { topbarEnabled = p2.enabled })
	end,
	[setSmallTouchDeviceModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { isSmallTouchDevice = p2.isSmallTouchDevice })
	end,
	[if fFlagTopBarSignalizeScreenSize then "" else setScreenSizeModule.name] = if fFlagTopBarSignalizeScreenSize then nil else function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { screenSize = p2.screenSize })
	end,
	[if fFlagTopBarSignalizeMenuOpen then "" else setInspectMenuOpenModule.name] = if fFlagTopBarSignalizeMenuOpen then nil else function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { inspectMenuOpen = p2.inspectMenuOpen })
	end,
	[setGamepadMenuOpenModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref), fFlagGamepadNavigationDialogABTestModule (ref)
		return cryoModule.Dictionary.join(p1, {
			isGamepadMenuOpen = p2.open,
			isGamepadNavigationDialogOpen = if fFlagGamepadNavigationDialogABTestModule then false else nil
		})
	end,
	[setGamepadNavigationDialogOpenModule.name] = if fFlagGamepadNavigationDialogABTestModule then function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { isGamepadNavigationDialogOpen = p2.open })
	end else nil,
	[if fFlagTopBarSignalizeKeepOutAreas then "" else setKeepOutAreaModule.name] = if fFlagTopBarSignalizeKeepOutAreas then nil else function(p1, p2)
		-- upvalues: cryoModule (ref)
		local cloned = table.clone(p1.keepOutAreas)
		cloned[p2.id] = { size = p2.size, position = p2.position }
		
		return cryoModule.Dictionary.join(p1, { keepOutAreas = cloned })
	end,
	[if fFlagTopBarSignalizeKeepOutAreas then "" else removeKeepOutAreaModule.name] = if fFlagTopBarSignalizeKeepOutAreas then nil else function(p1, p2)
		-- upvalues: cryoModule (ref)
		local cloned = table.clone(p1.keepOutAreas)
		cloned[p2.id] = nil
		
		return cryoModule.Dictionary.join(p1, { keepOutAreas = cloned })
	end
})