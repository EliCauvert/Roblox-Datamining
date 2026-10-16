local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local UseVoiceStateModule = require(RobloxGui.Modules.VoiceChat.Hooks.useVoiceState)
local ConstantsModule = require(RobloxGui.Modules.VoiceChat.Constants)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local _UDim2 = UDim2.fromOffset(36, 36)

local function _(p1) --[[ Line: 16 | Named "useJoinBinding" ]]
	-- upvalues: ReactModule (copy), RoactModule (copy)
	return ReactModule.useMemo(function() --[[ Line: 17 ]]
		-- upvalues: RoactModule (upval), p1 (copy)
		return RoactModule.joinBindings(p1)
	end, {})
end

local _ = function(p1) --[[ Line: 22 | Named "mapLevelToIcon" ]]
	-- upvalues: ConstantsModule (copy), Default (copy)
	return function(Entry) --[[ Line: 24 ]]
		-- upvalues: ConstantsModule (upval), Default (upval), p1 (copy)
		local Entry1 = Entry[1]
		local Entry2: number = Entry[2]
		
		return if Entry1 == ConstantsModule.VOICE_STATE.MUTED or Entry1 == ConstantsModule.VOICE_STATE.LOCAL_MUTED then Default:GetIcon("Muted", p1) elseif Entry1 == ConstantsModule.VOICE_STATE.CONNECTING then Default:GetIcon("Connecting", p1) elseif Entry1 == ConstantsModule.VOICE_STATE.INACTIVE then Default:GetIcon("Unmuted0", p1) elseif Entry1 == ConstantsModule.VOICE_STATE.TALKING then Default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * Entry2) * 20), p1) else Default:GetIcon("Error", p1)
	end
end

local function GenerateGUID() --[[ Line: 42 ]]
	-- upvalues: HttpService (copy)
	return HttpService:GenerateGUID()
end

return function(Image) --[[ Line: 55 | Named "VRBarVoiceIcon" ]]
	-- upvalues: UseVoiceStateModule (copy), ReactModule (copy), RoactModule (copy), GenerateGUID (copy), ConstantsModule (copy), RunService (copy), Default (copy), _UDim2 (copy)
	local UseVoiceStateModuleResult = UseVoiceStateModule(Image.userId, Image.disable or false)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(UseVoiceStateModuleResult)
	local list = { UseBindingResult1, UseBindingResult }
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 17 ]]
		-- upvalues: RoactModule (upval), list (copy)
		return RoactModule.joinBindings(list)
	end, {})
	local Current = ReactModule.useRef(GenerateGUID()).current or ""
	UseBindingResult2_1(UseVoiceStateModuleResult)
	local IsUseVoiceStateModuleResultMatch = UseVoiceStateModuleResult == ConstantsModule.VOICE_STATE.TALKING
	ReactModule.useEffect(function() --[[ Line: 65 ]]
		-- upvalues: IsUseVoiceStateModuleResultMatch (copy), RunService (upval), Current (copy), UseBindingResult2 (copy)
		if IsUseVoiceStateModuleResultMatch then
			RunService:BindToRenderStep(Current, 1, function() --[[ Line: 67 ]]
				-- upvalues: UseBindingResult2 (upval)
				UseBindingResult2(math.random())
			end)
		end
		return function() --[[ Line: 71 ]]
			-- upvalues: IsUseVoiceStateModuleResultMatch (upval), RunService (upval), Current (upval)
			if IsUseVoiceStateModuleResultMatch then
				RunService:UnbindFromRenderStep(Current)
			end
		end
	end, { IsUseVoiceStateModuleResultMatch })
	
	return RoactModule.createElement("ImageLabel", {
		BackgroundTransparency = Image.BackgroundTransparency or 1,
		Image = ReactModule.useMemo(function() --[[ Line: 78 ]]
			-- upvalues: UseMemoResult (copy), Image (copy), ConstantsModule (upval), Default (upval)
			local IconStyle = Image.iconStyle
			
			return UseMemoResult:map(function(Entry) --[[ Line: 24 ]]
				-- upvalues: ConstantsModule (upval), Default (upval), IconStyle (copy)
				local Entry1 = Entry[1]
				local Entry2: number = Entry[2]
				
				return if Entry1 == ConstantsModule.VOICE_STATE.MUTED or Entry1 == ConstantsModule.VOICE_STATE.LOCAL_MUTED then Default:GetIcon("Muted", IconStyle) elseif Entry1 == ConstantsModule.VOICE_STATE.CONNECTING then Default:GetIcon("Connecting", IconStyle) elseif Entry1 == ConstantsModule.VOICE_STATE.INACTIVE then Default:GetIcon("Unmuted0", IconStyle) elseif Entry1 == ConstantsModule.VOICE_STATE.TALKING then Default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * Entry2) * 20), IconStyle) else Default:GetIcon("Error", IconStyle)
			end)
		end, { Image.iconStyle }),
		ImageColor3 = Image.ImageColor3,
		ImageTransparency = Image.ImageTransparency,
		Position = Image.Position,
		Size = Image.Size or _UDim2,
		[RoactModule.Children] = Image[RoactModule.Children]
	})
end