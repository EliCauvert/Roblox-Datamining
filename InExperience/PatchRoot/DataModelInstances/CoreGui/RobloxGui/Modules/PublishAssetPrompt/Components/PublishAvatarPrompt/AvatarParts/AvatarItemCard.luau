local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local useStyle = require(corePackagesService.Packages.UIBlox).Core.Style.useStyle
local avatarPartViewportModule = require(script.Parent.AvatarPartViewport)

return function(p0) --[[ line: 22 | named "AvatarItemCard" ]]
	-- upvalues: useStyle (ref), reactModule (ref), avatarPartViewportModule (ref)
	local var3 = useStyle()
	local font = var3.Font
	local theme = var3.Theme
	local asset = p0.asset
	local captionHeader = font.CaptionHeader
	local color = theme.TextEmphasis.Color
	assert(if typeof(asset) ~= "table" then asset:IsA("MeshPart") or asset:IsA("Accessory") else true, "Assert that asset is a table, MeshPart, or Accessory")
	local bodyName = p0.bodyName
	local partName = p0.partName
	local partName_1 = bodyName and partName
	local text = nil
	
	if bodyName and partName then
		assert(bodyName, "bodyName is nil")
		assert(partName, "partName is nil")
		text = bodyName .. "'s " .. partName
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = p0.LayoutOrder
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 5)
		}),
		AvatarPartViewport = reactModule.createElement(avatarPartViewportModule, {
			LayoutOrder = 1,
			asset = asset,
			viewportSize = p0.viewportSize
		}),
		TitleText = partName_1 and reactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			TextWrapped = true,
			Text = text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Size = UDim2.new(1, 0, 0, 50),
			TextColor3 = color,
			Font = captionHeader.Font,
			TextSize = captionHeader.RelativeSize * font.BaseSize,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end