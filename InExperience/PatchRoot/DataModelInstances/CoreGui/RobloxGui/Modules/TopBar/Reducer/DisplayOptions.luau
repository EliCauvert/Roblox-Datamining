local CorePackages = game:GetService("CorePackages")
local RoduxModule = require(CorePackages.Packages.Rodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local Parent = script.Parent.Parent

if require(Parent.Flags.FFlagTopBarDeprecateDisplayOptionsRodux) then
	return nil
else
	local Actions = Parent.Actions
	local SetMenuOpenModule = require(Actions.SetMenuOpen)
	local SetScreenSizeModule = require(Actions.SetScreenSize)
	local SetKeepOutAreaModule = require(Actions.SetKeepOutArea)
	local RemoveKeepOutAreaModule = require(Actions.RemoveKeepOutArea)
	local _ = require(Actions.SetInputType)
	local SetInspectMenuOpenModule = require(Actions.SetInspectMenuOpen)
	local FFlagGamepadNavigationDialogABTestModule = require(script.Parent.Parent.Flags.FFlagGamepadNavigationDialogABTest)
	local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
	local FFlagTopBarSignalizeMenuOpen = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeMenuOpen
	local FFlagTopBarSignalizeKeepOutAreas = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
	local FFlagTopBarSignalizeScreenSize = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeScreenSize
	local _ = require(Parent.Constants).InputType
	local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
	
	return (RoduxModule.createReducer({
		menuOpen = false,
		inspectMenuOpen = false,
		topbarEnabled = true,
		isSmallTouchDevice = false,
		isGamepadMenuOpen = false,
		screenSize = Vector2.new(0, 0),
		isGamepadNavigationDialogOpen = not FFlagGamepadNavigationDialogABTestModule and nil,
		keepOutAreas = {}
	}, {
		[if FFlagTopBarSignalizeMenuOpen then "" else SetMenuOpenModule.name] = if FFlagTopBarSignalizeMenuOpen then nil else function(p1, p2) --[[ Line: 51 ]]
			-- upvalues: CryoModule (copy)
			return CryoModule.Dictionary.join(p1, {
				menuOpen = p2.menuOpen,
				isGamepadMenuOpen = (p1.menuOpen or not p2.menuOpen) and p1.isGamepadMenuOpen
			})
		end,
		[require(Actions.SetTopBarEnabled).name] = function(p1, p2) --[[ Line: 64 ]]
			-- upvalues: CryoModule (copy)
			return CryoModule.Dictionary.join(p1, { topbarEnabled = p2.enabled })
		end,
		[require(Actions.SetSmallTouchDevice).name] = function(p1, p2) --[[ Line: 70 ]]
			-- upvalues: CryoModule (copy)
			return CryoModule.Dictionary.join(p1, { isSmallTouchDevice = p2.isSmallTouchDevice })
		end,
		[if FFlagTopBarSignalizeScreenSize then "" else SetScreenSizeModule.name] = if FFlagTopBarSignalizeScreenSize then nil else function(p1, p2) --[[ Line: 76 ]]
			-- upvalues: CryoModule (copy)
			return CryoModule.Dictionary.join(p1, { screenSize = p2.screenSize })
		end,
		[if FFlagTopBarSignalizeMenuOpen then "" else SetInspectMenuOpenModule.name] = if FFlagTopBarSignalizeMenuOpen then nil else function(p1, p2) --[[ Line: 82 ]]
			-- upvalues: CryoModule (copy)
			return CryoModule.Dictionary.join(p1, { inspectMenuOpen = p2.inspectMenuOpen })
		end,
		[require(Actions.SetGamepadMenuOpen).name] = function(p1, p2) --[[ Line: 88 ]]
			-- upvalues: CryoModule (copy), FFlagGamepadNavigationDialogABTestModule (copy)
			return CryoModule.Dictionary.join(p1, {
				isGamepadMenuOpen = p2.open,
				isGamepadNavigationDialogOpen = not FFlagGamepadNavigationDialogABTestModule and nil
			})
		end,
		[require(Actions.SetGamepadNavigationDialogOpen).name] = if FFlagGamepadNavigationDialogABTestModule then function(p1, p2) --[[ Line: 96 ]]
			-- upvalues: CryoModule (copy)
			return CryoModule.Dictionary.join(p1, { isGamepadNavigationDialogOpen = p2.open })
		end else nil,
		[if FFlagTopBarSignalizeKeepOutAreas then "" else SetKeepOutAreaModule.name] = if FFlagTopBarSignalizeKeepOutAreas then nil else function(p1, p2) --[[ Line: 103 ]]
			-- upvalues: CryoModule (copy)
			local Copy = table.clone(p1.keepOutAreas)
			Copy[p2.id] = { size = p2.size, position = p2.position }
			
			return CryoModule.Dictionary.join(p1, { keepOutAreas = Copy })
		end,
		[if FFlagTopBarSignalizeKeepOutAreas then "" else RemoveKeepOutAreaModule.name] = if FFlagTopBarSignalizeKeepOutAreas then nil else function(p1, p2) --[[ Line: 115 ]]
			-- upvalues: CryoModule (copy)
			local Copy = table.clone(p1.keepOutAreas)
			Copy[p2.id] = nil
			
			return CryoModule.Dictionary.join(p1, { keepOutAreas = Copy })
		end
	}))
end