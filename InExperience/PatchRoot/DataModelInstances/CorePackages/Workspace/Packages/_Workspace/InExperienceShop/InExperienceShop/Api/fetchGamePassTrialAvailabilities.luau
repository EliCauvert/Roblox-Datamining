local RunService = game:GetService("RunService")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local HttpClientModule = require(Parent.HttpClient)
local _ = require(InExperienceShop.Types)
local ShopDebugLoggerModule = require(InExperienceShop.Internal.ShopDebugLogger)
local FFlagLuaAppEnableGamePassFreeTrialsModule = require(InExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local ParseGamePassTrialAvailabilitiesModule = require(script.Parent.parseGamePassTrialAvailabilities)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function emptyAvailabilities()
	return { available = {}, active = {}, redeemed = {} }
end

local function _(p1): string
	-- upvalues: Url (copy)
	return `{Url.APIS_URL}game-passes/v1/universes/{p1}/trial-availabilities`
end

return {
	fetchGamePassTrialAvailabilities = function(p1)
		-- upvalues: FFlagLuaAppEnableGamePassFreeTrialsModule (copy), RunService (copy), ShopDebugLoggerModule (copy), PromiseModule (copy), emptyAvailabilities (copy), FetchFunction (copy), Url (copy), ParseGamePassTrialAvailabilitiesModule (copy), AsPromiseFunction (copy)
		if FFlagLuaAppEnableGamePassFreeTrialsModule and RunService:IsStudio() and game.GameId == 0 then
			ShopDebugLoggerModule.logLazy(function(): string
				-- upvalues: p1 (copy)
				return "fetchGamePassTrialAvailabilities: skipped unpublished Studio universeId=" .. tostring(p1)
			end)
			
			return PromiseModule.resolve((emptyAvailabilities()))
		else
			return AsPromiseFunction((FetchFunction({
				method = "GET",
				analyticsKey = "game-pass-trial-availabilities.get",
				url = `{Url.APIS_URL}game-passes/v1/universes/{p1}/trial-availabilities`,
				decode = function(p2)
					-- upvalues: ParseGamePassTrialAvailabilitiesModule (upval)
					if typeof(p2) ~= "table" or typeof(p2.trialAvailabilities) ~= "table" then
						error("fetchGamePassTrialAvailabilities: malformed response, expected { trialAvailabilities = ... }")
					end
					return ParseGamePassTrialAvailabilitiesModule(p2.trialAvailabilities)
				end
			})))
		end
	end
}