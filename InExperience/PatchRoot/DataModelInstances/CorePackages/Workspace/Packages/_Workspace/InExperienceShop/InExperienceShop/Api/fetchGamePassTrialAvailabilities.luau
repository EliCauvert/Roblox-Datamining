local RunService = game:GetService("RunService")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local HttpClientModule = require(Parent.HttpClient)
local _ = require(InExperienceShop.Types)
local ShopDebugLoggerModule = require(InExperienceShop.Internal.ShopDebugLogger)
local FFlagLuaAppEnableGamePassFreeTrialsModule = require(InExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function emptyAvailabilities() --[[ Line: 22 ]]
	return { available = {}, active = {} }
end

local function _(p1): string --[[ Line: 26 | Named "trialAvailabilitiesUrl" ]]
	-- upvalues: Url (copy)
	return `{Url.APIS_URL}game-passes/v1/universes/{p1}/trial-availabilities`
end

local function parseResponse(p1) --[[ Line: 30 ]]
	-- upvalues: emptyAvailabilities (copy)
	local EmptyAvailabilitiesResult = emptyAvailabilities()
	
	for _, trialAvailability in p1.trialAvailabilities do
		if typeof(trialAvailability) == "table" and trialAvailability.gamePassId ~= nil then
			local Text = tostring(trialAvailability.gamePassId)
			
			if trialAvailability.status == "Available" then
				EmptyAvailabilitiesResult.available[Text] = true
			elseif trialAvailability.status == "Active" then
				EmptyAvailabilitiesResult.active[Text] = true
			end
		end
	end
	return EmptyAvailabilitiesResult
end

return {
	fetchGamePassTrialAvailabilities = function(p2) --[[ Line: 46 ]]
		-- upvalues: FFlagLuaAppEnableGamePassFreeTrialsModule (copy), RunService (copy), ShopDebugLoggerModule (copy), PromiseModule (copy), emptyAvailabilities (copy), FetchFunction (copy), Url (copy), parseResponse (copy), AsPromiseFunction (copy)
		if FFlagLuaAppEnableGamePassFreeTrialsModule and RunService:IsStudio() and game.GameId == 0 then
			ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 50 ]]
				-- upvalues: p2 (copy)
				return "fetchGamePassTrialAvailabilities: skipped unpublished Studio universeId=" .. tostring(p2)
			end)
			
			return PromiseModule.resolve((emptyAvailabilities()))
		else
			return AsPromiseFunction((FetchFunction({
				method = "GET",
				analyticsKey = "game-pass-trial-availabilities.get",
				url = `{Url.APIS_URL}game-passes/v1/universes/{p2}/trial-availabilities`,
				decode = function(p3) --[[ Line: 60 ]]
					-- upvalues: parseResponse (upval)
					if typeof(p3) ~= "table" or typeof(p3.trialAvailabilities) ~= "table" then
						error("fetchGamePassTrialAvailabilities: malformed response, expected { trialAvailabilities = ... }")
					end
					return (parseResponse(p3))
				end
			})))
		end
	end
}