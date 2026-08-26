local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local useStyleSheet = require(corePackagesService.Packages.Foundation).Hooks.useStyleSheet
local modules = coreGuiService.RobloxGui.Modules
local parent = script.Parent
local getFFlagExtraInviteModalStringValidationModule = require(modules.Flags.GetFFlagExtraInviteModalStringValidation)
local fFlagFixPromptGameInviteUIButtonScalingModule = require(modules.Flags.FFlagFixPromptGameInviteUIButtonScaling)
local shareGameContainerModule = require(parent.ShareGameContainer)
local modalShareGamePageFrameModule = require(parent.ModalShareGamePageFrame)
local layoutProviderModule = require(parent.LayoutProvider)
local inviteSingleUserContainerModule = require(parent.InviteSingleUserContainer)
local loadingModalModule = require(parent.LoadingModal)

local function FoundationStyleLink()
	-- upvalues: useStyleSheet (ref), roactModule (ref)
	return roactModule.createElement("StyleLink", { StyleSheet = useStyleSheet() })
end

local fullModalShareGameComponent = roactModule.PureComponent:extend("FullModalShareGameComponent")

function fullModalShareGameComponent.render(p1)
	-- upvalues: getFFlagExtraInviteModalStringValidationModule (ref), roactModule (ref), roactRoduxModule (ref), fFlagFixPromptGameInviteUIButtonScalingModule (ref), FoundationStyleLink (ref), loadingModalModule (ref), layoutProviderModule (ref), shareGameContainerModule (ref), inviteSingleUserContainerModule (ref), modalShareGamePageFrameModule (ref)
	local isVisible = p1.props.isVisible
	local analytics = p1.props.analytics
	local onAfterClosePage = p1.props.onAfterClosePage
	local store = p1.props.store
	local promptMessage = p1.props.promptMessage
	local inviteUserId = p1.props.inviteUserId
	local inviteMessageId = p1.props.inviteMessageId
	local launchData = p1.props.launchData
	local isLoading = p1.props.isLoading
	local requestImpl = p1.props.requestImpl
	
	if getFFlagExtraInviteModalStringValidationModule() and promptMessage then
		if not inviteUserId then
			promptMessage = promptMessage:gsub("\n", " ")
		end
		if promptMessage:gsub("%s", "") == "" then
			promptMessage = nil
		end
	end
	return roactModule.createElement(roactRoduxModule.StoreProvider, { store = store }, {
		screenGui = roactModule.createElement("ScreenGui", {
			AutoLocalize = false,
			DisplayOrder = -1,
			Enabled = isVisible,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			foundationStyleLink = if fFlagFixPromptGameInviteUIButtonScalingModule then roactModule.createElement(FoundationStyleLink) else nil,
			loadingIndicator = isLoading and roactModule.createElement(loadingModalModule),
			layoutProvider = not isLoading and roactModule.createElement(layoutProviderModule, nil, {
				ShareGameContainer = roactModule.createElement(shareGameContainerModule, {
					analytics = analytics,
					isVisible = isVisible,
					skeletonComponent = if inviteUserId then inviteSingleUserContainerModule else modalShareGamePageFrameModule,
					promptMessage = promptMessage,
					inviteUserId = inviteUserId,
					inviteMessageId = inviteMessageId,
					launchData = launchData,
					requestImpl = requestImpl,
					onAfterClosePage = function()
						-- upvalues: store (ref), onAfterClosePage (ref)
						local t = {}
						
						for i, v in pairs(store:getState().Invites) do
							table.insert(t, i)
						end
						onAfterClosePage(t)
					end
				})
			})
		})
	})
end

return fullModalShareGameComponent