local Cryo = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Cryo
local Parent = script.Parent
local NavigationReducerModule = require(script.navigationReducer)
local RespawnModule = require(script.respawn)
local InvitesModule = require(script.invites)
local GameInfoModule = require(script.gameInfo)
local ReportModule = require(script.report)
local FriendsModule = require(script.friends)
local DisplayOptionsModule = require(script.displayOptions)
local NativeClosePromptModule = require(script.nativeClosePrompt)
local VoiceStateModule = require(Parent.Parent.VoiceChat.Reducers.voiceState)
local ConstantsModule = require(Parent.Resources.Constants)
local ControlsModule = require(Parent.Resources.Controls)
local config = {
	[require(Parent.Actions.SetMenuOpen).name] = function(p1, p2) --[[ Line: 36 ]]
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, {
			isMenuOpen = p2.isMenuOpen,
			isMainPageMoreMenuOpen = if p2.isMenuOpen then nil else false,
			currentZone = if p1.isMenuOpen == p2.isMenuOpen then nil else 1
		})
	end,
	[require(Parent.Actions.SetMainPageMoreMenuOpen).name] = function(p1, p2) --[[ Line: 49 ]]
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { isMainPageMoreMenuOpen = p2.isMainPageMoreMenuOpen })
	end,
	[require(Parent.Actions.StartLeavingGame).name] = function(p1, _) --[[ Line: 54 ]]
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { leavingGame = true })
	end,
	[require(Parent.Actions.CancelLeavingGame).name] = function(p1, _) --[[ Line: 59 ]]
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { leavingGame = false })
	end,
	[require(Parent.Actions.SetCurrentPage).name] = function(p1, p2) --[[ Line: 64 ]]
		-- upvalues: Cryo (copy), ConstantsModule (copy)
		return Cryo.Dictionary.join(p1, {
			isMainPageMoreMenuOpen = false,
			menuPage = p2.newPage,
			currentZone = if p2.newPage == ConstantsModule.InitalPageKey then 0 else 1
		})
	end,
	[require(Parent.Actions.SetControlLayout).name] = function(p1, p2) --[[ Line: 72 ]]
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { controlLayout = p2.controlLayout })
	end,
	[require(Parent.Actions.SetScreenSize).name] = function(p1, p2) --[[ Line: 79 ]]
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { screenSize = p2.newScreenSize })
	end,
	[require(Parent.Actions.SetRespawning).name] = function(p1, p2) --[[ Line: 84 ]]
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, {
			isMainPageMoreMenuOpen = not p2.respawning and p1.isMainPageMoreMenuOpen
		})
	end,
	[require(Parent.Actions.SetCurrentZone).name] = function(p1, p2) --[[ Line: 96 ]]
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { currentZone = p2.zone })
	end,
	[require(Parent.Actions.SetControllerBarHeight).name] = function(p1, p2) --[[ Line: 101 ]]
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { controllerBarHeight = p2.controllerBarHeight })
	end,
	[require(Parent.Actions.IncrementControllerBar).name] = function(p1, _) --[[ Line: 106 ]]
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { controllerBarCount = p1.controllerBarCount + 1 })
	end,
	[require(Parent.Actions.DecrementControllerBar).name] = function(p1, _) --[[ Line: 111 ]]
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { controllerBarCount = p1.controllerBarCount - 1 })
	end
}

return function(p1, p2) --[[ Line: 118 | Named "reducer" ]]
	-- upvalues: ControlsModule (copy), ConstantsModule (copy), InvitesModule (copy), RespawnModule (copy), GameInfoModule (copy), FriendsModule (copy), DisplayOptionsModule (copy), NativeClosePromptModule (copy), config (copy), NavigationReducerModule (copy), VoiceStateModule (copy), ReportModule (copy)
	if p1 == nil then
		p1 = {
			isMenuOpen = false,
			leavingGame = false,
			currentZone = nil,
			voiceState = nil,
			recording = false,
			isMainPageMoreMenuOpen = false,
			controllerBarHeight = 0,
			controllerBarCount = 0,
			controlLayout = ControlsModule.ControlLayouts.KEYBOARD,
			menuPage = ConstantsModule.defaultPageKey,
			invites = InvitesModule(nil, p2),
			respawn = RespawnModule(nil, p2),
			gameInfo = GameInfoModule(nil, p2),
			friends = FriendsModule(nil, p2),
			displayOptions = DisplayOptionsModule(nil, p2),
			screenSize = Vector2.new(0, 0),
			nativeClosePrompt = NativeClosePromptModule(nil, p2)
		}
	end
	local Entry = config[p2.type]
	
	if Entry ~= nil then
		p1 = Entry(p1, p2)
	end
	local NavigationReducerModuleResult = NavigationReducerModule(p1, p2)
	NavigationReducerModuleResult.respawn = RespawnModule(NavigationReducerModuleResult.respawn, p2)
	NavigationReducerModuleResult.invites = InvitesModule(NavigationReducerModuleResult.invites, p2)
	NavigationReducerModuleResult.voiceState = VoiceStateModule(NavigationReducerModuleResult.voiceState, p2)
	NavigationReducerModuleResult.gameInfo = GameInfoModule(NavigationReducerModuleResult.gameInfo, p2)
	NavigationReducerModuleResult.report = ReportModule(NavigationReducerModuleResult.report, p2)
	NavigationReducerModuleResult.friends = FriendsModule(NavigationReducerModuleResult.friends, p2)
	NavigationReducerModuleResult.displayOptions = DisplayOptionsModule(NavigationReducerModuleResult.displayOptions, p2)
	NavigationReducerModuleResult.nativeClosePrompt = NativeClosePromptModule(NavigationReducerModuleResult.nativeClosePrompt, p2)
	
	return NavigationReducerModuleResult
end