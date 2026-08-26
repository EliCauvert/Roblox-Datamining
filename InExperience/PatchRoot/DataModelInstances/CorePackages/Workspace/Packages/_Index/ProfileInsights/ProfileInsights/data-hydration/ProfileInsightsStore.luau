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
local var1 = urlBuilderModule.UrlBuilder.new({
	path = "profile-insights-api/v1/multiProfileInsights",
	base = urlBuilderModule.UrlBase.APIS
})()

local function makeHttpCall(p1, p2, p3, p4)
	-- upvalues: httpService (ref), var1 (ref), profileInsightsStoreHttpTimeout (ref)
	httpService:RequestInternal({
		Method = "POST",
		Priority = 0,
		Url = var1,
		Body = httpService:JSONEncode({
			userIds = p1,
			count = if p3 then nil else p2 or 2,
			rankingStrategy = p3
		}),
		Timeout = profileInsightsStoreHttpTimeout,
		CachePolicy = Enum.HttpCachePolicy.None,
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		},
		RequestType = Enum.HttpRequestType.Default
	}):Start(function(p5, p6)
		-- upvalues: httpService (copy), p4 (ref)
		local var2 = nil
		local var3 = false
		
		if p6 and p6.Body then
			local ok, status = pcall(function()
				-- upvalues: httpService (copy), p6 (ref)
				return httpService:JSONDecode(p6.Body)
			end)
			var3 = ok
			var2 = status
		end
		p4(if p5 then var3 else false, var2)
	end)
end

local function _(p1, p2)
	return { status = p1, data = p2 }
end

return createComputed(function(_)
	-- upvalues: createSignal (ref), fFlagTFProfileInsightsBypassCache (ref), profileInsightsModelModule (ref), fFlagAddFriendsPageTrustedFriendRequestSection (ref), makeHttpCall (ref), httpService (ref)
	local t = {}
	local t_1 = {}
	
	local function _(p1, p2, p3)
		return table.concat(p1, ",") .. tostring(p2) .. tostring(p3)
	end
	
	local function mergeWithExisting(p1, p2)
		-- upvalues: t_1 (ref)
		local var2 = t_1[p1]
		
		if not var2 then
			return p2
		end
		local t = {}
		local list = { table.unpack(var2.getProfileInsights(false)) }
		local var3 = false
		
		for i, v in list do
			t[v.targetUserId] = true
		end
		for i, v_1 in p2 do
			if not t[v_1.targetUserId] then
				t[v_1.targetUserId] = true
				table.insert(list, v_1)
				var3 = true
			end
		end
		return if var3 then list else var2.getProfileInsights(false)
	end
	
	return {
		getProfileInsightsByUserId = function(p3)
			-- upvalues: createSignal (copy), fFlagTFProfileInsightsBypassCache (copy), t (ref), profileInsightsModelModule (copy), fFlagAddFriendsPageTrustedFriendRequestSection (copy), makeHttpCall (copy)
			local userIds = p3.userIds
			local count = p3.count
			local rankingStrategy = p3.rankingStrategy
			
			if not userIds or #userIds == 0 then
				return createSignal({ status = "success", data = {} })
			end
			local text = table.concat(userIds, ",") .. tostring(count) .. tostring(rankingStrategy)
			
			if fFlagTFProfileInsightsBypassCache then
				if t[text] and not p3.forceFetch then
					return createSignal({ status = "success", data = t[text] })
				elseif not t[text] then
					t[text] = profileInsightsModelModule.createProfileInsightsSignalList()
				end
			elseif t[text] then
				return createSignal({ status = "success", data = t[text] })
			end
			t[text] = profileInsightsModelModule.createProfileInsightsSignalList()
			if fFlagAddFriendsPageTrustedFriendRequestSection and p3.skipFetch then
				return createSignal({ status = "success", data = t[text] })
			end
			local var4, var5 = createSignal({ status = "fetching", data = t[text] })
			makeHttpCall(userIds, count, rankingStrategy, function(p4, p5)
				-- upvalues: t (copy), text (ref), profileInsightsModelModule (copy), var5 (ref), fFlagTFProfileInsightsBypassCache (copy)
				if p4 and p5.userInsights then
					t[text].setProfileInsights(profileInsightsModelModule.createProfileInsightsList(p5.userInsights))
					var5({ status = "success", data = t[text] })
					
					return
				elseif fFlagTFProfileInsightsBypassCache then
					var5({ status = "failed", data = t[text] })
					
					return
				end
				var5({ status = "failed", data = {} })
			end)
			
			return var4
		end,
		getProfileInsightsByPage = function(p3)
			-- upvalues: httpService (copy), t_1 (ref), profileInsightsModelModule (copy), createSignal (copy), t (ref), mergeWithExisting (ref), makeHttpCall (copy)
			local var4 = if p3.pageId then p3.pageId else httpService:GenerateGUID(false)
			local userIds = p3.userIds
			local count = p3.count
			local rankingStrategy = p3.rankingStrategy
			
			if not t_1[var4] then
				t_1[var4] = profileInsightsModelModule.createProfileInsightsSignalList()
			end
			if not userIds or #userIds == 0 then
				return createSignal({ status = "success", data = t_1[var4] })
			end
			local text = table.concat(userIds, ",") .. tostring(count) .. tostring(rankingStrategy)
			
			if t[text] then
				t_1[var4].setProfileInsights(mergeWithExisting(var4, t[text].getProfileInsights(false)))
				
				return createSignal({ status = "success", data = t_1[var4] })
			end
			t[text] = profileInsightsModelModule.createProfileInsightsSignalList()
			local var5, var6 = createSignal({ status = "success", data = t_1[var4] })
			makeHttpCall(userIds, count, rankingStrategy, function(p4, p5)
				-- upvalues: profileInsightsModelModule (copy), t (copy), text (ref), t_1 (copy), var4 (ref), mergeWithExisting (copy), var6 (ref)
				if p4 and p5.userInsights then
					local var7 = profileInsightsModelModule.createProfileInsightsList(p5.userInsights)
					t[text].setProfileInsights(var7)
					t_1[var4].setProfileInsights(mergeWithExisting(var4, var7))
					var6({ status = "success", data = t_1[var4] })
					
					return
				end
				var6({ status = "failed", data = {} })
			end)
			
			return var5
		end
	}
end)