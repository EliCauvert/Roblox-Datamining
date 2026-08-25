local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local httpRequestModule = require(corePackagesService.Packages.HttpRequest)
local var3 = httpRequestModule.config({
	requestFunction = function(p0, p1, p2)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.HttpRbxApi(p0, p1, p2)
	end,
	maxRetryCount = if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("WithReferralRewardTooltipInfoHttpRetryCount", 4) else nil
})
local url = require(corePackagesService.Workspace.Packages.Http).Url
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local cryoModule = require(corePackagesService.Packages.Cryo)

function GetReferralRewardTooltipInfo()
	-- upvalues: url (ref), var3 (ref)
	return var3(string.format("%sreferral-reward-metadata/v1/get-reward-metadata?%s", url.APIS_URL, url:makeQueryString({ UniverseId = game.GameId })), "GET")
end

function withReferralRewardTooltipInfo(p3)
	-- upvalues: cryoModule (ref), reactModule (ref), useLocalization (ref)
	return function(p4)
		-- upvalues: cryoModule (copy), reactModule (copy), useLocalization (copy), p3 (ref)
		local var5 = cryoModule.Dictionary.join(p4, { referralRewardTooltipText = "" })
		local var6, var7 = reactModule.useState("")
		reactModule.useEffect(function()
			-- upvalues: var7 (ref)
			GetReferralRewardTooltipInfo():andThen(function(p6)
				-- upvalues: var7 (copy)
				if p6 and p6.responseBody and p6.responseBody.name then
					var7(p6.responseBody.name)
					task.delay(4, function()
						-- upvalues: var7 (copy)
						var7("")
					end)
				end
			end):catch(function(p5)
				warn(p5)
			end)
		end, {})
		local var8 = useLocalization({
			referralRewardTooltipText = {
				"CoreScripts.TopBar.RobloxMenuReferralRewardTooltip",
				referralRewardName = var6
			}
		})
		
		if var6 ~= "" then
			var5 = cryoModule.Dictionary.join(var5, {
				referralRewardTooltipText = var8.referralRewardTooltipText
			})
		end
		return reactModule.createElement(p3, var5)
	end
end

return withReferralRewardTooltipInfo