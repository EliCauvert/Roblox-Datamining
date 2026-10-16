local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local Parent = script.Parent.Parent.Parent
local SetPlayerListVisibilityModule = require(Parent.Actions.SetPlayerListVisibility)
local ClosePlayerDropDownModule = require(Parent.Actions.ClosePlayerDropDown)
local FFlagPlayerListReduceRerendersModule = require(Parent.Flags.FFlagPlayerListReduceRerenders)
local FFlagAddNewPlayerListMobileFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local FFlagPlayerListUseMobileOnSmallDisplay = PlayerListModule.Flags.FFlagPlayerListUseMobileOnSmallDisplay
local ContextActionsBinder = require(CorePackages.Packages.Roact).PureComponent:extend("ContextActionsBinder")
local list = {
	Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2,
	Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4,
	Enum.UserInputType.Gamepad5, Enum.UserInputType.Gamepad6,
	Enum.UserInputType.Gamepad7, Enum.UserInputType.Gamepad8
}

function ContextActionsBinder.init(p1) --[[ Line: 37 ]]
	p1.boundPlayerListActions = false
end

function ContextActionsBinder.bindActions(p1) --[[ Line: 41 ]]
	-- upvalues: ContextActionService (copy), FFlagPlayerListUseMobileOnSmallDisplay (copy), GuiService (copy), list (copy), FFlagAddNewPlayerListMobileFocusNav (copy)
	ContextActionService:BindCoreAction("RbxPlayerListToggle", function(_, UserInputState, _) --[[ Line: 42 ]]
		-- upvalues: FFlagPlayerListUseMobileOnSmallDisplay (upval), p1 (copy), GuiService (upval)
		if FFlagPlayerListUseMobileOnSmallDisplay and p1.props.displayOptions.isSmallTouchDevice then
			return Enum.ContextActionResult.Pass
		elseif GuiService.MenuIsOpen then
			return Enum.ContextActionResult.Pass
		elseif UserInputState == Enum.UserInputState.Begin then
			p1.props.setVisibility(not p1.props.displayOptions.isVisible)
			
			return Enum.ContextActionResult.Sink
		else
			return Enum.ContextActionResult.Pass
		end
	end, false, Enum.KeyCode.Tab)
	ContextActionService:BindCoreAction("RbxPlayerListStopMovement", function(_, _, _) --[[ Line: 59 ]]
		-- upvalues: p1 (copy)
		return if p1.props.displayOptions.isVisible and p1.props.displayOptions.isTenFootInterface then Enum.ContextActionResult.Sink else Enum.ContextActionResult.Pass
	end, false, unpack(list))
	ContextActionService:BindCoreAction("RbxPlayerListGamepadClose", function(_, UserInputState, _) --[[ Line: 66 ]]
		-- upvalues: p1 (copy), FFlagAddNewPlayerListMobileFocusNav (upval)
		if UserInputState ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass
		elseif not p1.props.displayOptions.isTenFootInterface and (not FFlagAddNewPlayerListMobileFocusNav or not p1.props.displayOptions.isSmallTouchDevice) then
			return Enum.ContextActionResult.Pass
		elseif FFlagAddNewPlayerListMobileFocusNav and p1.props.playerDropDown.isVisible then
			p1.props.closePlayerDropDown()
			
			return Enum.ContextActionResult.Sink
		elseif FFlagAddNewPlayerListMobileFocusNav then
			if p1.props.displayOptions.isVisible then
				p1.props.setVisibility(false)
				
				return Enum.ContextActionResult.Sink
			end
		elseif p1.props.displayOptions.isVisible and p1.props.displayOptions.isTenFootInterface then
			p1.props.setVisibility(false)
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end, false, Enum.KeyCode.ButtonB, if FFlagAddNewPlayerListMobileFocusNav then Enum.KeyCode.ButtonB else Enum.KeyCode.ButtonStart)
	p1.boundPlayerListActions = true
end

function ContextActionsBinder.unbindActions(p1) --[[ Line: 101 ]]
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("RbxPlayerListToggle")
	ContextActionService:UnbindCoreAction("RbxPlayerListStopMovement")
	ContextActionService:UnbindCoreAction("RbxPlayerListGamepadClose")
	p1.boundPlayerListActions = false
end

function ContextActionsBinder.didMount(p1) --[[ Line: 108 ]]
	p1:bindActions()
end

function ContextActionsBinder:render() --[[ Line: 112 ]]
	return nil
end

function ContextActionsBinder.willUnmount(p1) --[[ Line: 116 ]]
	if p1.boundPlayerListActions then
		p1:unbindActions()
	end
end

local function mapStateToProps(p1) --[[ Line: 122 ]]
	-- upvalues: FFlagAddNewPlayerListMobileFocusNav (copy)
	return {
		displayOptions = p1.displayOptions,
		playerDropDown = if FFlagAddNewPlayerListMobileFocusNav then p1.playerDropDown else nil
	}
end

local function mapDispatchToProps(Callback) --[[ Line: 129 ]]
	-- upvalues: SetPlayerListVisibilityModule (copy), FFlagAddNewPlayerListMobileFocusNav (copy), ClosePlayerDropDownModule (copy)
	return {
		setVisibility = function(p1) --[[ Line: 131 ]]
			-- upvalues: Callback (copy), SetPlayerListVisibilityModule (upval)
			return Callback(SetPlayerListVisibilityModule(p1))
		end,
		closePlayerDropDown = if FFlagAddNewPlayerListMobileFocusNav then function() --[[ Line: 135 ]]
			-- upvalues: Callback (copy), ClosePlayerDropDownModule (upval)
			return Callback(ClosePlayerDropDownModule())
		end else nil
	}
end

return if FFlagPlayerListReduceRerendersModule then ReactModule.memo(RoactRoduxModule.connect(mapStateToProps, mapDispatchToProps)(ContextActionsBinder)) else RoactRoduxModule.connect(mapStateToProps, mapDispatchToProps)(ContextActionsBinder)