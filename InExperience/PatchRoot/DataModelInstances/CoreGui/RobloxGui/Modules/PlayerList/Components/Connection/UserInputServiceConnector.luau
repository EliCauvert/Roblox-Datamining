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

function userInputServiceConnector.render(p0) --[[ line: 19 ]]
	-- upvalues: roactModule (ref), eventConnectionModule (ref), userInputService (ref), playerListFilterInputServiceDispatches (ref)
	return roactModule.createFragment({
		InputBeganConnection = roactModule.createElement(eventConnectionModule, {
			event = userInputService.InputBegan,
			callback = function(p1, p2) --[[ line: 23 ]]
				-- upvalues: playerListFilterInputServiceDispatches (copy), p0 (ref)
				if playerListFilterInputServiceDispatches and not p0.props.playerDropdownVisible then return end
				if p2 then return end
				local userInputType = p1.UserInputType
				
				if userInputType == Enum.UserInputType.Touch or userInputType == Enum.UserInputType.MouseButton1 then
					p0.props.closePlayerDropDown()
				end
			end
		}),
		LastInputTypeChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = userInputService.LastInputTypeChanged,
			callback = function(p3) --[[ line: 41 ]]
				-- upvalues: playerListFilterInputServiceDispatches (copy), p0 (ref)
				local var9 = p3.Name:find("Gamepad") ~= nil
				
				if playerListFilterInputServiceDispatches and var9 == p0.props.isUsingGamepad then
					return
				end
				p0.props.setIsUsingGamepad(var9)
			end
		})
	})
end

return roactRoduxModule.connect(if playerListFilterInputServiceDispatches then function(p4) --[[ line: 55 | named "mapStateToProps" ]]
	return {
		playerDropdownVisible = p4.playerDropDown.isVisible,
		isUsingGamepad = p4.displayOptions.isUsingGamepad
	}
end else nil, function(p5) --[[ line: 62 | named "mapDispatchToProps" ]]
	-- upvalues: closePlayerDropDownModule (ref), setIsUsingGamepadModule (ref)
	return {
		closePlayerDropDown = function() --[[ line: 64 ]]
			-- upvalues: p5 (ref), closePlayerDropDownModule (copy)
			return p5(closePlayerDropDownModule())
		end,
		setIsUsingGamepad = function(value) --[[ line: 68 ]]
			-- upvalues: p5 (ref), setIsUsingGamepadModule (copy)
			return p5(setIsUsingGamepadModule(value))
		end
	}
end)(userInputServiceConnector)