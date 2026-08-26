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

function mouseOverrideManager.render(p1)
	-- upvalues: roact (ref), externalEventConnectionModule (ref), userInputService (ref)
	local exitModalOpen = p1.props.exitModalOpen
	
	return roact.createElement(externalEventConnectionModule, {
		event = userInputService:GetPropertyChangedSignal("OverrideMouseIconBehavior"),
		callback = function()
			-- upvalues: p1 (ref), exitModalOpen (ref), userInputService (copy)
			if (p1.props.menuOpen or exitModalOpen) and userInputService.OverrideMouseIconBehavior == Enum.OverrideMouseIconBehavior.None then
				p1:updateMouseIconOverride()
			end
		end
	})
end

function mouseOverrideManager.init(p1)
	p1.didOverrideMouse = false
end

function mouseOverrideManager.updateMouseIconOverride(p1)
	-- upvalues: inputType (ref), VRService (ref), mouseIconOverrideService (ref), inGameMenuCursorOverride (ref)
	if p1.props.menuOpen or p1.props.exitModalOpen then
		p1.didOverrideMouse = true
		
		if p1.props.inputType == inputType.Gamepad or VRService.VREnabled then
			mouseIconOverrideService.push(inGameMenuCursorOverride, Enum.OverrideMouseIconBehavior.ForceHide)
			
			return
		end
		mouseIconOverrideService.push(inGameMenuCursorOverride, Enum.OverrideMouseIconBehavior.ForceShow)
		
		return
	elseif p1.didOverrideMouse then
		p1.didOverrideMouse = false
		mouseIconOverrideService.pop(inGameMenuCursorOverride)
	end
end

function mouseOverrideManager.didMount(p1)
	p1:updateMouseIconOverride()
end

function mouseOverrideManager.didUpdate(p1)
	p1:updateMouseIconOverride()
end

return roactRodux.UNSTABLE_connect2(function(p1)
	return {
		menuOpen = p1.isMenuOpen,
		exitModalOpen = p1.nativeClosePrompt.closingApp,
		inputType = p1.displayOptions.inputType
	}
end, nil)(mouseOverrideManager)