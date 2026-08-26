local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local roactModule = require(corePackagesService.Packages.Roact)
local reactModule = require(corePackagesService.Packages.React)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local parent = script.Parent.Parent.Parent
local setPlayerListVisibilityModule = require(parent.Actions.SetPlayerListVisibility)
local closePlayerDropDownModule = require(parent.Actions.ClosePlayerDropDown)
local fFlagPlayerListReduceRerendersModule = require(parent.Flags.FFlagPlayerListReduceRerenders)
local fFlagAddNewPlayerListMobileFocusNav = playerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local fFlagPlayerListUseMobileOnSmallDisplay = playerListModule.Flags.FFlagPlayerListUseMobileOnSmallDisplay
local contextActionsBinder = roactModule.PureComponent:extend("ContextActionsBinder")
local list = {
	Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2,
	Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4,
	Enum.UserInputType.Gamepad5, Enum.UserInputType.Gamepad6,
	Enum.UserInputType.Gamepad7, Enum.UserInputType.Gamepad8
}

function contextActionsBinder.init(p1)
	p1.boundPlayerListActions = false
end

function contextActionsBinder.bindActions(p1)
	-- upvalues: contextActionService (ref), fFlagPlayerListUseMobileOnSmallDisplay (ref), guiService (ref), list (ref), fFlagAddNewPlayerListMobileFocusNav (ref)
	contextActionService:BindCoreAction("RbxPlayerListToggle", function(_, p2, _)
		-- upvalues: fFlagPlayerListUseMobileOnSmallDisplay (copy), p1 (ref), guiService (copy)
		if fFlagPlayerListUseMobileOnSmallDisplay and p1.props.displayOptions.isSmallTouchDevice then
			return Enum.ContextActionResult.Pass
		elseif guiService.MenuIsOpen then
			return Enum.ContextActionResult.Pass
		elseif p2 == Enum.UserInputState.Begin then
			p1.props.setVisibility(not p1.props.displayOptions.isVisible)
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end, false, Enum.KeyCode.Tab)
	contextActionService:BindCoreAction("RbxPlayerListStopMovement", function(_, _, _)
		-- upvalues: p1 (ref)
		return if p1.props.displayOptions.isVisible and p1.props.displayOptions.isTenFootInterface then Enum.ContextActionResult.Sink else Enum.ContextActionResult.Pass
	end, false, unpack(list))
	contextActionService:BindCoreAction("RbxPlayerListGamepadClose", function(_, p2, _)
		-- upvalues: p1 (ref), fFlagAddNewPlayerListMobileFocusNav (copy)
		if p2 ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass
		elseif not p1.props.displayOptions.isTenFootInterface and (not fFlagAddNewPlayerListMobileFocusNav or not p1.props.displayOptions.isSmallTouchDevice) then
			return Enum.ContextActionResult.Pass
		elseif fFlagAddNewPlayerListMobileFocusNav and p1.props.playerDropDown.isVisible then
			p1.props.closePlayerDropDown()
			
			return Enum.ContextActionResult.Sink
		elseif fFlagAddNewPlayerListMobileFocusNav then
			if p1.props.displayOptions.isVisible then
				p1.props.setVisibility(false)
				
				return Enum.ContextActionResult.Sink
			end
		elseif p1.props.displayOptions.isVisible and p1.props.displayOptions.isTenFootInterface then
			p1.props.setVisibility(false)
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end, false, Enum.KeyCode.ButtonB, if fFlagAddNewPlayerListMobileFocusNav then Enum.KeyCode.ButtonB else Enum.KeyCode.ButtonStart)
	p1.boundPlayerListActions = true
end

function contextActionsBinder.unbindActions(p1)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("RbxPlayerListToggle")
	contextActionService:UnbindCoreAction("RbxPlayerListStopMovement")
	contextActionService:UnbindCoreAction("RbxPlayerListGamepadClose")
	p1.boundPlayerListActions = false
end

function contextActionsBinder.didMount(p1)
	p1:bindActions()
end

function contextActionsBinder.render(_)
	return nil
end

function contextActionsBinder.willUnmount(p1)
	if p1.boundPlayerListActions then
		p1:unbindActions()
	end
end

local function mapStateToProps(p1)
	-- upvalues: fFlagAddNewPlayerListMobileFocusNav (ref)
	return {
		displayOptions = p1.displayOptions,
		playerDropDown = if fFlagAddNewPlayerListMobileFocusNav then p1.playerDropDown else nil
	}
end

local function mapDispatchToProps(p1)
	-- upvalues: setPlayerListVisibilityModule (ref), fFlagAddNewPlayerListMobileFocusNav (ref), closePlayerDropDownModule (ref)
	return {
		setVisibility = function(value)
			-- upvalues: p1 (ref), setPlayerListVisibilityModule (copy)
			return p1(setPlayerListVisibilityModule(value))
		end,
		closePlayerDropDown = if fFlagAddNewPlayerListMobileFocusNav then function()
			-- upvalues: p1 (ref), closePlayerDropDownModule (copy)
			return p1(closePlayerDropDownModule())
		end else nil
	}
end

return if fFlagPlayerListReduceRerendersModule then reactModule.memo(roactRoduxModule.connect(mapStateToProps, mapDispatchToProps)(contextActionsBinder)) else roactRoduxModule.connect(mapStateToProps, mapDispatchToProps)(contextActionsBinder)