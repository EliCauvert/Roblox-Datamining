local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local GetFFlagCurrencyTransferFlowUIImprovementFixModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferFlowUIImprovementFix)
local FFlagCurrencyTransferUseProfileFrameThumbnailModule = require(CurrencyTransfers.Flags.FFlagCurrencyTransferUseProfileFrameThumbnail)
local FoundationModule = require(Parent.Foundation)
local Image = FoundationModule.Image
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UserLibModule = require(Parent.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local Size100x100 = Enum.ThumbnailSize.Size100x100

return function(p1) --[[ Line: 34 | Named "UserProfileThumbnail" ]]
	-- upvalues: UseTokensFunction (copy), Size100x100 (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), FFlagCurrencyTransferUseProfileFrameThumbnailModule (copy), ReactModule (copy), View (copy), Image (copy), GetFFlagCurrencyTransferFlowUIImprovementFixModule (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	if not p1.thumbnailSize then
		p1.thumbnailSize = Size100x100
	end
	return ReactModule.createElement(View, {
		tag = "col gap-xlarge auto-xy align-x-center align-y-center",
		LayoutOrder = p1.layoutOrder
	}, {
		AvatarContainer = ReactModule.createElement(View, {
			tag = "aspect-1-1 position-center-center anchor-center-center",
			Size = p1.size or UDim2.fromOffset(80, 80)
		}, {
			AvatarImage = ReactModule.createElement(Image, {
				tag = "size-full aspect-1-1 radius-circle align-x-center align-y-center",
				Image = GetRbxthumbWithTypeSizeAndOptionsFunction(p1.userId, Constants.RbxthumbTypes.AvatarHeadShot, if p1.thumbnailSize == Enum.ThumbnailSize.Size48x48 then 48 elseif p1.thumbnailSize == Enum.ThumbnailSize.Size60x60 then 60 else 150, true, nil, FFlagCurrencyTransferUseProfileFrameThumbnailModule),
				backgroundStyle = UseTokensResult.Color.Shift.Shift_300
			})
		}),
		NameContainer = if p1.showUsername and (if GetFFlagCurrencyTransferFlowUIImprovementFixModule() then p1.username or p1.displayName else p1.username) then ReactModule.createElement(View, { tag = "col auto-y align-x-center" }, {
			Name = ReactModule.createElement(Text, {
				tag = "text-title-medium content-emphasis text-align-x-center",
				Text = GetFFlagCurrencyTransferFlowUIImprovementFixModule() and p1.displayName or (p1.username or "")
			})
		}) else nil,
		HandleContainer = if GetFFlagCurrencyTransferFlowUIImprovementFixModule() then if p1.displayName and p1.username then ReactModule.createElement(View, {
			tag = "col auto-y padding-bottom-medium",
			LayoutOrder = 3
		}, {
			Handle = ReactModule.createElement(Text, {
				tag = "text-label-medium content-emphasis",
				Text = "@" .. p1.username
			})
		}) else nil elseif p1.displayName then ReactModule.createElement(View, {
			tag = "col auto-y padding-bottom-medium",
			LayoutOrder = 3
		}, {
			Handle = ReactModule.createElement(Text, {
				tag = "text-label-medium content-emphasis",
				Text = "@" .. p1.displayName
			})
		}) else nil
	})
end