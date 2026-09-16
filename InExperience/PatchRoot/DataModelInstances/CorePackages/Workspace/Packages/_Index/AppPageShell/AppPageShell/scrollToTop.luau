local guiService = game:GetService("GuiService")
local tweenService = game:GetService("TweenService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local responsiveModule = require(script:FindFirstAncestor("AppPageShell").Parent.Responsive)

return function(p1)
	-- upvalues: userGameSettingsService (ref), responsiveModule (ref), tweenService (ref), guiService (ref)
	if userGameSettingsService.ReducedMotion then
		p1.CanvasPosition = Vector2.new(0, 0)
		
		return
	elseif responsiveModule.GetInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Directional then
		local var1 = tweenService:Create(p1, TweenInfo.new(0.3), { CanvasPosition = Vector2.new(0, 0) })
		var1:Play()
		var1.Completed:Connect(function()
			-- upvalues: guiService (copy), p1 (ref)
			guiService:Select(p1)
			task.defer(function()
				-- upvalues: p1 (copy), guiService (copy)
				if p1.Parent ~= nil then
					guiService:Select(p1)
				end
			end)
		end)
		
		return
	end
	p1:ScrollToTop()
end