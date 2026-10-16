local GuiService = game:GetService("GuiService")
local TweenService = game:GetService("TweenService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local ResponsiveModule = require(script:FindFirstAncestor("AppPageShell").Parent.Responsive)

return function(Target) --[[ Line: 18 | Named "scrollToTop" ]]
	-- upvalues: UserGameSettings (copy), ResponsiveModule (copy), TweenService (copy), GuiService (copy)
	if UserGameSettings.ReducedMotion then
		Target.CanvasPosition = Vector2.new(0, 0)
		
		return
	end
	if ResponsiveModule.GetInputModeStore(false).getLastInputType(false) == ResponsiveModule.Input.Directional then
		local Tween = TweenService:Create(Target, TweenInfo.new(0.3), { CanvasPosition = Vector2.new(0, 0) })
		Tween:Play()
		Tween.Completed:Connect(function() --[[ Line: 26 ]]
			-- upvalues: GuiService (upval), Target (copy)
			GuiService:Select(Target)
			task.defer(function() --[[ Line: 29 ]]
				-- upvalues: Target (upval), GuiService (upval)
				if Target.Parent ~= nil then
					GuiService:Select(Target)
				end
			end)
		end)
		
		return
	else
		Target:ScrollToTop()
	end
end