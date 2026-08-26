local robloxGui = game:GetService("CoreGui").RobloxGui
local corePackagesService = game:GetService("CorePackages")
local notificationService = game:GetService("NotificationService")
local httpService = game:GetService("HttpService")
local appUpdateService = game:GetService("AppUpdateService")
local errorPromptModule = require(robloxGui.Modules.ErrorPrompt)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)

local function _(p1, p2, p3)
	-- upvalues: robloxTranslatorModule (ref)
	local ok, status = pcall(function()
		-- upvalues: robloxTranslatorModule (copy), p1 (ref), p3 (ref)
		return robloxTranslatorModule:FormatByKey(p1, p3)
	end)
	
	return if ok then status else p2
end

local function performUpdate()
	-- upvalues: appUpdateService (ref)
	appUpdateService:PerformManagedUpdate()
end

local _ = function(p1, p2)
	return if p1 == "BetaProgram" then p2.betaProgramName elseif p1 == "BoundChannel" then p2.channelName else nil
end

return {
	init = function()
		-- upvalues: errorPromptModule (ref), robloxGui (ref), robloxTranslatorModule (ref), performUpdate (ref), notificationService (ref), httpService (ref), appUpdateService (ref)
		local default = errorPromptModule.new("Default", {
			MessageTextScaled = true,
			HideErrorCode = true,
			MenuIsOpenKey = "ChannelUpdatePrompt"
		})
		default:setParent(robloxGui)
		
		local function showUpdatePrompt(p1, p2)
			-- upvalues: robloxTranslatorModule (copy), default (ref)
			p2 = p2 or ""
			local var1 = nil
			
			if p1 == "BetaProgram" then
				local text = "An update is required for the Beta Program you are in: \"" .. p6 .. "\"."
				local t = { RBX_NAME = p2 }
				local var2 = "InGame.ChannelUpdatePrompt.Message.BetaProgram"
				local ok, status = pcall(function()
					-- upvalues: robloxTranslatorModule (copy), var2 (ref), t (ref)
					return robloxTranslatorModule:FormatByKey(var2, t)
				end)
				var1 = if ok then status else text
			elseif p1 == "BoundChannel" then
				local text = "An update is required for the channel you are bound to: \"" .. p6 .. "\"."
				local t = { RBX_NAME = p2 }
				local var3 = "InGame.ChannelUpdatePrompt.Message.BoundChannel"
				local ok, status = pcall(function()
					-- upvalues: robloxTranslatorModule (copy), var3 (ref), t (ref)
					return robloxTranslatorModule:FormatByKey(var3, t)
				end)
				var1 = if ok then status else text
			else
				warn("ChannelUpdatePrompt: unknown updateType '" .. tostring(p1) .. "', skipping prompt")
				
				return
			end
			default:_open(var1)
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
		robloxGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
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
		notificationService.RobloxEventReceived:Connect(function(p1)
			-- upvalues: httpService (copy), showUpdatePrompt (ref)
			if p1.namespace == "ChannelUpdateRequired" then
				local detail = httpService:JSONDecode(p1.detail)
				local updateType = detail.updateType
				showUpdatePrompt(detail.updateType, if updateType == "BetaProgram" then detail.betaProgramName elseif updateType == "BoundChannel" then detail.channelName else nil)
			end
		end)
		ok, status = pcall(function()
			-- upvalues: appUpdateService (copy)
			return appUpdateService:GetProtocolLaunchUpdateType()
		end)
		local ok_1, status_1 = pcall(function()
			-- upvalues: appUpdateService (copy)
			return appUpdateService:GetProtocolLaunchUpdateName()
		end)
		
		if ok and status ~= "" then
			showUpdatePrompt(status, if ok_1 then status_1 else "")
		end
	end
}