local parent = script:FindFirstAncestor("ProfileInsights").Parent
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local profileInsightsModelModule = require(script.Parent.ProfileInsightsModel)
local httpService = game:GetService("HttpService")
local profileInsightsStoreHttpTimeout = game:DefineFastInt("ProfileInsightsStoreHttpTimeout", 1500)
local fFlagAddFriendsPageTrustedFriendRequestSection = require(parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection
local fFlagTFProfileInsightsBypassCache = require(parent.SharedFlags).FFlagTFProfileInsightsBypassCache
local urlBuilderModule = require(parent.UrlBuilder)
local var5 = urlBuilderModule.UrlBuilder.new({
	path = "profile-insights-api/v1/multiProfileInsights",
	base = urlBuilderModule.UrlBase.APIS
})()

local function makeHttpCall(p0, p1, p2, p3) --[[ line: 51 ]]
	-- upvalues: httpService (ref), var5 (ref), profileInsightsStoreHttpTimeout (ref)
	httpService:RequestInternal({
		Method = "POST",
		Priority = 0,
		Url = var5,
		Body = httpService:JSONEncode({
			userIds = p0,
			count = if p2 then nil else p1 or 2,
			rankingStrategy = p2
		}),
		Timeout = profileInsightsStoreHttpTimeout,
		CachePolicy = Enum.HttpCachePolicy.None,
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		},
		RequestType = Enum.HttpRequestType.Default
	}):Start(function(p4, p5) --[[ line: 75 ]]
		-- upvalues: httpService (copy), p3 (ref)
		local var7 = nil
		local var8 = false
		
		if p5 and p5.Body then
			local ok, status = pcall(function() --[[ line: 79 ]]
				-- upvalues: httpService (copy), p5 (ref)
				return httpService:JSONDecode(p5.Body)
			end)
			var8 = ok
			var7 = status
		end
		p3(if p4 then var8 else false, var7)
	end)
end

local function _(p6, p7) --[[ line: 87 | named "createFetchResult" ]]
	return { status = p6, data = p7 }
end

return createComputed(function(_) --[[ line: 98 ]]
	-- upvalues: createSignal (ref), fFlagTFProfileInsightsBypassCache (ref), profileInsightsModelModule (ref), fFlagAddFriendsPageTrustedFriendRequestSection (ref), makeHttpCall (ref), httpService (ref)
	local t = {}
	local t_1 = {}
	
	local function _(p8, p9, p10) --[[ line: 103 | named "getCacheKey" ]]
		return table.concat(p8, ",") .. tostring(p9) .. tostring(p10)
	end
	
	local function mergeWithExisting(p11, p12) --[[ line: 107 ]]
		-- upvalues: t_1 (ref)
		local var12 = t_1[p11]
		
		if not var12 then
			return p12
		end
		local t = {}
		local list = { table.unpack(var12.getProfileInsights(false)) }
		local var15 = false
		
		for i, v in list do
			t[v.targetUserId] = true
		end
		for i, v_1 in p12 do
			if not t[v_1.targetUserId] then
				t[v_1.targetUserId] = true
				table.insert(list, v_1)
				var15 = true
			end
		end
		return if var15 then list else var12.getProfileInsights(false)
	end
	
	return {
		getProfileInsightsByUserId = function(p13) --[[ line: 134 ]]
			-- upvalues: createSignal (copy), fFlagTFProfileInsightsBypassCache (copy), t (ref), profileInsightsModelModule (copy), fFlagAddFriendsPageTrustedFriendRequestSection (copy), makeHttpCall (copy)
			local userIds = p13.userIds
			local count = p13.count
			local rankingStrategy = p13.rankingStrategy
			
			if not userIds or #userIds == 0 then
				return createSignal({ status = "success", data = {} })
			end
			local text = table.concat(userIds, ",") .. tostring(count) .. tostring(rankingStrategy)
			
			if fFlagTFProfileInsightsBypassCache then
				if t[text] and not p13.forceFetch then
					return createSignal({ status = "success", data = t[text] })
				elseif not t[text] then
					t[text] = profileInsightsModelModule.createProfileInsightsSignalList()
				end
			elseif t[text] then
				return createSignal({ status = "success", data = t[text] })
			end
			t[text] = profileInsightsModelModule.createProfileInsightsSignalList()
			if fFlagAddFriendsPageTrustedFriendRequestSection and p13.skipFetch then
				return createSignal({ status = "success", data = t[text] })
			end
			local var17, var18 = createSignal({ status = "fetching", data = t[text] })
			makeHttpCall(userIds, count, rankingStrategy, function(p14, p15) --[[ line: 166 ]]
				-- upvalues: t (copy), text (ref), profileInsightsModelModule (copy), var18 (ref), fFlagTFProfileInsightsBypassCache (copy)
				if p14 and p15.userInsights then
					t[text].setProfileInsights(profileInsightsModelModule.createProfileInsightsList(p15.userInsights))
					var18({ status = "success", data = t[text] })
					
					return
				elseif fFlagTFProfileInsightsBypassCache then
					var18({ status = "failed", data = t[text] })
					
					return
				end
				var18({ status = "failed", data = {} })
			end)
			
			return var17
		end,
		getProfileInsightsByPage = function(p16) --[[ line: 183 ]]
			-- upvalues: httpService (copy), t_1 (ref), profileInsightsModelModule (copy), createSignal (copy), t (ref), mergeWithExisting (ref), makeHttpCall (copy)
			local var19 = if p16.pageId then p16.pageId else httpService:GenerateGUID(false)
			local userIds = p16.userIds
			local count = p16.count
			local rankingStrategy = p16.rankingStrategy
			
			if not t_1[var19] then
				t_1[var19] = profileInsightsModelModule.createProfileInsightsSignalList()
			end
			if not userIds or #userIds == 0 then
				return createSignal({ status = "success", data = t_1[var19] })
			end
			local text = table.concat(userIds, ",") .. tostring(count) .. tostring(rankingStrategy)
			
			if t[text] then
				t_1[var19].setProfileInsights(mergeWithExisting(var19, t[text].getProfileInsights(false)))
				
				return createSignal({ status = "success", data = t_1[var19] })
			end
			t[text] = profileInsightsModelModule.createProfileInsightsSignalList()
			local var21, var22 = createSignal({ status = "success", data = t_1[var19] })
			makeHttpCall(userIds, count, rankingStrategy, function(p17, p18) --[[ line: 205 ]]
				-- upvalues: profileInsightsModelModule (copy), t (copy), text (ref), t_1 (copy), var19 (ref), mergeWithExisting (copy), var22 (ref)
				if p17 and p18.userInsights then
					local var23 = profileInsightsModelModule.createProfileInsightsList(p18.userInsights)
					t[text].setProfileInsights(var23)
					t_1[var19].setProfileInsights(mergeWithExisting(var19, var23))
					var22({ status = "success", data = t_1[var19] })
					
					return
				end
				var22({ status = "failed", data = {} })
			end)
			
			return var21
		end
	}
end)