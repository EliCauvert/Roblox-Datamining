local Parent = script:FindFirstAncestor("SettingsTabVisibility").Parent
local ReactModule = require(Parent.React)
local AmpUpsellModule = require(Parent.AmpUpsell)
local AmpApiProvider = AmpUpsellModule.AmpApiProvider
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local FetchFunction = require(Parent.Fetch).fetch

return function()
	-- upvalues: ReactModule (copy), AmpApiProvider (copy), AccessResponseEnum (copy), UrlBuilder (copy), FetchFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: AmpApiProvider (upval), AccessResponseEnum (upval), UseStateResult2 (copy), UrlBuilder (upval), FetchFunction (upval)
		task.spawn(function()
			-- upvalues: AmpApiProvider (upval), AccessResponseEnum (upval), UseStateResult2 (upval), UrlBuilder (upval), FetchFunction (upval)
			local FeatureAccess = AmpApiProvider.getFeatureAccess({ "ShouldHideSpendingSettingsTab" })
			
			if not FeatureAccess.featureAccessList or FeatureAccess.featureAccessList and (#FeatureAccess.featureAccessList > 0 and FeatureAccess.featureAccessList[1].access == AccessResponseEnum.Granted) then
				FetchFunction(UrlBuilder.fromString("apis:payments-gateway/v1/payment-profiles")(), { method = "GET" }):andThen(function(Result)
					-- upvalues: UseStateResult2 (upval)
					local JsonResult = Result:json()
					UseStateResult2(if JsonResult and JsonResult._values and JsonResult._values[1] then #JsonResult._values[1] > 0 else false)
				end):catch(function()
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(true)
				end)
				
				return
			else
				UseStateResult2(true)
			end
		end)
	end, {})
	
	return { showBillingTab = UseStateResult }
end