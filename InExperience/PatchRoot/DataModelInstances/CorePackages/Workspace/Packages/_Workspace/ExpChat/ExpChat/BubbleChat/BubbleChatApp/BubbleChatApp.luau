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
local bubbleChatApp = roactModule.PureComponent:extend("BubbleChatApp")
local getFStringVoicePerformanceIXPLayerNameModule = require(expChat.Flags.GetFStringVoicePerformanceIXPLayerName)
local billboardUpdateFrequencyIXPLayerValue = game:DefineFastString("BillboardUpdateFrequencyIXPLayerValue", "BillboardUpdateFrequency")
local billboardGuiModule = require(bubbleChat.BillboardGui)

if not expChatRemoveBubbleChatAppUserMessagesState then
	function bubbleChatApp.getDerivedStateFromProps(p0, p1) --[[ line: 40 ]]
		-- upvalues: dictionary (ref)
		return {
			userMessages = dictionary.join(p1.userMessages or {}, p0.userMessages)
		}
	end
end
function bubbleChatApp.init(p2) --[[ line: 50 ]]
	-- upvalues: var9 (ref), expChatRemoveBubbleChatAppUserMessagesState (ref), dictionary (ref), none (ref), IXPServiceWrapperModule (ref), getFStringVoicePerformanceIXPLayerNameModule (ref), billboardUpdateFrequencyIXPLayerValue (ref)
	var9:debug("Initializing")
	p2:setState({
		localPlayerVoiceEnabled = false,
		billboardUpdateFrequency = -1,
		userMessages = if expChatRemoveBubbleChatAppUserMessagesState then nil else {}
	})
	
	function p2.onBillboardFadeOut(p3) --[[ line: 58 ]]
		-- upvalues: expChatRemoveBubbleChatAppUserMessagesState (copy), p2 (ref), dictionary (copy), none (copy)
		if not expChatRemoveBubbleChatAppUserMessagesState then
			p2:setState({
				userMessages = dictionary.join(p2.state.userMessages, { [p3] = none })
			})
		end
	end
	
	function p2.setCameraPermissionStateFromControl(p4) --[[ line: 66 ]]
		-- upvalues: p2 (ref)
		p2:setState({ hasCameraPermissions = p4 })
	end
	
	local ok, status = pcall(function() --[[ line: 72 ]]
		-- upvalues: IXPServiceWrapperModule (copy), getFStringVoicePerformanceIXPLayerNameModule (copy)
		return IXPServiceWrapperModule:GetLayerData(getFStringVoicePerformanceIXPLayerNameModule())
	end)
	
	if ok and status and status[billboardUpdateFrequencyIXPLayerValue] then
		p2:setState({
			billboardUpdateFrequency = status[billboardUpdateFrequencyIXPLayerValue]
		})
	end
end

function bubbleChatApp.getPermissions(p5) --[[ line: 86 ]]
	local var21 = function(p6, p7) --[[ line: 87 ]]
		-- upvalues: p5 (ref)
		p5:setState({ hasCameraPermissions = p6, hasMicPermissions = p7 })
	end
	
	if p5.props.getPermissions then
		p5.props.getPermissions(var21)
	end
end

function bubbleChatApp.getMicPermission(p8) --[[ line: 102 ]]
	-- upvalues: permissions (ref)
	local var22 = function(_, p9) --[[ line: 103 ]]
		-- upvalues: p8 (ref)
		p8:setState({ hasMicPermissions = p9 })
	end
	
	if p8.props.getPermissions then
		p8.props.getPermissions(var22, permissions.MICROPHONE_ACCESS)
	end
end

function bubbleChatApp.getCameraPermissionWithoutRequest(p10) --[[ line: 117 ]]
	-- upvalues: permissions (ref)
	local var23 = function(p11, _) --[[ line: 118 ]]
		-- upvalues: p10 (ref)
		p10:setState({ hasCameraPermissions = p11 })
	end
	
	if p10.props.getPermissions then
		p10.props.getPermissions(var23, permissions.CAMERA_ACCESS, true)
	end
end

function bubbleChatApp.didMount(p12) --[[ line: 130 ]]
	-- upvalues: globalFlagsModule (ref), var9 (ref), playersService (ref), voiceChatService (ref), IXPServiceWrapperModule (ref), getFStringVoicePerformanceIXPLayerNameModule (ref)
	if globalFlagsModule.AvatarChatEnabled or globalFlagsModule.ChromeEnabled then
		if p12.props.isVoiceServiceInitialized then
			p12.props.isVoiceServiceInitialized():andThen(function() --[[ line: 137 ]]
				-- upvalues: p12 (ref)
				p12:getMicPermission()
			end):catch(function() --[[ line: 140 ]]
				-- upvalues: var9 (copy)
				var9:debug("VoiceChatServiceManager failed to initialize inside TextChatService bubblechat")
			end)
		else
			p12:getMicPermission()
		end
		p12:getCameraPermissionWithoutRequest()
	end
	task.spawn(function() --[[ line: 149 ]]
		-- upvalues: playersService (copy), voiceChatService (copy), var9 (copy), p12 (ref), IXPServiceWrapperModule (copy), getFStringVoicePerformanceIXPLayerNameModule (copy)
		local ok, status = pcall(function() --[[ line: 150 ]]
			-- upvalues: playersService (copy), voiceChatService (copy)
			return if playersService.LocalPlayer then voiceChatService:IsVoiceEnabledForUserIdAsync(playersService.LocalPlayer.UserId) else false
		end)
		
		if not ok then
			var9:debug("Unable to get voice enabled status: ", status)
			
			return
		elseif status then
			p12:setState({ localPlayerVoiceEnabled = true })
			IXPServiceWrapperModule:LogUserLayerExposure(getFStringVoicePerformanceIXPLayerNameModule())
		end
	end)
