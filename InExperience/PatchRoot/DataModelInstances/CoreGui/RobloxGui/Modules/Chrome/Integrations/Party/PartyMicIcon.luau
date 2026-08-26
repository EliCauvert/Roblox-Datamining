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

local function getLoadingIndicatorIcon(p1, p2, p3, p4, p5)
	-- upvalues: voiceChatModule (ref)
	return if not (not p3 or not p1 or p2) then if p4 then voiceChatModule.Utils.GetIcon("Unmuted", "MicLight", p5) else voiceChatModule.Utils.GetIcon("Unmuted0", "MicLight") else voiceChatModule.Utils.GetIcon("Muted", "MicLight")
end

function PartyMicIcon(p1)
	-- upvalues: playersService (ref), useIsVoiceConnected (ref), useParticipant (ref), useIsActiveParticipant (ref), reactModule (ref), useIsParticipantMuted (ref), httpService (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), partyMicVoiceIndicatorFrameBuffer (ref), runService (ref), getLoadingIndicatorIcon (ref), imageSetLabel (ref)
	local userId = playersService and (playersService.LocalPlayer and (playersService.LocalPlayer.UserId or -1))
	local var1 = useIsVoiceConnected()
	local var2 = useParticipant(userId)
	local var3 = useIsActiveParticipant(userId)
	local var4 = reactModule.useRef(var3)
	local var5 = useIsParticipantMuted(userId) == true
	local var6 = reactModule.useRef(0)
	local var7, var8 = reactModule.useState(0)
	local var9 = reactModule.useMemo(function()
		-- upvalues: httpService (copy)
		return httpService:GenerateGUID()
	end, {})
	local _ = nil
	local var10 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_SIZE else 36
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		if var2 then
			p1.isLocalPlayerMutedSignal:fire(var2.isMuted)
		end
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref)
		p1.isVoiceConnectedSignal:fire(var1)
	end, { var1 })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var6 (ref), partyMicVoiceIndicatorFrameBuffer (copy), var8 (ref)
		if var4.current then
			if partyMicVoiceIndicatorFrameBuffer < var6.current then
				var8(math.random())
				var6.current = 0
				
				return
			end
			var6.current += 1
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var3 (ref)
		var4.current = var3
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: runService (copy), var9 (ref), var11 (ref)
		runService:BindToRenderStep(var9, 1, var11)
		
		return function()
			-- upvalues: runService (copy), var9 (copy)
			runService:UnbindFromRenderStep(var9)
		end
	end, {})
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, var10, 0, var10)
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
		Icon = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(var10, var10),
			Image = reactModule.useMemo(function()
				-- upvalues: getLoadingIndicatorIcon (copy), var2 (ref), var5 (ref), var1 (ref), var3 (ref), var7 (ref)
				return getLoadingIndicatorIcon(var2, var5, var1, var3, var7)
			end, {
				var2,
				var5,
				var1,
				var3,
				var7
			})
		}, {
			reactModule.createElement("UICorner", { Name = "Corner", CornerRadius = UDim.new(1, 0) })
		})
	})
end

return PartyMicIcon