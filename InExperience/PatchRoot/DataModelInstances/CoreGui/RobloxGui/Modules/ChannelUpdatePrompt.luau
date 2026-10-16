local RobloxGui = game:GetService("CoreGui").RobloxGui
local NotificationService = game:GetService("NotificationService")
local HttpService = game:GetService("HttpService")
local AppUpdateService = game:GetService("AppUpdateService")
local ErrorPromptModule = require(RobloxGui.Modules.ErrorPrompt)
local RobloxTranslatorModule = require(game:GetService("CorePackages").Workspace.Packages.RobloxTranslator)

local function _(p1, p2, p3) --[[ Line: 21 | Named "translateOrFallback" ]]
	-- upvalues: RobloxTranslatorModule (copy)
	local Success, Result = pcall(function() --[[ Line: 22 ]]
		-- upvalues: RobloxTranslatorModule (upval), p1 (copy), p3 (copy)
		return RobloxTranslatorModule:FormatByKey(p1, p3)
	end)
	
	return Success and Result or p2
end

local function performUpdate() --[[ Line: 28 ]]
	-- upvalues: AppUpdateService (copy)
	AppUpdateService:PerformManagedUpdate()
end

local _ = function(p1, p2) --[[ Line: 32 | Named "resolveUpdateName" ]]
	return if p1 == "BetaProgram" then p2.betaProgramName elseif p1 == "BoundChannel" then p2.channelName else nil
end

return {
	init = function() --[[ Line: 43 ]]
		-- upvalues: ErrorPromptModule (copy), RobloxGui (copy), RobloxTranslatorModule (copy), performUpdate (copy), NotificationService (copy), HttpService (copy), AppUpdateService (copy)
		local Default = ErrorPromptModule.new("Default", {
			MessageTextScaled = true,
			HideErrorCode = true,
			MenuIsOpenKey = "ChannelUpdatePrompt"
		})
		Default:setParent(RobloxGui)
		
		local function showUpdatePrompt(UpdateType, BetaProgramName) --[[ Line: 57 ]]
			-- upvalues: RobloxTranslatorModule (upval), Default (copy)
			local BetaProgramName1 = BetaProgramName or ""
			local v1 = nil
			
			if UpdateType == "BetaProgram" then
				local Text = "An update is required for the Beta Program you are in: \"" .. BetaProgramName1 .. "\"."
				local config = { RBX_NAME = BetaProgramName1 }
				local v2 = "InGame.ChannelUpdatePrompt.Message.BetaProgram"
				local Success, Result = pcall(function() --[[ Line: 22 ]]
					-- upvalues: RobloxTranslatorModule (upval), v2 (copy), config (copy)
					return RobloxTranslatorModule:FormatByKey(v2, config)
				end)
				v1 = Success and Result or Text
			else
				if UpdateType ~= "BoundChannel" then
					warn("ChannelUpdatePrompt: unknown updateType '" .. tostring(UpdateType) .. "', skipping prompt")
					
					return
				end
				local Text = "An update is required for the channel you are bound to: \"" .. BetaProgramName1 .. "\"."
				local config1 = { RBX_NAME = BetaProgramName1 }
				local v3 = "InGame.ChannelUpdatePrompt.Message.BoundChannel"
				local Success1, Result1 = pcall(function() --[[ Line: 22 ]]
					-- upvalues: RobloxTranslatorModule (upval), v3 (copy), config1 (copy)
					return RobloxTranslatorModule:FormatByKey(v3, config1)
				end)
				v1 = Success1 and Result1 or Text
			end
			Default:_open(v1)
		end
		
		Default:updateButtons({
			{
				Text = "Restart Now",
				LocalizationKey = "InGame.CommonUI.Button.RestartNow",
				LayoutOrder = 1,
				Primary = true,
				Callback = performUpdate
			}
		})
		Default:setErrorTitle("Update Required", "InGame.CommonUI.Title.UpdateRequired")
		local X = RobloxGui.AbsoluteSize.X
		local Y = RobloxGui.AbsoluteSize.Y
		RobloxGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 95 | Named "onScreenSizeChanged" ]]
			-- upvalues: RobloxGui (upval), X (ref), Y (ref), Default (copy)
			local X1 = RobloxGui.AbsoluteSize.X
			local Y1 = RobloxGui.AbsoluteSize.Y
			
			if X ~= X1 or Y ~= Y1 then
				X = X1
				Y = Y1
				Default:resizeWidthAndHeight(X, Y)
			end
		end)
		local X1 = RobloxGui.AbsoluteSize.X
		local Y1 = RobloxGui.AbsoluteSize.Y
		
		if X ~= X1 or Y ~= Y1 then
			X = X1
			Y = Y1
			Default:resizeWidthAndHeight(X, Y)
		end
		NotificationService.RobloxEventReceived:Connect(function(EventData) --[[ Line: 108 ]]
			-- upvalues: HttpService (upval), showUpdatePrompt (copy)
			if EventData.namespace == "ChannelUpdateRequired" then
				local Data = HttpService:JSONDecode(EventData.detail)
				local UpdateType = Data.updateType
				showUpdatePrompt(Data.updateType, if UpdateType == "BetaProgram" then Data.betaProgramName elseif UpdateType == "BoundChannel" then Data.channelName else nil)
			end
		end)
		local Success, Result = pcall(function() --[[ Line: 117 ]]
			-- upvalues: AppUpdateService (upval)
			return AppUpdateService:GetProtocolLaunchUpdateType()
		end)
		local Success1, Result1 = pcall(function() --[[ Line: 120 ]]
			-- upvalues: AppUpdateService (upval)
			return AppUpdateService:GetProtocolLaunchUpdateName()
		end)
		
		if Success and Result ~= "" then
			showUpdatePrompt(Result, Success1 and Result1 or "")
		end
	end
}