local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Parent = script.Parent.Parent.Parent
local ClosePlayerDropDownModule = require(Parent.Actions.ClosePlayerDropDown)
local SetIsUsingGamepadModule = require(Parent.Actions.SetIsUsingGamepad)
local EventConnectionModule = require(script.Parent.EventConnection)
local UserInputServiceConnector = RoactModule.PureComponent:extend("UserInputServiceConnector")
local PlayerListFilterInputServiceDispatches = game:DefineFastFlag("PlayerListFilterInputServiceDispatches", false)

function UserInputServiceConnector.render(p1)
	-- upvalues: RoactModule (copy), EventConnectionModule (copy), UserInputService (copy), PlayerListFilterInputServiceDispatches (copy)
	return RoactModule.createFragment({
		InputBeganConnection = RoactModule.createElement(EventConnectionModule, {
			event = UserInputService.InputBegan,
			callback = function(Input, p2)
				-- upvalues: PlayerListFilterInputServiceDispatches (upval), p1 (copy)
				if PlayerListFilterInputServiceDispatches and not p1.props.playerDropdownVisible then return end
				if p2 then return end
				local UserInputType = Input.UserInputType
				
				if UserInputType == Enum.UserInputType.Touch or UserInputType == Enum.UserInputType.MouseButton1 then
					p1.props.closePlayerDropDown()
				end
			end
		}),
		LastInputTypeChangedConnection = RoactModule.createElement(EventConnectionModule, {
			event = UserInputService.LastInputTypeChanged,
			callback = function(p2)
				-- upvalues: PlayerListFilterInputServiceDispatches (upval), p1 (copy)
				local HasGamepad = p2.Name:find("Gamepad") ~= nil
				
				if not PlayerListFilterInputServiceDispatches or HasGamepad ~= p1.props.isUsingGamepad then
					p1.props.setIsUsingGamepad(HasGamepad)
					
					return
				end
			end
		})
	})
end

local function mapStateToProps(p1)
	return {
		playerDropdownVisible = p1.playerDropDown.isVisible,
		isUsingGamepad = p1.displayOptions.isUsingGamepad
	}
end

return RoactRoduxModule.connect(PlayerListFilterInputServiceDispatches and mapStateToProps or nil, function(Callback)
	-- upvalues: ClosePlayerDropDownModule (copy), SetIsUsingGamepadModule (copy)
	return {
		closePlayerDropDown = function()
			-- upvalues: Callback (copy), ClosePlayerDropDownModule (upval)
			return Callback(ClosePlayerDropDownModule())
		end,
		setIsUsingGamepad = function(p1)
			-- upvalues: Callback (copy), SetIsUsingGamepadModule (upval)
			return Callback(SetIsUsingGamepadModule(p1))
		end
	}
end)(UserInputServiceConnector)