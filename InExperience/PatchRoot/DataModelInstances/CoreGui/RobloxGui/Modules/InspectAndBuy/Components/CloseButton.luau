local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local parent = script.Parent.Parent
local setDetailsInformationModule = require(parent.Actions.SetDetailsInformation)
local setTryingOnInfoModule = require(parent.Actions.SetTryingOnInfo)
local inspectAndBuyContextModule = require(parent.Components.InspectAndBuyContext)
local themeModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Theme)
local closeButton = roactModule.PureComponent:extend("CloseButton")

function closeButton.render(p1)
	-- upvalues: roactModule (ref), inspectAndBuyContextModule (ref), themeModule (ref), guiService (ref)
	local view = p1.props.view
	local viewingDetails = p1.props.detailsInformation.viewingDetails
	local closeDetails = p1.props.closeDetails
	local setTryingOnInfo = p1.props.setTryingOnInfo
	
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p2)
			-- upvalues: view (ref), themeModule (copy), roactModule (copy), viewingDetails (ref), closeDetails (ref), setTryingOnInfo (ref), guiService (copy)
			local var1 = p2[view]
			local uDim2 = UDim2.new(0, 0, 0, 0)
			local var2 = 26
			
			if themeModule.UseInspectAndBuyPanel() then
				var2 = 18
				uDim2 = UDim2.new(0, var1.BorderPaddingSize, 0, 0)
			end
			return roactModule.createElement("ImageButton", {
				Size = UDim2.new(0, var2, 0, var2),
				Position = var1.CloseButtonPosition + uDim2,
				BackgroundTransparency = 1,
				Selectable = false,
				Image = if viewingDetails then "rbxasset://textures/ui/InspectMenu/caret_tail_left.png" else "rbxasset://textures/ui/InspectMenu/x.png",
				ZIndex = 2,
				[roactModule.Event.Activated] = function()
					-- upvalues: viewingDetails (copy), closeDetails (copy), setTryingOnInfo (copy), guiService (copy)
					if viewingDetails then
						closeDetails()
						setTryingOnInfo(false, nil)
						
						return
					end
					guiService:CloseInspectMenu()
				end
			})
		end
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		view = p1.view,
		detailsInformation = p1.detailsInformation
	}
end, function(p1)
	-- upvalues: setDetailsInformationModule (ref), setTryingOnInfoModule (ref)
	return {
		closeDetails = function()
			-- upvalues: p1 (ref), setDetailsInformationModule (copy)
			p1(setDetailsInformationModule(false, nil))
		end,
		setTryingOnInfo = function(value, p2)
			-- upvalues: p1 (ref), setTryingOnInfoModule (copy)
			p1(setTryingOnInfoModule(value, p2))
		end
	}
end)(closeButton)