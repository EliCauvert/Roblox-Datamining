local CorePackages = game:GetService("CorePackages")
local Parent = script.Parent.Parent
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local PlayerNameLabelModule = require(Parent.Components.PlayerNameLabel)
local AvatarHeadShotModule = require(Parent.Components.AvatarHeadShot)
local AssetListModule = require(Parent.Components.AssetList)
local InspectAndBuyContextModule = require(Parent.Components.InspectAndBuyContext)
local InitialView = RoactModule.PureComponent:extend("InitialView")

function InitialView.render(p1)
	-- upvalues: RoactModule (copy), InspectAndBuyContextModule (copy), AvatarHeadShotModule (copy), PlayerNameLabelModule (copy), AssetListModule (copy)
	local View = p1.props.view
	local DetailsInformation = p1.props.detailsInformation
	
	return RoactModule.createElement(InspectAndBuyContextModule.Consumer, {
		render = function(p2)
			-- upvalues: View (copy), RoactModule (upval), DetailsInformation (copy), AvatarHeadShotModule (upval), PlayerNameLabelModule (upval), AssetListModule (upval)
			local v1 = p2[View]
			
			return RoactModule.createElement("ScrollingFrame", {
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				Selectable = false,
				Position = UDim2.new(0, v1.BorderPaddingSize, 0, 10),
				Size = UDim2.new(1, -(2 * v1.BorderPaddingSize), 1, -36),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				Visible = not DetailsInformation.viewingDetails
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 15),
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Top = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, v1.TopSizeY)
				}, {
					UIListLayout = RoactModule.createElement("UIListLayout", {
						Padding = UDim.new(0, 10),
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal
					}),
					AvatarHeadShot = RoactModule.createElement(AvatarHeadShotModule),
					PlayerNameLabel = RoactModule.createElement(PlayerNameLabelModule)
				}),
				AssetList = RoactModule.createElement(AssetListModule)
			})
		end
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		view = p1.view,
		detailsInformation = p1.detailsInformation
	}
end)(InitialView)