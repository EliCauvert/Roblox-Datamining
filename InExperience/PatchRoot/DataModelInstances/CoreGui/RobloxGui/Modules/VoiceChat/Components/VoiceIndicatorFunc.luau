local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local ReactIsModule = require(CorePackages.Packages.ReactIs)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local UseVoiceStateModule = require(RobloxGui.Modules.VoiceChat.Hooks.useVoiceState)
local ConstantsModule = require(RobloxGui.Modules.VoiceChat.Constants)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local VoiceIndicatorPerformanceOptimizationsV2 = game:DefineFastFlag("VoiceIndicatorPerformanceOptimizationsV2", false)
local MicTalkingUpdateFrequency = game:DefineFastInt("MicTalkingUpdateFrequency", 3)
local _UDim2 = UDim2.fromOffset(28, 28)

local function _(p1, p2) --[[ Line: 32 | Named "useJoinBinding" ]]
	-- upvalues: ReactModule (copy), RoactModule (copy)
	return ReactModule.useMemo(function() --[[ Line: 33 ]]
		-- upvalues: RoactModule (upval), p1 (copy), p2 (copy)
		return RoactModule.joinBindings({ p1, p2 })
	end, { p1, p2 })
end

local _ = function(p1, p2) --[[ Line: 38 | Named "mapLevelToIcon" ]]
	-- upvalues: ConstantsModule (copy), Default (copy)
	return function(Entry) --[[ Line: 40 ]]
		-- upvalues: ConstantsModule (upval), Default (upval), p1 (copy), p2 (copy)
		local Entry1 = Entry[1]
		local Entry2: number = Entry[2]
		
		return if Entry1 == ConstantsModule.VOICE_STATE.MUTED or Entry1 == ConstantsModule.VOICE_STATE.LOCAL_MUTED then Default:GetIcon("Muted", p1) elseif Entry1 == ConstantsModule.VOICE_STATE.CONNECTING or Entry1 == ConstantsModule.VOICE_STATE.HIDDEN then if p2 and p1 == "MicLight" then Default:GetIcon("Connecting", "MicDark") else Default:GetIcon("Connecting", p1) elseif Entry1 == ConstantsModule.VOICE_STATE.INACTIVE then Default:GetIcon("Unmuted0", p1) elseif Entry1 == ConstantsModule.VOICE_STATE.TALKING then Default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * Entry2) * 20), p1) else Default:GetIcon("Error", p1)
	end
end

local config = {
	[ConstantsModule.VOICE_STATE.ERROR] = true,
	[ConstantsModule.VOICE_STATE.HIDDEN] = true
}

local function GenerateGUID() --[[ Line: 67 ]]
	-- upvalues: HttpService (copy)
	return HttpService:GenerateGUID()
end

local function createTweenShimmeringEffect(UseRefResult) --[[ Line: 83 ]]
	-- upvalues: TweenService (copy)
	return (TweenService:Create(UseRefResult:getValue(), TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, -1), { Offset = Vector2.new(1, 0) }))
end

