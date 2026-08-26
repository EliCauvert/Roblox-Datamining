local corePackagesService = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local guiService = game:GetService("GuiService")
local roduxModule = require(corePackagesService.Packages.Rodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local parent = script.Parent.Parent
local actions = script.Parent.Parent.Actions
local setPlayerListVisibilityModule = require(actions.SetPlayerListVisibility)
local setPlayerListEnabledModule = require(actions.SetPlayerListEnabled)
local setTempHideKeyModule = require(actions.SetTempHideKey)
local setPerformanceStatsVisibleModule = require(actions.SetPerformanceStatsVisible)
local setSmallTouchDeviceModule = require(actions.SetSmallTouchDevice)
local setTenFootInterfaceModule = require(actions.SetTenFootInterface)
local setInspectMenuEnabledModule = require(actions.SetInspectMenuEnabled)
local setIsUsingGamepadModule = require(actions.SetIsUsingGamepad)
local setHasPermissionToVoiceChatModule = require(actions.SetHasPermissionToVoiceChat)
local setMinimizedModule = require(actions.SetMinimized)
local setSubjectToChinaPoliciesModule = require(actions.SetSubjectToChinaPolicies)
local fFlagPlayerListPersistVisibilityModule = require(parent.Flags.FFlagPlayerListPersistVisibility)
local fFlagAddNewPlayerListMobileFocusNav = playerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local var1 = if fFlagPlayerListPersistVisibilityModule then UserSettings().GameSettings else nil

local function _(p1)
	-- upvalues: cryoModule (ref)
	p1.isVisible = p1.setVisible
	
	if not p1.isTenFootInterface then
		p1.isVisible = p1.isVisible
	end
	p1.isVisible = p1.isVisible and cryoModule.isEmpty(p1.tempHideKeys)
	
	return p1
end

return roduxModule.createReducer({
	isMinimized = false,
	isVisible = true,
	isSmallTouchDevice = false,
	performanceStatsVisible = false,
	playerlistCoreGuiEnabled = true,
	isTenFootInterface = false,
	isUsingGamepad = false,
	hasPermissionToVoiceChat = false,
	subjectToChinaPolicies = true,
	setVisible = if playerListModule.Flags.FFlagPlayerListUseMobileOnSmallDisplay then false elseif fFlagPlayerListPersistVisibilityModule then var1.PlayerListVisible else true,
	vrEnabled = VRService.VREnabled,
	inspectMenuEnabled = guiService:GetInspectMenuEnabled(),
	tempHideKeys = {}
}, {
	[setPlayerListVisibilityModule.name] = function(p1, p2)
		-- upvalues: fFlagPlayerListPersistVisibilityModule (ref), var1 (ref), cryoModule (ref)
		if fFlagPlayerListPersistVisibilityModule and not p1.isSmallTouchDevice and not p1.isTenFootInterface then
			var1.PlayerListVisible = p2.isVisible
		end
		local var2 = cryoModule.Dictionary.join(p1, { setVisible = p2.isVisible })
		var2.isVisible = var2.setVisible
		
		if not var2.isTenFootInterface then
			var2.isVisible = var2.isVisible
		end
		var2.isVisible = var2.isVisible and cryoModule.isEmpty(var2.tempHideKeys)
		
		return var2
	end,
	[setPlayerListEnabledModule.name] = function(p1, p2)
		-- upvalues: fFlagAddNewPlayerListMobileFocusNav (ref), cryoModule (ref)
		local var2 = cryoModule.Dictionary.join(p1, {
			playerlistCoreGuiEnabled = p2.isEnabled,
			setVisible = if fFlagAddNewPlayerListMobileFocusNav then if fFlagAddNewPlayerListMobileFocusNav and not p2.isEnabled then false else nil else nil
		})
		var2.isVisible = var2.setVisible
		
		if not var2.isTenFootInterface then
			var2.isVisible = var2.isVisible
		end
		var2.isVisible = var2.isVisible and cryoModule.isEmpty(var2.tempHideKeys)
		
		return var2
	end,
	[setTempHideKeyModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		local tempHideValue = p2.tempHideValue
		
		if tempHideValue == nil then
			tempHideValue = cryoModule.None
		end
		local var2 = cryoModule.Dictionary.join(p1, {
			tempHideKeys = cryoModule.Dictionary.join(p1.tempHideKeys, { [p2.tempHideKey] = tempHideValue })
		})
		var2.isVisible = var2.setVisible
		
		if not var2.isTenFootInterface then
			var2.isVisible = var2.isVisible
		end
		var2.isVisible = var2.isVisible and cryoModule.isEmpty(var2.tempHideKeys)
		
		return var2
	end,
	[setPerformanceStatsVisibleModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { performanceStatsVisible = p2.isVisible })
	end,
	[setSmallTouchDeviceModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		local var2 = cryoModule.Dictionary.join(p1, { isSmallTouchDevice = p2.isSmallTouchDevice })
		var2.isVisible = var2.setVisible
		
		if not var2.isTenFootInterface then
			var2.isVisible = var2.isVisible
		end
		var2.isVisible = var2.isVisible and cryoModule.isEmpty(var2.tempHideKeys)
		
		return var2
	end,
	[setTenFootInterfaceModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		local var2 = cryoModule.Dictionary.join(p1, {
			isTenFootInterface = p2.isTenFootInterface,
			setVisible = if p2.isTenFootInterface then false else p1.setVisible
		})
		var2.isVisible = var2.setVisible
		
		if not var2.isTenFootInterface then
			var2.isVisible = var2.isVisible
		end
		var2.isVisible = var2.isVisible and cryoModule.isEmpty(var2.tempHideKeys)
		
		return var2
	end,
	[setInspectMenuEnabledModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { inspectMenuEnabled = p2.enabled })
	end,
	[setIsUsingGamepadModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { isUsingGamepad = p2.isUsingGamepad })
	end,
	[setHasPermissionToVoiceChatModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { hasPermissionToVoiceChat = p2.hasPermissionToVoiceChat })
	end,
	[setMinimizedModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { isMinimized = p2.isMinimized })
	end,
	[setSubjectToChinaPoliciesModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { subjectToChinaPolicies = p2.subjectToChinaPolicies })
	end
})