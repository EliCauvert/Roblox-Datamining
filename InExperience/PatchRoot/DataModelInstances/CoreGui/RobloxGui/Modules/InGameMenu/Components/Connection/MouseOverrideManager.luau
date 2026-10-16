local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")
local MouseIconOverrideService = require(CorePackages.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent.Parent
local ExternalEventConnectionModule = require(Parent.Utility.ExternalEventConnection)
local InGameMenuCursorOverride = require(CorePackages.Workspace.Packages.AppCommonLib).Symbol.named("InGameMenuCursorOverride")
local InputType = require(Parent.Resources.Constants).InputType
local MouseOverrideManager = Roact.PureComponent:extend("MouseOverrideManager")
MouseOverrideManager.validateProps = T.strictInterface({
	menuOpen = T.boolean,
	exitModalOpen = T.boolean,
	inputType = T.string
})

function MouseOverrideManager.render(p1) --[[ Line: 30 ]]
	-- upvalues: Roact (copy), ExternalEventConnectionModule (copy), UserInputService (copy)
	local ExitModalOpen = p1.props.exitModalOpen
	
	return Roact.createElement(ExternalEventConnectionModule, {
		event = UserInputService:GetPropertyChangedSignal("OverrideMouseIconBehavior"),
		callback = function() --[[ Line: 35 ]]
			-- upvalues: p1 (copy), ExitModalOpen (copy), UserInputService (upval)
			if (p1.props.menuOpen or ExitModalOpen) and UserInputService.OverrideMouseIconBehavior == Enum.OverrideMouseIconBehavior.None then
				p1:updateMouseIconOverride()
			end
		end
	})
end

function MouseOverrideManager.init(p1) --[[ Line: 48 ]]
	p1.didOverrideMouse = false
end

function MouseOverrideManager.updateMouseIconOverride(p1) --[[ Line: 52 ]]
	-- upvalues: InputType (copy), VRService (copy), MouseIconOverrideService (copy), InGameMenuCursorOverride (copy)
	local ExitModalOpen = p1.props.exitModalOpen
	
	if p1.props.menuOpen or ExitModalOpen then
		p1.didOverrideMouse = true
		
		if p1.props.inputType == InputType.Gamepad or VRService.VREnabled then
			MouseIconOverrideService.push(InGameMenuCursorOverride, Enum.OverrideMouseIconBehavior.ForceHide)
			
			return
		else
			MouseIconOverrideService.push(InGameMenuCursorOverride, Enum.OverrideMouseIconBehavior.ForceShow)
			
			return
		end
	elseif p1.didOverrideMouse then
		p1.didOverrideMouse = false
		MouseIconOverrideService.pop(InGameMenuCursorOverride)
	end
end

function MouseOverrideManager.didMount(p1) --[[ Line: 68 ]]
	p1:updateMouseIconOverride()
end

function MouseOverrideManager.didUpdate(p1) --[[ Line: 72 ]]
	p1:updateMouseIconOverride()
end

return RoactRodux.UNSTABLE_connect2(function(p1) --[[ Line: 76 ]]
	return {
		menuOpen = p1.isMenuOpen,
		exitModalOpen = p1.nativeClosePrompt.closingApp,
		inputType = p1.displayOptions.inputType
	}
end, nil)(MouseOverrideManager)