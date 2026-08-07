local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")
local symbol = require(corePackagesService.Workspace.Packages.AppCommonLib).Symbol
local mouseIconOverrideService = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Resources.Constants)
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local inGameMenuCursorOverride = symbol.named("InGameMenuCursorOverride")
local inputType = constantsModule.InputType
local mouseOverrideManager = roact.PureComponent:extend("MouseOverrideManager")
mouseOverrideManager.validateProps = t.strictInterface({
	menuOpen = t.boolean,
	exitModalOpen = t.boolean,
	inputType = t.string
})

function mouseOverrideManager.render(p0) --[[ line: 30 ]]
	-- upvalues: roact (ref), externalEventConnectionModule (ref), userInputService (ref)
	local exitModalOpen = p0.props.exitModalOpen
	
	return roact.createElement(externalEventConnectionModule, {
		event = userInputService:GetPropertyChangedSignal("OverrideMouseIconBehavior"),
		callback = function() --[[ line: 35 ]]
			-- upvalues: p0 (ref), exitModalOpen (ref), userInputService (copy)
			if (p0.props.menuOpen or exitModalOpen) and userInputService.OverrideMouseIconBehavior == Enum.OverrideMouseIconBehavior.None then
				p0:updateMouseIconOverride()
			end
		end
	})
end

function mouseOverrideManager.init(p1) --[[ line: 48 ]]
	p1.didOverrideMouse = false
end

function mouseOverrideManager.updateMouseIconOverride(p2) --[[ line: 52 ]]
	-- upvalues: inputType (ref), VRService (ref), mouseIconOverrideService (ref), inGameMenuCursorOverride (ref)
	if p2.props.menuOpen or p2.props.exitModalOpen then
		p2.didOverrideMouse = true
		
		if p2.props.inputType == inputType.Gamepad or VRService.VREnabled then
			mouseIconOverrideService.push(inGameMenuCursorOverride, Enum.OverrideMouseIconBehavior.ForceHide)
			
			return
		end
		mouseIconOverrideService.push(inGameMenuCursorOverride, Enum.OverrideMouseIconBehavior.ForceShow)
		
		return
	elseif p2.didOverrideMouse then
		p2.didOverrideMouse = false
		mouseIconOverrideService.pop(inGameMenuCursorOverride)
	end
end

function mouseOverrideManager.didMount(p3) --[[ line: 68 ]]
	p3:updateMouseIconOverride()
end

function mouseOverrideManager.didUpdate(p4) --[[ line: 72 ]]
	p4:updateMouseIconOverride()
end

return roactRodux.UNSTABLE_connect2(function(p5) --[[ line: 76 ]]
	return {
		menuOpen = p5.isMenuOpen,
		exitModalOpen = p5.nativeClosePrompt.closingApp,
		inputType = p5.displayOptions.inputType
	}
end, nil)(mouseOverrideManager)