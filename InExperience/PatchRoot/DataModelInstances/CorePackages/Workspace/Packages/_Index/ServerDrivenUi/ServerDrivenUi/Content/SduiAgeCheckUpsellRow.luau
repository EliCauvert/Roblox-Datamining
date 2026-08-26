local IXPService = game:GetService("IXPService")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local sduiContentRow = require(parent.SduiSharedContent).SduiContentRow
local ageCheckUpsellDismissedData = require(parent.GameDetail).AgeCheckUpsellDismissedData
local luaAppEdpFaeIxpEnabled = game:DefineFastFlag("LuaAppEdpFaeIxpEnabled", false)
local luaAppEdpFaeIxpLayer = game:DefineFastString("LuaAppEdpFaeIxpLayer", "PlayerApp.GameDetailsPage.Exposure")

return reactModule.memo(function(p1)
	-- upvalues: signalsReactModule (ref), ageCheckUpsellDismissedData (ref), luaAppEdpFaeIxpEnabled (ref), reactModule (ref), IXPService (ref), luaAppEdpFaeIxpLayer (ref), sduiContentRow (ref)
	local var1 = signalsReactModule.useSignalState(ageCheckUpsellDismissedData.getIsAgeCheckUpsellDismissed)
	
	if luaAppEdpFaeIxpEnabled then
		reactModule.useEffect(function()
			-- upvalues: var1 (ref), IXPService (copy), luaAppEdpFaeIxpLayer (copy)
			if not var1 then
				IXPService:LogFlagLinkedUserLayerExposure(luaAppEdpFaeIxpLayer)
			end
		end, { var1 })
	end
	return if var1 then nil else reactModule.createElement(sduiContentRow, p1)
end)