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
local var9 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)
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
	function bubbleChatApp.getDerivedStateFromProps(p0, p1) --[[ line: 42 ]]
		-- upvalues: dictionary (ref)
		return {
			userMessages = dictionary.join(p1.userMessages or {}, p0.userMessages)
		}
	end
end
function bubbleChatApp.init(p2) --[[ line: 52 ]]
	-- upvalues: var9 (ref), expChatRemoveBubbleChatAppUserMessagesState (ref), dictionary (ref), none (ref), expChatBubbleChatRerenderOnAncestryChange (ref), IXPServiceWrapperModule (ref), getFStringVoicePerformanceIXPLayerNameModule (ref), billboardUpdateFrequencyIXPLayerValue (ref)
	var9:debug("Initializing")
	p2:setState({
		localPlayerVoiceEnabled = false,
		billboardUpdateFrequency = -1,
		userMessages = if expChatRemoveBubbleChatAppUserMessagesState then nil else {}
	})
	
	function p2.onBillboardFadeOut(p3) --[[ line: 60 ]]
		-- upvalues: expChatRemoveBubbleChatAppUserMessagesState (copy), p2 (ref), dictionary (copy), none (copy)
		if not expChatRemoveBubbleChatAppUserMessagesState then
			p2:setState({
				userMessages = dictionary.join(p2.state.userMessages, { [p3] = none })
			})
		end
	end
	
	function p2.setCameraPermissionStateFromControl(p4) --[[ line: 68 ]]
		-- upvalues: p2 (ref)
		p2:setState({ hasCameraPermissions = p4 })
	end
	
	if expChatBubbleChatRerenderOnAncestryChange then
		p2.isMounted = false
		p2.ancestryConnections = {}
		
		function p2.onTrackedAncestryChanged() --[[ line: 77 ]]
			-- upvalues: p2 (ref)
			if p2.isMounted then
				p2:setState(function(p5) --[[ line: 81 ]]
					return {
						ancestryRerenderToken = (p5.ancestryRerenderToken or 0) + 1
					}
				end)
			end
		end
	end
	local ok, status = pcall(function() --[[ line: 88 ]]
		-- upvalues: IXPServiceWrapperModule (copy), getFStringVoicePerformanceIXPLayerNameModule (copy)
		return IXPServiceWrapperModule:GetLayerData(getFStringVoicePerformanceIXPLayerNameModule())
	end)
	
	if ok and status and status[billboardUpdateFrequencyIXPLayerValue] then
		p2:setState({
			billboardUpdateFrequency = status[billboardUpdateFrequencyIXPLayerValue]
		})
	end
end

function bubbleChatApp.getPermissions(p6) --[[ line: 102 ]]
	local var22 = function(p7, p8) --[[ line: 103 ]]
		-- upvalues: p6 (ref)
		p6:setState({ hasCameraPermissions = p7, hasMicPermissions = p8 })
	end
	
	if p6.props.getPermissions then
		p6.props.getPermissions(var22)
	end
end

function bubbleChatApp.getMicPermission(p9) --[[ line: 118 ]]
	-- upvalues: permissions (ref)
	local var23 = function(_, p10) --[[ line: 119 ]]
		-- upvalues: p9 (ref)
		p9:setState({ hasMicPermissions = p10 })
	end
	
	if p9.props.getPermissions then
		p9.props.getPermissions(var23, permissions.MICROPHONE_ACCESS)
	end
end

function bubbleChatApp.getCameraPermissionWithoutRequest(p11) --[[ line: 133 ]]
	-- upvalues: permissions (ref)
	local var24 = function(p12, _) --[[ line: 134 ]]
		-- upvalues: p11 (ref)
		p11:setState({ hasCameraPermissions = p12 })
	end
	
	if p11.props.getPermissions then
		p11.props.getPermissions(var24, permissions.CAMERA_ACCESS, true)
	end
end

