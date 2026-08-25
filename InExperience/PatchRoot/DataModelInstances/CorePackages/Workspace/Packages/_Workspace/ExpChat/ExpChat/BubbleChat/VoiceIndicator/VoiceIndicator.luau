local parent = script:FindFirstAncestor("ExpChat").Parent
local var0 = require(parent.ExpChatShared).Logger:new("ExpChat/" .. script.Name)
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local UIBloxModule = require(parent.UIBlox)
local withSelectionCursorProvider = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local getVoiceIndicatorIconModule = require(script:FindFirstAncestor("BubbleChat").Helpers.getVoiceIndicatorIcon)
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local getFFlagExpChatUseVoiceParticipantsStore = require(parent.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore
local voiceIndicator = roactModule.PureComponent:extend("VoiceIndicator")
voiceIndicator.defaultProps = {}

function voiceIndicator.init(p0)
	-- upvalues: roactModule (ref), httpService (ref), runService (ref), getVoiceIndicatorIconModule (ref)
	local var8, var9 = roactModule.createBinding(0)
	p0.level = var8
	p0.updateLevel = var9
	local var10, var11 = roactModule.createBinding(p0.props.voiceState)
	p0.voiceState = var10
	p0.updateVoiceState = var11
	p0.renderStepName = httpService:GenerateGUID()
	runService:BindToRenderStep(p0.renderStepName, 1, function()
		-- upvalues: p0 (ref)
		p0.updateLevel(math.random())
	end)
	p0.levelIcon = roactModule.joinBindings({ p0.voiceState, p0.level }):map(function(p1)
		-- upvalues: getVoiceIndicatorIconModule (copy), p0 (ref)
		return getVoiceIndicatorIconModule(p0.props.getIcon, p1[1], p1[2], p0.props.iconStyle)
	end)
	
	function p0.onClicked()
		-- upvalues: p0 (ref)
		if p0.props.onClicked and p0.props.userId then
			p0.props.onClicked(p0.props.userId)
		end
	end
end

function voiceIndicator.renderWithSelectionCursor(p2, p3)
	-- upvalues: roactModule (ref), cursorKind (ref)
	if p2.props.hideOnError and (not p2.props.voiceState or (if p2.props.voiceState ~= "Error" then p2.props.voiceState == "Hidden" else true)) then
		return nil
	end
	local var12 = if p2.props.voiceState == "LOCAL_MUTED" then 0.5 else 0
	
	if p2.props.iconTransparency then
		local var13 = var12
		var12 = if type(p2.props.iconTransparency) ~= "number" then 1 - (1 - p2.props.iconTransparency) * (1 - var13) else p2.props.iconTransparency:map(function(p4)
			-- upvalues: var13 (ref)
			return 1 - (1 - p4) * (1 - var13)
		end)
	end
	return roactModule.createElement("ImageButton", {
		Size = p2.props.size or UDim2.fromOffset(28, 28),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = p2.levelIcon,
		ImageTransparency = var12,
		SelectionImageObject = p3(cursorKind.RoundedRectNoInset),
		[roactModule.Event.Activated] = p2.onClicked
	})
end

function voiceIndicator.render(p5)
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p6)
		-- upvalues: p5 (ref)
		return p5:renderWithSelectionCursor(p6)
	end)
end

function voiceIndicator.didUpdate(p7, p8, _)
	-- upvalues: var0 (ref)
	var0:trace("Voice state updated to {} for ...{}", p7.props.voiceState, string.sub(tostring(p7.props.userId), -4))
	
	if p8.voiceState ~= p7.props.voiceState then
		p7.updateVoiceState(p7.props.voiceState)
	end
end

function voiceIndicator.willUnmount(p9)
	-- upvalues: runService (ref)
	pcall(function()
		-- upvalues: runService (copy), p9 (ref)
		runService:UnbindFromRenderStep(p9.renderStepName)
	end)
end

return if getFFlagExpChatUseVoiceParticipantsStore() then voiceIndicator else roactRoduxModule.connect(function(p10, p11)
	return { voiceState = p10.Voice.participants[p11.userId] }
end)(voiceIndicator)