local Parent = script:FindFirstAncestor("NavigationRodux").Parent
local CentralOverlayModule = require(Parent.CentralOverlay)
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType

return function(Callback)
	-- upvalues: CentralOverlayModule (copy), CentralOverlayType (copy)
	return function(p1)
		-- upvalues: CentralOverlayModule (upval), CentralOverlayType (upval), Callback (copy)
		p1:dispatch(CentralOverlayModule.Actions.SetCentralOverlay(CentralOverlayType.LeaveRobloxAlert, {
			bodyTextKey = "Feature.GameDetails.Message.RobloxWebsiteSignedInWarning",
			continueFunc = function()
				-- upvalues: p1 (copy), CentralOverlayModule (upval), Callback (upval)
				p1:dispatch(CentralOverlayModule.Thunks.CloseCentralOverlay())
				Callback()
			end
		}))
	end
end