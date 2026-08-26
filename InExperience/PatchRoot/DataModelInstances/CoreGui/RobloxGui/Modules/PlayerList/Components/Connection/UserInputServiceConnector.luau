local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local parent = script.Parent.Parent.Parent
local closePlayerDropDownModule = require(parent.Actions.ClosePlayerDropDown)
local setIsUsingGamepadModule = require(parent.Actions.SetIsUsingGamepad)
local eventConnectionModule = require(script.Parent.EventConnection)
local userInputServiceConnector = roactModule.PureComponent:extend("UserInputServiceConnector")
local playerListFilterInputServiceDispatches = game:DefineFastFlag("PlayerListFilterInputServiceDispatches", false)

function userInputServiceConnector.render(p1)
	-- upvalues: roactModule (ref), eventConnectionModule (ref), userInputService (ref), playerListFilterInputServiceDispatches (ref)
	return roactModule.createFragment({
		InputBeganConnection = roactModule.createElement(eventConnectionModule, {
			event = userInputService.InputBegan,
			callback = function(p2, p3)
				-- upvalues: playerListFilterInputServiceDispatches (copy), p1 (ref)
				if playerListFilterInputServiceDispatches and not p1.props.playerDropdownVisible then return end
				if p3 then return end
				local userInputType = p2.UserInputType
				
				if userInputType == Enum.UserInputType.Touch or userInputType == Enum.UserInputType.MouseButton1 then
					p1.props.closePlayerDropDown()
				end
			end
		}),
		LastInputTypeChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = userInputService.LastInputTypeChanged,
			callback = function(p2)
				-- upvalues: playerListFilterInputServiceDispatches (copy), p1 (ref)
				local var1 = p2.Name:find("Gamepad") ~= nil
				
				if playerListFilterInputServiceDispatches and var1 == p1.props.isUsingGamepad then
					return
				end
				p1.props.setIsUsingGamepad(var1)
			end
		})
	})
end

return roactRoduxModule.connect(if playerListFilterInputServiceDispatches then function(p1)
	return {
		playerDropdownVisible = p1.playerDropDown.isVisible,
		isUsingGamepad = p1.displayOptions.isUsingGamepad
	}
end else nil, function(p1)
	-- upvalues: closePlayerDropDownModule (ref), setIsUsingGamepadModule (ref)
	return {
		closePlayerDropDown = function()
			-- upvalues: p1 (ref), closePlayerDropDownModule (copy)
			return p1(closePlayerDropDownModule())
		end,
		setIsUsingGamepad = function(value)
			-- upvalues: p1 (ref), setIsUsingGamepadModule (copy)
			return p1(setIsUsingGamepadModule(value))
		end
	}
end)(userInputServiceConnector)