local parent = script:FindFirstAncestor("DataHydration").Parent
local httpService = game:GetService("HttpService")
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local urlBase = require(parent.UrlBuilder).UrlBase
local _ = require(script.Parent.AdCampaignsTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise
local t = {}

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

function t.fetchAdCampaigns(p1)
	-- upvalues: urlBase (ref), promiseModule (ref), httpService (ref), fetch (ref), asPromise (ref), mapCampaign (ref)
	p1 = p1 or {}
	local baseUrl = p1.baseUrl or urlBase.APIS
	
	return promiseModule.race({
		promiseModule.new(function(p2, p3)
			-- upvalues: baseUrl (ref), httpService (copy), fetch (copy), p1 (ref), asPromise (copy), mapCampaign (copy)
			local t = {}
			
			local function fetchPage(p4, p5)
				-- upvalues: baseUrl (copy), httpService (copy), fetch (copy), p1 (copy), asPromise (copy), t (ref), mapCampaign (copy), p2 (ref), p3 (ref), fetchPage (ref)
				local var1 = ("%s/ads-management/v1/campaigns?maxPageSize=%d"):format(baseUrl, 100)
				
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
		end),
		(p1.delay or promiseModule.delay)(p1.timeoutSec or 25):andThen(function()
			-- upvalues: promiseModule (copy)
			return promiseModule.reject({ errorMessage = "Ad campaigns fetch timed out" })
		end)
	})
end

return t