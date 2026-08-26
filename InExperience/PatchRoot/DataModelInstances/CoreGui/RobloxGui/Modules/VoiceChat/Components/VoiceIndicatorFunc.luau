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

local function _(p1, p2)
	-- upvalues: reactModule (ref), roactModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: roactModule (copy), p1 (ref), p2 (ref)
		return roactModule.joinBindings({ p1, p2 })
	end, { p1, p2 })
end

local _ = function(p1, p2)
	-- upvalues: constantsModule (ref), default (ref)
	return function(p3)
		-- upvalues: constantsModule (copy), default (copy), p1 (ref), p2 (ref)
		local var1 = p3[1]
		
		return if var1 == constantsModule.VOICE_STATE.MUTED or var1 == constantsModule.VOICE_STATE.LOCAL_MUTED then default:GetIcon("Muted", p1) elseif var1 == constantsModule.VOICE_STATE.CONNECTING or var1 == constantsModule.VOICE_STATE.HIDDEN then if p2 and p1 == "MicLight" then default:GetIcon("Connecting", "MicDark") else default:GetIcon("Connecting", p1) elseif var1 == constantsModule.VOICE_STATE.INACTIVE then default:GetIcon("Unmuted0", p1) elseif var1 == constantsModule.VOICE_STATE.TALKING then default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * p3[2]) * 20), p1) else default:GetIcon("Error", p1)
	end
end

local t = {
	[constantsModule.VOICE_STATE.ERROR] = true,
	[constantsModule.VOICE_STATE.HIDDEN] = true
}

local function GenerateGUID()
	-- upvalues: httpService (ref)
	return httpService:GenerateGUID()
end

local function createTweenShimmeringEffect(p1)
	-- upvalues: tweenService (ref)
	return tweenService:Create(p1:getValue(), TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, -1), { Offset = Vector2.new(1, 0) })
end

return function(p1)
	-- upvalues: useVoiceStateModule (ref), reactModule (ref), roactModule (ref), GenerateGUID (ref), constantsModule (ref), createTweenShimmeringEffect (ref), voiceIndicatorPerformanceOptimizationsV2 (ref), runService (ref), micTalkingUpdateFrequency (ref), t (ref), reactIsModule (ref), default (ref), useSelectionCursor (ref), cursorKind (ref), uDim2 (ref)
	local var1 = useVoiceStateModule(p1.userId, p1.disable or false)
	local var2, var3 = reactModule.useBinding(0)
	local var4 = p1.selectable ~= nil or p1.selectable
	local var5, var6 = reactModule.useBinding(var1)
	local var7 = reactModule.useMemo(function()
		-- upvalues: roactModule (copy), var5 (ref), var2 (ref)
		return roactModule.joinBindings({ var5, var2 })
	end, { var5, var2 })
	local current = reactModule.useRef(GenerateGUID()).current or ""
	var6(var1)
	local var8 = var1 == constantsModule.VOICE_STATE.TALKING
	local var9 = var1 == constantsModule.VOICE_STATE.CONNECTING
	local var10 = p1.showConnectingShimmer == true
	local var11 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var9 (ref), var11 (ref), createTweenShimmeringEffect (copy)
		if var10 and var9 and var11.current then
			local var12 = createTweenShimmeringEffect(var11)
			var12:Play()
			
			return function()
				-- upvalues: var12 (ref)
				var12:Cancel()
			end
		end
		return function() end
	end, { var9, var10 })
	
	if voiceIndicatorPerformanceOptimizationsV2 then
		local var12 = reactModule.useRef(false)
		var12.current = var1 == constantsModule.VOICE_STATE.TALKING
		reactModule.useEffect(function()
			-- upvalues: runService (copy), current (ref), var12 (ref), micTalkingUpdateFrequency (copy), var3 (ref)
			local var13 = 0
			runService:BindToRenderStep(current, 1, function()
				-- upvalues: var12 (copy), var13 (write), micTalkingUpdateFrequency (copy), var3 (copy)
				if not var12.current then return end
				var13 += 1
				
				if micTalkingUpdateFrequency <= var13 then
					var13 = 0
					var3(math.random())
				end
			end)
			
			return function()
				-- upvalues: runService (copy), current (copy)
				runService:UnbindFromRenderStep(current)
			end
		end, { current })
	else
		reactModule.useEffect(function()
			-- upvalues: var8 (ref), runService (copy), current (ref), var3 (ref)
			if var8 then
				runService:BindToRenderStep(current, 1, function()
					-- upvalues: var3 (copy)
					var3(math.random())
				end)
			end
			return function()
				-- upvalues: var8 (copy), runService (copy), current (copy)
				if var8 then
					runService:UnbindFromRenderStep(current)
				end
			end
		end, { var8, current })
	end
	local var13 = not (p1.hideOnError and (not var1 or t[var1]))
	local var14 = if var1 == constantsModule.VOICE_STATE.LOCAL_MUTED then 0.5 else 0
	
	if p1.iconTransparency then
		local var15 = var14
		var14 = if reactIsModule.isBinding(p1.iconTransparency) then p1.iconTransparency:map(function(p2)
			-- upvalues: var15 (ref)
			return 1 - (1 - p2) * (1 - var15)
		end) else 1 - (1 - p1.iconTransparency) * (1 - var15)
	end
	return roactModule.createElement("ImageButton", {
		Size = p1.size or uDim2,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = reactModule.useMemo(function()
			-- upvalues: var7 (ref), p1 (ref), var10 (ref), constantsModule (copy), default (copy)
			local iconStyle = p1.iconStyle
			
			return var7:map(function(p2)
				-- upvalues: constantsModule (copy), default (copy), iconStyle (ref), var10 (ref)
				local var16 = p2[1]
				
				return if var16 == constantsModule.VOICE_STATE.MUTED or var16 == constantsModule.VOICE_STATE.LOCAL_MUTED then default:GetIcon("Muted", iconStyle) elseif var16 == constantsModule.VOICE_STATE.CONNECTING or var16 == constantsModule.VOICE_STATE.HIDDEN then if var10 and iconStyle == "MicLight" then default:GetIcon("Connecting", "MicDark") else default:GetIcon("Connecting", iconStyle) elseif var16 == constantsModule.VOICE_STATE.INACTIVE then default:GetIcon("Unmuted0", iconStyle) elseif var16 == constantsModule.VOICE_STATE.TALKING then default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * p2[2]) * 20), iconStyle) else default:GetIcon("Error", iconStyle)
			end)
		end, { p1.iconStyle, var10 }),
		ImageTransparency = var14,
		Selectable = var4,
		SelectionImageObject = useSelectionCursor(cursorKind.RoundedRectNoInset),
		Visible = var13,
		[roactModule.Event.Activated] = p1.onClicked
	}, {
		ShimmerGradient = if var10 then roactModule.createElement("UIGradient", {
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.new(0.6, 0.6, 0.6)),
				ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.8, 0.8)),
				ColorSequenceKeypoint.new(1, Color3.new(0.6, 0.6, 0.6))
			}),
			Enabled = var9,
			Rotation = -45,
			Offset = Vector2.new(-1, 0),
			[roactModule.Ref] = var11
		}) else nil
	})
end