local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UseStyleSheetFunction = require(CorePackages.Packages.Foundation).Hooks.useStyleSheet
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Parent = script.Parent
local GetFFlagExtraInviteModalStringValidationModule = require(Modules.Flags.GetFFlagExtraInviteModalStringValidation)
local FFlagFixPromptGameInviteUIButtonScalingModule = require(Modules.Flags.FFlagFixPromptGameInviteUIButtonScaling)
local ShareGameContainerModule = require(Parent.ShareGameContainer)
local ModalShareGamePageFrameModule = require(Parent.ModalShareGamePageFrame)
local LayoutProviderModule = require(Parent.LayoutProvider)
local InviteSingleUserContainerModule = require(Parent.InviteSingleUserContainer)
local LoadingModalModule = require(Parent.LoadingModal)

local function FoundationStyleLink()
	-- upvalues: UseStyleSheetFunction (copy), RoactModule (copy)
	return RoactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetFunction() })
end

local FullModalShareGameComponent = RoactModule.PureComponent:extend("FullModalShareGameComponent")

function FullModalShareGameComponent.render(p1)
	-- upvalues: GetFFlagExtraInviteModalStringValidationModule (copy), RoactModule (copy), RoactRoduxModule (copy), FFlagFixPromptGameInviteUIButtonScalingModule (copy), FoundationStyleLink (copy), LoadingModalModule (copy), LayoutProviderModule (copy), ShareGameContainerModule (copy), InviteSingleUserContainerModule (copy), ModalShareGamePageFrameModule (copy)
	local IsVisible = p1.props.isVisible
	local Analytics = p1.props.analytics
	local OnAfterClosePageFunction = p1.props.onAfterClosePage
	local Store = p1.props.store
	local PromptMessage = p1.props.promptMessage
	local InviteUserId = p1.props.inviteUserId
	local InviteMessageId = p1.props.inviteMessageId
	local LaunchData = p1.props.launchData
	local IsLoading = p1.props.isLoading
	local RequestImpl = p1.props.requestImpl
	
	if GetFFlagExtraInviteModalStringValidationModule() and PromptMessage then
		if not InviteUserId then
			PromptMessage = PromptMessage:gsub("\n", " ")
		end
		if PromptMessage:gsub("%s", "") == "" then
			PromptMessage = nil
		end
	end
	return RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = Store }, {
		screenGui = RoactModule.createElement("ScreenGui", {
			AutoLocalize = false,
			DisplayOrder = -1,
			Enabled = IsVisible,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			foundationStyleLink = if FFlagFixPromptGameInviteUIButtonScalingModule then RoactModule.createElement(FoundationStyleLink) else nil,
			loadingIndicator = IsLoading and RoactModule.createElement(LoadingModalModule),
			layoutProvider = not IsLoading and RoactModule.createElement(LayoutProviderModule, nil, {
				ShareGameContainer = RoactModule.createElement(ShareGameContainerModule, {
					analytics = Analytics,
					isVisible = IsVisible,
					skeletonComponent = if InviteUserId then InviteSingleUserContainerModule else ModalShareGamePageFrameModule,
					promptMessage = PromptMessage,
					inviteUserId = InviteUserId,
					inviteMessageId = InviteMessageId,
					launchData = LaunchData,
					requestImpl = RequestImpl,
					onAfterClosePage = function()
						-- upvalues: Store (copy), OnAfterClosePageFunction (copy)
						local List = {}
						
						for i, _ in pairs(Store:getState().Invites) do
							table.insert(List, i)
						end
						OnAfterClosePageFunction(List)
					end
				})
			})
		})
	})
end

return FullModalShareGameComponent