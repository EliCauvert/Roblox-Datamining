local DependenciesModule = require(script.Parent.dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local Foundation = DependenciesModule.Foundation
local IconSize = Foundation.Enums.IconSize
local Loading = Foundation.Loading
local T = DependenciesModule.t
local WithLocalizationFunction = DependenciesModule.withLocalization
local ExperienceInviteStatus = DependenciesModule.ShareLinksRodux.Enums.ExperienceInviteStatus
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local InteractiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local InviteLinkExpiredModal = Roact.Component:extend("InviteLinkExpiredModal")
local _ = require(script.Parent.inviteLinkExpiredMapStateToProps)
InviteLinkExpiredModal.defaultProps = {
	closeModal = function() end,
	launchGame = function() end
}
InviteLinkExpiredModal.validateProps = T.interface({
	closeModal = T.callback,
	launchGame = T.callback,
	linkStatus = T.string,
	experienceName = T.string,
	isLoading = T.boolean,
	screenSize = T.Vector2
})

function InviteLinkExpiredModal.render(p1)
	-- upvalues: ExperienceInviteStatus (copy), WithLocalizationFunction (copy), Roact (copy), Loading (copy), IconSize (copy), InteractiveAlert (copy), ButtonType (copy)
	local Props = p1.props
	local TitleText = nil
	local v1 = nil
	
	if ExperienceInviteStatus.fromRawValue(Props.linkStatus) == ExperienceInviteStatus.InviterNotInExperience then
		TitleText = "Feature.SocialShare.Label.InviterNotHereError"
		v1 = "Feature.SocialShare.Description.InviterNotHereError"
	else
		TitleText = "Feature.SocialShare.Label.InviteExpiredError"
		v1 = "Feature.SocialShare.Description.InviteExpiredError"
	end
	return WithLocalizationFunction({
		confirmButtonText = "Feature.Chat.Drawer.Join",
		cancelButtonText = "Feature.Friends.Label.Cancel",
		titleText = TitleText,
		bodyText = { v1, experienceName = Props.experienceName }
	})(function(p2)
		-- upvalues: Roact (upval), Loading (upval), IconSize (upval), InteractiveAlert (upval), Props (copy), ButtonType (upval)
		local function v15()
			-- upvalues: Roact (upval), Loading (upval), IconSize (upval)
			return Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 48)
			}, {
				Spinner = Roact.createElement(Loading, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					size = IconSize.Large
				})
			})
		end
		
		return Roact.createElement(InteractiveAlert, {
			screenSize = Props.screenSize,
			title = p2.titleText,
			bodyText = if Props.isLoading then nil else p2.bodyText,
			middleContent = Props.isLoading and v15 or nil,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = nil,
						props = {
							text = p2.cancelButtonText,
							onActivated = function()
								-- upvalues: Props (upval)
								Props.closeModal(false)
							end
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							text = p2.confirmButtonText,
							onActivated = function()
								-- upvalues: Props (upval)
								Props.launchGame()
								Props.closeModal(true)
							end
						}
					}
				}
			}
		})
	end)
end

return InviteLinkExpiredModal