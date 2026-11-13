local CorePackages = game:GetService("CorePackages")
local RoduxModule = require(CorePackages.Packages.Rodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local Actions = script.Parent.Parent.Actions
local SetPlayerListVisibilityModule = require(Actions.SetPlayerListVisibility)
local SetPlayerListEnabledModule = require(Actions.SetPlayerListEnabled)
local SetTempHideKeyModule = require(Actions.SetTempHideKey)
local SetPerformanceStatsVisibleModule = require(Actions.SetPerformanceStatsVisible)
local SetSmallTouchDeviceModule = require(Actions.SetSmallTouchDevice)
local SetTenFootInterfaceModule = require(Actions.SetTenFootInterface)
local SetInspectMenuEnabledModule = require(Actions.SetInspectMenuEnabled)
local SetIsUsingGamepadModule = require(Actions.SetIsUsingGamepad)
local SetHasPermissionToVoiceChatModule = require(Actions.SetHasPermissionToVoiceChat)
local SetMinimizedModule = require(Actions.SetMinimized)
local SetSubjectToChinaPoliciesModule = require(Actions.SetSubjectToChinaPolicies)
local FFlagPlayerListPersistVisibilityModule = require(script.Parent.Parent.Flags.FFlagPlayerListPersistVisibility)
local FFlagAddNewPlayerListMobileFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local FFlagPlayerListUseMobileOnSmallDisplay = PlayerListModule.Flags.FFlagPlayerListUseMobileOnSmallDisplay
local GameSettings = if FFlagPlayerListPersistVisibilityModule then UserSettings().GameSettings else nil
local config = {
	isMinimized = false,
	isVisible = true,
	isSmallTouchDevice = false,
	performanceStatsVisible = false,
	playerlistCoreGuiEnabled = true,
	isTenFootInterface = false,
	isUsingGamepad = false,
	hasPermissionToVoiceChat = false,
	subjectToChinaPolicies = true,
	setVisible = not FFlagPlayerListUseMobileOnSmallDisplay and (not FFlagPlayerListPersistVisibilityModule or GameSettings.PlayerListVisible),
	vrEnabled = game:GetService("VRService").VREnabled,
	inspectMenuEnabled = game:GetService("GuiService"):GetInspectMenuEnabled(),
	tempHideKeys = {}
}

local function _(p1)
	-- upvalues: CryoModule (copy)
	p1.isVisible = p1.setVisible
	
	if not p1.isTenFootInterface then
		p1.isVisible = p1.isVisible
	end
	p1.isVisible = p1.isVisible and CryoModule.isEmpty(p1.tempHideKeys)
	
	return p1
end

return (RoduxModule.createReducer(config, {
	[SetPlayerListVisibilityModule.name] = function(p1, p2)
		-- upvalues: FFlagPlayerListPersistVisibilityModule (copy), GameSettings (copy), CryoModule (copy)
		if FFlagPlayerListPersistVisibilityModule and not p1.isSmallTouchDevice and not p1.isTenFootInterface then
			GameSettings.PlayerListVisible = p2.isVisible
		end
		local JoinResult = CryoModule.Dictionary.join(p1, { setVisible = p2.isVisible })
		JoinResult.isVisible = JoinResult.setVisible
		
		if not JoinResult.isTenFootInterface then
			JoinResult.isVisible = JoinResult.isVisible
		end
		JoinResult.isVisible = JoinResult.isVisible and CryoModule.isEmpty(JoinResult.tempHideKeys)
		
		return JoinResult
	end,
	[SetPlayerListEnabledModule.name] = function(p1, p2)
		-- upvalues: FFlagAddNewPlayerListMobileFocusNav (copy), CryoModule (copy)
		local v1 = (not FFlagAddNewPlayerListMobileFocusNav or p2.isEnabled) and nil
		local JoinResult = CryoModule.Dictionary.join(p1, {
			playerlistCoreGuiEnabled = p2.isEnabled,
			setVisible = if FFlagAddNewPlayerListMobileFocusNav then v1 else nil
		})
		JoinResult.isVisible = JoinResult.setVisible
		
		if not JoinResult.isTenFootInterface then
			JoinResult.isVisible = JoinResult.isVisible
		end
		JoinResult.isVisible = JoinResult.isVisible and CryoModule.isEmpty(JoinResult.tempHideKeys)
		
		return JoinResult
	end,
	[SetTempHideKeyModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local TempHideValue = p2.tempHideValue
		
		if TempHideValue == nil then
			TempHideValue = CryoModule.None
		end
		local JoinResult = CryoModule.Dictionary.join(p1, {
			tempHideKeys = CryoModule.Dictionary.join(p1.tempHideKeys, { [p2.tempHideKey] = TempHideValue })
		})
		JoinResult.isVisible = JoinResult.setVisible
		
		if not JoinResult.isTenFootInterface then
			JoinResult.isVisible = JoinResult.isVisible
		end
		JoinResult.isVisible = JoinResult.isVisible and CryoModule.isEmpty(JoinResult.tempHideKeys)
		
		return JoinResult
	end,
	[SetPerformanceStatsVisibleModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { performanceStatsVisible = p2.isVisible })
	end,
	[SetSmallTouchDeviceModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local JoinResult = CryoModule.Dictionary.join(p1, { isSmallTouchDevice = p2.isSmallTouchDevice })
		JoinResult.isVisible = JoinResult.setVisible
		
		if not JoinResult.isTenFootInterface then
			JoinResult.isVisible = JoinResult.isVisible
		end
		JoinResult.isVisible = JoinResult.isVisible and CryoModule.isEmpty(JoinResult.tempHideKeys)
		
		return JoinResult
	end,
	[SetTenFootInterfaceModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local JoinResult = CryoModule.Dictionary.join(p1, {
			isTenFootInterface = p2.isTenFootInterface,
			setVisible = not p2.isTenFootInterface and p1.setVisible
		})
		JoinResult.isVisible = JoinResult.setVisible
		
		if not JoinResult.isTenFootInterface then
			JoinResult.isVisible = JoinResult.isVisible
		end
		JoinResult.isVisible = JoinResult.isVisible and CryoModule.isEmpty(JoinResult.tempHideKeys)
		
		return JoinResult
	end,
	[SetInspectMenuEnabledModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { inspectMenuEnabled = p2.enabled })
	end,
	[SetIsUsingGamepadModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { isUsingGamepad = p2.isUsingGamepad })
	end,
	[SetHasPermissionToVoiceChatModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { hasPermissionToVoiceChat = p2.hasPermissionToVoiceChat })
	end,
	[SetMinimizedModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { isMinimized = p2.isMinimized })
	end,
	[SetSubjectToChinaPoliciesModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { subjectToChinaPolicies = p2.subjectToChinaPolicies })
	end
}))