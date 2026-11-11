local Parent = script.Parent
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local SoundService = game:GetService("SoundService")
local GetCoreGuiAtPositionModule = require(Parent.getCoreGuiAtPosition)
local TTSHandlerModule = require(Parent.TTSHandler)
local TTSHandlerStateModule = require(Parent.TTSHandlerState)
local TextUtilityModule = require(Parent.TextUtility)
local PropertiesModule = require(Parent.Properties)
local HighlightCoreGuiModule = require(Parent.highlightCoreGui)
local CreateLoggerModule = require(Parent.CreateLogger)
local v1 = require(Parent.getFFlagReadAloudDebugPrintouts)()
local LoggerModule = if v1 then CreateLoggerModule(script.Name) else nil
local InputBeganConnection = nil
local NewResult = nil
local v2 = nil
local v3 = nil
local ClockTime = -1
local config = { [Enum.UserInputType.MouseButton2] = true }

local function _(Input): boolean
	-- upvalues: config (copy)
	return if config[Input.UserInputType] then true else false
end

function TriggerTTS(p1)
	-- upvalues: config (copy), HighlightCoreGuiModule (copy), v2 (ref), NewResult (ref), v3 (ref), v1 (copy), LoggerModule (copy), TTSHandlerStateModule (copy), ClockTime (ref), TextUtilityModule (copy)
	return function(Input, _)
		-- upvalues: config (upval), HighlightCoreGuiModule (upval), p1 (copy), v2 (upval), NewResult (upval), v3 (upval), v1 (upval), LoggerModule (upval), TTSHandlerStateModule (upval), ClockTime (upval), TextUtilityModule (upval)
		if not (if config[Input.UserInputType] then true else false) then
			HighlightCoreGuiModule.highlight(p1, v2)
			
			return
		end
		if v2 and NewResult then
			if v3 == v2 then
				if v1 then
					LoggerModule:debug("Clicked previously read object------------------------")
				end
				if NewResult.State == TTSHandlerStateModule.Playing then
					NewResult:Pause()
					
					return
				end
				if NewResult.State == TTSHandlerStateModule.Idle or NewResult.State == TTSHandlerStateModule.Paused then
					NewResult:Play()
					
					return
				end
				if NewResult.State == TTSHandlerStateModule.Loading then
					LoggerModule:info("TTSHandler is loading, blocked input")
					
					return
				end
			else
				if v1 then
					LoggerModule:debug("Clicked new text------------------------")
				end
				ClockTime = os.clock()
				v3 = v2
				NewResult:SetText((TextUtilityModule.retrieveDescendantText(v2)))
				NewResult:Play()
			end
		end
	end
end

local _ = function(p1)
	-- upvalues: RunService (copy), ClockTime (ref), PropertiesModule (copy), UserInputService (copy), GetCoreGuiAtPositionModule (copy), GuiService (copy), v2 (ref), HighlightCoreGuiModule (copy)
	RunService:BindToRenderStep("ReadAloudHighlight", Enum.RenderPriority.Input.Value + 1, function()
		-- upvalues: ClockTime (upval), PropertiesModule (upval), UserInputService (upval), GetCoreGuiAtPositionModule (upval), GuiService (upval), v2 (upval), HighlightCoreGuiModule (upval), p1 (copy)
		if PropertiesModule.ReadAloudLoadCooldown < os.clock() - ClockTime and (UserInputService:GetLastInputType() == Enum.UserInputType.MouseMovement or UserInputService:GetLastInputType() == Enum.UserInputType.MouseWheel) then
			local v4 = GetCoreGuiAtPositionModule(UserInputService:GetMouseLocation() - GuiService:GetGuiInset())
			
			if v4 ~= v2 then
				v2 = v4
			end
		else
			v2 = nil
		end
		HighlightCoreGuiModule.highlight(p1, v2)
	end)
end

local _ = function()
	-- upvalues: RunService (copy)
	RunService:UnbindFromRenderStep("ReadAloudHighlight")
end

return {
	Enable = function()
		-- upvalues: NewResult (ref), LoggerModule (copy), HighlightCoreGuiModule (copy), InputBeganConnection (ref), UserInputService (copy), TTSHandlerModule (copy), SoundService (copy), RunService (copy), ClockTime (ref), PropertiesModule (copy), GetCoreGuiAtPositionModule (copy), GuiService (copy), v2 (ref)
		if NewResult then
			LoggerModule:warning("Attempted to enable Read Aloud, but it's already enabled!")
			
			return
		else
			local SetUpHighlightResult = HighlightCoreGuiModule.setUpHighlight()
			InputBeganConnection = UserInputService.InputBegan:Connect(TriggerTTS(SetUpHighlightResult))
			NewResult = TTSHandlerModule.new()
			SoundService:SetSoundEnabled(true)
			RunService:BindToRenderStep("ReadAloudHighlight", Enum.RenderPriority.Input.Value + 1, function()
				-- upvalues: ClockTime (upval), PropertiesModule (upval), UserInputService (upval), GetCoreGuiAtPositionModule (upval), GuiService (upval), v2 (upval), HighlightCoreGuiModule (upval), SetUpHighlightResult (copy)
				if PropertiesModule.ReadAloudLoadCooldown < os.clock() - ClockTime and (UserInputService:GetLastInputType() == Enum.UserInputType.MouseMovement or UserInputService:GetLastInputType() == Enum.UserInputType.MouseWheel) then
					local v4 = GetCoreGuiAtPositionModule(UserInputService:GetMouseLocation() - GuiService:GetGuiInset())
					
					if v4 ~= v2 then
						v2 = v4
					end
				else
					v2 = nil
				end
				HighlightCoreGuiModule.highlight(SetUpHighlightResult, v2)
			end)
		end
	end,
	Disable = function()
		-- upvalues: NewResult (ref), LoggerModule (copy), InputBeganConnection (ref), RunService (copy), HighlightCoreGuiModule (copy)
		if not NewResult then
			LoggerModule:warning("Attempted to disable Read Aloud, but it's already disabled!")
			
			return
		end
		if InputBeganConnection then
			InputBeganConnection:Disconnect()
		end
		InputBeganConnection = nil
		NewResult:CleanUp()
		NewResult = nil
		RunService:UnbindFromRenderStep("ReadAloudHighlight")
		HighlightCoreGuiModule.cleanUpHighlight()
	end,
	ReadSystemTextFromKey = function(p1)
		-- upvalues: NewResult (ref), LoggerModule (copy), v1 (copy)
		if not NewResult then
			LoggerModule:warning("Tried to read text, but Read Aloud is not enabled!")
			
			return
		end
		if v1 then
			LoggerModule:debug(`Requesting system TTS for key "{p5}"`)
		end
		NewResult:ReadSystemTextFromKey(p1)
	end
}