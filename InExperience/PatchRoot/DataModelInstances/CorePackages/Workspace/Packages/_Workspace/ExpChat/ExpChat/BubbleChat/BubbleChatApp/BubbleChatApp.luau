local Players = game:GetService("Players")
local VoiceChatService = game:GetService("VoiceChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local IXPServiceWrapperModule = require(ExpChat.IXPServiceWrapper)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local Dictionary = require(Parent.llama).Dictionary
local None = require(Parent.llama).None
local NewResult = ExpChatSharedModule.Logger:new("ExpChat/" .. script.Name)
local WithSignalsDataModule = require(script.Parent.withSignalsData)
local Permissions = require(ExpChat.Config).Permissions
local GlobalFlagsModule = require(ExpChat.GlobalFlags)
local GetFFlagUseCharacterStoreFunction = ExpChatSharedModule.Flags.getFFlagUseCharacterStore
local ExpChatRemoveBubbleChatAppUserMessagesState = game:DefineFastFlag("ExpChatRemoveBubbleChatAppUserMessagesState", false)
local MemoizeBubbleChatApp = game:DefineFastFlag("MemoizeBubbleChatApp", false)
local GetFFlagExpChatUseVoiceParticipantsStoreFunction = require(Parent.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore
local ExpChatBubbleChatRerenderOnAncestryChange = game:DefineFastFlag("ExpChatBubbleChatRerenderOnAncestryChange", false)
local BubbleChatApp = RoactModule.PureComponent:extend("BubbleChatApp")
local GetFStringVoicePerformanceIXPLayerNameModule = require(ExpChat.Flags.GetFStringVoicePerformanceIXPLayerName)
local BillboardUpdateFrequencyIXPLayerValue = game:DefineFastString("BillboardUpdateFrequencyIXPLayerValue", "BillboardUpdateFrequency")
local BillboardGuiModule = require(script:FindFirstAncestor("BubbleChat").BillboardGui)

if not ExpChatRemoveBubbleChatAppUserMessagesState then
	function BubbleChatApp.getDerivedStateFromProps(p1, p2)
		-- upvalues: Dictionary (copy)
		return {
			userMessages = Dictionary.join(p2.userMessages or {}, p1.userMessages)
		}
	end
end
function BubbleChatApp.init(p1)
	-- upvalues: NewResult (copy), ExpChatRemoveBubbleChatAppUserMessagesState (copy), Dictionary (copy), None (copy), ExpChatBubbleChatRerenderOnAncestryChange (copy), IXPServiceWrapperModule (copy), GetFStringVoicePerformanceIXPLayerNameModule (copy), BillboardUpdateFrequencyIXPLayerValue (copy)
	NewResult:debug("Initializing")
	p1:setState({
		localPlayerVoiceEnabled = false,
		billboardUpdateFrequency = -1,
		userMessages = if ExpChatRemoveBubbleChatAppUserMessagesState then nil else {}
	})
	
	function p1.onBillboardFadeOut(p2)
		-- upvalues: ExpChatRemoveBubbleChatAppUserMessagesState (upval), p1 (copy), Dictionary (upval), None (upval)
		if not ExpChatRemoveBubbleChatAppUserMessagesState then
			p1:setState({
				userMessages = Dictionary.join(p1.state.userMessages, { [p2] = None })
			})
		end
	end
	
	function p1.setCameraPermissionStateFromControl(HasCameraPermissions)
		-- upvalues: p1 (copy)
		p1:setState({ hasCameraPermissions = HasCameraPermissions })
	end
	
	if ExpChatBubbleChatRerenderOnAncestryChange then
		p1.isMounted = false
		p1.ancestryConnections = {}
		
		function p1.onTrackedAncestryChanged()
			-- upvalues: p1 (copy)
			if p1.isMounted then
				p1:setState(function(p2)
					return {
						ancestryRerenderToken = (p2.ancestryRerenderToken or 0) + 1
					}
				end)
			end
		end
	end
	local Success, Result = pcall(function()
		-- upvalues: IXPServiceWrapperModule (upval), GetFStringVoicePerformanceIXPLayerNameModule (upval)
		return IXPServiceWrapperModule:GetLayerData(GetFStringVoicePerformanceIXPLayerNameModule())
	end)
	
	if Success and Result and Result[BillboardUpdateFrequencyIXPLayerValue] then
		p1:setState({
			billboardUpdateFrequency = Result[BillboardUpdateFrequencyIXPLayerValue]
		})
	end
end

function BubbleChatApp.getPermissions(p1)
	local function v26(HasCameraPermissions, HasMicPermissions)
		-- upvalues: p1 (copy)
		p1:setState({
			hasCameraPermissions = HasCameraPermissions,
			hasMicPermissions = HasMicPermissions
		})
	end
	
	if p1.props.getPermissions then
		p1.props.getPermissions(v26)
	end
end

function BubbleChatApp.getMicPermission(p1)
	-- upvalues: Permissions (copy)
	local function v27(_, HasMicPermissions)
		-- upvalues: p1 (copy)
		p1:setState({ hasMicPermissions = HasMicPermissions })
	end
	
	if p1.props.getPermissions then
		p1.props.getPermissions(v27, Permissions.MICROPHONE_ACCESS)
	end
end

function BubbleChatApp.getCameraPermissionWithoutRequest(p1)
	-- upvalues: Permissions (copy)
	local function v28(HasCameraPermissions, _)
		-- upvalues: p1 (copy)
		p1:setState({ hasCameraPermissions = HasCameraPermissions })
	end
	
	if p1.props.getPermissions then
		p1.props.getPermissions(v28, Permissions.CAMERA_ACCESS, true)
	end
end

function BubbleChatApp.updateTrackedAncestryConnections(p1)
	local t = {}
	
	if p1.props.characters then
		for _, character in pairs(p1.props.characters) do
			if character then
				t[character] = true
			end
		end
	end
	if p1.props.mockUserIdToPartOrModel then
		for _, value in pairs(p1.props.mockUserIdToPartOrModel) do
			if value then
				t[value] = true
			end
		end
	end
	for i in pairs(t) do
		if not p1.ancestryConnections[i] then
			p1.ancestryConnections[i] = i.AncestryChanged:Connect(p1.onTrackedAncestryChanged)
		end
	end
	for i1, ancestryConnection in pairs(p1.ancestryConnections) do
		if not t[i1] then
			ancestryConnection:Disconnect()
			p1.ancestryConnections[i1] = nil
		end
	end
end

function BubbleChatApp.didMount(p2)
	-- upvalues: ExpChatBubbleChatRerenderOnAncestryChange (copy), GlobalFlagsModule (copy), NewResult (copy), Players (copy), VoiceChatService (copy), IXPServiceWrapperModule (copy), GetFStringVoicePerformanceIXPLayerNameModule (copy)
	if ExpChatBubbleChatRerenderOnAncestryChange then
		p2.isMounted = true
		p2:updateTrackedAncestryConnections()
	end
	if GlobalFlagsModule.AvatarChatEnabled or GlobalFlagsModule.ChromeEnabled then
		if p2.props.isVoiceServiceInitialized then
			p2.props.isVoiceServiceInitialized():andThen(function()
				-- upvalues: p2 (copy)
				p2:getMicPermission()
			end):catch(function()
				-- upvalues: NewResult (upval)
				NewResult:debug("VoiceChatServiceManager failed to initialize inside TextChatService bubblechat")
			end)
		else
			p2:getMicPermission()
		end
		p2:getCameraPermissionWithoutRequest()
	end
	task.spawn(function()
		-- upvalues: Players (upval), VoiceChatService (upval), NewResult (upval), p2 (copy), IXPServiceWrapperModule (upval), GetFStringVoicePerformanceIXPLayerNameModule (upval)
		local Success, Result = pcall(function()
			-- upvalues: Players (upval), VoiceChatService (upval)
			return if Players.LocalPlayer then VoiceChatService:IsVoiceEnabledForUserIdAsync(Players.LocalPlayer.UserId) else false
		end)
		
		if not Success then
			NewResult:debug("Unable to get voice enabled status: ", Result)
			
			return
		end
		if Result then
			p2:setState({ localPlayerVoiceEnabled = true })
			IXPServiceWrapperModule:LogUserLayerExposure(GetFStringVoicePerformanceIXPLayerNameModule())
		end
	end)
end

function BubbleChatApp.didUpdate(p2)
	-- upvalues: ExpChatBubbleChatRerenderOnAncestryChange (copy)
	if ExpChatBubbleChatRerenderOnAncestryChange then
		p2:updateTrackedAncestryConnections()
	end
end

function BubbleChatApp.willUnmount(p2)
	-- upvalues: ExpChatBubbleChatRerenderOnAncestryChange (copy)
	if ExpChatBubbleChatRerenderOnAncestryChange then
		p2.isMounted = false
		
		for i, ancestryConnection in pairs(p2.ancestryConnections) do
			ancestryConnection:Disconnect()
			p2.ancestryConnections[i] = nil
		end
	end
end

function BubbleChatApp.render(p3)
	-- upvalues: GlobalFlagsModule (copy), Players (copy), RoactModule (copy), Dictionary (copy), BillboardGuiModule (copy)
	local t = {}
	
	if p3.props.characters then
		for i, character in pairs(p3.props.characters) do
			if character and character:IsDescendantOf(workspace) then
				t[i] = false
			end
		end
	end
	if p3.props.mockUserIdToPartOrModel then
		for i1, value in pairs(p3.props.mockUserIdToPartOrModel) do
			if value and value:IsDescendantOf(workspace) then
				t[i1] = false
			end
		end
	end
	if p3.props.voiceParticipants then
		for i2, voiceParticipant in pairs(p3.props.voiceParticipants) do
			if voiceParticipant ~= "Hidden" then
				t[i2] = true
			end
		end
	end
	if GlobalFlagsModule.AvatarChatEnabled and p3.state.hasCameraPermissions and Players.LocalPlayer then
		t[tostring(Players.LocalPlayer.UserId)] = true
	end
	return RoactModule.createElement("ScreenGui", { ResetOnSpawn = false }, Dictionary.map(t, function(p4, UserId)
		-- upvalues: RoactModule (upval), BillboardGuiModule (upval), p3 (copy)
		return RoactModule.createElement(BillboardGuiModule, {
			userId = UserId,
			onFadeOut = p3.onBillboardFadeOut,
			voiceEnabled = p3.props.voiceEnabled and p4,
			getIconVoiceIndicator = p3.props.getIconVoiceIndicator,
			onClickedVoiceIndicator = p3.props.onClickedVoiceIndicator,
			onClickedCameraIndicator = p3.props.onClickedCameraIndicator,
			selfViewListenerChanged = p3.props.selfViewListenerChanged,
			hasCameraPermissions = p3.state.hasCameraPermissions,
			hasMicPermissions = p3.state.hasMicPermissions,
			displayCameraDeniedToast = p3.props.displayCameraDeniedToast,
			isCamEnabledForUserAndPlace = p3.props.isCamEnabledForUserAndPlace,
			isCameraOnlyUser = p3.props.isCameraOnlyUser,
			setCameraPermissionStateFromControl = p3.setCameraPermissionStateFromControl,
			getPermissions = p3.props.getPermissions,
			voiceState = p3.props.voiceParticipants[UserId],
			partOrModel = p3.props.mockUserIdToPartOrModel[UserId],
			isTextChatServiceOn = p3.props.isTextChatServiceOn,
			billboardUpdateFrequency = p3.state.billboardUpdateFrequency
		}), "BubbleChat_" .. UserId
	end))
end

local function mapStateToProps(p4, p5)
	-- upvalues: ExpChatSharedModule (copy), ExpChatRemoveBubbleChatAppUserMessagesState (copy), GetFFlagUseCharacterStoreFunction (copy), GetFFlagExpChatUseVoiceParticipantsStoreFunction (copy)
	local MockUserIdToPartOrModel = p4.Messages.mockUserIdToPartOrModel
	
	if p5.mockUserIdToPartOrModel then
		MockUserIdToPartOrModel = p5.mockUserIdToPartOrModel
	else
		local Context = ExpChatSharedModule.context
		local MessagesStore = Context and Context.messagesStore
		
		if MessagesStore then
			MockUserIdToPartOrModel = MessagesStore.getMockUserIdToPartOrModel(false)
		end
	end
	return {
		userMessages = if ExpChatRemoveBubbleChatAppUserMessagesState then nil else p4.Messages.messagesBySenderId,
		voiceEnabled = p4.Voice.isEnabled,
		characters = if GetFFlagUseCharacterStoreFunction() then nil else p4.Players.charactersByUserId,
		voiceParticipants = if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then nil else p4.Voice.participants,
		mockUserIdToPartOrModel = MockUserIdToPartOrModel
	}
end

if GetFFlagUseCharacterStoreFunction() or GetFFlagExpChatUseVoiceParticipantsStoreFunction() then
	local v1 = RoactRoduxModule.connect(mapStateToProps)(BubbleChatApp)
	
	return if MemoizeBubbleChatApp then ReactModule.memo(WithSignalsDataModule(v1)) else WithSignalsDataModule(v1)
else
	return if MemoizeBubbleChatApp then ReactModule.memo(RoactRoduxModule.connect(mapStateToProps)(BubbleChatApp)) else RoactRoduxModule.connect(mapStateToProps)(BubbleChatApp)
end