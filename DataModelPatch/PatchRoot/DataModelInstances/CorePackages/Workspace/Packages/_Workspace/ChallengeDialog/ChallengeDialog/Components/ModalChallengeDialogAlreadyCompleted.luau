local ChallengeDialog = script:FindFirstAncestor("ChallengeDialog")
local Parent = ChallengeDialog.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AppPage = require(Parent.RobloxAppEnums).AppPage
local LockModule = require(ChallengeDialog.Common.Lock)
local ModalTextComponentModule = require(ChallengeDialog.Common.ModalTextComponent)
local ModalButtonConfigModule = require(ChallengeDialog.Common.ModalButtonConfig)
local FullPageModalWrapperModule = require(ChallengeDialog.Common.FullPageModalWrapper)
local ModalFooterModule = require(ChallengeDialog.Common.ModalFooter)
local ModalTextSizesModule = require(ChallengeDialog.Common.ModalTextSizes)
local ButtonType = require(Parent.UIBlox).App.Button.Enum.ButtonType
local config = {
	okay = "Authentication.TwoStepVerification.Action.Okay",
	header = "Authentication.TwoStepVerification.Label.AttemptReviewed",
	alreadyReviewed = "Authentication.TwoStepVerification.Label.AlreadyReviewed",
	helpMessage = "Authentication.TwoStepVerification.Label.NeedHelpMessage"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), FullPageModalWrapperModule (copy), LockModule (copy), ModalTextComponentModule (copy), ModalButtonConfigModule (copy), ButtonType (copy), ModalFooterModule (copy), ModalTextSizesModule (copy), AppPage (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return ReactModule.createElement(FullPageModalWrapperModule, {
		title = UseLocalizationResult.header,
		closeModal = p1.closeModal,
		makeBodyFragment = function(ContentWidth)
			-- upvalues: ReactModule (upval), LockModule (upval), ModalTextComponentModule (upval), UseLocalizationResult (copy)
			return ReactModule.createElement(ReactModule.Fragment, nil, {
				Lock = ReactModule.createElement(LockModule, { layoutOrder = 1 }),
				AlreadyCompleted = ReactModule.createElement(ModalTextComponentModule, {
					layoutOrder = 2,
					useBold = true,
					useEmphasis = true,
					contentWidth = ContentWidth,
					text = UseLocalizationResult.alreadyReviewed
				})
			})
		end,
		buttonConfig = ModalButtonConfigModule({
			{
				onActivated = p1.closeModal,
				text = UseLocalizationResult.okay,
				type = ButtonType.PrimarySystem
			}
		}),
		footerContent = ModalFooterModule(function(ContentWidth)
			-- upvalues: ReactModule (upval), ModalTextComponentModule (upval), UseLocalizationResult (copy), ModalTextSizesModule (upval), p1 (copy), AppPage (upval)
			return ReactModule.createElement(ModalTextComponentModule, {
				BackgroundTransparency = 0,
				layoutOrder = 1,
				text = UseLocalizationResult.helpMessage,
				contentWidth = ContentWidth,
				size = ModalTextSizesModule.Footer,
				onActivated = function()
					-- upvalues: p1 (upval), AppPage (upval)
					p1.navigateToPage({
						detail = "https://en.help.roblox.com/hc/en-us/articles/212459863-Add-2-Step-Verification-to-Your-Account",
						name = AppPage.GenericWebPage,
						extraProps = { title = "" }
					})
				end
			})
		end)
	})
end