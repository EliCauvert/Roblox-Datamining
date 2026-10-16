local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Parent = script.Parent.Parent
local SetDetailsInformationModule = require(Parent.Actions.SetDetailsInformation)
local SetTryingOnInfoModule = require(Parent.Actions.SetTryingOnInfo)
local InspectAndBuyContextModule = require(Parent.Components.InspectAndBuyContext)
local ThemeModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Theme)
local CloseButton = RoactModule.PureComponent:extend("CloseButton")

function CloseButton.render(p1) --[[ Line: 19 ]]
	-- upvalues: RoactModule (copy), InspectAndBuyContextModule (copy), ThemeModule (copy), GuiService (copy)
	local View = p1.props.view
	local ViewingDetails = p1.props.detailsInformation.viewingDetails
	local CloseDetailsFunction = p1.props.closeDetails
	local SetTryingOnInfoFunction = p1.props.setTryingOnInfo
	
	return RoactModule.createElement(InspectAndBuyContextModule.Consumer, {
		render = function(p2) --[[ Line: 26 ]]
			-- upvalues: View (copy), ThemeModule (upval), RoactModule (upval), ViewingDetails (copy), CloseDetailsFunction (copy), SetTryingOnInfoFunction (copy), GuiService (upval)
			local v1 = p2[View]
			local _UDim2 = UDim2.new(0, 0, 0, 0)
			local XOffset = 26
			
			if ThemeModule.UseInspectAndBuyPanel() then
				XOffset = 18
				_UDim2 = UDim2.new(0, v1.BorderPaddingSize, 0, 0)
			end
			return RoactModule.createElement("ImageButton", {
				Size = UDim2.new(0, XOffset, 0, XOffset),
				Position = v1.CloseButtonPosition + _UDim2,
				BackgroundTransparency = 1,
				Selectable = false,
				Image = if ViewingDetails then "rbxasset://textures/ui/InspectMenu/caret_tail_left.png" else "rbxasset://textures/ui/InspectMenu/x.png",
				ZIndex = 2,
				[RoactModule.Event.Activated] = function() --[[ Line: 42 ]]
					-- upvalues: ViewingDetails (upval), CloseDetailsFunction (upval), SetTryingOnInfoFunction (upval), GuiService (upval)
					if ViewingDetails then
						CloseDetailsFunction()
						SetTryingOnInfoFunction(false, nil)
						
						return
					else
						GuiService:CloseInspectMenu()
					end
				end
			})
		end
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ Line: 55 ]]
	return {
		view = p1.view,
		detailsInformation = p1.detailsInformation
	}
end, function(Callback) --[[ Line: 60 ]]
	-- upvalues: SetDetailsInformationModule (copy), SetTryingOnInfoModule (copy)
	return {
		closeDetails = function() --[[ Line: 62 ]]
			-- upvalues: Callback (copy), SetDetailsInformationModule (upval)
			Callback(SetDetailsInformationModule(false, nil))
		end,
		setTryingOnInfo = function(p1, p2) --[[ Line: 65 ]]
			-- upvalues: Callback (copy), SetTryingOnInfoModule (upval)
			Callback(SetTryingOnInfoModule(p1, p2))
		end
	}
end)(CloseButton)