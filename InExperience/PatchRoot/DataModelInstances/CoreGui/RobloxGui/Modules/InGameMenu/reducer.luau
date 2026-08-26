local cryo = require(game:GetService("CorePackages").Packages.InGameMenuDependencies).Cryo
local parent = script.Parent
local setMenuOpenModule = require(parent.Actions.SetMenuOpen)
local setMainPageMoreMenuOpenModule = require(parent.Actions.SetMainPageMoreMenuOpen)
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)
local setScreenSizeModule = require(parent.Actions.SetScreenSize)
local startLeavingGameModule = require(parent.Actions.StartLeavingGame)
local cancelLeavingGameModule = require(parent.Actions.CancelLeavingGame)
local setControlLayoutModule = require(parent.Actions.SetControlLayout)
local setRespawningModule = require(parent.Actions.SetRespawning)
local setCurrentZoneModule = require(parent.Actions.SetCurrentZone)
local setControllerBarHeightModule = require(parent.Actions.SetControllerBarHeight)
local decrementControllerBarModule = require(parent.Actions.DecrementControllerBar)
local incrementControllerBarModule = require(parent.Actions.IncrementControllerBar)
local navigationReducerModule = require(script.navigationReducer)
local respawnModule = require(script.respawn)
local invitesModule = require(script.invites)
local gameInfoModule = require(script.gameInfo)
local reportModule = require(script.report)
local friendsModule = require(script.friends)
local displayOptionsModule = require(script.displayOptions)
local nativeClosePromptModule = require(script.nativeClosePrompt)
local voiceStateModule = require(parent.Parent.VoiceChat.Reducers.voiceState)
local constantsModule = require(parent.Resources.Constants)
local controlsModule = require(parent.Resources.Controls)
local t = {
	[setMenuOpenModule.name] = function(p1, p2)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, {
			isMenuOpen = p2.isMenuOpen,
			isMainPageMoreMenuOpen = if not p2.isMenuOpen then false else nil,
			currentZone = if p1.isMenuOpen ~= p2.isMenuOpen then nil else 1
		})
	end,
	[setMainPageMoreMenuOpenModule.name] = function(p1, p2)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { isMainPageMoreMenuOpen = p2.isMainPageMoreMenuOpen })
	end,
	[startLeavingGameModule.name] = function(p1, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { leavingGame = true })
	end,
	[cancelLeavingGameModule.name] = function(p1, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { leavingGame = false })
	end,
	[setCurrentPageModule.name] = function(p1, p2)
		-- upvalues: cryo (ref), constantsModule (ref)
		return cryo.Dictionary.join(p1, {
			isMainPageMoreMenuOpen = false,
			menuPage = p2.newPage,
			currentZone = if p2.newPage == constantsModule.InitalPageKey then 0 else 1
		})
	end,
	[setControlLayoutModule.name] = function(p1, p2)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { controlLayout = p2.controlLayout })
	end,
	[setScreenSizeModule.name] = function(p1, p2)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { screenSize = p2.newScreenSize })
	end,
	[setRespawningModule.name] = function(p1, p2)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, {
			isMainPageMoreMenuOpen = if p2.respawning then false else p1.isMainPageMoreMenuOpen
		})
	end,
	[setCurrentZoneModule.name] = function(p1, p2)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { currentZone = p2.zone })
	end,
	[setControllerBarHeightModule.name] = function(p1, p2)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { controllerBarHeight = p2.controllerBarHeight })
	end,
	[incrementControllerBarModule.name] = function(p1, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { controllerBarCount = p1.controllerBarCount + 1 })
	end,
	[decrementControllerBarModule.name] = function(p1, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { controllerBarCount = p1.controllerBarCount - 1 })
	end
}

return function(p1, p2)
	-- upvalues: controlsModule (ref), constantsModule (ref), invitesModule (ref), respawnModule (ref), gameInfoModule (ref), friendsModule (ref), displayOptionsModule (ref), nativeClosePromptModule (ref), t (ref), navigationReducerModule (ref), voiceStateModule (ref), reportModule (ref)
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
			controlLayout = controlsModule.ControlLayouts.KEYBOARD,
			menuPage = constantsModule.defaultPageKey,
			invites = invitesModule(nil, p2),
			respawn = respawnModule(nil, p2),
			gameInfo = gameInfoModule(nil, p2),
			friends = friendsModule(nil, p2),
			displayOptions = displayOptionsModule(nil, p2),
			screenSize = Vector2.new(0, 0),
			nativeClosePrompt = nativeClosePromptModule(nil, p2)
		}
	end
	local type = t[p2.type]
	
	if type ~= nil then
		p1 = type(p1, p2)
	end
	local var1 = navigationReducerModule(p1, p2)
	var1.respawn = respawnModule(var1.respawn, p2)
	var1.invites = invitesModule(var1.invites, p2)
	var1.voiceState = voiceStateModule(var1.voiceState, p2)
	var1.gameInfo = gameInfoModule(var1.gameInfo, p2)
	var1.report = reportModule(var1.report, p2)
	var1.friends = friendsModule(var1.friends, p2)
	var1.displayOptions = displayOptionsModule(var1.displayOptions, p2)
	var1.nativeClosePrompt = nativeClosePromptModule(var1.nativeClosePrompt, p2)
	
	return var1
end