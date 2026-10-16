local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpService = game:GetService("HttpService")
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local _ = require(script.Parent.AdCampaignsTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function fetchBillingAccounts(p1) --[[ Line: 38 ]]
	-- upvalues: FetchFunction (copy), UrlBase (copy), AsPromiseFunction (copy)
	return AsPromiseFunction((FetchFunction({
		method = "GET",
		analyticsKey = "ads-billing-accounts.list",
		network = p1.network,
		url = (p1.baseUrl or UrlBase.APIS) .. "/ads-management/v1/billing-accounts",
		decode = function(p2) --[[ Line: 44 ]]
			local BillingAccounts = if type(p2) == "table" then p2.billingAccounts else nil
			
			if type(BillingAccounts) ~= "table" then
				error("Billing accounts response is missing billingAccounts")
			end
			return BillingAccounts
		end
	})))
end

local function mapCampaign(p1) --[[ Line: 56 ]]
	local Schedule = p1.schedule or {}
	
	return {
		id = p1.id,
		name = p1.name,
		status = p1.status,
		deliveryStatus = p1.deliveryStatus,
		targetUniverseId = p1.targetUniverseId,
		schedule = {
			startTime = Schedule.startTime,
			durationInDays = if type(Schedule.durationInDays) == "number" then Schedule.durationInDays else 0
		}
	}
end

local function fetchAllCampaigns(p1) --[[ Line: 71 ]]
	-- upvalues: UrlBase (copy), PromiseModule (copy), HttpService (copy), FetchFunction (copy), AsPromiseFunction (copy), mapCampaign (copy)
	local BaseUrl = p1.baseUrl or UrlBase.APIS
	
	return PromiseModule.new(function(Callback1, Callback) --[[ Line: 74 ]]
		-- upvalues: BaseUrl (copy), HttpService (upval), FetchFunction (upval), p1 (copy), AsPromiseFunction (upval), mapCampaign (upval)
		local List = {}
		
		local function fetchPage(NextPageToken, p2) --[[ Line: 77 ]]
			-- upvalues: BaseUrl (upval), HttpService (upval), FetchFunction (upval), p1 (upval), AsPromiseFunction (upval), List (copy), mapCampaign (upval), Callback1 (copy), Callback (copy), fetchPage (copy)
			local MaxPageSizeName: string = ("%s%s?maxPageSize=%d"):format(BaseUrl, "/ads-management/v1/campaigns", 100)
			
			if NextPageToken ~= nil and NextPageToken ~= "" then
				MaxPageSizeName ..= "&pageToken=" .. HttpService:UrlEncode(NextPageToken)
			end
			AsPromiseFunction((FetchFunction({
				method = "GET",
				analyticsKey = "ads-campaigns.list",
				network = p1.network,
				url = MaxPageSizeName,
				decode = function(p3) --[[ Line: 88 ]]
					return p3
				end
			}))):andThen(function(Result) --[[ Line: 94 ]]
				-- upvalues: List (upval), mapCampaign (upval), Callback1 (upval), p2 (copy), Callback (upval), fetchPage (upval)
				local Campaigns = if Result == nil then nil else Result.campaigns
				
				if Campaigns ~= nil then
					for _, campaign in Campaigns do
						table.insert(List, (mapCampaign(campaign)))
					end
				end
				local NextPageToken = if Result == nil then nil else Result.nextPageToken
				
				if NextPageToken == nil or NextPageToken == "" then
					Callback1(List)
					
					return
				end
				if p2 >= 10 then
					Callback({
						errorMessage = "Ad campaigns pagination exceeded the page limit"
					})
					
					return
				else
					fetchPage(NextPageToken, p2 + 1)
				end
			end):catch(function(Err) --[[ Line: 114 ]]
				-- upvalues: Callback (upval)
				Callback(Err)
			end)
		end
		
		fetchPage(nil, 1)
	end)
end

return {
	fetchAdCampaigns = function(p2) --[[ Line: 127 ]]
		-- upvalues: PromiseModule (copy), fetchBillingAccounts (copy), fetchAllCampaigns (copy)
		local P9 = p2 or {}
		
		return PromiseModule.race({
			fetchBillingAccounts(P9):andThen(function(Result) --[[ Line: 132 ]]
				-- upvalues: fetchAllCampaigns (upval), P9 (copy)
				return if #Result == 0 then {} else fetchAllCampaigns(P9)
			end),
			((P9.delay or PromiseModule.delay)(P9.timeoutSec or 25):andThen(function() --[[ Line: 141 ]]
				-- upvalues: PromiseModule (upval)
				return PromiseModule.reject({ errorMessage = "Ad campaigns fetch timed out" })
			end))
		})
	end
}