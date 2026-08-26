local socialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local parent = socialExperienceJoin.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local textKeysModule = require(socialExperienceJoin.Common.TextKeys)

return function(p1)
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref)
	local var1 = useLocalization({
		titleText = textKeysModule.PurchaseExperienceModalTitle,
		bodyText = {
			textKeysModule.PurchaseExperienceModalBody,
			gameName = p1.experienceName,
			X = p1.price
		},
		confirmButtonText = textKeysModule.Unlock,
		cancelButtonText = textKeysModule.Cancel,
		successToastTitle = textKeysModule.SuccessPurchaseToastTitle,
		successToastMessage = {
			textKeysModule.SuccessPurchaseToastMessage,
			gameName = p1.experienceName,
			price = p1.price
		}
	})
	
	return reactModule.createElement(interactiveAlert, {
		screenSize = p1.screenSize,
		title = var1.titleText,
		bodyText = var1.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = nil,
					props = {
						text = var1.cancelButtonText,
						onActivated = p1.cancelPurchase
					}
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						text = var1.confirmButtonText,
						onActivated = p1.purchaseExperience
					}
				}
			}
		}
	})
end