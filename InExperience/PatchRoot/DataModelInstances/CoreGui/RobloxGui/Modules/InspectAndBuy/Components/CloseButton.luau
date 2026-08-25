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

function closeButton.render(p0)
	-- upvalues: roactModule (ref), inspectAndBuyContextModule (ref), themeModule (ref), guiService (ref)
	local view = p0.props.view
	local viewingDetails = p0.props.detailsInformation.viewingDetails
	local closeDetails = p0.props.closeDetails
	local setTryingOnInfo = p0.props.setTryingOnInfo
	
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p1)
			-- upvalues: view (ref), themeModule (copy), roactModule (copy), viewingDetails (ref), closeDetails (ref), setTryingOnInfo (ref), guiService (copy)
			local var9 = p1[view]
			local uDim2 = UDim2.new(0, 0, 0, 0)
			local var11 = 26
			
			if themeModule.UseInspectAndBuyPanel() then
				var11 = 18
				uDim2 = UDim2.new(0, var9.BorderPaddingSize, 0, 0)
			end
			return roactModule.createElement("ImageButton", {
				Size = UDim2.new(0, var11, 0, var11),
				Position = var9.CloseButtonPosition + uDim2,
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

return roactRoduxModule.UNSTABLE_connect2(function(p2, _)
	return {
		view = p2.view,
		detailsInformation = p2.detailsInformation
	}
end, function(p3)
	-- upvalues: setDetailsInformationModule (ref), setTryingOnInfoModule (ref)
	return {
		closeDetails = function()
			-- upvalues: p3 (ref), setDetailsInformationModule (copy)
			p3(setDetailsInformationModule(false, nil))
		end,
		setTryingOnInfo = function(value, p4)
			-- upvalues: p3 (ref), setTryingOnInfoModule (copy)
			p3(setTryingOnInfoModule(value, p4))
		end
	}
end)(closeButton)