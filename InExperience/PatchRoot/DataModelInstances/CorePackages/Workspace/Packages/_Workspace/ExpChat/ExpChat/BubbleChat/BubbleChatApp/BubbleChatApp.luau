local playersService = game:GetService("Players")
local voiceChatService = game:GetService("VoiceChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local IXPServiceWrapperModule = require(expChat.IXPServiceWrapper)
local expChatSharedModule = require(parent.ExpChatShared)
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
local roactRoduxModule = require(parent.RoactRodux)
local dictionary = require(parent.llama).Dictionary
local none = require(parent.llama).None
local sharedFlagsModule = require(parent.SharedFlags)
local var1 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)
local bubbleChat = script:FindFirstAncestor("BubbleChat")
local withSignalsDataModule = require(script.Parent.withSignalsData)
local permissions = require(expChat.Config).Permissions
local globalFlagsModule = require(expChat.GlobalFlags)
local getFFlagUseCharacterStore = expChatSharedModule.Flags.getFFlagUseCharacterStore
local expChatRemoveBubbleChatAppUserMessagesState = game:DefineFastFlag("ExpChatRemoveBubbleChatAppUserMessagesState", false)
local fFlagExpChatUseMessagesStore = require(parent.SharedFlags).FFlagExpChatUseMessagesStore
local memoizeBubbleChatApp = game:DefineFastFlag("MemoizeBubbleChatApp", false)
local getFFlagExpChatUseVoiceParticipantsStore = sharedFlagsModule.GetFFlagExpChatUseVoiceParticipantsStore
local expChatBubbleChatRerenderOnAncestryChange = game:DefineFastFlag("ExpChatBubbleChatRerenderOnAncestryChange", false)
local bubbleChatApp = roactModule.PureComponent:extend("BubbleChatApp")
local getFStringVoicePerformanceIXPLayerNameModule = require(expChat.Flags.GetFStringVoicePerformanceIXPLayerName)
local billboardUpdateFrequencyIXPLayerValue = game:DefineFastString("BillboardUpdateFrequencyIXPLayerValue", "BillboardUpdateFrequency")
local billboardGuiModule = require(bubbleChat.BillboardGui)

if not expChatRemoveBubbleChatAppUserMessagesState then
	function bubbleChatApp.getDerivedStateFromProps(p1, p2)
		-- upvalues: dictionary (ref)
		return {
			userMessages = dictionary.join(p2.userMessages or {}, p1.userMessages)
		}
	end
end
function bubbleChatApp.init(p1)
	-- upvalues: var1 (ref), expChatRemoveBubbleChatAppUserMessagesState (ref), dictionary (ref), none (ref), expChatBubbleChatRerenderOnAncestryChange (ref), IXPServiceWrapperModule (ref), getFStringVoicePerformanceIXPLayerNameModule (ref), billboardUpdateFrequencyIXPLayerValue (ref)
	var1:debug("Initializing")
	p1:setState({
		localPlayerVoiceEnabled = false,
		billboardUpdateFrequency = -1,
		userMessages = if expChatRemoveBubbleChatAppUserMessagesState then nil else {}
	})
	
	function p2.onBillboardFadeOut(p2)
		-- upvalues: expChatRemoveBubbleChatAppUserMessagesState (copy), p1 (ref), dictionary (copy), none (copy)
		if not expChatRemoveBubbleChatAppUserMessagesState then
			p1:setState({
				userMessages = dictionary.join(p1.state.userMessages, { [p2] = none })
			})
		end
	end
	
	function p2.setCameraPermissionStateFromControl(p2)
		-- upvalues: p1 (ref)
		p1:setState({ hasCameraPermissions = p2 })
	end
	
	if expChatBubbleChatRerenderOnAncestryChange then
		p1.isMounted = false
		p1.ancestryConnections = {}
		
		function p2.onTrackedAncestryChanged()
			-- upvalues: p1 (ref)
			if p1.isMounted then
				p1:setState(function(p2)
					return {
						ancestryRerenderToken = (p2.ancestryRerenderToken or 0) + 1
					}
				end)
			end
		end
	end
	local ok, status = pcall(function()
		-- upvalues: IXPServiceWrapperModule (copy), getFStringVoicePerformanceIXPLayerNameModule (copy)
		return IXPServiceWrapperModule:GetLayerData(getFStringVoicePerformanceIXPLayerNameModule())
	end)
	
	if ok and status and status[billboardUpdateFrequencyIXPLayerValue] then
		p1:setState({
			billboardUpdateFrequency = status[billboardUpdateFrequencyIXPLayerValue]
		})
	end
