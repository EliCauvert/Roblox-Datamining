local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagLuaAppEnableGamePassFreeTrialsModule = require(InExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local _ = require(InExperienceShop.Types)

return function(p1, p2)
	-- upvalues: SignalsReactModule (copy), GetInExperienceShopStoreModule (copy), FFlagLuaAppEnableGamePassFreeTrialsModule (copy), ReactModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetInExperienceShopStoreModule)
	
	return {
		isActionLoading = SignalsReactModule.useSignalState(function(p3): boolean
			-- upvalues: FFlagLuaAppEnableGamePassFreeTrialsModule (upval), UseSignalStateResult (copy), p1 (copy)
			return if FFlagLuaAppEnableGamePassFreeTrialsModule then UseSignalStateResult.getTrialRedemptionInFlight(p3)[p1] == true else false
		end),
		isActionDisabled = SignalsReactModule.useSignalState(function(p3): boolean
			-- upvalues: FFlagLuaAppEnableGamePassFreeTrialsModule (upval), UseSignalStateResult (copy)
			return if FFlagLuaAppEnableGamePassFreeTrialsModule then next(UseSignalStateResult.getTrialRedemptionInFlight(p3)) ~= nil else false
		end),
		onTryActivated = ReactModule.useCallback(function()
			-- upvalues: FFlagLuaAppEnableGamePassFreeTrialsModule (upval), UseSignalStateResult (copy), p1 (copy), p2 (copy)
			if FFlagLuaAppEnableGamePassFreeTrialsModule then
				UseSignalStateResult.redeemGamePassTrial(p1, p2)
			end
		end, { p1, p2, UseSignalStateResult.redeemGamePassTrial })
	}
end