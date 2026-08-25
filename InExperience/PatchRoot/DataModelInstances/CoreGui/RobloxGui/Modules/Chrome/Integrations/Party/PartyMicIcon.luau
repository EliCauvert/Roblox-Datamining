local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local crossExperienceVoiceModule = require(corePackagesService.Workspace.Packages.CrossExperienceVoice)
local voiceChatModule = require(corePackagesService.Workspace.Packages.VoiceChat)
local useParticipant = crossExperienceVoiceModule.Hooks.useParticipant
local useIsVoiceConnected = crossExperienceVoiceModule.Hooks.useIsVoiceConnected
local useIsActiveParticipant = crossExperienceVoiceModule.Hooks.useIsActiveParticipant
local useIsParticipantMuted = crossExperienceVoiceModule.Hooks.useIsParticipantMuted
local unibarStyle = require(corePackagesService.Workspace.Packages.Chrome).UnibarStyle
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(script.Parent.Parent.Parent.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local partyMicVoiceIndicatorFrameBuffer = game:DefineFastInt("PartyMicVoiceIndicatorFrameBuffer", 3)

local function getLoadingIndicatorIcon(p0, p1, p2, p3, p4)
	-- upvalues: voiceChatModule (ref)
	return if not (not p2 or not p0 or p1) then if p3 then voiceChatModule.Utils.GetIcon("Unmuted", "MicLight", p4) else voiceChatModule.Utils.GetIcon("Unmuted0", "MicLight") else voiceChatModule.Utils.GetIcon("Muted", "MicLight")
end

function PartyMicIcon(p5)
	-- upvalues: playersService (ref), useIsVoiceConnected (ref), useParticipant (ref), useIsActiveParticipant (ref), reactModule (ref), useIsParticipantMuted (ref), httpService (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), partyMicVoiceIndicatorFrameBuffer (ref), runService (ref), getLoadingIndicatorIcon (ref), imageSetLabel (ref)
	local userId = playersService and (playersService.LocalPlayer and (playersService.LocalPlayer.UserId or -1))
	local var11 = useIsVoiceConnected()
	local var12 = useParticipant(userId)
	local var13 = useIsActiveParticipant(userId)
	local var14 = reactModule.useRef(var13)
	local var15 = useIsParticipantMuted(userId) == true
	local var16 = reactModule.useRef(0)
	local var17, var18 = reactModule.useState(0)
	local var19 = reactModule.useMemo(function()
		-- upvalues: httpService (copy)
		return httpService:GenerateGUID()
	end, {})
	local _ = nil
	local var20 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_SIZE else 36
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), p5 (ref)
		if var12 then
			p5.isLocalPlayerMutedSignal:fire(var12.isMuted)
		end
	end, { var12 })
	reactModule.useEffect(function()
		-- upvalues: p5 (ref), var11 (ref)
		p5.isVoiceConnectedSignal:fire(var11)
	end, { var11 })
	local var21 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), var16 (ref), partyMicVoiceIndicatorFrameBuffer (copy), var18 (ref)
		if var14.current then
			if partyMicVoiceIndicatorFrameBuffer < var16.current then
				var18(math.random())
				var16.current = 0
				
				return
			end
			var16.current += 1
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var13 (ref)
		var14.current = var13
	end, { var13 })
	reactModule.useEffect(function()
		-- upvalues: runService (copy), var19 (ref), var21 (ref)
		runService:BindToRenderStep(var19, 1, var21)
		
		return function()
			-- upvalues: runService (copy), var19 (copy)
			runService:UnbindFromRenderStep(var19)
		end
	end, {})
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, var20, 0, var20)
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
		Icon = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(var20, var20),
			Image = reactModule.useMemo(function()
				-- upvalues: getLoadingIndicatorIcon (copy), var12 (ref), var15 (ref), var11 (ref), var13 (ref), var17 (ref)
				return getLoadingIndicatorIcon(var12, var15, var11, var13, var17)
			end, {
				var12,
				var15,
				var11,
				var13,
				var17
			})
		}, {
			reactModule.createElement("UICorner", { Name = "Corner", CornerRadius = UDim.new(1, 0) })
		})
	})
end

return PartyMicIcon