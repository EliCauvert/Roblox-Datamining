local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local AvatarPartViewportModule = require(script.Parent.AvatarPartViewport)
local GetFFlagSingleUploadMakeupSupportModule = require(script.Parent.Parent.Parent.Parent.Flags.GetFFlagSingleUploadMakeupSupport)

return function(Frame)
	-- upvalues: UseStyleFunction (copy), GetFFlagSingleUploadMakeupSupportModule (copy), ReactModule (copy), AvatarPartViewportModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Asset = Frame.asset
	local CaptionHeader = UseStyleResultFont.CaptionHeader
	local Color = UseStyleResult.Theme.TextEmphasis.Color
	
	if GetFFlagSingleUploadMakeupSupportModule() then
		assert(typeof(Asset) == "table" or (Asset:IsA("MeshPart") or (Asset:IsA("Accessory") or Asset:IsA("Decal"))), "Assert that asset is a table, MeshPart, Accessory, or Decal")
	else
		assert(typeof(Asset) == "table" or (Asset:IsA("MeshPart") or Asset:IsA("Accessory")), "Assert that asset is a table, MeshPart, or Accessory")
	end
	local BodyName = Frame.bodyName
	local PartName = Frame.partName
	local Text: string? = nil
	local HasPartName = nil
	
	if GetFFlagSingleUploadMakeupSupportModule() then
		if BodyName and PartName then
			Text = BodyName .. "'s " .. PartName
		elseif PartName then
			Text = PartName
		end
		HasPartName = Text ~= nil
	else
		HasPartName = BodyName ~= nil and PartName ~= nil
		
		if BodyName and PartName then
			Text = BodyName .. "'s " .. PartName
		end
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = Frame.LayoutOrder
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 5)
		}),
		AvatarPartViewport = ReactModule.createElement(AvatarPartViewportModule, {
			LayoutOrder = 1,
			asset = Asset,
			assetType = if GetFFlagSingleUploadMakeupSupportModule() then Frame.assetType else nil,
			viewportSize = Frame.viewportSize
		}),
		TitleText = HasPartName and ReactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			TextWrapped = true,
			Text = Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Size = UDim2.new(1, 0, 0, 50),
			TextColor3 = Color,
			Font = CaptionHeader.Font,
			TextSize = CaptionHeader.RelativeSize * UseStyleResultFont.BaseSize,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end