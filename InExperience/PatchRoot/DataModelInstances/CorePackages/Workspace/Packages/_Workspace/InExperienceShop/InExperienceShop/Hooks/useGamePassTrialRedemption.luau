local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagLuaAppEnableGamePassFreeTrialsModule = require(InExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)

return function(p1)
	-- upvalues: SignalsReactModule (copy), GetInExperienceShopStoreModule (copy), FFlagLuaAppEnableGamePassFreeTrialsModule (copy), ReactModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetInExperienceShopStoreModule)
	
	return {
		isActionLoading = SignalsReactModule.useSignalState(function(p2): boolean
			-- upvalues: FFlagLuaAppEnableGamePassFreeTrialsModule (upval), UseSignalStateResult (copy), p1 (copy)
			return if FFlagLuaAppEnableGamePassFreeTrialsModule then UseSignalStateResult.getTrialRedemptionInFlight(p2)[p1] == true else false
		end),
		isActionDisabled = SignalsReactModule.useSignalState(function(p2): boolean
			-- upvalues: FFlagLuaAppEnableGamePassFreeTrialsModule (upval), UseSignalStateResult (copy)
			return if FFlagLuaAppEnableGamePassFreeTrialsModule then next(UseSignalStateResult.getTrialRedemptionInFlight(p2)) ~= nil else false
		end),
		onTryActivated = ReactModule.useCallback(function()
			-- upvalues: FFlagLuaAppEnableGamePassFreeTrialsModule (upval), UseSignalStateResult (copy), p1 (copy)
			if FFlagLuaAppEnableGamePassFreeTrialsModule then
				UseSignalStateResult.redeemGamePassTrial(p1)
			end
		end, { p1, UseSignalStateResult.redeemGamePassTrial })
	}
end