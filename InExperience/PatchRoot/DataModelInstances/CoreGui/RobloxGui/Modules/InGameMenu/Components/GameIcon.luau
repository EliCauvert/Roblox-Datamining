local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent
local withStyle = UIBlox.Core.Style.withStyle
local images = UIBlox.App.ImageSet.Images
local assetImageModule = require(parent.Components.AssetImage)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
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

function gameIcon.render(p0) --[[ line: 33 ]]
	-- upvalues: getGameIconRequestSizeModule (ref), withStyle (ref), roact (ref), assetImageModule (ref), imageSetLabel (ref), images (ref)
	local var6
	local iconSize = p0.props.iconSize
	local var4 = getGameIconRequestSizeModule(iconSize)
	local gameId = p0.props.gameId
	local cornerRadius = p0.props.cornerRadius
	local var5 = ("rbxthumb://type=GameIcon&id=%d&w=%d&h=%d"):format(gameId, var4, var4)
	
	if gameId == 0 then
		var6 = if iconSize <= 44 then iconSize else 44
		
		return withStyle(function(p1) --[[ line: 49 ]]
			-- upvalues: roact (copy), assetImageModule (copy), iconSize (ref), p0 (ref), imageSetLabel (copy), var6 (write), images (copy), cornerRadius (ref)
			local UICorner
			local createElement = roact.createElement
			local label = assetImageModule.Label
			local t = {
				imageKey = "RoundedRect",
				Size = UDim2.fromOffset(iconSize, iconSize),
				ImageColor3 = p1.Theme.PlaceHolder.Color,
				ImageTransparency = p1.Theme.PlaceHolder.Transparency,
				LayoutOrder = p0.props.layoutOrder,
				Position = p0.props.Position,
				AnchorPoint = p0.props.AnchorPoint
			}
			local t_1 = {}
			local createElement_1 = roact.createElement
			local t_2 = {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var6, var6),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = images["icons/imageUnavailable"],
				ImageColor3 = p1.Theme.UIDefault.Color,
				ImageTransparency = p1.Theme.UIDefault.Transparency,
				AnchorPoint = Vector2.new(0.5, 0.5)
			}
			local t_3 = {}
			
			if cornerRadius and cornerRadius ~= UDim.new(0, 0) then
				UICorner = roact.createElement("UICorner", { CornerRadius = cornerRadius }) or nil
			end
			t_3.UICorner = UICorner
			t_1.PlaceholderIcon = createElement_1(imageSetLabel, t_2, t_3)
			
			return createElement(label, t, t_1)
		end)
	end
	local UICorner
	var6 = roact.createElement
	local var7 = "ImageLabel"
	local t = {
		BackgroundTransparency = 1,
		Image = var5,
		Size = UDim2.fromOffset(iconSize, iconSize),
		LayoutOrder = p0.props.layoutOrder,
		Position = p0.props.Position,
		AnchorPoint = p0.props.AnchorPoint
	}
	local t_1 = {}
	
	if cornerRadius and cornerRadius ~= UDim.new(0, 0) then
		UICorner = roact.createElement("UICorner", { CornerRadius = cornerRadius }) or nil
	end
	t_1.UICorner = UICorner
	
	return var6(var7, t, t_1)
end

return gameIcon