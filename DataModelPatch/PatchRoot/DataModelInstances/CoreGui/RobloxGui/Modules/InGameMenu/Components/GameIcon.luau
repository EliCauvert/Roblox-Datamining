local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local Images = UIBlox.App.ImageSet.Images
local AssetImageModule = require(Parent.Components.AssetImage)
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local GetGameIconRequestSizeModule = require(Parent.Components.getGameIconRequestSize)
local GameIcon = Roact.PureComponent:extend("GameIcon")
GameIcon.validateProps = T.strictInterface({
	gameId = T.number,
	iconSize = T.numberMin(0),
	layoutOrder = T.optional(T.number),
	cornerRadius = T.optional(T.UDim),
	Position = T.optional(T.UDim2),
	AnchorPoint = T.optional(T.Vector2)
})

function GameIcon.render(p1)
	-- upvalues: GetGameIconRequestSizeModule (copy), WithFoundationOrUIBloxStyleFunction (copy), Roact (copy), AssetImageModule (copy), ImageSetLabel (copy), Images (copy)
	local IconSize: number = p1.props.iconSize
	local GameIconRequestSizeModule = GetGameIconRequestSizeModule(IconSize)
	local GameId = p1.props.gameId
	local CornerRadius = p1.props.cornerRadius
	local RbxthumbName: string = ("rbxthumb://type=GameIcon&id=%d&w=%d&h=%d"):format(GameId, GameIconRequestSizeModule, GameIconRequestSizeModule)
	
	if GameId == 0 then
		local XOffset = if IconSize <= 44 then IconSize else 44
		
		return WithFoundationOrUIBloxStyleFunction(function(p2)
			return {
				Theme = {
					PlaceHolder = {
						Color = p2.Color.Common.Shimmer.Color3,
						Transparency = p2.Color.Common.Shimmer.Transparency
					},
					UIDefault = {
						Color = p2.Color.Shift.Shift_200.Color3,
						Transparency = p2.Color.Shift.Shift_200.Transparency
					}
				}
			}
		end, function(p2)
			-- upvalues: Roact (upval), AssetImageModule (upval), IconSize (copy), p1 (copy), ImageSetLabel (upval), XOffset (ref), Images (upval), CornerRadius (copy)
			return Roact.createElement(AssetImageModule.Label, {
				imageKey = "RoundedRect",
				Size = UDim2.fromOffset(IconSize, IconSize),
				ImageColor3 = p2.Theme.PlaceHolder.Color,
				ImageTransparency = p2.Theme.PlaceHolder.Transparency,
				LayoutOrder = p1.props.layoutOrder,
				Position = p1.props.Position,
				AnchorPoint = p1.props.AnchorPoint
			}, {
				PlaceholderIcon = Roact.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(XOffset, XOffset),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = Images["icons/imageUnavailable"],
					ImageColor3 = p2.Theme.UIDefault.Color,
					ImageTransparency = p2.Theme.UIDefault.Transparency,
					AnchorPoint = Vector2.new(0.5, 0.5)
				}, {
					UICorner = CornerRadius and CornerRadius ~= UDim.new(0, 0) and Roact.createElement("UICorner", { CornerRadius = CornerRadius }) or nil
				})
			})
		end)
	else
		local XOffset = Roact
		XOffset = XOffset.createElement
		
		return XOffset("ImageLabel", {
			BackgroundTransparency = 1,
			Image = RbxthumbName,
			Size = UDim2.fromOffset(IconSize, IconSize),
			LayoutOrder = p1.props.layoutOrder,
			Position = p1.props.Position,
			AnchorPoint = p1.props.AnchorPoint
		}, {
			UICorner = CornerRadius and CornerRadius ~= UDim.new(0, 0) and Roact.createElement("UICorner", { CornerRadius = CornerRadius }) or nil
		})
	end
end

return GameIcon