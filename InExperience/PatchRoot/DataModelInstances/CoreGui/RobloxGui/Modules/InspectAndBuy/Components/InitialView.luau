local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local playerNameLabelModule = require(parent.Components.PlayerNameLabel)
local avatarHeadShotModule = require(parent.Components.AvatarHeadShot)
local assetListModule = require(parent.Components.AssetList)
local inspectAndBuyContextModule = require(parent.Components.InspectAndBuyContext)
local initialView = roactModule.PureComponent:extend("InitialView")

function initialView.render(p1)
	-- upvalues: roactModule (ref), inspectAndBuyContextModule (ref), avatarHeadShotModule (ref), playerNameLabelModule (ref), assetListModule (ref)
	local view = p1.props.view
	local detailsInformation = p1.props.detailsInformation
	
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p2)
			-- upvalues: view (ref), roactModule (copy), detailsInformation (ref), avatarHeadShotModule (copy), playerNameLabelModule (copy), assetListModule (copy)
			local var1 = p2[view]
			
			return roactModule.createElement("ScrollingFrame", {
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				Selectable = false,
				Position = UDim2.new(0, var1.BorderPaddingSize, 0, 10),
				Size = UDim2.new(1, -(2 * var1.BorderPaddingSize), 1, -36),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				Visible = not detailsInformation.viewingDetails
			}, {
				UIListLayout = roactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 15),
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Top = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, var1.TopSizeY)
				}, {
					UIListLayout = roactModule.createElement("UIListLayout", {
						Padding = UDim.new(0, 10),
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal
					}),
					AvatarHeadShot = roactModule.createElement(avatarHeadShotModule),
					PlayerNameLabel = roactModule.createElement(playerNameLabelModule)
				}),
				AssetList = roactModule.createElement(assetListModule)
			})
		end
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		view = p1.view,
		detailsInformation = p1.detailsInformation
	}
end)(initialView)