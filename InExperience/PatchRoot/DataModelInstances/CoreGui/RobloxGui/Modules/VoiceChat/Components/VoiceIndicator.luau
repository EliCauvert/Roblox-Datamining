local corePackagesService = game:GetService("CorePackages")
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local withSelectionCursorProvider = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local var1 = require(robloxGui.Modules.VoiceChat.Logger)(script.Name)
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

function voiceIndicator.getIcon(_, p1)
	return "rbxasset://textures/ui/VoiceChat/" .. p0 .. ".png"
end

function voiceIndicator.init(p1)
	-- upvalues: roactModule (ref), httpService (ref), runService (ref), constantsModule (ref), default (ref)
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
		-- upvalues: constantsModule (copy), default (copy), p1 (ref)
		local var6 = p2[1]
		
		return if var6 == constantsModule.VOICE_STATE.MUTED or var6 == constantsModule.VOICE_STATE.LOCAL_MUTED then default:GetIcon("Muted", p1.props.iconStyle) elseif var6 == constantsModule.VOICE_STATE.CONNECTING then default:GetIcon("Connecting", p1.props.iconStyle) elseif var6 == constantsModule.VOICE_STATE.INACTIVE then default:GetIcon("Unmuted0", p1.props.iconStyle) elseif var6 == constantsModule.VOICE_STATE.TALKING then default:GetIcon("Unmuted" .. tostring(math.floor(p2[2] * 5 + 0.5) * 20), p1.props.iconStyle) else default:GetIcon("Error", p1.props.iconStyle)
	end)
end

function voiceIndicator.renderWithSelectionCursor(p1, p2)
	-- upvalues: constantsModule (ref), reactIsModule (ref), roactModule (ref), cursorKind (ref)
	if p1.props.hideOnError and (not p1.props.voiceState or (if p1.props.voiceState ~= constantsModule.VOICE_STATE.ERROR then p1.props.voiceState == constantsModule.VOICE_STATE.HIDDEN else true)) then
		return nil
	end
	local var2 = if p1.props.voiceState == constantsModule.VOICE_STATE.LOCAL_MUTED then 0.5 else 0
	
	if p1.props.iconTransparency then
		local var3 = var2
		var2 = if reactIsModule.isBinding(p1.props.iconTransparency) then p1.props.iconTransparency:map(function(p3)
			-- upvalues: var3 (ref)
			return 1 - (1 - p3) * (1 - var3)
		end) else 1 - (1 - p1.props.iconTransparency) * (1 - var3)
	end
	return roactModule.createElement("ImageButton", {
		Size = p1.props.size or UDim2.fromOffset(28, 28),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = p1.levelIcon,
		ImageTransparency = var2,
		SelectionImageObject = p2(cursorKind.RoundedRectNoInset),
		[roactModule.Event.Activated] = p1.props.onClicked
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

return roactRoduxModule.connect(function(p1, p2)
	return { voiceState = p1.voiceState[p2.userId] }
end)(voiceIndicator)