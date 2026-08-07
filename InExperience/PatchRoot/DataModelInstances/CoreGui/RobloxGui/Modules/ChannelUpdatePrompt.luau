local robloxGui = game:GetService("CoreGui").RobloxGui
local corePackagesService = game:GetService("CorePackages")
local notificationService = game:GetService("NotificationService")
local httpService = game:GetService("HttpService")
local appUpdateService = game:GetService("AppUpdateService")
local errorPromptModule = require(robloxGui.Modules.ErrorPrompt)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)

local function _(p0, p1, p2) --[[ line: 21 | named "translateOrFallback" ]]
	-- upvalues: robloxTranslatorModule (ref)
	local ok, status = pcall(function() --[[ line: 22 ]]
		-- upvalues: robloxTranslatorModule (copy), p0 (ref), p2 (ref)
		return robloxTranslatorModule:FormatByKey(p0, p2)
	end)
	
	return if ok then status else p1
end

local function performUpdate() --[[ line: 28 ]]
	-- upvalues: appUpdateService (ref)
	appUpdateService:PerformManagedUpdate()
end

local _ = function(p3, p4) --[[ line: 32 | named "resolveUpdateName" ]]
	return if p3 == "BetaProgram" then p4.betaProgramName elseif p3 == "BoundChannel" then p4.channelName else nil
end

return {
	init = function() --[[ line: 43 ]]
		-- upvalues: errorPromptModule (ref), robloxGui (ref), robloxTranslatorModule (ref), performUpdate (ref), notificationService (ref), httpService (ref), appUpdateService (ref)
		local default = errorPromptModule.new("Default", {
			MessageTextScaled = true,
			HideErrorCode = true,
			MenuIsOpenKey = "ChannelUpdatePrompt"
		})
		default:setParent(robloxGui)
		
		local function showUpdatePrompt(p5, p6) --[[ line: 57 ]]
			-- upvalues: robloxTranslatorModule (copy), default (ref)
			p6 = p6 or ""
			local var10 = nil
			
			if p5 == "BetaProgram" then
				local text = "An update is required for the Beta Program you are in: \"" .. p6 .. "\"."
				local t = { RBX_NAME = p6 }
				local var13 = "InGame.ChannelUpdatePrompt.Message.BetaProgram"
				local ok, status = pcall(function() --[[ line: 22 ]]
					-- upvalues: robloxTranslatorModule (copy), var13 (ref), t (ref)
					return robloxTranslatorModule:FormatByKey(var13, t)
				end)
				var10 = if ok then status else text
			elseif p5 == "BoundChannel" then
				local text = "An update is required for the channel you are bound to: \"" .. p6 .. "\"."
				local t = { RBX_NAME = p6 }
				local var16 = "InGame.ChannelUpdatePrompt.Message.BoundChannel"
				local ok, status = pcall(function() --[[ line: 22 ]]
					-- upvalues: robloxTranslatorModule (copy), var16 (ref), t (ref)
					return robloxTranslatorModule:FormatByKey(var16, t)
				end)
				var10 = if ok then status else text
			else
				warn("ChannelUpdatePrompt: unknown updateType '" .. tostring(p5) .. "', skipping prompt")
				
				return
			end
			default:_open(var10)
		end
		
		default:updateButtons({
			{
				Text = "Restart Now",
				LocalizationKey = "InGame.CommonUI.Button.RestartNow",
				LayoutOrder = 1,
				Primary = true,
				Callback = performUpdate
			}
		})
		default:setErrorTitle("Update Required", "InGame.CommonUI.Title.UpdateRequired")
		local x = robloxGui.AbsoluteSize.X
		local y = robloxGui.AbsoluteSize.Y
		robloxGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 95 | named "onScreenSizeChanged" ]]
			-- upvalues: robloxGui (copy), x (write), y (write), default (ref)
			local x_1 = robloxGui.AbsoluteSize.X
			local y_1 = robloxGui.AbsoluteSize.Y
			
			if x ~= x_1 or y ~= y_1 then
				x = x_1
				y = y_1
				default:resizeWidthAndHeight(x, y)
			end
		end)
		local ok = robloxGui.AbsoluteSize.X
		local y_1 = robloxGui.AbsoluteSize.Y
		
		if x ~= ok or y ~= y_1 then
			default:resizeWidthAndHeight(ok, y_1)
		end
		notificationService.RobloxEventReceived:Connect(function(p7) --[[ line: 108 ]]
			-- upvalues: httpService (copy), showUpdatePrompt (ref)
			if p7.namespace == "ChannelUpdateRequired" then
				local detail = httpService:JSONDecode(p7.detail)
				local updateType = detail.updateType
				showUpdatePrompt(detail.updateType, if updateType == "BetaProgram" then detail.betaProgramName elseif updateType == "BoundChannel" then detail.channelName else nil)
			end
		end)
		ok, status = pcall(function() --[[ line: 117 ]]
			-- upvalues: appUpdateService (copy)
			return appUpdateService:GetProtocolLaunchUpdateType()
		end)
		local ok_1, status_1 = pcall(function() --[[ line: 120 ]]
			-- upvalues: appUpdateService (copy)
			return appUpdateService:GetProtocolLaunchUpdateName()
		end)
		
		if ok and status ~= "" then
			showUpdatePrompt(status, if ok_1 then status_1 else "")
		end
	end
}