function bubbleChatApp.updateTrackedAncestryConnections(p13) --[[ line: 148 ]]
	local t = {}
	
	if p13.props.characters then
		for i, v in pairs(p13.props.characters) do
			if v then
				t[v] = true
			end
		end
	end
	if p13.props.mockUserIdToPartOrModel then
		for i, v in pairs(p13.props.mockUserIdToPartOrModel) do
			if v then
				t[v] = true
			end
		end
	end
	for i in pairs(t) do
		if not p13.ancestryConnections[i] then
			p13.ancestryConnections[i] = i.AncestryChanged:Connect(p13.onTrackedAncestryChanged)
		end
	end
	for i_1, v in pairs(p13.ancestryConnections) do
		if not t[i_1] then
			v:Disconnect()
			p13.ancestryConnections[i_1] = nil
		end
	end
end

function bubbleChatApp.didMount(p14) --[[ line: 179 ]]
	-- upvalues: expChatBubbleChatRerenderOnAncestryChange (ref), globalFlagsModule (ref), var9 (ref), playersService (ref), voiceChatService (ref), IXPServiceWrapperModule (ref), getFStringVoicePerformanceIXPLayerNameModule (ref)
	if expChatBubbleChatRerenderOnAncestryChange then
		p14.isMounted = true
		p14:updateTrackedAncestryConnections()
	end
	if globalFlagsModule.AvatarChatEnabled or globalFlagsModule.ChromeEnabled then
		if p14.props.isVoiceServiceInitialized then
			p14.props.isVoiceServiceInitialized():andThen(function() --[[ line: 191 ]]
				-- upvalues: p14 (ref)
				p14:getMicPermission()
			end):catch(function() --[[ line: 194 ]]
				-- upvalues: var9 (copy)
				var9:debug("VoiceChatServiceManager failed to initialize inside TextChatService bubblechat")
			end)
		else
			p14:getMicPermission()
		end
		p14:getCameraPermissionWithoutRequest()
	end
	task.spawn(function() --[[ line: 203 ]]
		-- upvalues: playersService (copy), voiceChatService (copy), var9 (copy), p14 (ref), IXPServiceWrapperModule (copy), getFStringVoicePerformanceIXPLayerNameModule (copy)
		local ok, status = pcall(function() --[[ line: 204 ]]
			-- upvalues: playersService (copy), voiceChatService (copy)
			return if playersService.LocalPlayer then voiceChatService:IsVoiceEnabledForUserIdAsync(playersService.LocalPlayer.UserId) else false
		end)
		
		if not ok then
			var9:debug("Unable to get voice enabled status: ", status)
			
			return
		elseif status then
			p14:setState({ localPlayerVoiceEnabled = true })
			IXPServiceWrapperModule:LogUserLayerExposure(getFStringVoicePerformanceIXPLayerNameModule())
		end
	end)
end

function bubbleChatApp.didUpdate(p15) --[[ line: 225 ]]
	-- upvalues: expChatBubbleChatRerenderOnAncestryChange (ref)
	if expChatBubbleChatRerenderOnAncestryChange then
		p15:updateTrackedAncestryConnections()
	end
end

function bubbleChatApp.willUnmount(p16) --[[ line: 231 ]]
	-- upvalues: expChatBubbleChatRerenderOnAncestryChange (ref)
	if expChatBubbleChatRerenderOnAncestryChange then
		p16.isMounted = false
		
		for i, v in pairs(p16.ancestryConnections) do
			v:Disconnect()
			p16.ancestryConnections[i] = nil
		end
	end
end