end

function bubbleChatApp.getPermissions(p1)
	local var2 = function(p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({ hasCameraPermissions = p2, hasMicPermissions = p3 })
	end
	
	if p1.props.getPermissions then
		p1.props.getPermissions(var2)
	end
end

function bubbleChatApp.getMicPermission(p1)
	-- upvalues: permissions (ref)
	local var2 = function(_, p2)
		-- upvalues: p1 (ref)
		p1:setState({ hasMicPermissions = p2 })
	end
	
	if p1.props.getPermissions then
		p1.props.getPermissions(var2, permissions.MICROPHONE_ACCESS)
	end
end

function bubbleChatApp.getCameraPermissionWithoutRequest(p1)
	-- upvalues: permissions (ref)
	local var2 = function(p2, _)
		-- upvalues: p1 (ref)
		p1:setState({ hasCameraPermissions = p2 })
	end
	
	if p1.props.getPermissions then
		p1.props.getPermissions(var2, permissions.CAMERA_ACCESS, true)
	end
end

function bubbleChatApp.updateTrackedAncestryConnections(p1)
	local t = {}
	
	if p1.props.characters then
		for i, v in pairs(p1.props.characters) do
			if v then
				t[v] = true
			end
		end
	end
	if p1.props.mockUserIdToPartOrModel then
		for i, v in pairs(p1.props.mockUserIdToPartOrModel) do
			if v then
				t[v] = true
			end
		end
	end
	for i in pairs(t) do
		if not p1.ancestryConnections[i] then
			p1.ancestryConnections[i] = i.AncestryChanged:Connect(p1.onTrackedAncestryChanged)
		end
	end
	for i_1, v in pairs(p1.ancestryConnections) do
		if not t[i_1] then
			v:Disconnect()
			p1.ancestryConnections[i_1] = nil
		end
	end
end

function bubbleChatApp.didMount(p2)
	-- upvalues: expChatBubbleChatRerenderOnAncestryChange (ref), globalFlagsModule (ref), var1 (ref), playersService (ref), voiceChatService (ref), IXPServiceWrapperModule (ref), getFStringVoicePerformanceIXPLayerNameModule (ref)
	if expChatBubbleChatRerenderOnAncestryChange then
		p2.isMounted = true
		p2:updateTrackedAncestryConnections()
	end
	if globalFlagsModule.AvatarChatEnabled or globalFlagsModule.ChromeEnabled then
		if p2.props.isVoiceServiceInitialized then
			p2.props.isVoiceServiceInitialized():andThen(function()
				-- upvalues: p2 (ref)
				p2:getMicPermission()
			end):catch(function()
				-- upvalues: var1 (copy)
				var1:debug("VoiceChatServiceManager failed to initialize inside TextChatService bubblechat")
			end)
		else
			p2:getMicPermission()
		end
		p2:getCameraPermissionWithoutRequest()
	end
	task.spawn(function()
		-- upvalues: playersService (copy), voiceChatService (copy), var1 (copy), p2 (ref), IXPServiceWrapperModule (copy), getFStringVoicePerformanceIXPLayerNameModule (copy)
		local ok, status = pcall(function()
			-- upvalues: playersService (copy), voiceChatService (copy)
			return if playersService.LocalPlayer then voiceChatService:IsVoiceEnabledForUserIdAsync(playersService.LocalPlayer.UserId) else false
		end)
		
		if not ok then
			var1:debug("Unable to get voice enabled status: ", status)
			
			return
		elseif status then
			p2:setState({ localPlayerVoiceEnabled = true })
			IXPServiceWrapperModule:LogUserLayerExposure(getFStringVoicePerformanceIXPLayerNameModule())
		end
	end)
end

function bubbleChatApp.didUpdate(p2)
	-- upvalues: expChatBubbleChatRerenderOnAncestryChange (ref)
	if expChatBubbleChatRerenderOnAncestryChange then
		p2:updateTrackedAncestryConnections()
	end
end

function bubbleChatApp.willUnmount(p2)
	-- upvalues: expChatBubbleChatRerenderOnAncestryChange (ref)
	if expChatBubbleChatRerenderOnAncestryChange then
		p2.isMounted = false
		
		for i, v in pairs(p2.ancestryConnections) do
			v:Disconnect()
			p2.ancestryConnections[i] = nil
		end
	end
end

function bubbleChatApp.render(p3)
	-- upvalues: globalFlagsModule (ref), playersService (ref), roactModule (ref), dictionary (ref), billboardGuiModule (ref), fFlagExpChatUseMessagesStore (ref)
	local t = {}
	
	if p3.props.characters then
		for i, v in pairs(p3.props.characters) do
			if v and v:IsDescendantOf(workspace) then
				t[i] = false
			end
		end
	end
	if p3.props.mockUserIdToPartOrModel then
		for i, v in pairs(p3.props.mockUserIdToPartOrModel) do
			if v and v:IsDescendantOf(workspace) then
				t[i] = false
			end
		end
	end
	if p3.props.voiceParticipants then
		for i, v in pairs(p3.props.voiceParticipants) do
			if v ~= "Hidden" then
				t[i] = true
			end
		end
	end
	if globalFlagsModule.AvatarChatEnabled and p3.state.hasCameraPermissions and playersService.LocalPlayer then
		t[tostring(playersService.LocalPlayer.UserId)] = true
	end
	return roactModule.createElement("ScreenGui", { ResetOnSpawn = false }, dictionary.map(t, function(p4, p5)
		-- upvalues: roactModule (copy), billboardGuiModule (copy), p3 (ref), fFlagExpChatUseMessagesStore (copy)
		return roactModule.createElement(billboardGuiModule, {
			userId = p5,
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
			isBubbleChatEnabled = if fFlagExpChatUseMessagesStore then nil else p3.props.isBubbleChatEnabled,
			voiceState = p3.props.voiceParticipants[p5],
			partOrModel = p3.props.mockUserIdToPartOrModel[p5],
			isTextChatServiceOn = p3.props.isTextChatServiceOn,
			billboardUpdateFrequency = p3.state.billboardUpdateFrequency
		}), "BubbleChat_" .. p19
	end))
end

local function mapStateToProps(p4, p5)
	-- upvalues: fFlagExpChatUseMessagesStore (ref), expChatSharedModule (ref), expChatRemoveBubbleChatAppUserMessagesState (ref), getFFlagUseCharacterStore (ref), getFFlagExpChatUseVoiceParticipantsStore (ref)
	local var2 = if not fFlagExpChatUseMessagesStore then if p5.isTextChatServiceOn then p4.BubbleChatSettings.Enabled else p4.LegacyBubbleChatSettings.Enabled else nil
	local mockUserIdToPartOrModel = p4.Messages.mockUserIdToPartOrModel
	
	if fFlagExpChatUseMessagesStore then
		if p5.mockUserIdToPartOrModel then
			mockUserIdToPartOrModel = p5.mockUserIdToPartOrModel
		else
			local context = expChatSharedModule.context
			local messagesStore = context and context.messagesStore
			
			if messagesStore then
				mockUserIdToPartOrModel = messagesStore.getMockUserIdToPartOrModel(false)
			end
		end
	end
	return {
		isBubbleChatEnabled = if fFlagExpChatUseMessagesStore then nil else var2,
		userMessages = if expChatRemoveBubbleChatAppUserMessagesState then nil else p4.Messages.messagesBySenderId,
		voiceEnabled = p4.Voice.isEnabled,
		characters = if getFFlagUseCharacterStore() then nil else p4.Players.charactersByUserId,
		voiceParticipants = if getFFlagExpChatUseVoiceParticipantsStore() then nil else p4.Voice.participants,
		mockUserIdToPartOrModel = mockUserIdToPartOrModel
	}
end

if getFFlagUseCharacterStore() or getFFlagExpChatUseVoiceParticipantsStore() then
	local var2 = roactRoduxModule.connect(mapStateToProps)(bubbleChatApp)
	
	return if memoizeBubbleChatApp then reactModule.memo(withSignalsDataModule(var2)) else withSignalsDataModule(var2)
end
return if memoizeBubbleChatApp then reactModule.memo(roactRoduxModule.connect(mapStateToProps)(bubbleChatApp)) else roactRoduxModule.connect(mapStateToProps)(bubbleChatApp)