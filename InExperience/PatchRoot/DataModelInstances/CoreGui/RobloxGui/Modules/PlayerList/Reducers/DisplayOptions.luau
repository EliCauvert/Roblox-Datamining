local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local Actions = script.Parent.Parent.Actions
local FFlagPlayerListPersistVisibilityModule = require(script.Parent.Parent.Flags.FFlagPlayerListPersistVisibility)
local FFlagAddNewPlayerListMobileFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local GameSettings = if FFlagPlayerListPersistVisibilityModule then UserSettings().GameSettings else nil

local function _(p1) --[[ Line: 48 | Named "updateIsVisible" ]]
	-- upvalues: CryoModule (copy)
	p1.isVisible = p1.setVisible
	
	if not p1.isTenFootInterface then
		p1.isVisible = p1.isVisible
	end
	p1.isVisible = p1.isVisible and CryoModule.isEmpty(p1.tempHideKeys)
	
	return p1
end

return (require(CorePackages.Packages.Rodux).createReducer({
	isMinimized = false,
	isVisible = true,
	isSmallTouchDevice = false,
	performanceStatsVisible = false,
	playerlistCoreGuiEnabled = true,
	isTenFootInterface = false,
	isUsingGamepad = false,
	hasPermissionToVoiceChat = false,
	subjectToChinaPolicies = true,
	setVisible = not PlayerListModule.Flags.FFlagPlayerListUseMobileOnSmallDisplay and (not FFlagPlayerListPersistVisibilityModule or GameSettings.PlayerListVisible),
	vrEnabled = game:GetService("VRService").VREnabled,
	inspectMenuEnabled = game:GetService("GuiService"):GetInspectMenuEnabled(),
	tempHideKeys = {}
}, {
	[require(Actions.SetPlayerListVisibility).name] = function(p1, p2) --[[ Line: 61 ]]
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
	[require(Actions.SetPlayerListEnabled).name] = function(p1, p2) --[[ Line: 73 ]]
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
	[require(Actions.SetTempHideKey).name] = function(p1, p2) --[[ Line: 87 ]]
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
	[require(Actions.SetPerformanceStatsVisible).name] = function(p1, p2) --[[ Line: 99 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { performanceStatsVisible = p2.isVisible })
	end,
	[require(Actions.SetSmallTouchDevice).name] = function(p1, p2) --[[ Line: 105 ]]
		-- upvalues: CryoModule (copy)
		local JoinResult = CryoModule.Dictionary.join(p1, { isSmallTouchDevice = p2.isSmallTouchDevice })
		JoinResult.isVisible = JoinResult.setVisible
		
		if not JoinResult.isTenFootInterface then
			JoinResult.isVisible = JoinResult.isVisible
		end
		JoinResult.isVisible = JoinResult.isVisible and CryoModule.isEmpty(JoinResult.tempHideKeys)
		
		return JoinResult
	end,
	[require(Actions.SetTenFootInterface).name] = function(p1, p2) --[[ Line: 111 ]]
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
	[require(Actions.SetInspectMenuEnabled).name] = function(p1, p2) --[[ Line: 122 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { inspectMenuEnabled = p2.enabled })
	end,
	[require(Actions.SetIsUsingGamepad).name] = function(p1, p2) --[[ Line: 128 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { isUsingGamepad = p2.isUsingGamepad })
	end,
	[require(Actions.SetHasPermissionToVoiceChat).name] = function(p1, p2) --[[ Line: 134 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { hasPermissionToVoiceChat = p2.hasPermissionToVoiceChat })
	end,
	[require(Actions.SetMinimized).name] = function(p1, p2) --[[ Line: 140 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { isMinimized = p2.isMinimized })
	end,
	[require(Actions.SetSubjectToChinaPolicies).name] = function(p1, p2) --[[ Line: 146 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { subjectToChinaPolicies = p2.subjectToChinaPolicies })
	end
}))