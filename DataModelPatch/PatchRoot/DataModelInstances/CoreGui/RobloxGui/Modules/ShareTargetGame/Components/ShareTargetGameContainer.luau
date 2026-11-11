local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithLocalizationModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.withLocalization)
local DependenciesModule = require(script:FindFirstAncestor("ShareTargetGame").dependencies)
local ComposeFunction = DependenciesModule.SocialLibraries.RoduxTools.compose
local UniversalAppPolicy = DependenciesModule.UniversalAppPolicy
local ShareTargetGameModule = require(script.Parent.ShareTargetGame)
local ShareTargetGameTopBarModule = require(script.Parent.ShareTargetGameTopBar)
local ShareTargetGameContainer = RoactModule.PureComponent:extend("ShareTargetGameContainer")
local MapStateToPropsModule = require(script.Parent.Parent.mapStateToProps)
local MapDispatchToPropsModule = require(script.Parent.Parent.mapDispatchToProps)
local KeepConversationOrderSameModule = require(script.Parent.Parent.Utils.keepConversationOrderSame)
ShareTargetGameContainer.defaultProps = { analytics = nil, networkImpl = nil }

function ShareTargetGameContainer.init(p1)
	function p1.hasAllInformation(): boolean
		-- upvalues: p1 (copy)
		return if p1.props.appLoaded and p1.props.placeInfo and p1.props.gameCreator and p1.props.gameThumbnail then true else false
	end
	
	p1.state = { conversationSendingStatuses = {} }
end

function ShareTargetGameContainer.getDerivedStateFromProps(p1, p2)
	-- upvalues: KeepConversationOrderSameModule (copy)
	return {
		formattedConversations = KeepConversationOrderSameModule(p1.conversations, p2.formattedConversations)
	}
end

function getChatRecipient(List, p1)
	for _, value in List do
		if value ~= p1 then
			return value
		end
	end
	return nil
end

function ShareTargetGameContainer.render(p2)
	-- upvalues: UIBloxModule (copy), CryoModule (copy), RoactModule (copy), ShareTargetGameTopBarModule (copy), ShareTargetGameModule (copy), WithLocalizationModule (copy)
	return UIBloxModule.Style.withStyle(function(p3)
		-- upvalues: p2 (copy), CryoModule (upval), RoactModule (upval), ShareTargetGameTopBarModule (upval), ShareTargetGameModule (upval), WithLocalizationModule (upval)
		local function renderFrame(p4)
			-- upvalues: p2 (upval), CryoModule (upval), RoactModule (upval), p3 (copy), ShareTargetGameTopBarModule (upval), ShareTargetGameModule (upval)
			return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				layout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
				shareTargetGame = RoactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundColor3 = p3.Theme.BackgroundDefault.Color
				}, {
					layout = RoactModule.createElement("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Top,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					topBar = RoactModule.createElement(ShareTargetGameTopBarModule, { LayoutOrder = 1 }),
					content = RoactModule.createElement(ShareTargetGameModule, CryoModule.Dictionary.join(p2.props, p4, {
						LayoutOrder = 2,
						onSendButtonActivated = function(p5)
							-- upvalues: p2 (upval), CryoModule (upval)
							p2:setState({
								conversationSendingStatuses = CryoModule.Dictionary.join(p2.state.conversationSendingStatuses, { [p5.conversationId] = "sending" })
							})
							
							return p2.props.sendGameLinkToConversation(p5.conversationId, tostring(p2.props.placeInfo.universeId), true, if game:DefineFastFlag("ExperienceInviteNotification", false) then getChatRecipient(p5.participants, p2.props.senderId) else nil, p2.props.placeInfo.universeRootPlaceId):andThen(function()
								-- upvalues: p2 (upval), p5 (copy), CryoModule (upval)
								p2.props.analytics:onActivatedInviteSent(tostring(p2.props.placeInfo.universeRootPlaceId), tostring(p2.props.placeInfo.universeId), tostring(p2.props.senderId), p5.conversationId, p5.participants)
								p2:setState({
									conversationSendingStatuses = CryoModule.Dictionary.join(p2.state.conversationSendingStatuses, { [p5.conversationId] = "sent" })
								})
							end, function()
								-- upvalues: p2 (upval), CryoModule (upval), p5 (copy)
								p2:setState({
									conversationSendingStatuses = CryoModule.Dictionary.join(p2.state.conversationSendingStatuses, { [p5.conversationId] = "failed" })
								})
							end)
						end,
						formattedConversations = p2.state.formattedConversations,
						conversationSendingStatuses = p2.state.conversationSendingStatuses,
						isLoading = not p2.hasAllInformation()
					}))
				})
			})
		end
		
		return WithLocalizationModule({
			filterBoxPlaceHolderText = "Feature.Chat.Label.SearchForFriendsAndChat",
			sentText = "Feature.Chat.Label.Sent",
			sendText = "Feature.Chat.Action.Send",
			sendingText = "Feature.Chat.Response.Sending",
			failedText = "Feature.Chat.Response.Failed",
			offlinePresence = "Common.Presence.Label.Offline",
			onlinePresence = "Common.Presence.Label.Online",
			byBuilderText = {
				"Feature.Chat.Label.ByBuilder",
				USERNAME = p2.props.gameCreator
			}
		})(function(p4)
			-- upvalues: renderFrame (copy)
			return renderFrame(p4)
		end)
	end)
end

function ShareTargetGameContainer.didMount(p2)
	if p2.props.placeInfo.universeId then
		p2.props.fetchGameData(p2.props.networkImpl, p2.props.placeInfo.universeId)
	else
		p2.props.fetchPlaceInfos(p2.props.networkImpl, p2.props.placeId)
	end
	if not p2.props.appLoaded then
		spawn(function()
			-- upvalues: p2 (copy)
			p2.props.fetchConversations(1):andThen(function()
				-- upvalues: p2 (upval)
				p2.props.setAppLoaded()
			end)
		end)
	end
	p2.props.analytics:inputShareGameEntryPoint(p2.props.placeId, p2.props.placeInfo.universeId)
end

return ComposeFunction(RoactRoduxModule.connect(MapStateToPropsModule, MapDispatchToPropsModule), UniversalAppPolicy.connect(function(p2)
	return { shouldShowCreatorName = p2.shouldShowCreatorName() }
end))(ShareTargetGameContainer)