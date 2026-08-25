local corePackagesService = game:GetService("CorePackages")
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local roactModule = require(corePackagesService.Packages.Roact)
local reactModule = require(corePackagesService.Packages.React)
local useVoiceStateModule = require(robloxGui.Modules.VoiceChat.Hooks.useVoiceState)
local constantsModule = require(robloxGui.Modules.VoiceChat.Constants)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local uDim2 = UDim2.fromOffset(36, 36)

local function _(p0)
	-- upvalues: reactModule (ref), roactModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: roactModule (copy), p0 (ref)
		return roactModule.joinBindings(p0)
	end, {})
end

local _ = function(p1)
	-- upvalues: constantsModule (ref), default (ref)
	return function(p2)
		-- upvalues: constantsModule (copy), default (copy), p1 (ref)
		local var10 = p2[1]
		
		return if var10 == constantsModule.VOICE_STATE.MUTED or var10 == constantsModule.VOICE_STATE.LOCAL_MUTED then default:GetIcon("Muted", p1) elseif var10 == constantsModule.VOICE_STATE.CONNECTING then default:GetIcon("Connecting", p1) elseif var10 == constantsModule.VOICE_STATE.INACTIVE then default:GetIcon("Unmuted0", p1) elseif var10 == constantsModule.VOICE_STATE.TALKING then default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * p2[2]) * 20), p1) else default:GetIcon("Error", p1)
	end
end

local function GenerateGUID()
	-- upvalues: httpService (ref)
	return httpService:GenerateGUID()
end

return function(p3)
	-- upvalues: useVoiceStateModule (ref), reactModule (ref), roactModule (ref), GenerateGUID (ref), constantsModule (ref), runService (ref), default (ref), uDim2 (ref)
	local var11 = useVoiceStateModule(p3.userId, p3.disable or false)
	local var12, var13 = reactModule.useBinding(0)
	local var14, var15 = reactModule.useBinding(var11)
	local list = { var14, var12 }
	local var17 = reactModule.useMemo(function()
		-- upvalues: roactModule (copy), list (ref)
		return roactModule.joinBindings(list)
	end, {})
	local current = reactModule.useRef(GenerateGUID()).current or ""
	var15(var11)
	local var19 = var11 == constantsModule.VOICE_STATE.TALKING
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), runService (copy), current (ref), var13 (ref)
		if var19 then
			runService:BindToRenderStep(current, 1, function()
				-- upvalues: var13 (copy)
				var13(math.random())
			end)
		end
		return function()
			-- upvalues: var19 (copy), runService (copy), current (copy)
			if var19 then
				runService:UnbindFromRenderStep(current)
			end
		end
	end, { var19 })
	
	return roactModule.createElement("ImageLabel", {
		BackgroundTransparency = p3.BackgroundTransparency or 1,
		Image = reactModule.useMemo(function()
			-- upvalues: var17 (ref), p3 (ref), constantsModule (copy), default (copy)
			local iconStyle = p3.iconStyle
			
			return var17:map(function(p4)
				-- upvalues: constantsModule (copy), default (copy), iconStyle (ref)
				local var10 = p4[1]
				
				return if var10 == constantsModule.VOICE_STATE.MUTED or var10 == constantsModule.VOICE_STATE.LOCAL_MUTED then default:GetIcon("Muted", iconStyle) elseif var10 == constantsModule.VOICE_STATE.CONNECTING then default:GetIcon("Connecting", iconStyle) elseif var10 == constantsModule.VOICE_STATE.INACTIVE then default:GetIcon("Unmuted0", iconStyle) elseif var10 == constantsModule.VOICE_STATE.TALKING then default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * p4[2]) * 20), iconStyle) else default:GetIcon("Error", iconStyle)
			end)
		end, { p3.iconStyle }),
		ImageColor3 = p3.ImageColor3,
		ImageTransparency = p3.ImageTransparency,
		Position = p3.Position,
		Size = p3.Size or uDim2,
		[roactModule.Children] = p3[roactModule.Children]
	})
end