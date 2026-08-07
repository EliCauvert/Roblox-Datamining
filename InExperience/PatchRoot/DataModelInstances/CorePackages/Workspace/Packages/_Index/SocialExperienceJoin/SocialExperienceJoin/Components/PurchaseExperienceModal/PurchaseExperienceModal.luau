local socialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local parent = socialExperienceJoin.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local textKeysModule = require(socialExperienceJoin.Common.TextKeys)

return function(p0) --[[ line: 22 ]]
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref)
	local var4 = useLocalization({
		titleText = textKeysModule.PurchaseExperienceModalTitle,
		bodyText = {
			textKeysModule.PurchaseExperienceModalBody,
			gameName = p0.experienceName,
			X = p0.price
		},
		confirmButtonText = textKeysModule.Unlock,
		cancelButtonText = textKeysModule.Cancel,
		successToastTitle = textKeysModule.SuccessPurchaseToastTitle,
		successToastMessage = {
			textKeysModule.SuccessPurchaseToastMessage,
			gameName = p0.experienceName,
			price = p0.price
		}
	})
	
	return reactModule.createElement(interactiveAlert, {
		screenSize = p0.screenSize,
		title = var4.titleText,
		bodyText = var4.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = nil,
					props = {
						text = var4.cancelButtonText,
						onActivated = p0.cancelPurchase
					}
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						text = var4.confirmButtonText,
						onActivated = p0.purchaseExperience
					}
				}
			}
		}
	})
end