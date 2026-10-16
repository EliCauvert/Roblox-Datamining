local Parent = script:FindFirstAncestor("DiscoveryRouting").Parent
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay

return function(TitleText, BodyText, ActionButtonText, CancelButtonText, OnActionButtonClick, OnCancelButtonClick, OnCloseModal) --[[ Line: 6 ]]
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	return function(p1) --[[ Line: 15 ]]
		-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval), TitleText (copy), BodyText (copy), ActionButtonText (copy), CancelButtonText (copy), OnActionButtonClick (copy), OnCancelButtonClick (copy), OnCloseModal (copy)
		p1:dispatch(SetCentralOverlayFunction(CentralOverlayType.PlayButtonUpsellDialog, {
			titleText = TitleText,
			bodyText = BodyText,
			actionButtonText = ActionButtonText,
			cancelButtonText = CancelButtonText,
			onActionButtonClick = OnActionButtonClick,
			onCancelButtonClick = OnCancelButtonClick,
			onCloseModal = OnCloseModal
		}))
	end
end