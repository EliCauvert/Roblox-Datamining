local SocialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local Parent = SocialExperienceJoin.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local TextKeysModule = require(SocialExperienceJoin.Common.TextKeys)

return function(p1) --[[ Line: 22 ]]
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = TextKeysModule.PurchaseExperienceModalTitle,
		bodyText = {
			TextKeysModule.PurchaseExperienceModalBody,
			gameName = p1.experienceName,
			X = p1.price
		},
		confirmButtonText = TextKeysModule.Unlock,
		cancelButtonText = TextKeysModule.Cancel,
		successToastTitle = TextKeysModule.SuccessPurchaseToastTitle,
		successToastMessage = {
			TextKeysModule.SuccessPurchaseToastMessage,
			gameName = p1.experienceName,
			price = p1.price
		}
	})
	
	return ReactModule.createElement(InteractiveAlert, {
		screenSize = p1.screenSize,
		title = UseLocalizationResult.titleText,
		bodyText = UseLocalizationResult.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = nil,
					props = {
						text = UseLocalizationResult.cancelButtonText,
						onActivated = p1.cancelPurchase
					}
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						text = UseLocalizationResult.confirmButtonText,
						onActivated = p1.purchaseExperience
					}
				}
			}
		}
	})
end