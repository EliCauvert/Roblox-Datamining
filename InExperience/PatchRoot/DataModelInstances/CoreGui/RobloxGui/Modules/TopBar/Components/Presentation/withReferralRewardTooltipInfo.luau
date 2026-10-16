local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local HttpRequestModule = require(CorePackages.Packages.HttpRequest)
local ConfigResult = HttpRequestModule.config({
	requestFunction = function(p1, p2, p3) --[[ Line: 7 ]]
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	maxRetryCount = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("WithReferralRewardTooltipInfoHttpRetryCount", 4) else nil
})
local Url = require(CorePackages.Workspace.Packages.Http).Url
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local CryoModule = require(CorePackages.Packages.Cryo)

function GetReferralRewardTooltipInfo() --[[ Line: 19 ]]
	-- upvalues: Url (copy), ConfigResult (copy)
	return ConfigResult(string.format("%sreferral-reward-metadata/v1/get-reward-metadata?%s", Url.APIS_URL, (Url:makeQueryString({ UniverseId = game.GameId }))), "GET")
end

function withReferralRewardTooltipInfo(p1) --[[ Line: 27 ]]
	-- upvalues: CryoModule (copy), ReactModule (copy), UseLocalizationFunction (copy)
	return function(p2) --[[ Line: 28 ]]
		-- upvalues: CryoModule (upval), ReactModule (upval), UseLocalizationFunction (upval), p1 (copy)
		local JoinResult = CryoModule.Dictionary.join(p2, { referralRewardTooltipText = "" })
		local UseStateResult, UseStateResult2 = ReactModule.useState("")
		ReactModule.useEffect(function() --[[ Line: 33 ]]
			-- upvalues: UseStateResult2 (copy)
			GetReferralRewardTooltipInfo():andThen(function(Result) --[[ Line: 34 ]]
				-- upvalues: UseStateResult2 (upval)
				if Result and Result.responseBody and Result.responseBody.name then
					UseStateResult2(Result.responseBody.name)
					task.delay(4, function() --[[ Line: 37 ]]
						-- upvalues: UseStateResult2 (upval)
						UseStateResult2("")
					end)
				end
			end):catch(function(Err) --[[ Line: 41 ]]
				warn(Err)
			end)
		end, {})
		local UseLocalizationResult = UseLocalizationFunction({
			referralRewardTooltipText = {
				"CoreScripts.TopBar.RobloxMenuReferralRewardTooltip",
				referralRewardName = UseStateResult
			}
		})
		
		if UseStateResult ~= "" then
			JoinResult = CryoModule.Dictionary.join(JoinResult, {
				referralRewardTooltipText = UseLocalizationResult.referralRewardTooltipText
			})
		end
		return ReactModule.createElement(p1, JoinResult)
	end
end

return withReferralRewardTooltipInfo