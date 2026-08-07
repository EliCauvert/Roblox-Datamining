local corePackagesService = game:GetService("CorePackages")
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local roactModule = require(corePackagesService.Packages.Roact)
local reactModule = require(corePackagesService.Packages.React)
local reactIsModule = require(corePackagesService.Packages.ReactIs)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local useSelectionCursor = UIBloxModule.App.SelectionImage.useSelectionCursor
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local useVoiceStateModule = require(robloxGui.Modules.VoiceChat.Hooks.useVoiceState)
local constantsModule = require(robloxGui.Modules.VoiceChat.Constants)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local voiceIndicatorPerformanceOptimizationsV2 = game:DefineFastFlag("VoiceIndicatorPerformanceOptimizationsV2", false)
local micTalkingUpdateFrequency = game:DefineFastInt("MicTalkingUpdateFrequency", 3)
local uDim2 = UDim2.fromOffset(28, 28)

local function _(p0, p1) --[[ line: 32 | named "useJoinBinding" ]]
	-- upvalues: reactModule (ref), roactModule (ref)
	return reactModule.useMemo(function() --[[ line: 33 ]]
		-- upvalues: roactModule (copy), p0 (ref), p1 (ref)
		return roactModule.joinBindings({ p0, p1 })
	end, { p0, p1 })
end

local _ = function(p2, p3) --[[ line: 38 | named "mapLevelToIcon" ]]
	-- upvalues: constantsModule (ref), default (ref)
	return function(p4) --[[ line: 40 ]]
		-- upvalues: constantsModule (copy), default (copy), p2 (ref), p3 (ref)
		local var17 = p4[1]
		
		return if var17 == constantsModule.VOICE_STATE.MUTED or var17 == constantsModule.VOICE_STATE.LOCAL_MUTED then default:GetIcon("Muted", p2) elseif var17 == constantsModule.VOICE_STATE.CONNECTING or var17 == constantsModule.VOICE_STATE.HIDDEN then if p3 and p2 == "MicLight" then default:GetIcon("Connecting", "MicDark") else default:GetIcon("Connecting", p2) elseif var17 == constantsModule.VOICE_STATE.INACTIVE then default:GetIcon("Unmuted0", p2) elseif var17 == constantsModule.VOICE_STATE.TALKING then default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * p4[2]) * 20), p2) else default:GetIcon("Error", p2)
	end
end

local t = {
	[constantsModule.VOICE_STATE.ERROR] = true,
	[constantsModule.VOICE_STATE.HIDDEN] = true
}

local function GenerateGUID() --[[ line: 67 ]]
	-- upvalues: httpService (ref)
	return httpService:GenerateGUID()
end

local function createTweenShimmeringEffect(p5) --[[ line: 83 ]]
	-- upvalues: tweenService (ref)
	return tweenService:Create(p5:getValue(), TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, -1), { Offset = Vector2.new(1, 0) })
end

