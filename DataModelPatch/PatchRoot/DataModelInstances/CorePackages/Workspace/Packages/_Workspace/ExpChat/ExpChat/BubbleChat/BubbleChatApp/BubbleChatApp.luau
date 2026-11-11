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
local FFlagExpChatUseMessagesStore = require(Parent.SharedFlags).FFlagExpChatUseMessagesStore
local MemoizeBubbleChatApp = game:DefineFastFlag("MemoizeBubbleChatApp", false)
local GetFFlagExpChatUseVoiceParticipantsStoreFunction = require(Parent.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore
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
	-- upvalues: NewResult (copy), ExpChatRemoveBubbleChatAppUserMessagesState (copy), Dictionary (copy), None (copy), IXPServiceWrapperModule (copy), GetFStringVoicePerformanceIXPLayerNameModule (copy), BillboardUpdateFrequencyIXPLayerValue (copy)
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

function BubbleChatApp.didMount(p1)
	-- upvalues: GlobalFlagsModule (copy), NewResult (copy), Players (copy), VoiceChatService (copy), IXPServiceWrapperModule (copy), GetFStringVoicePerformanceIXPLayerNameModule (copy)
	if GlobalFlagsModule.AvatarChatEnabled or GlobalFlagsModule.ChromeEnabled then
		if p1.props.isVoiceServiceInitialized then
			p1.props.isVoiceServiceInitialized():andThen(function()
				-- upvalues: p1 (copy)
				p1:getMicPermission()
			end):catch(function()
				-- upvalues: NewResult (upval)
				NewResult:debug("VoiceChatServiceManager failed to initialize inside TextChatService bubblechat")
			end)
		else
			p1:getMicPermission()
		end
		p1:getCameraPermissionWithoutRequest()
	end
	task.spawn(function()
		-- upvalues: Players (upval), VoiceChatService (upval), NewResult (upval), p1 (copy), IXPServiceWrapperModule (upval), GetFStringVoicePerformanceIXPLayerNameModule (upval)
		local Success, Result = pcall(function()
			-- upvalues: Players (upval), VoiceChatService (upval)
			return if Players.LocalPlayer then VoiceChatService:IsVoiceEnabledForUserIdAsync(Players.LocalPlayer.UserId) else false
		end)
		
		if not Success then
			NewResult:debug("Unable to get voice enabled status: ", Result)
			
			return
		end
		if Result then
			p1:setState({ localPlayerVoiceEnabled = true })
			IXPServiceWrapperModule:LogUserLayerExposure(GetFStringVoicePerformanceIXPLayerNameModule())
		end
	end)
end

function BubbleChatApp.render(p1)
	-- upvalues: GlobalFlagsModule (copy), Players (copy), RoactModule (copy), Dictionary (copy), BillboardGuiModule (copy), FFlagExpChatUseMessagesStore (copy)
	local t = {}
	
	if p1.props.characters then
		for i, character in pairs(p1.props.characters) do
			if character and character:IsDescendantOf(workspace) then
				t[i] = false
			end
		end
	end
	if p1.props.mockUserIdToPartOrModel then
		for i1, value in pairs(p1.props.mockUserIdToPartOrModel) do
			if value and value:IsDescendantOf(workspace) then
				t[i1] = false
			end
		end
	end
	if p1.props.voiceParticipants then
		for i2, voiceParticipant in pairs(p1.props.voiceParticipants) do
			if voiceParticipant ~= "Hidden" then
				t[i2] = true
			end
		end
	end
	if GlobalFlagsModule.AvatarChatEnabled and p1.state.hasCameraPermissions and Players.LocalPlayer then
		t[tostring(Players.LocalPlayer.UserId)] = true
	end
	return RoactModule.createElement("ScreenGui", { ResetOnSpawn = false }, Dictionary.map(t, function(p2, UserId)
		-- upvalues: RoactModule (upval), BillboardGuiModule (upval), p1 (copy), FFlagExpChatUseMessagesStore (upval)
		return RoactModule.createElement(BillboardGuiModule, {
			userId = UserId,
			onFadeOut = p1.onBillboardFadeOut,
			voiceEnabled = p1.props.voiceEnabled and p2,
			getIconVoiceIndicator = p1.props.getIconVoiceIndicator,
			onClickedVoiceIndicator = p1.props.onClickedVoiceIndicator,
			onClickedCameraIndicator = p1.props.onClickedCameraIndicator,
			selfViewListenerChanged = p1.props.selfViewListenerChanged,
			hasCameraPermissions = p1.state.hasCameraPermissions,
			hasMicPermissions = p1.state.hasMicPermissions,
			displayCameraDeniedToast = p1.props.displayCameraDeniedToast,
			isCamEnabledForUserAndPlace = p1.props.isCamEnabledForUserAndPlace,
			isCameraOnlyUser = p1.props.isCameraOnlyUser,
			setCameraPermissionStateFromControl = p1.setCameraPermissionStateFromControl,
			getPermissions = p1.props.getPermissions,
			isBubbleChatEnabled = if FFlagExpChatUseMessagesStore then nil else p1.props.isBubbleChatEnabled,
			voiceState = p1.props.voiceParticipants[UserId],
			partOrModel = p1.props.mockUserIdToPartOrModel[UserId],
			isTextChatServiceOn = p1.props.isTextChatServiceOn,
			billboardUpdateFrequency = p1.state.billboardUpdateFrequency
		}), "BubbleChat_" .. UserId
	end))
end

local function mapStateToProps(p2, p3)
	-- upvalues: FFlagExpChatUseMessagesStore (copy), ExpChatSharedModule (copy), ExpChatRemoveBubbleChatAppUserMessagesState (copy), GetFFlagUseCharacterStoreFunction (copy), GetFFlagExpChatUseVoiceParticipantsStoreFunction (copy)
	local Enabled = if FFlagExpChatUseMessagesStore then nil elseif p3.isTextChatServiceOn then p2.BubbleChatSettings.Enabled else p2.LegacyBubbleChatSettings.Enabled
	local MockUserIdToPartOrModel = p2.Messages.mockUserIdToPartOrModel
	
	if FFlagExpChatUseMessagesStore then
		if p3.mockUserIdToPartOrModel then
			MockUserIdToPartOrModel = p3.mockUserIdToPartOrModel
		else
			local Context = ExpChatSharedModule.context
			local MessagesStore = Context and Context.messagesStore
			
			if MessagesStore then
				MockUserIdToPartOrModel = MessagesStore.getMockUserIdToPartOrModel(false)
			end
		end
	end
	return {
		isBubbleChatEnabled = if FFlagExpChatUseMessagesStore then nil else Enabled,
		userMessages = if ExpChatRemoveBubbleChatAppUserMessagesState then nil else p2.Messages.messagesBySenderId,
		voiceEnabled = p2.Voice.isEnabled,
		characters = if GetFFlagUseCharacterStoreFunction() then nil else p2.Players.charactersByUserId,
		voiceParticipants = if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then nil else p2.Voice.participants,
		mockUserIdToPartOrModel = MockUserIdToPartOrModel
	}
end

if GetFFlagUseCharacterStoreFunction() or GetFFlagExpChatUseVoiceParticipantsStoreFunction() then
	local v1 = RoactRoduxModule.connect(mapStateToProps)(BubbleChatApp)
	
	return if MemoizeBubbleChatApp then ReactModule.memo(WithSignalsDataModule(v1)) else WithSignalsDataModule(v1)
else
	return if MemoizeBubbleChatApp then ReactModule.memo(RoactRoduxModule.connect(mapStateToProps)(BubbleChatApp)) else RoactRoduxModule.connect(mapStateToProps)(BubbleChatApp)
end