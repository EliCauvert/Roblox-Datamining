local parent = script:FindFirstAncestor("DataHydration").Parent
local httpService = game:GetService("HttpService")
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local urlBase = require(parent.UrlBuilder).UrlBase
local _ = require(script.Parent.AdCampaignsTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise
local t = {}

local function fetchBillingAccounts(p1)
	-- upvalues: fetch (ref), urlBase (ref), asPromise (ref)
	return asPromise(fetch({
		method = "GET",
		analyticsKey = "ads-billing-accounts.list",
		network = p1.network,
		url = (p1.baseUrl or urlBase.APIS) .. "/ads-management/v1/billing-accounts",
		decode = function(p2)
			local var1 = if type(p2) == "table" then p2.billingAccounts else nil
			
			if type(var1) ~= "table" then
				error("Billing accounts response is missing billingAccounts")
			end
			return var1
		end
	}))
end

local function mapCampaign(p1)
	local schedule = p1.schedule or {}
	
	return {
		id = p1.id,
		name = p1.name,
		status = p1.status,
		deliveryStatus = p1.deliveryStatus,
		targetUniverseId = p1.targetUniverseId,
		schedule = {
			startTime = schedule.startTime,
			durationInDays = if type(schedule.durationInDays) == "number" then schedule.durationInDays else 0
		}
	}
end

local function fetchAllCampaigns(p1)
	-- upvalues: urlBase (ref), promiseModule (ref), httpService (ref), fetch (ref), asPromise (ref), mapCampaign (ref)
	local baseUrl = p1.baseUrl or urlBase.APIS
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: baseUrl (ref), httpService (copy), fetch (copy), p1 (ref), asPromise (copy), mapCampaign (copy)
		local t = {}
		
		local function fetchPage(p4, p5)
			-- upvalues: baseUrl (copy), httpService (copy), fetch (copy), p1 (copy), asPromise (copy), t (ref), mapCampaign (copy), p2 (ref), p3 (ref), fetchPage (ref)
			local var1 = ("%s%s?maxPageSize=%d"):format(baseUrl, "/ads-management/v1/campaigns", 100)
			
			if p4 ~= nil and p4 ~= "" then
				var1 ..= "&pageToken=" .. httpService:UrlEncode(p4)
			end
			asPromise(fetch({
				method = "GET",
				analyticsKey = "ads-campaigns.list",
				network = p1.network,
				url = var1,
				decode = function(p6)
					return p6
				end
			})):andThen(function(p6)
				-- upvalues: t (copy), mapCampaign (copy), p2 (copy), p5 (ref), p3 (copy), fetchPage (copy)
				local var2 = if p6 ~= nil then nil else p6.campaigns
				
				if var2 ~= nil then
					for i, v in var2 do
						table.insert(t, mapCampaign(v))
					end
				end
				local var3 = if p6 ~= nil then nil else p6.nextPageToken
				
				if var3 == nil or var3 == "" then
					p2(t)
					
					return
				elseif p5 >= 10 then
					p3({
						errorMessage = "Ad campaigns pagination exceeded the page limit"
					})
					
					return
				end
				fetchPage(var3, p5 + 1)
			end):catch(function(p7)
				-- upvalues: p3 (copy)
				p3(p7)
			end)
		end
		
		fetchPage(nil, 1)
	end)
end

function t.fetchAdCampaigns(p2)
	-- upvalues: promiseModule (ref), fetchBillingAccounts (ref), fetchAllCampaigns (ref)
	p2 = p2 or {}
	
	return promiseModule.race({
		fetchBillingAccounts(p2):andThen(function(p3)
			-- upvalues: fetchAllCampaigns (copy), p2 (ref)
			return if #p3 == 0 then {} else fetchAllCampaigns(p2)
		end),
		(p2.delay or promiseModule.delay)(p2.timeoutSec or 25):andThen(function()
			-- upvalues: promiseModule (copy)
			return promiseModule.reject({ errorMessage = "Ad campaigns fetch timed out" })
		end)
	})
end

return t