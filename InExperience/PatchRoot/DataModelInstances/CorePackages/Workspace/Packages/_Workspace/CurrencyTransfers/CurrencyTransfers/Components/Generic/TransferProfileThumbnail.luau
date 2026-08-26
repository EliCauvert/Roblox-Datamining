local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local getFFlagCurrencyTransferFlowUIImprovementFixModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFlowUIImprovementFix)
local fFlagCurrencyTransferUseProfileFrameThumbnailModule = require(currencyTransfers.Flags.FFlagCurrencyTransferUseProfileFrameThumbnail)
local foundationModule = require(parent.Foundation)
local image = foundationModule.Image
local view = foundationModule.View
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local userLibModule = require(parent.UserLib)
local constants = userLibModule.Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local size100x100 = Enum.ThumbnailSize.Size100x100

return function(p1)
	-- upvalues: useTokens (ref), size100x100 (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), fFlagCurrencyTransferUseProfileFrameThumbnailModule (ref), reactModule (ref), view (ref), image (ref), getFFlagCurrencyTransferFlowUIImprovementFixModule (ref), text (ref)
	local var1 = useTokens()
	
	if not p1.thumbnailSize then
		p1.thumbnailSize = size100x100
	end
	return reactModule.createElement(view, {
		tag = "col gap-xlarge auto-xy align-x-center align-y-center",
		LayoutOrder = p1.layoutOrder
	}, {
		AvatarContainer = reactModule.createElement(view, {
			tag = "aspect-1-1 position-center-center anchor-center-center",
			Size = p1.size or UDim2.fromOffset(80, 80)
		}, {
			AvatarImage = reactModule.createElement(image, {
				tag = "size-full aspect-1-1 radius-circle align-x-center align-y-center",
				Image = getRbxthumbWithTypeSizeAndOptions(p1.userId, constants.RbxthumbTypes.AvatarHeadShot, if p1.thumbnailSize == Enum.ThumbnailSize.Size48x48 then 48 elseif p1.thumbnailSize == Enum.ThumbnailSize.Size60x60 then 60 else 150, true, nil, fFlagCurrencyTransferUseProfileFrameThumbnailModule),
				backgroundStyle = var1.Color.Shift.Shift_300
			})
		}),
		NameContainer = if p1.showUsername and (if getFFlagCurrencyTransferFlowUIImprovementFixModule() then p1.username or p1.displayName else p1.username) then reactModule.createElement(view, { tag = "col auto-y align-x-center" }, {
			Name = reactModule.createElement(text, {
				tag = "text-title-medium content-emphasis text-align-x-center",
				Text = if getFFlagCurrencyTransferFlowUIImprovementFixModule() then p1.displayName or (p1.username or "") else p1.username or ""
			})
		}) else nil,
		HandleContainer = if not getFFlagCurrencyTransferFlowUIImprovementFixModule() then if p1.displayName and p1.username then reactModule.createElement(view, {
			tag = "col auto-y padding-bottom-medium",
			LayoutOrder = 3
		}, {
			Handle = reactModule.createElement(text, {
				tag = "text-label-medium content-emphasis",
				Text = "@" .. p0.username
			})
		}) else nil elseif p1.displayName then reactModule.createElement(view, {
			tag = "col auto-y padding-bottom-medium",
			LayoutOrder = 3
		}, {
			Handle = reactModule.createElement(text, {
				tag = "text-label-medium content-emphasis",
				Text = "@" .. p0.displayName
			})
		}) else nil
	})
end