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
	[if fFlagTopBarSignalizeMenuOpen then "" else setMenuOpenModule.name] = if fFlagTopBarSignalizeMenuOpen then nil else function(p0, p1)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, {
			menuOpen = p1.menuOpen,
			isGamepadMenuOpen = if not (p0.menuOpen or not p1.menuOpen) then false else p0.isGamepadMenuOpen
		})
	end,
	[setTopBarEnabledModule.name] = function(p2, p3)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { topbarEnabled = p3.enabled })
	end,
	[setSmallTouchDeviceModule.name] = function(p4, p5)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p4, { isSmallTouchDevice = p5.isSmallTouchDevice })
	end,
	[if fFlagTopBarSignalizeScreenSize then "" else setScreenSizeModule.name] = if fFlagTopBarSignalizeScreenSize then nil else function(p6, p7)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p6, { screenSize = p7.screenSize })
	end,
	[if fFlagTopBarSignalizeMenuOpen then "" else setInspectMenuOpenModule.name] = if fFlagTopBarSignalizeMenuOpen then nil else function(p8, p9)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p8, { inspectMenuOpen = p9.inspectMenuOpen })
	end,
	[setGamepadMenuOpenModule.name] = function(p10, p11)
		-- upvalues: cryoModule (ref), fFlagGamepadNavigationDialogABTestModule (ref)
		return cryoModule.Dictionary.join(p10, {
			isGamepadMenuOpen = p11.open,
			isGamepadNavigationDialogOpen = if fFlagGamepadNavigationDialogABTestModule then false else nil
		})
	end,
	[setGamepadNavigationDialogOpenModule.name] = if fFlagGamepadNavigationDialogABTestModule then function(p12, p13)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p12, { isGamepadNavigationDialogOpen = p13.open })
	end else nil,
	[if fFlagTopBarSignalizeKeepOutAreas then "" else setKeepOutAreaModule.name] = if fFlagTopBarSignalizeKeepOutAreas then nil else function(p14, p15)
		-- upvalues: cryoModule (ref)
		local cloned = table.clone(p14.keepOutAreas)
		cloned[p15.id] = { size = p15.size, position = p15.position }
		
		return cryoModule.Dictionary.join(p14, { keepOutAreas = cloned })
	end,
	[if fFlagTopBarSignalizeKeepOutAreas then "" else removeKeepOutAreaModule.name] = if fFlagTopBarSignalizeKeepOutAreas then nil else function(p16, p17)
		-- upvalues: cryoModule (ref)
		local cloned = table.clone(p16.keepOutAreas)
		cloned[p17.id] = nil
		
		return cryoModule.Dictionary.join(p16, { keepOutAreas = cloned })
	end
})