return function(p6) --[[ line: 91 | named "VoiceIndicator" ]]
	-- upvalues: useVoiceStateModule (ref), reactModule (ref), roactModule (ref), GenerateGUID (ref), constantsModule (ref), createTweenShimmeringEffect (ref), voiceIndicatorPerformanceOptimizationsV2 (ref), runService (ref), micTalkingUpdateFrequency (ref), t (ref), reactIsModule (ref), default (ref), useSelectionCursor (ref), cursorKind (ref), uDim2 (ref)
	local var18 = useVoiceStateModule(p6.userId, p6.disable or false)
	local var19, var20 = reactModule.useBinding(0)
	local var21 = p6.selectable ~= nil or p6.selectable
	local var22, var23 = reactModule.useBinding(var18)
	local var24 = reactModule.useMemo(function() --[[ line: 33 ]]
		-- upvalues: roactModule (copy), var22 (ref), var19 (ref)
		return roactModule.joinBindings({ var22, var19 })
	end, { var22, var19 })
	local current = reactModule.useRef(GenerateGUID()).current or ""
	var23(var18)
	local var26 = var18 == constantsModule.VOICE_STATE.TALKING
	local var27 = var18 == constantsModule.VOICE_STATE.CONNECTING
	local var28 = p6.showConnectingShimmer == true
	local var29 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 105 ]]
		-- upvalues: var28 (ref), var27 (ref), var29 (ref), createTweenShimmeringEffect (copy)
		if var28 and var27 and var29.current then
			local var34 = createTweenShimmeringEffect(var29)
			var34:Play()
			
			return function() --[[ line: 110 ]]
				-- upvalues: var34 (ref)
				var34:Cancel()
			end
		end
		return function() --[[ line: 114 ]] end
	end, { var27, var28 })
	
	if voiceIndicatorPerformanceOptimizationsV2 then
		local var30 = reactModule.useRef(false)
		var30.current = var18 == constantsModule.VOICE_STATE.TALKING
		reactModule.useEffect(function() --[[ line: 121 ]]
			-- upvalues: runService (copy), current (ref), var30 (ref), micTalkingUpdateFrequency (copy), var20 (ref)
			local var35 = 0
			runService:BindToRenderStep(current, 1, function() --[[ line: 124 ]]
				-- upvalues: var30 (copy), var35 (write), micTalkingUpdateFrequency (copy), var20 (copy)
				if not var30.current then return end
				var35 += 1
				
				if micTalkingUpdateFrequency <= var35 then
					var35 = 0
					var20(math.random())
				end
			end)
			
			return function() --[[ line: 136 ]]
				-- upvalues: runService (copy), current (copy)
				runService:UnbindFromRenderStep(current)
			end
		end, { current })
	else
		reactModule.useEffect(function() --[[ line: 141 ]]
			-- upvalues: var26 (ref), runService (copy), current (ref), var20 (ref)
			if var26 then
				runService:BindToRenderStep(current, 1, function() --[[ line: 143 ]]
					-- upvalues: var20 (copy)
					var20(math.random())
				end)
			end
			return function() --[[ line: 147 ]]
				-- upvalues: var26 (copy), runService (copy), current (copy)
				if var26 then
					runService:UnbindFromRenderStep(current)
				end
			end
		end, { var26, current })
	end
	local var31 = not (p6.hideOnError and (not var18 or t[var18]))
	local var32 = if var18 == constantsModule.VOICE_STATE.LOCAL_MUTED then 0.5 else 0
	
	if p6.iconTransparency then
		local var33 = var32
		var32 = if reactIsModule.isBinding(p6.iconTransparency) then p6.iconTransparency:map(function(p7) --[[ line: 161 ]]
			-- upvalues: var33 (ref)
			return 1 - (1 - p7) * (1 - var33)
		end) else 1 - (1 - p6.iconTransparency) * (1 - var33)
	end
	return roactModule.createElement("ImageButton", {
		Size = p6.size or uDim2,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = reactModule.useMemo(function() --[[ line: 169 ]]
			-- upvalues: var24 (ref), p6 (ref), var28 (ref), constantsModule (copy), default (copy)
			local iconStyle = p6.iconStyle
			
			return var24:map(function(p8) --[[ line: 40 ]]
				-- upvalues: constantsModule (copy), default (copy), iconStyle (ref), var28 (ref)
				local var17 = p8[1]
				
				return if var17 == constantsModule.VOICE_STATE.MUTED or var17 == constantsModule.VOICE_STATE.LOCAL_MUTED then default:GetIcon("Muted", iconStyle) elseif var17 == constantsModule.VOICE_STATE.CONNECTING or var17 == constantsModule.VOICE_STATE.HIDDEN then if var28 and iconStyle == "MicLight" then default:GetIcon("Connecting", "MicDark") else default:GetIcon("Connecting", iconStyle) elseif var17 == constantsModule.VOICE_STATE.INACTIVE then default:GetIcon("Unmuted0", iconStyle) elseif var17 == constantsModule.VOICE_STATE.TALKING then default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * p8[2]) * 20), iconStyle) else default:GetIcon("Error", iconStyle)
			end)
		end, { p6.iconStyle, var28 }),
		ImageTransparency = var32,
		Selectable = var21,
		SelectionImageObject = useSelectionCursor(cursorKind.RoundedRectNoInset),
		Visible = var31,
		[roactModule.Event.Activated] = p6.onClicked
	}, {
		ShimmerGradient = if var28 then roactModule.createElement("UIGradient", {
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.new(0.6, 0.6, 0.6)),
				ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.8, 0.8)),
				ColorSequenceKeypoint.new(1, Color3.new(0.6, 0.6, 0.6))
			}),
			Enabled = var27,
			Rotation = -45,
			Offset = Vector2.new(-1, 0),
			[roactModule.Ref] = var29
		}) else nil
	})
end