return function(p1) --[[ Line: 91 | Named "VoiceIndicator" ]]
	-- upvalues: UseVoiceStateModule (copy), ReactModule (copy), RoactModule (copy), GenerateGUID (copy), ConstantsModule (copy), createTweenShimmeringEffect (copy), VoiceIndicatorPerformanceOptimizationsV2 (copy), RunService (copy), MicTalkingUpdateFrequency (copy), config (copy), ReactIsModule (copy), Default (copy), UseSelectionCursorFunction (copy), CursorKind (copy), _UDim2 (copy)
	local UseVoiceStateModuleResult = UseVoiceStateModule(p1.userId, p1.disable or false)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local NoSelectable = p1.selectable == nil or p1.selectable
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(UseVoiceStateModuleResult)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 33 ]]
		-- upvalues: RoactModule (upval), UseBindingResult1 (copy), UseBindingResult (copy)
		return RoactModule.joinBindings({ UseBindingResult1, UseBindingResult })
	end, { UseBindingResult1, UseBindingResult })
	local Current = ReactModule.useRef(GenerateGUID()).current or ""
	UseBindingResult2_1(UseVoiceStateModuleResult)
	local IsUseVoiceStateModuleResultMatch = UseVoiceStateModuleResult == ConstantsModule.VOICE_STATE.TALKING
	local IsUseVoiceStateModuleResultMatch1 = UseVoiceStateModuleResult == ConstantsModule.VOICE_STATE.CONNECTING
	local IsShowConnectingShimmer = p1.showConnectingShimmer == true
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 105 ]]
		-- upvalues: IsShowConnectingShimmer (copy), IsUseVoiceStateModuleResultMatch1 (copy), UseRefResult (copy), createTweenShimmeringEffect (upval)
		if IsShowConnectingShimmer and IsUseVoiceStateModuleResultMatch1 and UseRefResult.current then
			local TweenShimmeringEffect = createTweenShimmeringEffect(UseRefResult)
			TweenShimmeringEffect:Play()
			
			return function() --[[ Line: 110 ]]
				-- upvalues: TweenShimmeringEffect (copy)
				TweenShimmeringEffect:Cancel()
			end
		else
			return function() --[[ Line: 114 ]] end
		end
	end, {
		IsUseVoiceStateModuleResultMatch1,
		IsShowConnectingShimmer
	})
	
	if VoiceIndicatorPerformanceOptimizationsV2 then
		local UseRefResult1 = ReactModule.useRef(false)
		UseRefResult1.current = UseVoiceStateModuleResult == ConstantsModule.VOICE_STATE.TALKING
		ReactModule.useEffect(function() --[[ Line: 121 ]]
			-- upvalues: RunService (upval), Current (copy), UseRefResult1 (copy), MicTalkingUpdateFrequency (upval), UseBindingResult2 (copy)
			local Count = 0
			RunService:BindToRenderStep(Current, 1, function() --[[ Line: 124 ]]
				-- upvalues: UseRefResult1 (upval), Count (ref), MicTalkingUpdateFrequency (upval), UseBindingResult2 (upval)
				if not UseRefResult1.current then return end
				Count += 1
				
				if MicTalkingUpdateFrequency <= Count then
					Count = 0
					UseBindingResult2(math.random())
				end
			end)
			
			return function() --[[ Line: 136 ]]
				-- upvalues: RunService (upval), Current (upval)
				RunService:UnbindFromRenderStep(Current)
			end
		end, { Current })
	else
		ReactModule.useEffect(function() --[[ Line: 141 ]]
			-- upvalues: IsUseVoiceStateModuleResultMatch (copy), RunService (upval), Current (copy), UseBindingResult2 (copy)
			if IsUseVoiceStateModuleResultMatch then
				RunService:BindToRenderStep(Current, 1, function() --[[ Line: 143 ]]
					-- upvalues: UseBindingResult2 (upval)
					UseBindingResult2(math.random())
				end)
			end
			return function() --[[ Line: 147 ]]
				-- upvalues: IsUseVoiceStateModuleResultMatch (upval), RunService (upval), Current (upval)
				if IsUseVoiceStateModuleResultMatch then
					RunService:UnbindFromRenderStep(Current)
				end
			end
		end, { IsUseVoiceStateModuleResultMatch, Current })
	end
	local Inverted = not (p1.hideOnError and (not UseVoiceStateModuleResult or config[UseVoiceStateModuleResult]))
	local MapResult = if UseVoiceStateModuleResult == ConstantsModule.VOICE_STATE.LOCAL_MUTED then 0.5 else 0
	
	if p1.iconTransparency then
		MapResult = if ReactIsModule.isBinding(p1.iconTransparency) then p1.iconTransparency:map(function(p2: number): number --[[ Line: 161 ]]
			-- upvalues: MapResult (copy)
			return 1 - (1 - p2) * (1 - MapResult)
		end) else 1 - (1 - p1.iconTransparency) * (1 - MapResult)
	end
	return RoactModule.createElement("ImageButton", {
		Size = p1.size or _UDim2,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = ReactModule.useMemo(function() --[[ Line: 169 ]]
			-- upvalues: UseMemoResult (copy), p1 (copy), IsShowConnectingShimmer (copy), ConstantsModule (upval), Default (upval)
			local IconStyle = p1.iconStyle
			
			return UseMemoResult:map(function(Entry) --[[ Line: 40 ]]
				-- upvalues: ConstantsModule (upval), Default (upval), IconStyle (copy), IsShowConnectingShimmer (copy)
				local Entry1 = Entry[1]
				local Entry2: number = Entry[2]
				
				return if Entry1 == ConstantsModule.VOICE_STATE.MUTED or Entry1 == ConstantsModule.VOICE_STATE.LOCAL_MUTED then Default:GetIcon("Muted", IconStyle) elseif Entry1 == ConstantsModule.VOICE_STATE.CONNECTING or Entry1 == ConstantsModule.VOICE_STATE.HIDDEN then if IsShowConnectingShimmer and IconStyle == "MicLight" then Default:GetIcon("Connecting", "MicDark") else Default:GetIcon("Connecting", IconStyle) elseif Entry1 == ConstantsModule.VOICE_STATE.INACTIVE then Default:GetIcon("Unmuted0", IconStyle) elseif Entry1 == ConstantsModule.VOICE_STATE.TALKING then Default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * Entry2) * 20), IconStyle) else Default:GetIcon("Error", IconStyle)
			end)
		end, { p1.iconStyle, IsShowConnectingShimmer }),
		ImageTransparency = MapResult,
		Selectable = NoSelectable,
		SelectionImageObject = UseSelectionCursorFunction(CursorKind.RoundedRectNoInset),
		Visible = Inverted,
		[RoactModule.Event.Activated] = p1.onClicked
	}, {
		ShimmerGradient = if IsShowConnectingShimmer then RoactModule.createElement("UIGradient", {
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.new(0.6, 0.6, 0.6)),
				ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.8, 0.8)),
				ColorSequenceKeypoint.new(1, Color3.new(0.6, 0.6, 0.6))
			}),
			Enabled = IsUseVoiceStateModuleResultMatch1,
			Rotation = -45,
			Offset = Vector2.new(-1, 0),
			[RoactModule.Ref] = UseRefResult
		}) else nil
	})
end