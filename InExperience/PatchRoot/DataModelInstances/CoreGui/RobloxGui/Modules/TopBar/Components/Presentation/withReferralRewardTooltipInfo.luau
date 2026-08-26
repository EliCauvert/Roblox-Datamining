local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local httpRequestModule = require(corePackagesService.Packages.HttpRequest)
local var1 = httpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	maxRetryCount = if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("WithReferralRewardTooltipInfoHttpRetryCount", 4) else nil
})
local url = require(corePackagesService.Workspace.Packages.Http).Url
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local cryoModule = require(corePackagesService.Packages.Cryo)

function GetReferralRewardTooltipInfo()
	-- upvalues: url (ref), var1 (ref)
	return var1(string.format("%sreferral-reward-metadata/v1/get-reward-metadata?%s", url.APIS_URL, url:makeQueryString({ UniverseId = game.GameId })), "GET")
end

function withReferralRewardTooltipInfo(p1)
	-- upvalues: cryoModule (ref), reactModule (ref), useLocalization (ref)
	return function(p2)
		-- upvalues: cryoModule (copy), reactModule (copy), useLocalization (copy), p1 (ref)
		local var2 = cryoModule.Dictionary.join(p2, { referralRewardTooltipText = "" })
		local var3, var4 = reactModule.useState("")
		reactModule.useEffect(function()
			-- upvalues: var4 (ref)
			GetReferralRewardTooltipInfo():andThen(function(p3)
				-- upvalues: var4 (copy)
				if p3 and p3.responseBody and p3.responseBody.name then
					var4(p3.responseBody.name)
					task.delay(4, function()
						-- upvalues: var4 (copy)
						var4("")
					end)
				end
			end):catch(function(p3)
				warn(p3)
			end)
		end, {})
		local var5 = useLocalization({
			referralRewardTooltipText = {
				"CoreScripts.TopBar.RobloxMenuReferralRewardTooltip",
				referralRewardName = var3
			}
		})
		
		if var3 ~= "" then
			var2 = cryoModule.Dictionary.join(var2, {
				referralRewardTooltipText = var5.referralRewardTooltipText
			})
		end
		return reactModule.createElement(p1, var2)
	end
end

return withReferralRewardTooltipInfo