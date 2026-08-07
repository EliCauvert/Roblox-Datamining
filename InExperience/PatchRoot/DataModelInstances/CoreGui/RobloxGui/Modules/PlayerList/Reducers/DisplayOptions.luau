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
local var18 = if fFlagPlayerListPersistVisibilityModule then UserSettings().GameSettings else nil

local function _(p0) --[[ line: 48 | named "updateIsVisible" ]]
	-- upvalues: cryoModule (ref)
	p0.isVisible = p0.setVisible
	
	if not p0.isTenFootInterface then
		p0.isVisible = p0.isVisible
	end
	p0.isVisible = p0.isVisible and cryoModule.isEmpty(p0.tempHideKeys)
	
	return p0
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
	setVisible = if playerListModule.Flags.FFlagPlayerListUseMobileOnSmallDisplay then false elseif fFlagPlayerListPersistVisibilityModule then var18.PlayerListVisible else true,
	vrEnabled = VRService.VREnabled,
	inspectMenuEnabled = guiService:GetInspectMenuEnabled(),
	tempHideKeys = {}
}, {
	[setPlayerListVisibilityModule.name] = function(p1, p2) --[[ line: 61 ]]
		-- upvalues: fFlagPlayerListPersistVisibilityModule (ref), var18 (ref), cryoModule (ref)
		if fFlagPlayerListPersistVisibilityModule and not p1.isSmallTouchDevice and not p1.isTenFootInterface then
			var18.PlayerListVisible = p2.isVisible
		end
		local var19 = cryoModule.Dictionary.join(p1, { setVisible = p2.isVisible })
		var19.isVisible = var19.setVisible
		
		if not var19.isTenFootInterface then
			var19.isVisible = var19.isVisible
		end
		var19.isVisible = var19.isVisible and cryoModule.isEmpty(var19.tempHideKeys)
		
		return var19
	end,
	[setPlayerListEnabledModule.name] = function(p3, p4) --[[ line: 73 ]]
		-- upvalues: fFlagAddNewPlayerListMobileFocusNav (ref), cryoModule (ref)
		local var20 = cryoModule.Dictionary.join(p3, {
			playerlistCoreGuiEnabled = p4.isEnabled,
			setVisible = if fFlagAddNewPlayerListMobileFocusNav then if fFlagAddNewPlayerListMobileFocusNav and not p4.isEnabled then false else nil else nil
		})
		var20.isVisible = var20.setVisible
		
		if not var20.isTenFootInterface then
			var20.isVisible = var20.isVisible
		end
		var20.isVisible = var20.isVisible and cryoModule.isEmpty(var20.tempHideKeys)
		
		return var20
	end,
	[setTempHideKeyModule.name] = function(p5, p6) --[[ line: 87 ]]
		-- upvalues: cryoModule (ref)
		local tempHideValue = p6.tempHideValue
		
		if tempHideValue == nil then
			tempHideValue = cryoModule.None
		end
		local var21 = cryoModule.Dictionary.join(p5, {
			tempHideKeys = cryoModule.Dictionary.join(p5.tempHideKeys, { [p6.tempHideKey] = tempHideValue })
		})
		var21.isVisible = var21.setVisible
		
		if not var21.isTenFootInterface then
			var21.isVisible = var21.isVisible
		end
		var21.isVisible = var21.isVisible and cryoModule.isEmpty(var21.tempHideKeys)
		
		return var21
	end,
	[setPerformanceStatsVisibleModule.name] = function(p7, p8) --[[ line: 99 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p7, { performanceStatsVisible = p8.isVisible })
	end,
	[setSmallTouchDeviceModule.name] = function(p9, p10) --[[ line: 105 ]]
		-- upvalues: cryoModule (ref)
		local var22 = cryoModule.Dictionary.join(p9, { isSmallTouchDevice = p10.isSmallTouchDevice })
		var22.isVisible = var22.setVisible
		
		if not var22.isTenFootInterface then
			var22.isVisible = var22.isVisible
		end
		var22.isVisible = var22.isVisible and cryoModule.isEmpty(var22.tempHideKeys)
		
		return var22
	end,
	[setTenFootInterfaceModule.name] = function(p11, p12) --[[ line: 111 ]]
		-- upvalues: cryoModule (ref)
		local var23 = cryoModule.Dictionary.join(p11, {
			isTenFootInterface = p12.isTenFootInterface,
			setVisible = if p12.isTenFootInterface then false else p11.setVisible
		})
		var23.isVisible = var23.setVisible
		
		if not var23.isTenFootInterface then
			var23.isVisible = var23.isVisible
		end
		var23.isVisible = var23.isVisible and cryoModule.isEmpty(var23.tempHideKeys)
		
		return var23
	end,
	[setInspectMenuEnabledModule.name] = function(p13, p14) --[[ line: 122 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p13, { inspectMenuEnabled = p14.enabled })
	end,
	[setIsUsingGamepadModule.name] = function(p15, p16) --[[ line: 128 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p15, { isUsingGamepad = p16.isUsingGamepad })
	end,
	[setHasPermissionToVoiceChatModule.name] = function(p17, p18) --[[ line: 134 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p17, { hasPermissionToVoiceChat = p18.hasPermissionToVoiceChat })
	end,
	[setMinimizedModule.name] = function(p19, p20) --[[ line: 140 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p19, { isMinimized = p20.isMinimized })
	end,
	[setSubjectToChinaPoliciesModule.name] = function(p21, p22) --[[ line: 146 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p21, { subjectToChinaPolicies = p22.subjectToChinaPolicies })
	end
})