end

function bubbleChatApp.render(p13) --[[ line: 171 ]]
	-- upvalues: globalFlagsModule (ref), playersService (ref), roactModule (ref), dictionary (ref), billboardGuiModule (ref), fFlagExpChatUseMessagesStore (ref)
	local t = {}
	
	if p13.props.characters then
		for i, v in pairs(p13.props.characters) do
			if v and v:IsDescendantOf(workspace) then
				t[i] = false
			end
		end
	end
	if p13.props.mockUserIdToPartOrModel then
		for i, v in pairs(p13.props.mockUserIdToPartOrModel) do
			if v and v:IsDescendantOf(workspace) then
				t[i] = false
			end
		end
	end
	if p13.props.voiceParticipants then
		for i, v in pairs(p13.props.voiceParticipants) do
			if v ~= "Hidden" then
				t[i] = true
			end
		end
	end
	if globalFlagsModule.AvatarChatEnabled and p13.state.hasCameraPermissions and playersService.LocalPlayer then
		t[tostring(playersService.LocalPlayer.UserId)] = true
	end
	return roactModule.createElement("ScreenGui", { ResetOnSpawn = false }, dictionary.map(t, function(p14, p15) --[[ line: 216 ]]
		-- upvalues: roactModule (copy), billboardGuiModule (copy), p13 (ref), fFlagExpChatUseMessagesStore (copy)
		return roactModule.createElement(billboardGuiModule, {
			userId = p15,
			onFadeOut = p13.onBillboardFadeOut,
			voiceEnabled = p13.props.voiceEnabled and p14,
			getIconVoiceIndicator = p13.props.getIconVoiceIndicator,
			onClickedVoiceIndicator = p13.props.onClickedVoiceIndicator,
			onClickedCameraIndicator = p13.props.onClickedCameraIndicator,
			selfViewListenerChanged = p13.props.selfViewListenerChanged,
			hasCameraPermissions = p13.state.hasCameraPermissions,
			hasMicPermissions = p13.state.hasMicPermissions,
			displayCameraDeniedToast = p13.props.displayCameraDeniedToast,
			isCamEnabledForUserAndPlace = p13.props.isCamEnabledForUserAndPlace,
			isCameraOnlyUser = p13.props.isCameraOnlyUser,
			setCameraPermissionStateFromControl = p13.setCameraPermissionStateFromControl,
			getPermissions = p13.props.getPermissions,
			isBubbleChatEnabled = if fFlagExpChatUseMessagesStore then nil else p13.props.isBubbleChatEnabled,
			voiceState = p13.props.voiceParticipants[p15],
			partOrModel = p13.props.mockUserIdToPartOrModel[p15],
			isTextChatServiceOn = p13.props.isTextChatServiceOn,
			billboardUpdateFrequency = p13.state.billboardUpdateFrequency
		}), "BubbleChat_" .. p15
	end))
end

local function mapStateToProps(p16, p17) --[[ line: 243 ]]
	-- upvalues: fFlagExpChatUseMessagesStore (ref), expChatSharedModule (ref), expChatRemoveBubbleChatAppUserMessagesState (ref), getFFlagUseCharacterStore (ref), getFFlagExpChatUseVoiceParticipantsStore (ref)
	local var25 = if not fFlagExpChatUseMessagesStore then if p17.isTextChatServiceOn then p16.BubbleChatSettings.Enabled else p16.LegacyBubbleChatSettings.Enabled else nil
	local mockUserIdToPartOrModel = p16.Messages.mockUserIdToPartOrModel
	
	if fFlagExpChatUseMessagesStore then
		if p17.mockUserIdToPartOrModel then
			mockUserIdToPartOrModel = p17.mockUserIdToPartOrModel
		else
			local context = expChatSharedModule.context
			local messagesStore = context and context.messagesStore
			
			if messagesStore then
				mockUserIdToPartOrModel = messagesStore.getMockUserIdToPartOrModel(false)
			end
		end
	end
	return {
		isBubbleChatEnabled = if fFlagExpChatUseMessagesStore then nil else var25,
		userMessages = if expChatRemoveBubbleChatAppUserMessagesState then nil else p16.Messages.messagesBySenderId,
		voiceEnabled = p16.Voice.isEnabled,
		characters = if getFFlagUseCharacterStore() then nil else p16.Players.charactersByUserId,
		voiceParticipants = if getFFlagExpChatUseVoiceParticipantsStore() then nil else p16.Voice.participants,
		mockUserIdToPartOrModel = mockUserIdToPartOrModel
	}
end

if getFFlagUseCharacterStore() or getFFlagExpChatUseVoiceParticipantsStore() then
	local var20 = roactRoduxModule.connect(mapStateToProps)(bubbleChatApp)
	
	return if memoizeBubbleChatApp then reactModule.memo(withSignalsDataModule(var20)) else withSignalsDataModule(var20)
end
return if memoizeBubbleChatApp then reactModule.memo(roactRoduxModule.connect(mapStateToProps)(bubbleChatApp)) else roactRoduxModule.connect(mapStateToProps)(bubbleChatApp)