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

local function emptyAvailabilities()
	return { available = {}, active = {}, redeemed = {} }
end

local function _(p1): string
	-- upvalues: Url (copy)
	return `{Url.APIS_URL}game-passes/v1/universes/{p1}/trial-availabilities`
end

local _ = function(p1)
	return if typeof(p1) == "string" then DateTime.fromIsoDate(p1) else nil
end

local _ = function(p1, p2)
	p1.available[p2] = nil
	p1.active[p2] = nil
	p1.redeemed[p2] = nil
end

local function parseResponse(p1)
	-- upvalues: emptyAvailabilities (copy)
	local EmptyAvailabilitiesResult = emptyAvailabilities()
	
	for _, trialAvailability in p1.trialAvailabilities do
		if typeof(trialAvailability) == "table" and trialAvailability.gamePassId ~= nil then
			local Text = tostring(trialAvailability.gamePassId)
			local Status = trialAvailability.status
			
			if Status == "Available" or Status == "Active" or Status == "Redeemed" then
				EmptyAvailabilitiesResult.available[Text] = nil
				EmptyAvailabilitiesResult.active[Text] = nil
				EmptyAvailabilitiesResult.redeemed[Text] = nil
				
				if Status == "Available" then
					EmptyAvailabilitiesResult.available[Text] = true
				elseif Status == "Active" then
					EmptyAvailabilitiesResult.active[Text] = true
				else
					local EndTime = trialAvailability.endTime
					EmptyAvailabilitiesResult.redeemed[Text] = {
						endTime = if typeof(EndTime) == "string" then DateTime.fromIsoDate(EndTime) else nil
					}
				end
			end
		end
	end
	return EmptyAvailabilitiesResult
end

return {
	fetchGamePassTrialAvailabilities = function(p2)
		-- upvalues: FFlagLuaAppEnableGamePassFreeTrialsModule (copy), RunService (copy), ShopDebugLoggerModule (copy), PromiseModule (copy), emptyAvailabilities (copy), FetchFunction (copy), Url (copy), parseResponse (copy), AsPromiseFunction (copy)
		if FFlagLuaAppEnableGamePassFreeTrialsModule and RunService:IsStudio() and game.GameId == 0 then
			ShopDebugLoggerModule.logLazy(function(): string
				-- upvalues: p2 (copy)
				return "fetchGamePassTrialAvailabilities: skipped unpublished Studio universeId=" .. tostring(p2)
			end)
			
			return PromiseModule.resolve((emptyAvailabilities()))
		else
			return AsPromiseFunction((FetchFunction({
				method = "GET",
				analyticsKey = "game-pass-trial-availabilities.get",
				url = `{Url.APIS_URL}game-passes/v1/universes/{p2}/trial-availabilities`,
				decode = function(p3)
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