function bubbleChatApp.render(p17) --[[ line: 241 ]]
	-- upvalues: globalFlagsModule (ref), playersService (ref), roactModule (ref), dictionary (ref), billboardGuiModule (ref), fFlagExpChatUseMessagesStore (ref)
	local t = {}
	
	if p17.props.characters then
		for i, v in pairs(p17.props.characters) do
			if v and v:IsDescendantOf(workspace) then
				t[i] = false
			end
		end
	end
	if p17.props.mockUserIdToPartOrModel then
		for i, v in pairs(p17.props.mockUserIdToPartOrModel) do
			if v and v:IsDescendantOf(workspace) then
				t[i] = false
			end
		end
	end
	if p17.props.voiceParticipants then
		for i, v in pairs(p17.props.voiceParticipants) do
			if v ~= "Hidden" then
				t[i] = true
			end
		end
	end
	if globalFlagsModule.AvatarChatEnabled and p17.state.hasCameraPermissions and playersService.LocalPlayer then
		t[tostring(playersService.LocalPlayer.UserId)] = true
	end
	return roactModule.createElement("ScreenGui", { ResetOnSpawn = false }, dictionary.map(t, function(p18, p19) --[[ line: 286 ]]
		-- upvalues: roactModule (copy), billboardGuiModule (copy), p17 (ref), fFlagExpChatUseMessagesStore (copy)
		return roactModule.createElement(billboardGuiModule, {
			userId = p19,
			onFadeOut = p17.onBillboardFadeOut,
			voiceEnabled = p17.props.voiceEnabled and p18,
			getIconVoiceIndicator = p17.props.getIconVoiceIndicator,
			onClickedVoiceIndicator = p17.props.onClickedVoiceIndicator,
			onClickedCameraIndicator = p17.props.onClickedCameraIndicator,
			selfViewListenerChanged = p17.props.selfViewListenerChanged,
			hasCameraPermissions = p17.state.hasCameraPermissions,
			hasMicPermissions = p17.state.hasMicPermissions,
			displayCameraDeniedToast = p17.props.displayCameraDeniedToast,
			isCamEnabledForUserAndPlace = p17.props.isCamEnabledForUserAndPlace,
			isCameraOnlyUser = p17.props.isCameraOnlyUser,
			setCameraPermissionStateFromControl = p17.setCameraPermissionStateFromControl,
			getPermissions = p17.props.getPermissions,
			isBubbleChatEnabled = if fFlagExpChatUseMessagesStore then nil else p17.props.isBubbleChatEnabled,
			voiceState = p17.props.voiceParticipants[p19],
			partOrModel = p17.props.mockUserIdToPartOrModel[p19],
			isTextChatServiceOn = p17.props.isTextChatServiceOn,
			billboardUpdateFrequency = p17.state.billboardUpdateFrequency
		}), "BubbleChat_" .. p19
	end))
end

local function mapStateToProps(p20, p21) --[[ line: 313 ]]
	-- upvalues: fFlagExpChatUseMessagesStore (ref), expChatSharedModule (ref), expChatRemoveBubbleChatAppUserMessagesState (ref), getFFlagUseCharacterStore (ref), getFFlagExpChatUseVoiceParticipantsStore (ref)
	local var27 = if not fFlagExpChatUseMessagesStore then if p21.isTextChatServiceOn then p20.BubbleChatSettings.Enabled else p20.LegacyBubbleChatSettings.Enabled else nil
	local mockUserIdToPartOrModel = p20.Messages.mockUserIdToPartOrModel
	
	if fFlagExpChatUseMessagesStore then
		if p21.mockUserIdToPartOrModel then
			mockUserIdToPartOrModel = p21.mockUserIdToPartOrModel
		else
			local context = expChatSharedModule.context
			local messagesStore = context and context.messagesStore
			
			if messagesStore then
				mockUserIdToPartOrModel = messagesStore.getMockUserIdToPartOrModel(false)
			end
		end
	end
	return {
		isBubbleChatEnabled = if fFlagExpChatUseMessagesStore then nil else var27,
		userMessages = if expChatRemoveBubbleChatAppUserMessagesState then nil else p20.Messages.messagesBySenderId,
		voiceEnabled = p20.Voice.isEnabled,
		characters = if getFFlagUseCharacterStore() then nil else p20.Players.charactersByUserId,
		voiceParticipants = if getFFlagExpChatUseVoiceParticipantsStore() then nil else p20.Voice.participants,
		mockUserIdToPartOrModel = mockUserIdToPartOrModel
	}
end

if getFFlagUseCharacterStore() or getFFlagExpChatUseVoiceParticipantsStore() then
	local var21 = roactRoduxModule.connect(mapStateToProps)(bubbleChatApp)
	
	return if memoizeBubbleChatApp then reactModule.memo(withSignalsDataModule(var21)) else withSignalsDataModule(var21)
end
return if memoizeBubbleChatApp then reactModule.memo(roactRoduxModule.connect(mapStateToProps)(bubbleChatApp)) else roactRoduxModule.connect(mapStateToProps)(bubbleChatApp)