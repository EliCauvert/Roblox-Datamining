local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local images = UIBlox.App.ImageSet.Images
local assetImageModule = require(parent.Components.AssetImage)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local image = require(corePackagesService.Packages.Foundation).Image
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local getGameIconRequestSizeModule = require(parent.Components.getGameIconRequestSize)
local gameIcon = roact.PureComponent:extend("GameIcon")
gameIcon.validateProps = t.strictInterface({
	gameId = t.number,
	iconSize = t.numberMin(0),
	layoutOrder = t.optional(t.number),
	cornerRadius = t.optional(t.UDim),
	Position = t.optional(t.UDim2),
	AnchorPoint = t.optional(t.Vector2)
})

function gameIcon.render(p1)
	-- upvalues: getGameIconRequestSizeModule (ref), withFoundationOrUIBloxStyle (ref), roact (ref), assetImageModule (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), imageSetLabel (ref), images (ref)
	local var1
	local iconSize = p1.props.iconSize
	local var2 = getGameIconRequestSizeModule(iconSize)
	local gameId = p1.props.gameId
	local cornerRadius = p1.props.cornerRadius
	local var3 = ("rbxthumb://type=GameIcon&id=%d&w=%d&h=%d"):format(gameId, var2, var2)
	
	if gameId == 0 then
		var1 = if iconSize <= 44 then iconSize else 44
		
		return withFoundationOrUIBloxStyle(function(p2)
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
			-- upvalues: roact (copy), assetImageModule (copy), iconSize (ref), p1 (ref), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), var1 (write), cornerRadius (ref), imageSetLabel (copy), images (copy)
			local var4
			local createElement = roact.createElement
			local label = assetImageModule.Label
			local t = {
				imageKey = "RoundedRect",
				Size = UDim2.fromOffset(iconSize, iconSize),
				ImageColor3 = p2.Theme.PlaceHolder.Color,
				ImageTransparency = p2.Theme.PlaceHolder.Transparency,
				LayoutOrder = p1.props.layoutOrder,
				Position = p1.props.Position,
				AnchorPoint = p1.props.AnchorPoint
			}
			local t_1 = {}
			
			if fFlagCoreUiMigrateUIBloxToFoundation then
				var4 = roact.createElement(image, {
					Image = "icons/imageUnavailable",
					Size = UDim2.fromOffset(var1, var1),
					Position = UDim2.fromScale(0.5, 0.5),
					imageStyle = {
						Color3 = p2.Theme.UIDefault.Color,
						Transparency = p2.Theme.UIDefault.Transparency
					},
					AnchorPoint = Vector2.new(0.5, 0.5),
					cornerRadius = cornerRadius
				})
			else
				local UICorner
				var4 = roact.createElement
				local var5 = imageSetLabel
				local t_2 = {
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(var1, var1),
					Position = UDim2.fromScale(0.5, 0.5),
					Image = images["icons/imageUnavailable"],
					ImageColor3 = p2.Theme.UIDefault.Color,
					ImageTransparency = p2.Theme.UIDefault.Transparency,
					AnchorPoint = Vector2.new(0.5, 0.5)
				}
				local t_3 = {}
				
				if cornerRadius and cornerRadius ~= UDim.new(0, 0) then
					UICorner = roact.createElement("UICorner", { CornerRadius = cornerRadius }) or nil
				end
				t_3.UICorner = UICorner
				var4 = var4(var5, t_2, t_3)
			end
			t_1.PlaceholderIcon = var4
			
			return createElement(label, t, t_1)
		end)
	end
	local UICorner
	var1 = roact.createElement
	local var4 = "ImageLabel"
	local t = {
		BackgroundTransparency = 1,
		Image = var3,
		Size = UDim2.fromOffset(iconSize, iconSize),
		LayoutOrder = p1.props.layoutOrder,
		Position = p1.props.Position,
		AnchorPoint = p1.props.AnchorPoint
	}
	local t_1 = {}
	
	if cornerRadius and cornerRadius ~= UDim.new(0, 0) then
		UICorner = roact.createElement("UICorner", { CornerRadius = cornerRadius }) or nil
	end
	t_1.UICorner = UICorner
	
	return var1(var4, t, t_1)
end

return gameIcon