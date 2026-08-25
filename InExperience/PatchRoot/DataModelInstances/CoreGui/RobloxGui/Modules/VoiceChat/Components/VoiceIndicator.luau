local corePackagesService = game:GetService("CorePackages")
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local withSelectionCursorProvider = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local var5 = require(robloxGui.Modules.VoiceChat.Logger)(script.Name)
local roactModule = require(corePackagesService.Packages.Roact)
local reactIsModule = require(corePackagesService.Packages.ReactIs)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local constantsModule = require(robloxGui.Modules.VoiceChat.Constants)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local voiceIndicator = roactModule.PureComponent:extend("VoiceIndicator")
voiceIndicator.validateProps = tModule.strictInterface({
	onClicked = tModule.optional(tModule.callback),
	userId = tModule.string,
	hideOnError = tModule.optional(tModule.boolean),
	size = tModule.optional(tModule.UDim2),
	iconStyle = tModule.optional(tModule.union(tModule.literal("MicDark"), tModule.literal("MicLight"), tModule.literal("SpeakerDark"), tModule.literal("SpeakerLight"))),
	iconTransparency = tModule.optional(tModule.union(tModule.number, tModule.table)),
	voiceState = tModule.string
})
voiceIndicator.defaultProps = {}

function voiceIndicator.getIcon(_, p0)
	return "rbxasset://textures/ui/VoiceChat/" .. p0 .. ".png"
end

function voiceIndicator.init(p1)
	-- upvalues: roactModule (ref), httpService (ref), runService (ref), constantsModule (ref), default (ref)
	local var12, var13 = roactModule.createBinding(0)
	p1.level = var12
	p1.updateLevel = var13
	local var14, var15 = roactModule.createBinding(p1.props.voiceState)
	p1.voiceState = var14
	p1.updateVoiceState = var15
	p1.renderStepName = httpService:GenerateGUID()
	runService:BindToRenderStep(p1.renderStepName, 1, function()
		-- upvalues: p1 (ref)
		p1.updateLevel(math.random())
	end)
	p1.levelIcon = roactModule.joinBindings({ p1.voiceState, p1.level }):map(function(p2)
		-- upvalues: constantsModule (copy), default (copy), p1 (ref)
		local var16 = p2[1]
		
		return if var16 == constantsModule.VOICE_STATE.MUTED or var16 == constantsModule.VOICE_STATE.LOCAL_MUTED then default:GetIcon("Muted", p1.props.iconStyle) elseif var16 == constantsModule.VOICE_STATE.CONNECTING then default:GetIcon("Connecting", p1.props.iconStyle) elseif var16 == constantsModule.VOICE_STATE.INACTIVE then default:GetIcon("Unmuted0", p1.props.iconStyle) elseif var16 == constantsModule.VOICE_STATE.TALKING then default:GetIcon("Unmuted" .. tostring(math.floor(p2[2] * 5 + 0.5) * 20), p1.props.iconStyle) else default:GetIcon("Error", p1.props.iconStyle)
	end)
end

function voiceIndicator.renderWithSelectionCursor(p3, p4)
	-- upvalues: constantsModule (ref), reactIsModule (ref), roactModule (ref), cursorKind (ref)
	if p3.props.hideOnError and (not p3.props.voiceState or (if p3.props.voiceState ~= constantsModule.VOICE_STATE.ERROR then p3.props.voiceState == constantsModule.VOICE_STATE.HIDDEN else true)) then
		return nil
	end
	local var17 = if p3.props.voiceState == constantsModule.VOICE_STATE.LOCAL_MUTED then 0.5 else 0
	
	if p3.props.iconTransparency then
		local var18 = var17
		var17 = if reactIsModule.isBinding(p3.props.iconTransparency) then p3.props.iconTransparency:map(function(p5)
			-- upvalues: var18 (ref)
			return 1 - (1 - p5) * (1 - var18)
		end) else 1 - (1 - p3.props.iconTransparency) * (1 - var18)
	end
	return roactModule.createElement("ImageButton", {
		Size = p3.props.size or UDim2.fromOffset(28, 28),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = p3.levelIcon,
		ImageTransparency = var17,
		SelectionImageObject = p4(cursorKind.RoundedRectNoInset),
		[roactModule.Event.Activated] = p3.props.onClicked
	})
end

function voiceIndicator.render(p6)
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p7)
		-- upvalues: p6 (ref)
		return p6:renderWithSelectionCursor(p7)
	end)
end

function voiceIndicator.didUpdate(p8, p9, _)
	-- upvalues: var5 (ref)
	var5:trace("Voice state updated to {} for ...{}", p8.props.voiceState, string.sub(tostring(p8.props.userId), -4))
	
	if p9.voiceState ~= p8.props.voiceState then
		p8.updateVoiceState(p8.props.voiceState)
	end
end

function voiceIndicator.willUnmount(p10)
	-- upvalues: runService (ref)
	pcall(function()
		-- upvalues: runService (copy), p10 (ref)
		runService:UnbindFromRenderStep(p10.renderStepName)
	end)
end

return roactRoduxModule.connect(function(p11, p12)
	return { voiceState = p11.voiceState[p12.userId] }
end)(voiceIndicator)