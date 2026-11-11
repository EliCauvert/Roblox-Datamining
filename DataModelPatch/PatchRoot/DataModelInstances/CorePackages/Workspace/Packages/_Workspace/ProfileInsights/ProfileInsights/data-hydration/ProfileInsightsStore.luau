local Parent = script:FindFirstAncestor("ProfileInsights").Parent
local SignalsModule = require(Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local ProfileInsightsModelModule = require(script.Parent.ProfileInsightsModel)
local HttpService = game:GetService("HttpService")
local ProfileInsightsStoreHttpTimeout = game:DefineFastInt("ProfileInsightsStoreHttpTimeout", 1500)
local UrlBuilderModule = require(Parent.UrlBuilder)
local Url = UrlBuilderModule.UrlBuilder.new({
	path = "profile-insights-api/v1/multiProfileInsights",
	base = UrlBuilderModule.UrlBase.APIS
})()

local function makeHttpCall(UserIds, Count, RankingStrategy, Callback)
	-- upvalues: HttpService (copy), Url (copy), ProfileInsightsStoreHttpTimeout (copy)
	HttpService:RequestInternal({
		Method = "POST",
		Priority = 0,
		Url = Url,
		Body = HttpService:JSONEncode({
			userIds = UserIds,
			count = if RankingStrategy then nil else Count or 2,
			rankingStrategy = RankingStrategy
		}),
		Timeout = ProfileInsightsStoreHttpTimeout,
		CachePolicy = Enum.HttpCachePolicy.None,
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		},
		RequestType = Enum.HttpRequestType.Default
	}):Start(function(p1, p2)
		-- upvalues: HttpService (upval), Callback (copy)
		local v1 = nil
		local v2 = false
		
		if p2 and p2.Body then
			v2, v9 = pcall(function()
				-- upvalues: HttpService (upval), p2 (copy)
				return HttpService:JSONDecode(p2.Body)
			end)
		end
		Callback(if p1 then v2 else false, v1)
	end)
end

local function _(Status, Data)
	return { status = Status, data = Data }
end

return SignalsModule.createComputed(function(_)
	-- upvalues: CreateSignalFunction (copy), ProfileInsightsModelModule (copy), makeHttpCall (copy), HttpService (copy)
	local ProfileInsightsSignalLists = {}
	local ProfileInsightsSignalLists1 = {}
	
	local function _(List, p1, p2): string
		return table.concat(List, ",") .. tostring(p1) .. tostring(p2)
	end
	
	local function mergeWithExisting(PageId, ProfileInsights)
		-- upvalues: ProfileInsightsSignalLists1 (copy)
		local ProfileInsightsSignalList = ProfileInsightsSignalLists1[PageId]
		
		if not ProfileInsightsSignalList then
			return ProfileInsights
		end
		local t = {}
		local List = {
			table.unpack(ProfileInsightsSignalList.getProfileInsights(false))
		}
		local Flag = false
		
		for _, value in List do
			t[value.targetUserId] = true
		end
		for _, profileInsight in ProfileInsights do
			if not t[profileInsight.targetUserId] then
				t[profileInsight.targetUserId] = true
				table.insert(List, profileInsight)
				Flag = true
			end
		end
		return if Flag then List else ProfileInsightsSignalList.getProfileInsights(false)
	end
	
	return {
		getProfileInsightsByUserId = function(p1)
			-- upvalues: CreateSignalFunction (upval), ProfileInsightsSignalLists (copy), ProfileInsightsModelModule (upval), makeHttpCall (upval)
			local UserIds = p1.userIds
			local Count = p1.count
			local RankingStrategy = p1.rankingStrategy
			
			if not UserIds or #UserIds == 0 then
				return CreateSignalFunction({ status = "success", data = {} })
			end
			local Text = table.concat(UserIds, ",") .. tostring(Count) .. tostring(RankingStrategy)
			
			if ProfileInsightsSignalLists[Text] then
				return CreateSignalFunction({
					status = "success",
					data = ProfileInsightsSignalLists[Text]
				})
			else
				ProfileInsightsSignalLists[Text] = ProfileInsightsModelModule.createProfileInsightsSignalList()
				local Signal, Signal2 = CreateSignalFunction({
					status = "fetching",
					data = ProfileInsightsSignalLists[Text]
				})
				makeHttpCall(UserIds, Count, RankingStrategy, function(p2, p3)
					-- upvalues: ProfileInsightsSignalLists (upval), Text (copy), ProfileInsightsModelModule (upval), Signal2 (copy)
					if p2 and p3.userInsights then
						ProfileInsightsSignalLists[Text].setProfileInsights(ProfileInsightsModelModule.createProfileInsightsList(p3.userInsights))
						Signal2({
							status = "success",
							data = ProfileInsightsSignalLists[Text]
						})
						
						return
					else
						Signal2({ status = "failed", data = {} })
					end
				end)
				
				return Signal
			end
		end,
		getProfileInsightsByPage = function(p1)
			-- upvalues: HttpService (upval), ProfileInsightsSignalLists1 (copy), ProfileInsightsModelModule (upval), CreateSignalFunction (upval), ProfileInsightsSignalLists (copy), mergeWithExisting (copy), makeHttpCall (upval)
			local PageId = if p1.pageId then p1.pageId else HttpService:GenerateGUID(false)
			local UserIds = p1.userIds
			local Count = p1.count
			local RankingStrategy = p1.rankingStrategy
			
			if not ProfileInsightsSignalLists1[PageId] then
				ProfileInsightsSignalLists1[PageId] = ProfileInsightsModelModule.createProfileInsightsSignalList()
			end
			if not UserIds or #UserIds == 0 then
				return CreateSignalFunction({
					status = "success",
					data = ProfileInsightsSignalLists1[PageId]
				})
			end
			local Text = table.concat(UserIds, ",") .. tostring(Count) .. tostring(RankingStrategy)
			
			if ProfileInsightsSignalLists[Text] then
				ProfileInsightsSignalLists1[PageId].setProfileInsights((mergeWithExisting(PageId, ProfileInsightsSignalLists[Text].getProfileInsights(false))))
				
				return CreateSignalFunction({
					status = "success",
					data = ProfileInsightsSignalLists1[PageId]
				})
			else
				ProfileInsightsSignalLists[Text] = ProfileInsightsModelModule.createProfileInsightsSignalList()
				local Signal, Signal2 = CreateSignalFunction({
					status = "success",
					data = ProfileInsightsSignalLists1[PageId]
				})
				makeHttpCall(UserIds, Count, RankingStrategy, function(p2, p3)
					-- upvalues: ProfileInsightsModelModule (upval), ProfileInsightsSignalLists (upval), Text (copy), ProfileInsightsSignalLists1 (upval), PageId (copy), mergeWithExisting (upval), Signal2 (copy)
					if p2 and p3.userInsights then
						local ProfileInsightsList = ProfileInsightsModelModule.createProfileInsightsList(p3.userInsights)
						ProfileInsightsSignalLists[Text].setProfileInsights(ProfileInsightsList)
						ProfileInsightsSignalLists1[PageId].setProfileInsights((mergeWithExisting(PageId, ProfileInsightsList)))
						Signal2({
							status = "success",
							data = ProfileInsightsSignalLists1[PageId]
						})
						
						return
					else
						Signal2({ status = "failed", data = {} })
					end
				end)
				
				return Signal
			end
		end
	}
end)