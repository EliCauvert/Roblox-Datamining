local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local v1 = require(RobloxGui.Modules.VoiceChat.Logger)(script.Name)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactIsModule = require(CorePackages.Packages.ReactIs)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local ConstantsModule = require(RobloxGui.Modules.VoiceChat.Constants)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local VoiceIndicator = RoactModule.PureComponent:extend("VoiceIndicator")
VoiceIndicator.validateProps = TModule.strictInterface({
	onClicked = TModule.optional(TModule.callback),
	userId = TModule.string,
	hideOnError = TModule.optional(TModule.boolean),
	size = TModule.optional(TModule.UDim2),
	iconStyle = TModule.optional(TModule.union(TModule.literal("MicDark"), TModule.literal("MicLight"), TModule.literal("SpeakerDark"), TModule.literal("SpeakerLight"))),
	iconTransparency = TModule.optional(TModule.union(TModule.number, TModule.table)),
	voiceState = TModule.string
})
VoiceIndicator.defaultProps = {}

function VoiceIndicator:getIcon(Text): string --[[ Line: 47 ]]
	return "rbxasset://textures/ui/VoiceChat/" .. Text .. ".png"
end

function VoiceIndicator.init(p1) --[[ Line: 51 ]]
	-- upvalues: RoactModule (copy), HttpService (copy), RunService (copy), ConstantsModule (copy), Default (copy)
	p1.level, p1.updateLevel = RoactModule.createBinding(0)
	p1.voiceState, p1.updateVoiceState = RoactModule.createBinding(p1.props.voiceState)
	p1.renderStepName = HttpService:GenerateGUID()
	RunService:BindToRenderStep(p1.renderStepName, 1, function() --[[ Line: 58 ]]
		-- upvalues: p1 (copy)
		p1.updateLevel(math.random())
	end)
	p1.levelIcon = RoactModule.joinBindings({ p1.voiceState, p1.level }):map(function(Entry) --[[ Line: 62 ]]
		-- upvalues: ConstantsModule (upval), Default (upval), p1 (copy)
		local Entry1 = Entry[1]
		local Entry2: number = Entry[2]
		
		return if Entry1 == ConstantsModule.VOICE_STATE.MUTED or Entry1 == ConstantsModule.VOICE_STATE.LOCAL_MUTED then Default:GetIcon("Muted", p1.props.iconStyle) elseif Entry1 == ConstantsModule.VOICE_STATE.CONNECTING then Default:GetIcon("Connecting", p1.props.iconStyle) elseif Entry1 == ConstantsModule.VOICE_STATE.INACTIVE then Default:GetIcon("Unmuted0", p1.props.iconStyle) elseif Entry1 == ConstantsModule.VOICE_STATE.TALKING then Default:GetIcon("Unmuted" .. tostring(math.floor(Entry2 * 5 + 0.5) * 20), p1.props.iconStyle) else Default:GetIcon("Error", p1.props.iconStyle)
	end)
end

function VoiceIndicator.renderWithSelectionCursor(p1, Callback) --[[ Line: 82 ]]
	-- upvalues: ConstantsModule (copy), ReactIsModule (copy), RoactModule (copy), CursorKind (copy)
	local IsVoiceStateMatch: boolean = p1.props.voiceState == ConstantsModule.VOICE_STATE.ERROR or p1.props.voiceState == ConstantsModule.VOICE_STATE.HIDDEN
	
	if p1.props.hideOnError and (not p1.props.voiceState or IsVoiceStateMatch) then
		return nil
	end
	local MapResult = if p1.props.voiceState == ConstantsModule.VOICE_STATE.LOCAL_MUTED then 0.5 else 0
	
	if p1.props.iconTransparency then
		MapResult = if ReactIsModule.isBinding(p1.props.iconTransparency) then p1.props.iconTransparency:map(function(p2: number): number --[[ Line: 94 ]]
			-- upvalues: MapResult (copy)
			return 1 - (1 - p2) * (1 - MapResult)
		end) else 1 - (1 - p1.props.iconTransparency) * (1 - MapResult)
	end
	return RoactModule.createElement("ImageButton", {
		Size = p1.props.size or UDim2.fromOffset(28, 28),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = p1.levelIcon,
		ImageTransparency = MapResult,
		SelectionImageObject = Callback(CursorKind.RoundedRectNoInset),
		[RoactModule.Event.Activated] = p1.props.onClicked
	})
end

function VoiceIndicator.render(p1) --[[ Line: 113 ]]
	-- upvalues: WithSelectionCursorProviderFunction (copy)
	return WithSelectionCursorProviderFunction(function(p2) --[[ Line: 114 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function VoiceIndicator.didUpdate(p1, p2, _) --[[ Line: 119 ]]
	-- upvalues: v1 (copy)
	v1:trace("Voice state updated to {} for ...{}", p1.props.voiceState, (string.sub(tostring(p1.props.userId), -4)))
	
	if p2.voiceState ~= p1.props.voiceState then
		p1.updateVoiceState(p1.props.voiceState)
	end
end

function VoiceIndicator.willUnmount(p1) --[[ Line: 126 ]]
	-- upvalues: RunService (copy)
	pcall(function() --[[ Line: 127 ]]
		-- upvalues: RunService (upval), p1 (copy)
		RunService:UnbindFromRenderStep(p1.renderStepName)
	end)
end

return RoactRoduxModule.connect(function(p1, p2) --[[ Line: 132 | Named "mapStateToProps" ]]
	return { voiceState = p1.voiceState[p2.userId] }
end)(VoiceIndicator)