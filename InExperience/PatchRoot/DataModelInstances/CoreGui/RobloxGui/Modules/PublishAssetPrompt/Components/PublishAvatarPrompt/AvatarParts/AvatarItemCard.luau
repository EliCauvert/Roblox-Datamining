local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local useStyle = require(corePackagesService.Packages.UIBlox).Core.Style.useStyle
local avatarPartViewportModule = require(script.Parent.AvatarPartViewport)
local getFFlagSingleUploadMakeupSupportModule = require(script.Parent.Parent.Parent.Parent.Flags.GetFFlagSingleUploadMakeupSupport)

return function(p1)
	-- upvalues: useStyle (ref), getFFlagSingleUploadMakeupSupportModule (ref), reactModule (ref), avatarPartViewportModule (ref)
	local var1 = useStyle()
	local font = var1.Font
	local theme = var1.Theme
	local asset = p1.asset
	local captionHeader = font.CaptionHeader
	local color = theme.TextEmphasis.Color
	
	if getFFlagSingleUploadMakeupSupportModule() then
		assert(if typeof(asset) ~= "table" then asset:IsA("MeshPart") or (asset:IsA("Accessory") or asset:IsA("Decal")) else true, "Assert that asset is a table, MeshPart, Accessory, or Decal")
	else
		assert(if typeof(asset) ~= "table" then asset:IsA("MeshPart") or asset:IsA("Accessory") else true, "Assert that asset is a table, MeshPart, or Accessory")
	end
	local var2
	local bodyName = p1.bodyName
	local partName = p1.partName
	local _ = nil
	local text = nil
	
	if getFFlagSingleUploadMakeupSupportModule() then
		if bodyName and partName then
			text = bodyName .. "'s " .. partName
		elseif partName then
			text = partName
		end
		local _ = text ~= nil
	else
		var2 = bodyName ~= nil and partName ~= nil
		
		if bodyName and partName then
			text = bodyName .. "'s " .. partName
		end
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = p1.LayoutOrder
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 5)
		}),
		AvatarPartViewport = reactModule.createElement(avatarPartViewportModule, {
			LayoutOrder = 1,
			asset = asset,
			assetType = if getFFlagSingleUploadMakeupSupportModule() then p1.assetType else nil,
			viewportSize = p1.viewportSize
		}),
		TitleText = var2 and reactModule.createElement("TextLabel", {
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