local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local ReactModule = require(CorePackages.Packages.React)
local CrossExperienceVoiceModule = require(CorePackages.Workspace.Packages.CrossExperienceVoice)
local VoiceChatModule = require(CorePackages.Workspace.Packages.VoiceChat)
local UseParticipantFunction = CrossExperienceVoiceModule.Hooks.useParticipant
local UseIsVoiceConnectedFunction = CrossExperienceVoiceModule.Hooks.useIsVoiceConnected
local UseIsActiveParticipantFunction = CrossExperienceVoiceModule.Hooks.useIsActiveParticipant
local UseIsParticipantMutedFunction = CrossExperienceVoiceModule.Hooks.useIsParticipantMuted
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(script.Parent.Parent.Parent.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local ImageSetLabel = require(CorePackages.Packages.UIBlox).Core.ImageSet.ImageSetLabel
local PartyMicVoiceIndicatorFrameBuffer = game:DefineFastInt("PartyMicVoiceIndicatorFrameBuffer", 3)

local function getLoadingIndicatorIcon(p1, p2, p3, Current, p4)
	-- upvalues: VoiceChatModule (copy)
	return if p3 and p1 and not p2 then if Current then VoiceChatModule.Utils.GetIcon("Unmuted", "MicLight", p4) else VoiceChatModule.Utils.GetIcon("Unmuted0", "MicLight") else VoiceChatModule.Utils.GetIcon("Muted", "MicLight")
end

function PartyMicIcon(p1)
	-- upvalues: Players (copy), UseIsVoiceConnectedFunction (copy), UseParticipantFunction (copy), UseIsActiveParticipantFunction (copy), ReactModule (copy), UseIsParticipantMutedFunction (copy), HttpService (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), PartyMicVoiceIndicatorFrameBuffer (copy), RunService (copy), getLoadingIndicatorIcon (copy), ImageSetLabel (copy)
	local UserId = Players and Players.LocalPlayer and Players.LocalPlayer.UserId or -1
	local UseIsVoiceConnectedResult = UseIsVoiceConnectedFunction()
	local UseParticipantResult = UseParticipantFunction(UserId)
	local UseIsActiveParticipantResult = UseIsActiveParticipantFunction(UserId)
	local UseRefResult = ReactModule.useRef(UseIsActiveParticipantResult)
	local IsUseIsParticipantMutedResult = UseIsParticipantMutedFunction(UserId) == true
	local UseRefResult1 = ReactModule.useRef(0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: HttpService (upval)
		return HttpService:GenerateGUID()
	end, {})
	local ICONSIZE = if FFlagTokenizeUnibarConstantsWithStyleProvider then UnibarStyle.use().ICON_SIZE else 36
	ReactModule.useEffect(function()
		-- upvalues: UseParticipantResult (copy), p1 (copy)
		if UseParticipantResult then
			p1.isLocalPlayerMutedSignal:fire(UseParticipantResult.isMuted)
		end
	end, { UseParticipantResult })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseIsVoiceConnectedResult (copy)
		p1.isVoiceConnectedSignal:fire(UseIsVoiceConnectedResult)
	end, { UseIsVoiceConnectedResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), PartyMicVoiceIndicatorFrameBuffer (upval), UseStateResult2 (copy)
		if UseRefResult.current then
			if PartyMicVoiceIndicatorFrameBuffer < UseRefResult1.current then
				UseStateResult2(math.random())
				UseRefResult1.current = 0
				
				return
			else
				UseRefResult1.current += 1
			end
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseIsActiveParticipantResult (copy)
		UseRefResult.current = UseIsActiveParticipantResult
	end, { UseIsActiveParticipantResult })
	ReactModule.useEffect(function()
		-- upvalues: RunService (upval), UseMemoResult (copy), UseResult (copy)
		RunService:BindToRenderStep(UseMemoResult, 1, UseResult)
		
		return function()
			-- upvalues: RunService (upval), UseMemoResult (upval)
			RunService:UnbindFromRenderStep(UseMemoResult)
		end
	end, {})
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, ICONSIZE, 0, ICONSIZE)
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
		Icon = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(ICONSIZE, ICONSIZE),
			Image = ReactModule.useMemo(function()
				-- upvalues: getLoadingIndicatorIcon (upval), UseParticipantResult (copy), IsUseIsParticipantMutedResult (copy), UseIsVoiceConnectedResult (copy), UseIsActiveParticipantResult (copy), UseStateResult (copy)
				return getLoadingIndicatorIcon(UseParticipantResult, IsUseIsParticipantMutedResult, UseIsVoiceConnectedResult, UseIsActiveParticipantResult, UseStateResult)
			end, {
				UseParticipantResult,
				IsUseIsParticipantMutedResult,
				UseIsVoiceConnectedResult,
				UseIsActiveParticipantResult,
				UseStateResult
			})
		}, {
			ReactModule.createElement("UICorner", { Name = "Corner", CornerRadius = UDim.new(1, 0) })
		})
	})
end

return PartyMicIcon