local Parent = script:FindFirstAncestor("ExpChat").Parent
local NewResult = require(Parent.ExpChatShared).Logger:new("ExpChat/" .. script.Name)
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local UIBloxModule = require(Parent.UIBlox)
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local GetVoiceIndicatorIconModule = require(script:FindFirstAncestor("BubbleChat").Helpers.getVoiceIndicatorIcon)
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local GetFFlagExpChatUseVoiceParticipantsStoreFunction = require(Parent.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore
local VoiceIndicator = RoactModule.PureComponent:extend("VoiceIndicator")
VoiceIndicator.defaultProps = {}

function VoiceIndicator.init(p1) --[[ Line: 48 ]]
	-- upvalues: RoactModule (copy), HttpService (copy), RunService (copy), GetVoiceIndicatorIconModule (copy)
	p1.level, p1.updateLevel = RoactModule.createBinding(0)
	p1.voiceState, p1.updateVoiceState = RoactModule.createBinding(p1.props.voiceState)
	p1.renderStepName = HttpService:GenerateGUID()
	RunService:BindToRenderStep(p1.renderStepName, 1, function() --[[ Line: 55 ]]
		-- upvalues: p1 (copy)
		p1.updateLevel(math.random())
	end)
	p1.levelIcon = RoactModule.joinBindings({ p1.voiceState, p1.level }):map(function(Entry) --[[ Line: 59 ]]
		-- upvalues: GetVoiceIndicatorIconModule (upval), p1 (copy)
		return GetVoiceIndicatorIconModule(p1.props.getIcon, Entry[1], Entry[2], p1.props.iconStyle)
	end)
	
	function p1.onClicked() --[[ Line: 66 ]]
		-- upvalues: p1 (copy)
		if p1.props.onClicked and p1.props.userId then
			p1.props.onClicked(p1.props.userId)
		end
	end
end

function VoiceIndicator.renderWithSelectionCursor(p1, Callback) --[[ Line: 73 ]]
	-- upvalues: RoactModule (copy), CursorKind (copy)
	local IsError: boolean = p1.props.voiceState == "Error" or p1.props.voiceState == "Hidden"
	
	if p1.props.hideOnError and (not p1.props.voiceState or IsError) then
		return nil
	end
	local MapResult = if p1.props.voiceState == "LOCAL_MUTED" then 0.5 else 0
	
	if p1.props.iconTransparency then
		MapResult = if type(p1.props.iconTransparency) == "number" then 1 - (1 - p1.props.iconTransparency) * (1 - MapResult) else p1.props.iconTransparency:map(function(p2: number): number --[[ Line: 84 ]]
			-- upvalues: MapResult (copy)
			return 1 - (1 - p2) * (1 - MapResult)
		end)
	end
	return RoactModule.createElement("ImageButton", {
		Size = p1.props.size or UDim2.fromOffset(28, 28),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = p1.levelIcon,
		ImageTransparency = MapResult,
		SelectionImageObject = Callback(CursorKind.RoundedRectNoInset),
		[RoactModule.Event.Activated] = p1.onClicked
	})
end

function VoiceIndicator.render(p1) --[[ Line: 103 ]]
	-- upvalues: WithSelectionCursorProviderFunction (copy)
	return WithSelectionCursorProviderFunction(function(p2) --[[ Line: 104 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function VoiceIndicator.didUpdate(p1, p2, _) --[[ Line: 109 ]]
	-- upvalues: NewResult (copy)
	NewResult:trace("Voice state updated to {} for ...{}", p1.props.voiceState, (string.sub(tostring(p1.props.userId), -4)))
	
	if p2.voiceState ~= p1.props.voiceState then
		p1.updateVoiceState(p1.props.voiceState)
	end
end

function VoiceIndicator.willUnmount(p1) --[[ Line: 121 ]]
	-- upvalues: RunService (copy)
	pcall(function() --[[ Line: 122 ]]
		-- upvalues: RunService (upval), p1 (copy)
		RunService:UnbindFromRenderStep(p1.renderStepName)
	end)
end

local function mapStateToProps(p1, p2) --[[ Line: 127 ]]
	return { voiceState = p1.Voice.participants[p2.userId] }
end

return if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then VoiceIndicator else RoactRoduxModule.connect(mapStateToProps)(VoiceIndicator)