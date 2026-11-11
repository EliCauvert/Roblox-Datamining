local TeleportService = game:GetService("TeleportService")
local InExperienceDetailsPrompt = script:FindFirstAncestor("InExperienceDetailsPrompt")
local Parent = InExperienceDetailsPrompt.Parent
local ReactModule = require(Parent.React)
local InExperienceDetailsPromptContainerModule = require(InExperienceDetailsPrompt.Features.InExperienceDetailsPromptContainer)
local FireInExperienceDetailsPromptOpenedEventFunction = require(Parent.DiscoveryAnalytics).Events.fireInExperienceDetailsPromptOpenedEvent
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local FFlagLuaAppIedpOverlayAndNavigationFix = require(Parent.SharedFlags).FFlagLuaAppIedpOverlayAndNavigationFix
local FFlagLuaAppIedpControlledJoin = require(Parent.SharedFlags).FFlagLuaAppIedpControlledJoin

return function()
	-- upvalues: ReactModule (copy), TeleportService (copy), FireInExperienceDetailsPromptOpenedEventFunction (copy), FFlagLuaAppIedpControlledJoin (copy), DiscoveryEventErrorLogger (copy), FFlagLuaAppIedpOverlayAndNavigationFix (copy), InExperienceDetailsPromptContainerModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: TeleportService (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), FireInExperienceDetailsPromptOpenedEventFunction (upval)
		local OpenExperienceDetailsPromptConnection = TeleportService.OpenExperienceDetailsPrompt:Connect(function(UniverseId)
			-- upvalues: UseStateResult2 (upval), UseStateResult2_1 (upval), FireInExperienceDetailsPromptOpenedEventFunction (upval)
			UseStateResult2((tostring(UniverseId)))
			UseStateResult2_1(true)
			FireInExperienceDetailsPromptOpenedEventFunction({ targetUniverseId = tostring(UniverseId) })
		end)
		
		return function()
			-- upvalues: OpenExperienceDetailsPromptConnection (copy)
			if OpenExperienceDetailsPromptConnection then
				OpenExperienceDetailsPromptConnection:Disconnect()
			end
		end
	end, {})
	
	if UseStateResult1 and UseStateResult then
		local function closePrompt()
			-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy)
			UseStateResult2(nil)
			UseStateResult2_1(false)
		end
		
		local Config = if FFlagLuaAppIedpControlledJoin then {
			universeId = UseStateResult,
			onJoin = function(PlaceId)
				-- upvalues: TeleportService (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), DiscoveryEventErrorLogger (upval), UseStateResult (copy)
				if PlaceId then
					TeleportService:PromptExperienceDetailsCompleted(Enum.PromptExperienceDetailsResult.TeleportAttempted)
					TeleportService:Teleport(PlaceId)
					UseStateResult2(nil)
					UseStateResult2_1(false)
					
					return
				else
					DiscoveryEventErrorLogger.reportError("InExperienceDetailsPromptAppOnJoinMissingRootPlaceId", "Missing valid root place id for universe id", { universeId = UseStateResult })
				end
			end,
			onClose = function()
				-- upvalues: TeleportService (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
				TeleportService:PromptExperienceDetailsCompleted(Enum.PromptExperienceDetailsResult.PromptClosed)
				UseStateResult2(nil)
				UseStateResult2_1(false)
			end
		} else { universeId = UseStateResult, onClose = closePrompt }
		
		return if FFlagLuaAppIedpOverlayAndNavigationFix then ReactModule.createElement(InExperienceDetailsPromptContainerModule, Config) else ReactModule.createElement("ScreenGui", { ScreenInsets = Enum.ScreenInsets.None }, {
			InExperienceDetailsPrompt = ReactModule.createElement(InExperienceDetailsPromptContainerModule, Config)
		})
	else
		return nil
	end
end