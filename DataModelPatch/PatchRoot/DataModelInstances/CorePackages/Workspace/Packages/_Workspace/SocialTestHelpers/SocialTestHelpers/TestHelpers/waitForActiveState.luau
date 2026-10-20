local ReactRobloxModule = require(script:FindFirstAncestor("SocialTestHelpers").Parent.ReactRoblox)

return function(Button, p1)
	-- upvalues: ReactRobloxModule (copy)
	assert(Button:IsA("GuiButton"), "waitForActiveState expects a GuiButton")
	local P1 = p1 or 10
	
	for _ = 1, P1 do
		if Button.Active then return end
		ReactRobloxModule.act(function()
			task.wait()
		end)
	end
	error(string.format("waitForActiveState: button not Active after %d attempts for %s", P1, Button:GetFullName()))
end