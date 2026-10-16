local IXPService = game:GetService("IXPService")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.SduiCompat)
local SduiContentRow = require(Parent.SduiSharedContent).SduiContentRow
local AgeCheckUpsellDismissedData = require(Parent.GameDetail).AgeCheckUpsellDismissedData
local LuaAppEdpFaeIxpEnabled = game:DefineFastFlag("LuaAppEdpFaeIxpEnabled", false)
local LuaAppEdpFaeIxpLayer = game:DefineFastString("LuaAppEdpFaeIxpLayer", "PlayerApp.GameDetailsPage.Exposure")

return ReactModule.memo(function(p1) --[[ Line: 43 | Named "SduiAgeCheckUpsellRow" ]]
	-- upvalues: SignalsReactModule (copy), AgeCheckUpsellDismissedData (copy), LuaAppEdpFaeIxpEnabled (copy), ReactModule (copy), IXPService (copy), LuaAppEdpFaeIxpLayer (copy), SduiContentRow (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(AgeCheckUpsellDismissedData.getIsAgeCheckUpsellDismissed)
	
	if LuaAppEdpFaeIxpEnabled then
		ReactModule.useEffect(function() --[[ Line: 47 ]]
			-- upvalues: UseSignalStateResult (copy), IXPService (upval), LuaAppEdpFaeIxpLayer (upval)
			if not UseSignalStateResult then
				IXPService:LogFlagLinkedUserLayerExposure(LuaAppEdpFaeIxpLayer)
			end
		end, { UseSignalStateResult })
	end
	return if UseSignalStateResult then nil else ReactModule.createElement(SduiContentRow, p1)
end)