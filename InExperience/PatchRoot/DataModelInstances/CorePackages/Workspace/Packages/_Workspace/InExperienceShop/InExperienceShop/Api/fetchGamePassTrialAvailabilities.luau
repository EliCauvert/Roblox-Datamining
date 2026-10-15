local runService = game:GetService("RunService")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local httpClientModule = require(parent.HttpClient)
local _ = require(inExperienceShop.Types)
local shopDebugLoggerModule = require(inExperienceShop.Internal.ShopDebugLogger)
local fFlagLuaAppEnableGamePassFreeTrialsModule = require(inExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function emptyAvailabilities()
	return { available = {}, active = {} }
end

local function _(p1)
	-- upvalues: url (ref)
	return `{url.APIS_URL}game-passes/v1/universes/{p1}/trial-availabilities`
end

local function parseResponse(p1)
	-- upvalues: emptyAvailabilities (ref)
	local var1 = emptyAvailabilities()
	
	for i, v in p1.trialAvailabilities do
		if typeof(v) == "table" and v.gamePassId ~= nil then
			local var2 = tostring(v.gamePassId)
			
			if v.status == "Available" then
				var1.available[var2] = true
			elseif v.status == "Active" then
				var1.active[var2] = true
			end
		end
	end
	return var1
end

return {
	fetchGamePassTrialAvailabilities = function(p2)
		-- upvalues: fFlagLuaAppEnableGamePassFreeTrialsModule (ref), runService (ref), shopDebugLoggerModule (ref), promiseModule (ref), emptyAvailabilities (ref), fetch (ref), url (ref), parseResponse (ref), asPromise (ref)
		if fFlagLuaAppEnableGamePassFreeTrialsModule and runService:IsStudio() and game.GameId == 0 then
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p2 (ref)
				return "fetchGamePassTrialAvailabilities: skipped unpublished Studio universeId=" .. tostring(p2)
			end)
			
			return promiseModule.resolve(emptyAvailabilities())
		end
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "game-pass-trial-availabilities.get",
			url = `{url.APIS_URL}game-passes/v1/universes/{p2}/trial-availabilities`,
			decode = function(p3)
				-- upvalues: parseResponse (copy)
				if typeof(p3) ~= "table" or typeof(p3.trialAvailabilities) ~= "table" then
					error("fetchGamePassTrialAvailabilities: malformed response, expected { trialAvailabilities = ... }")
				end
				return parseResponse(p3)
			end
		}))
	end
}