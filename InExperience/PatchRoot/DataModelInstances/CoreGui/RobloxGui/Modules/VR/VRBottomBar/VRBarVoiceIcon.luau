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

local function _(p1)
	-- upvalues: reactModule (ref), roactModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: roactModule (copy), p1 (ref)
		return roactModule.joinBindings(p1)
	end, {})
end

local _ = function(p1)
	-- upvalues: constantsModule (ref), default (ref)
	return function(p2)
		-- upvalues: constantsModule (copy), default (copy), p1 (ref)
		local var1 = p2[1]
		
		return if var1 == constantsModule.VOICE_STATE.MUTED or var1 == constantsModule.VOICE_STATE.LOCAL_MUTED then default:GetIcon("Muted", p1) elseif var1 == constantsModule.VOICE_STATE.CONNECTING then default:GetIcon("Connecting", p1) elseif var1 == constantsModule.VOICE_STATE.INACTIVE then default:GetIcon("Unmuted0", p1) elseif var1 == constantsModule.VOICE_STATE.TALKING then default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * p2[2]) * 20), p1) else default:GetIcon("Error", p1)
	end
end

local function GenerateGUID()
	-- upvalues: httpService (ref)
	return httpService:GenerateGUID()
end

return function(p1)
	-- upvalues: useVoiceStateModule (ref), reactModule (ref), roactModule (ref), GenerateGUID (ref), constantsModule (ref), runService (ref), default (ref), uDim2 (ref)
	local var1 = useVoiceStateModule(p1.userId, p1.disable or false)
	local var2, var3 = reactModule.useBinding(0)
	local var4, var5 = reactModule.useBinding(var1)
	local list = { var4, var2 }
	local var6 = reactModule.useMemo(function()
		-- upvalues: roactModule (copy), list (ref)
		return roactModule.joinBindings(list)
	end, {})
	local current = reactModule.useRef(GenerateGUID()).current or ""
	var5(var1)
	local var7 = var1 == constantsModule.VOICE_STATE.TALKING
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), runService (copy), current (ref), var3 (ref)
		if var7 then
			runService:BindToRenderStep(current, 1, function()
				-- upvalues: var3 (copy)
				var3(math.random())
			end)
		end
		return function()
			-- upvalues: var7 (copy), runService (copy), current (copy)
			if var7 then
				runService:UnbindFromRenderStep(current)
			end
		end
	end, { var7 })
	
	return roactModule.createElement("ImageLabel", {
		BackgroundTransparency = p1.BackgroundTransparency or 1,
		Image = reactModule.useMemo(function()
			-- upvalues: var6 (ref), p1 (ref), constantsModule (copy), default (copy)
			local iconStyle = p1.iconStyle
			
			return var6:map(function(p2)
				-- upvalues: constantsModule (copy), default (copy), iconStyle (ref)
				local var8 = p2[1]
				
				return if var8 == constantsModule.VOICE_STATE.MUTED or var8 == constantsModule.VOICE_STATE.LOCAL_MUTED then default:GetIcon("Muted", iconStyle) elseif var8 == constantsModule.VOICE_STATE.CONNECTING then default:GetIcon("Connecting", iconStyle) elseif var8 == constantsModule.VOICE_STATE.INACTIVE then default:GetIcon("Unmuted0", iconStyle) elseif var8 == constantsModule.VOICE_STATE.TALKING then default:GetIcon("Unmuted" .. tostring(math.floor(0.5 + 5 * p2[2]) * 20), iconStyle) else default:GetIcon("Error", iconStyle)
			end)
		end, { p1.iconStyle }),
		ImageColor3 = p1.ImageColor3,
		ImageTransparency = p1.ImageTransparency,
		Position = p1.Position,
		Size = p1.Size or uDim2,
		[roactModule.Children] = p1[roactModule.Children]
	})
end