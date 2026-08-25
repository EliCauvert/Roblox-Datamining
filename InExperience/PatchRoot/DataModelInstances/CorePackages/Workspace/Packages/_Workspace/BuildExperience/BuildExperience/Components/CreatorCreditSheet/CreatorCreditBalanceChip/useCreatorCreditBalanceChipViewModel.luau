local parent = script:FindFirstAncestor("BuildExperience").Parent
local localizationService = game:GetService("LocalizationService")
local creatorCreditModule = require(parent.DataHydration.CreatorCredit)
local numberLocalization = require(parent.Localization).NumberLocalization
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.CreatorCreditBalanceChipView)
local useOpenBuyRobuxWebViewModule = require(script.Parent.Parent.useOpenBuyRobuxWebView)

local function _(p0)
	-- upvalues: numberLocalization (ref), localizationService (ref)
	return numberLocalization.localize(string.format("%.0f", math.floor(p0)), localizationService.RobloxLocaleId)
end

return function()
	-- upvalues: creatorCreditModule (ref), reactModule (ref), signalsReactModule (ref), useOpenBuyRobuxWebViewModule (ref), numberLocalization (ref), localizationService (ref)
	local creatorCreditStore = creatorCreditModule.getCreatorCreditStore(false)
	local var6 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: creatorCreditStore (ref)
		return creatorCreditStore.getQuotaSummary()
	end, { creatorCreditStore }).data)
	
	return {
		balanceText = if var6 ~= nil then nil else numberLocalization.localize(string.format("%.0f", math.floor(var6.robuxBalance)), localizationService.RobloxLocaleId),
		onActivated = useOpenBuyRobuxWebViewModule(reactModule.useCallback(function()
			-- upvalues: creatorCreditStore (ref)
			creatorCreditStore.refreshQuotaSummary():catch(function() end)
		end, { creatorCreditStore }))
	}
end