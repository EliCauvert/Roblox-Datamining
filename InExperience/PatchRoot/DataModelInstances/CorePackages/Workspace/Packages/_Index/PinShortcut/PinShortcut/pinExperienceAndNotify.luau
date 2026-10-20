local ShowPinExperienceResultModule = require(script.Parent.showPinExperienceResult)

local function pinExperienceAndNotify(PlaceId, UniverseId, ExperienceName, p1, PinShortcutService)
	-- upvalues: ShowPinExperienceResultModule (copy), pinExperienceAndNotify (copy)
	local PinShortcutService1 = PinShortcutService or game:GetService("PinShortcutService")
	local Connection = nil
	Connection = PinShortcutService1.OnPinExperienceCompleted:Connect(function(Status, PlaceId, UniverseId, ExperienceName)
		-- upvalues: Connection (ref), PinShortcutService1 (copy), ShowPinExperienceResultModule (upval), p1 (copy), pinExperienceAndNotify (upval)
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
		local ShouldShowLuaNotificationOnPinExperienceCompleted = false
		pcall(function()
			-- upvalues: ShouldShowLuaNotificationOnPinExperienceCompleted (ref), PinShortcutService1 (upval)
			ShouldShowLuaNotificationOnPinExperienceCompleted = PinShortcutService1:ShouldShowLuaNotificationOnPinExperienceCompleted()
		end)
		
		if ShouldShowLuaNotificationOnPinExperienceCompleted then
			ShowPinExperienceResultModule(p1, Status, ExperienceName, {
				onViewShortcut = if PinShortcutService1:IsRevealPinnedExperienceAvailable() then function()
					-- upvalues: PinShortcutService1 (upval), PlaceId (copy)
					pcall(function()
						-- upvalues: PinShortcutService1 (upval), PlaceId (upval)
						PinShortcutService1:RevealPinnedExperience(PlaceId)
					end)
				end else nil,
				onRetry = function()
					-- upvalues: pinExperienceAndNotify (upval), PlaceId (copy), UniverseId (copy), ExperienceName (copy), p1 (upval), PinShortcutService1 (upval)
					pinExperienceAndNotify(PlaceId, UniverseId, ExperienceName, p1, PinShortcutService1)
				end
			})
			
			return
		end
	end)
	
	if not pcall(function()
		-- upvalues: PinShortcutService1 (copy), PlaceId (copy), UniverseId (copy), ExperienceName (copy)
		PinShortcutService1:PinExperience(PlaceId, UniverseId, ExperienceName)
	end) and Connection then
		Connection:Disconnect()
		Connection = nil
	end
end

return pinExperienceAndNotify