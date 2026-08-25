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
	[setMenuOpenModule.name] = function(p0, p1)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p0, {
			isMenuOpen = p1.isMenuOpen,
			isMainPageMoreMenuOpen = if not p1.isMenuOpen then false else nil,
			currentZone = if p0.isMenuOpen ~= p1.isMenuOpen then nil else 1
		})
	end,
	[setMainPageMoreMenuOpenModule.name] = function(p2, p3)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p2, { isMainPageMoreMenuOpen = p3.isMainPageMoreMenuOpen })
	end,
	[startLeavingGameModule.name] = function(p4, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p4, { leavingGame = true })
	end,
	[cancelLeavingGameModule.name] = function(p5, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p5, { leavingGame = false })
	end,
	[setCurrentPageModule.name] = function(p6, p7)
		-- upvalues: cryo (ref), constantsModule (ref)
		return cryo.Dictionary.join(p6, {
			isMainPageMoreMenuOpen = false,
			menuPage = p7.newPage,
			currentZone = if p7.newPage == constantsModule.InitalPageKey then 0 else 1
		})
	end,
	[setControlLayoutModule.name] = function(p8, p9)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p8, { controlLayout = p9.controlLayout })
	end,
	[setScreenSizeModule.name] = function(p10, p11)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p10, { screenSize = p11.newScreenSize })
	end,
	[setRespawningModule.name] = function(p12, p13)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p12, {
			isMainPageMoreMenuOpen = if p13.respawning then false else p12.isMainPageMoreMenuOpen
		})
	end,
	[setCurrentZoneModule.name] = function(p14, p15)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p14, { currentZone = p15.zone })
	end,
	[setControllerBarHeightModule.name] = function(p16, p17)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p16, { controllerBarHeight = p17.controllerBarHeight })
	end,
	[incrementControllerBarModule.name] = function(p18, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p18, { controllerBarCount = p18.controllerBarCount + 1 })
	end,
	[decrementControllerBarModule.name] = function(p19, _)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p19, { controllerBarCount = p19.controllerBarCount - 1 })
	end
}

return function(p20, p21)
	-- upvalues: controlsModule (ref), constantsModule (ref), invitesModule (ref), respawnModule (ref), gameInfoModule (ref), friendsModule (ref), displayOptionsModule (ref), nativeClosePromptModule (ref), t (ref), navigationReducerModule (ref), voiceStateModule (ref), reportModule (ref)
	if p20 == nil then
		p20 = {
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
			invites = invitesModule(nil, p21),
			respawn = respawnModule(nil, p21),
			gameInfo = gameInfoModule(nil, p21),
			friends = friendsModule(nil, p21),
			displayOptions = displayOptionsModule(nil, p21),
			screenSize = Vector2.new(0, 0),
			nativeClosePrompt = nativeClosePromptModule(nil, p21)
		}
	end
	local type = t[p21.type]
	
	if type ~= nil then
		p20 = type(p20, p21)
	end
	local var24 = navigationReducerModule(p20, p21)
	var24.respawn = respawnModule(var24.respawn, p21)
	var24.invites = invitesModule(var24.invites, p21)
	var24.voiceState = voiceStateModule(var24.voiceState, p21)
	var24.gameInfo = gameInfoModule(var24.gameInfo, p21)
	var24.report = reportModule(var24.report, p21)
	var24.friends = friendsModule(var24.friends, p21)
	var24.displayOptions = displayOptionsModule(var24.displayOptions, p21)
	var24.nativeClosePrompt = nativeClosePromptModule(var24.nativeClosePrompt, p21)
	
	return var24
end