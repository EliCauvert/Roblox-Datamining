local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)

return function(ContinueFunc, CloseFunc, TitleText, BodyText, CancelButtonText, ConfirmButtonText)
	-- upvalues: SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	return function(p1)
		-- upvalues: SetCentralOverlayModule (upval), OverlayTypeModule (upval), ContinueFunc (copy), CloseFunc (copy), TitleText (copy), BodyText (copy), CancelButtonText (copy), ConfirmButtonText (copy)
		p1:dispatch(SetCentralOverlayModule(OverlayTypeModule.SurveyPrompt, {
			continueFunc = ContinueFunc,
			closeFunc = CloseFunc,
			titleText = TitleText,
			bodyText = BodyText,
			cancelButtonText = CancelButtonText,
			confirmButtonText = ConfirmButtonText
		}))
	end
end