local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local playerNameLabelModule = require(parent.Components.PlayerNameLabel)
local avatarHeadShotModule = require(parent.Components.AvatarHeadShot)
local assetListModule = require(parent.Components.AssetList)
local inspectAndBuyContextModule = require(parent.Components.InspectAndBuyContext)
local initialView = roactModule.PureComponent:extend("InitialView")

function initialView.render(p0) --[[ line: 13 ]]
	-- upvalues: roactModule (ref), inspectAndBuyContextModule (ref), avatarHeadShotModule (ref), playerNameLabelModule (ref), assetListModule (ref)
	local view = p0.props.view
	local detailsInformation = p0.props.detailsInformation
	
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p1) --[[ line: 18 ]]
			-- upvalues: view (ref), roactModule (copy), detailsInformation (ref), avatarHeadShotModule (copy), playerNameLabelModule (copy), assetListModule (copy)
			local var8 = p1[view]
			
			return roactModule.createElement("ScrollingFrame", {
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				Selectable = false,
				Position = UDim2.new(0, var8.BorderPaddingSize, 0, 10),
				Size = UDim2.new(1, -(2 * var8.BorderPaddingSize), 1, -36),
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
					Size = UDim2.new(1, 0, 0, var8.TopSizeY)
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

return roactRoduxModule.UNSTABLE_connect2(function(p2, _) --[[ line: 53 ]]
	return {
		view = p2.view,
		detailsInformation = p2.detailsInformation
	}
end)(initialView)