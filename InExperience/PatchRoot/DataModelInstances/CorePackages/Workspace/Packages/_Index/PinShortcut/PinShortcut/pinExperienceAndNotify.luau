local showPinExperienceResultModule = require(script.Parent.showPinExperienceResult)

local function pinExperienceAndNotify(p1, p2, p3, p4, p5)
	-- upvalues: showPinExperienceResultModule (ref), pinExperienceAndNotify (ref)
	p5 = p5 or game:GetService("PinShortcutService")
	local onPinExperienceCompletedConnection = nil
	onPinExperienceCompletedConnection = p5.OnPinExperienceCompleted:Connect(function(p6, p7, p8, p9)
		-- upvalues: onPinExperienceCompletedConnection (write), p5 (ref), showPinExperienceResultModule (copy), p4 (ref), pinExperienceAndNotify (copy)
		if onPinExperienceCompletedConnection then
			onPinExperienceCompletedConnection:Disconnect()
			onPinExperienceCompletedConnection = nil
		end
		local var1 = false
		pcall(function()
			-- upvalues: var1 (write), p5 (copy)
			var1 = p5:ShouldShowLuaNotificationOnPinExperienceCompleted()
		end)
	end)
	
	if not pcall(function()
		-- upvalues: p5 (ref), p1 (ref), p2 (ref), p3 (ref)
		p5:PinExperience(p1, p2, p3)
	end) and onPinExperienceCompletedConnection then
		onPinExperienceCompletedConnection:Disconnect()
		onPinExperienceCompletedConnection = nil
	end
end

return pinExperienceAndNotify