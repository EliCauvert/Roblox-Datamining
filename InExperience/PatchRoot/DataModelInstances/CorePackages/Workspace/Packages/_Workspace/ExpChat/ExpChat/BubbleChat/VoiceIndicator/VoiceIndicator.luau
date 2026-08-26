local parent = script:FindFirstAncestor("ExpChat").Parent
local var1 = require(parent.ExpChatShared).Logger:new("ExpChat/" .. script.Name)
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

function voiceIndicator.init(p1)
	-- upvalues: roactModule (ref), httpService (ref), runService (ref), getVoiceIndicatorIconModule (ref)
	local var2, var3 = roactModule.createBinding(0)
	p1.level = var2
	p1.updateLevel = var3
	local var4, var5 = roactModule.createBinding(p1.props.voiceState)
	p1.voiceState = var4
	p1.updateVoiceState = var5
	p1.renderStepName = httpService:GenerateGUID()
	runService:BindToRenderStep(p1.renderStepName, 1, function()
		-- upvalues: p1 (ref)
		p1.updateLevel(math.random())
	end)
	p1.levelIcon = roactModule.joinBindings({ p1.voiceState, p1.level }):map(function(p2)
		-- upvalues: getVoiceIndicatorIconModule (copy), p1 (ref)
		return getVoiceIndicatorIconModule(p1.props.getIcon, p2[1], p2[2], p1.props.iconStyle)
	end)
	
	function p0.onClicked()
		-- upvalues: p1 (ref)
		if p1.props.onClicked and p1.props.userId then
			p1.props.onClicked(p1.props.userId)
		end
	end
end

function voiceIndicator.renderWithSelectionCursor(p1, p2)
	-- upvalues: roactModule (ref), cursorKind (ref)
	if p1.props.hideOnError and (not p1.props.voiceState or (if p1.props.voiceState ~= "Error" then p1.props.voiceState == "Hidden" else true)) then
		return nil
	end
	local var2 = if p1.props.voiceState == "LOCAL_MUTED" then 0.5 else 0
	
	if p1.props.iconTransparency then
		local var3 = var2
		var2 = if type(p1.props.iconTransparency) ~= "number" then 1 - (1 - p1.props.iconTransparency) * (1 - var3) else p1.props.iconTransparency:map(function(p3)
			-- upvalues: var3 (ref)
			return 1 - (1 - p3) * (1 - var3)
		end)
	end
	return roactModule.createElement("ImageButton", {
		Size = p1.props.size or UDim2.fromOffset(28, 28),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = p1.levelIcon,
		ImageTransparency = var2,
		SelectionImageObject = p2(cursorKind.RoundedRectNoInset),
		[roactModule.Event.Activated] = p1.onClicked
	})
end

function voiceIndicator.render(p1)
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function voiceIndicator.didUpdate(p1, p2, _)
	-- upvalues: var1 (ref)
	var1:trace("Voice state updated to {} for ...{}", p1.props.voiceState, string.sub(tostring(p1.props.userId), -4))
	
	if p2.voiceState ~= p1.props.voiceState then
		p1.updateVoiceState(p1.props.voiceState)
	end
end

function voiceIndicator.willUnmount(p1)
	-- upvalues: runService (ref)
	pcall(function()
		-- upvalues: runService (copy), p1 (ref)
		runService:UnbindFromRenderStep(p1.renderStepName)
	end)
end

return if getFFlagExpChatUseVoiceParticipantsStore() then voiceIndicator else roactRoduxModule.connect(function(p1, p2)
	return { voiceState = p1.Voice.participants[p2.userId] }
end)(voiceIndicator)