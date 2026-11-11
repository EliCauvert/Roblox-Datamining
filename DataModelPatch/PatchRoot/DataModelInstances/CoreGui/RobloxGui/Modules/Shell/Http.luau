local HttpService = game:GetService("HttpService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UtilityModule = require(Modules.Shell.Utility)
local Url = require(game:GetService("CorePackages").Workspace.Packages.Http).Url
local Replaced = string.gsub(string.gsub(game:GetService("ContentProvider").BaseUrl:lower(), "/m.", "/www."), "http://", "https://")
local _ = string.gsub(Replaced, "https://www.", "https://accountsettings.")
local GetFStringAppLocationForAppPresenceModule = require(Modules.Shell.Flags.GetFStringAppLocationForAppPresence)

local function _(p1)
	-- upvalues: HttpService (copy)
	if p1 == nil or #p1 == 0 then
		return nil
	else
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), p1 (copy)
			return HttpService:JSONDecode(p1)
		end)
		
		return if Success then Result else nil
	end
end

local _ = function(p1, p2)
	-- upvalues: HttpService (copy)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy)
		return game:HttpGetAsync(p1)
	end)
	
	if not Success then
		return nil
	elseif p2 then
		return Result
	elseif Result == nil or #Result == 0 then
		return nil
	else
		local Success1, Result1 = pcall(function()
			-- upvalues: HttpService (upval), Result (copy)
			return HttpService:JSONDecode(Result)
		end)
		
		return if Success1 then Result1 else nil
	end
end

local _ = function(p1, p2, p3)
	-- upvalues: HttpService (copy)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy), p2 (copy), p3 (copy)
		return game:HttpPostAsync(p1, p2, p3)
	end)
	
	if not Success then
		return nil
	elseif Result == nil or #Result == 0 then
		return nil
	else
		local Success1, Result1 = pcall(function()
			-- upvalues: HttpService (upval), Result (copy)
			return HttpService:JSONDecode(Result)
		end)
		
		return if Success1 then Result1 else nil
	end
end

local _ = function(ApiUrlPath)
	-- upvalues: HttpRbxApiService (copy), HttpService (copy)
	local Success, Result = pcall(function()
		-- upvalues: HttpRbxApiService (upval), ApiUrlPath (copy)
		return HttpRbxApiService:GetAsync(ApiUrlPath)
	end)
	
	if not Success then
		return nil
	elseif Result == nil or #Result == 0 then
		return nil
	else
		local Success1, Result1 = pcall(function()
			-- upvalues: HttpService (upval), Result (copy)
			return HttpService:JSONDecode(Result)
		end)
		
		return if Success1 then Result1 else nil
	end
end

local _ = function(ApiUrlPath, Data, Priority, ContentType)
	-- upvalues: HttpRbxApiService (copy), HttpService (copy)
	local Success, Result = pcall(function()
		-- upvalues: HttpRbxApiService (upval), ApiUrlPath (copy), Data (copy), Priority (copy), ContentType (copy)
		return HttpRbxApiService:PostAsync(ApiUrlPath, Data, Priority, ContentType)
	end)
	
	if not Success then
		return nil
	elseif Result == nil or #Result == 0 then
		return nil
	else
		local Success1, Result1 = pcall(function()
			-- upvalues: HttpService (upval), Result (copy)
			return HttpService:JSONDecode(Result)
		end)
		
		return if Success1 then Result1 else nil
	end
end

local _ = function(p1, p2, p3, p4)
	-- upvalues: HttpRbxApiService (copy), HttpService (copy)
	local Success, Result = pcall(function()
		-- upvalues: HttpRbxApiService (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy)
		return HttpRbxApiService:PostAsyncFullUrl(p1, p2, p3, p4)
	end)
	
	if not Success then
		return nil
	elseif Result == nil or #Result == 0 then
		return nil
	else
		local Success1, Result1 = pcall(function()
			-- upvalues: HttpService (upval), Result (copy)
			return HttpService:JSONDecode(Result)
		end)
		
		return if Success1 then Result1 else nil
	end
end

local _ = function(Options)
	-- upvalues: UtilityModule (copy), HttpService (copy)
	local v1 = nil
	local SignalResult = UtilityModule.Signal()
	HttpService:RequestInternal(Options):Start(function(p1, p2)
		-- upvalues: v1 (ref), HttpService (upval), SignalResult (copy)
		if p1 and p2.StatusCode ~= 401 and p2.StatusCode >= 200 and p2.StatusCode < 400 then
			local Body = p2.Body
			local v2 = nil
			
			if Body == nil or #Body == 0 then
				v2 = nil
			else
				local Success, Result = pcall(function()
					-- upvalues: HttpService (upval), Body (copy)
					return HttpService:JSONDecode(Body)
				end)
				v2 = if Success then Result else nil
			end
			v1 = v2
		end
		SignalResult:fire()
	end)
	SignalResult:wait()
	
	return v1
end

local function buildServiceUrl(Text): string
	-- upvalues: Replaced (ref)
	return string.gsub(Replaced, "https://www.", "https://" .. Text .. ".")
end

local _ = function(p1): boolean
	return p1 == nil or #p1 == 0
end

return {
	BaseUrl = Replaced,
	AssetGameBaseUrl = string.gsub(Replaced, "https://www.", "https://assetgame."),
	GetCuratedSortAsync = function(p1, p2)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Formatted = string.format("%sgames/set?GameSetTargetId=%d&MaxRows=%d", Replaced, p1, p2)
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy)
			return game:HttpGetAsync(Formatted)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetCuratedSortByUrlAsync = function(p1)
		-- upvalues: HttpService (copy)
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy)
			return game:HttpGetAsync(p1)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetUserPlacesAsync = function(p1, p2, p3)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Formatted = string.format("%sgames/list-users-games-json?userid=%d&startIndex=%d&pageSize=%d", Replaced, p3, p1, p2)
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy)
			return game:HttpGetAsync(Formatted)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	SearchGamesAsync = function(p1, p2, Input)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Formatted = string.format("%sgames/list-json?keyword=%s&StartRows=%d&MaxRows=%d&filterByDeviceType=true", Replaced, HttpService:UrlEncode(Input), p1, p2)
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy)
			return game:HttpGetAsync(Formatted)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetGamesAsync = function(List)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Text = string.gsub(Replaced, "https://www.", "https://games.") .. "v1/games?universeIds=" .. table.concat(List, ",")
		local Success, Result = pcall(function()
			-- upvalues: Text (copy)
			return game:HttpGetAsync(Text)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	PostExperienceGuidelines = function(UniverseId)
		-- upvalues: buildServiceUrl (copy), HttpService (copy), UtilityModule (copy)
		local config = {
			Method = "POST",
			Url = string.format("%sexperience-guidelines-api/experience-guidelines/get-age-recommendation", buildServiceUrl("apis")),
			Body = HttpService:JSONEncode({ universeId = UniverseId }),
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}
		local v1 = nil
		local SignalResult = UtilityModule.Signal()
		HttpService:RequestInternal(config):Start(function(p1, p2)
			-- upvalues: v1 (ref), HttpService (upval), SignalResult (copy)
			if p1 and p2.StatusCode ~= 401 and p2.StatusCode >= 200 and p2.StatusCode < 400 then
				local Body = p2.Body
				local v2 = nil
				
				if Body == nil or #Body == 0 then
					v2 = nil
				else
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), Body (copy)
						return HttpService:JSONDecode(Body)
					end)
					v2 = if Success then Result else nil
				end
				v1 = v2
			end
			SignalResult:fire()
		end)
		SignalResult:wait()
		
		return v1
	end,
	GetGameIconIdAsync = function(p1)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Text = Replaced .. "places/icons/json?placeId=" .. tostring(p1)
		local Success, Result = pcall(function()
			-- upvalues: Text (copy)
			return game:HttpGetAsync(Text)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetGameVotesAsync = function(p1)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Text = Replaced .. "PlaceItem/GameDetailsVotingPanelJson?placeId=" .. tostring(p1)
		local Success, Result = pcall(function()
			-- upvalues: Text (copy)
			return game:HttpGetAsync(Text)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetRecommendedGamesAsync = function(p1)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Text = Replaced .. "Games/GetRecommendedGamesJson?currentPlaceId=" .. tostring(p1)
		local Success, Result = pcall(function()
			-- upvalues: Text (copy)
			return game:HttpGetAsync(Text)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetGameThumbnailsAsync = function(p1)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Text = Replaced .. "thumbnail/place-thumbnails?placeId=" .. tostring(p1)
		local Success, Result = pcall(function()
			-- upvalues: Text (copy)
			return game:HttpGetAsync(Text)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetBadgesForUniverseAsync = function(p1, p2)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Formatted = string.format("%sv1/universes/%d/badges?sortOrder=Asc&limit=100", string.gsub(Replaced, "https://www.", "https://badges."), p1)
		
		if p2 then
			Formatted = string.format(Formatted .. "&cursor=%s", p2)
		end
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy)
			return game:HttpGetAsync(Formatted)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetUserAwardedBadgesAsync = function(p1, List)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Formatted = string.format("%sv1/users/%d/badges/awarded-dates?badgeIds=%s", string.gsub(Replaced, "https://www.", "https://badges."), p1, (table.concat(List, ",")))
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy)
			return game:HttpGetAsync(Formatted)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	PostFavoriteToggleAsync = function(p1)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Text = Replaced .. "favorite/toggle?assetID=" .. tostring(p1)
		local v1 = "favoriteToggle"
		local v2 = nil
		local Success, Result = pcall(function()
			-- upvalues: Text (copy), v1 (copy), v2 (copy)
			return game:HttpPostAsync(Text, v1, v2)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	PostGameVoteAsync = function(p1, p2)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Text = Replaced .. "voting/vote?assetId=" .. tostring(p1) .. "&vote=" .. tostring(p2)
		local v1 = "vote"
		local v2 = nil
		local Success, Result = pcall(function()
			-- upvalues: Text (copy), v1 (copy), v2 (copy)
			return game:HttpPostAsync(Text, v1, v2)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	RegisterAppPresence = function()
		-- upvalues: buildServiceUrl (copy), GetFStringAppLocationForAppPresenceModule (copy), HttpService (copy)
		local Formatted = string.format("%s/v1/presence/register-app-presence", buildServiceUrl("presence"))
		local Json = HttpService:JSONEncode({ location = GetFStringAppLocationForAppPresenceModule() })
		local v1 = nil
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy), Json (copy), v1 (copy)
			return game:HttpPostAsync(Formatted, Json, v1)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetCrossplayEnabledStatusAsync = function()
		-- upvalues: buildServiceUrl (copy), UtilityModule (copy), HttpService (copy)
		local config = {
			Method = "GET",
			Url = string.format("%suser-settings-api/v1/user-settings?requestedUserSettings=xboxCrossPlayStatusIsEnabled", buildServiceUrl("apis"))
		}
		local v1 = nil
		local SignalResult = UtilityModule.Signal()
		HttpService:RequestInternal(config):Start(function(p1, p2)
			-- upvalues: v1 (ref), HttpService (upval), SignalResult (copy)
			if p1 and p2.StatusCode ~= 401 and p2.StatusCode >= 200 and p2.StatusCode < 400 then
				local Body = p2.Body
				local v2 = nil
				
				if Body == nil or #Body == 0 then
					v2 = nil
				else
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), Body (copy)
						return HttpService:JSONDecode(Body)
					end)
					v2 = if Success then Result else nil
				end
				v1 = v2
			end
			SignalResult:fire()
		end)
		SignalResult:wait()
		
		return v1
	end,
	PostCrossplayStatusAsync = function(XboxCrossPlayStatusIsEnabled)
		-- upvalues: buildServiceUrl (copy), HttpService (copy), UtilityModule (copy)
		local config = {
			Method = "POST",
			Url = string.format("%suser-settings-api/v1/user-settings", buildServiceUrl("apis")),
			Body = HttpService:JSONEncode({
				xboxCrossPlayStatusIsEnabled = XboxCrossPlayStatusIsEnabled
			}),
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}
		local v1 = nil
		local SignalResult = UtilityModule.Signal()
		HttpService:RequestInternal(config):Start(function(p1, p2)
			-- upvalues: v1 (ref), HttpService (upval), SignalResult (copy)
			if p1 and p2.StatusCode ~= 401 and p2.StatusCode >= 200 and p2.StatusCode < 400 then
				local Body = p2.Body
				local v2 = nil
				
				if Body == nil or #Body == 0 then
					v2 = nil
				else
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), Body (copy)
						return HttpService:JSONDecode(Body)
					end)
					v2 = if Success then Result else nil
				end
				v1 = v2
			end
			SignalResult:fire()
		end)
		SignalResult:wait()
		
		return v1
	end,
	GetRecommendedUsersndsAsync = function()
		-- upvalues: buildServiceUrl (copy), HttpService (copy)
		local Formatted = string.format("%s/v1/recommended-users", buildServiceUrl("friends"))
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy)
			return game:HttpGetAsync(Formatted)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetUsersPresenceAsync = function(UserIds)
		-- upvalues: HttpService (copy), buildServiceUrl (copy)
		local Json = HttpService:JSONEncode({ userIds = UserIds })
		local Formatted = string.format("%s/v1/presence/users", buildServiceUrl("presence"))
		local v1 = nil
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy), Json (copy), v1 (copy)
			return game:HttpPostAsync(Formatted, Json, v1)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetPlatformUserBalanceAsync = function()
		-- upvalues: buildServiceUrl (copy), HttpService (copy)
		local Formatted = string.format("%sv1/user/currency", buildServiceUrl("economy"))
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy)
			return game:HttpGetAsync(Formatted)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetTotalUserBalanceAsync = function()
		-- upvalues: buildServiceUrl (copy), HttpService (copy)
		local Formatted = string.format("%sv1/user/currency", buildServiceUrl("economy"))
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy)
			return game:HttpGetAsync(Formatted)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetUserOwnedPackagesAsync = function(p1, p2)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Text = Replaced .. "users/inventory/list-json?userId=" .. tostring(p1) .. "&assetTypeId=" .. tostring(32) .. "&pageNumber=" .. tostring(p2 or 1)
		local Success, Result = pcall(function()
			-- upvalues: Text (copy)
			return game:HttpGetAsync(Text)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetCurrentlyWearingAsync = function(p1)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Formatted = string.format("%s/v1/users/%d/currently-wearing", string.gsub(Replaced, "https://www.", "https://avatar."), p1)
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy)
			return game:HttpGetAsync(Formatted)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	SetWearingAssetsAsync = function(AssetIds)
		-- upvalues: HttpService (copy), buildServiceUrl (copy), UtilityModule (copy)
		local config = {
			Method = "POST",
			Url = string.format("%s/v1/avatar/set-wearing-assets", buildServiceUrl("avatar")),
			Body = HttpService:JSONEncode({ assetIds = AssetIds }),
			Headers = { ["Content-Type"] = "application/json" }
		}
		local v1 = nil
		local SignalResult = UtilityModule.Signal()
		HttpService:RequestInternal(config):Start(function(p1, p2)
			-- upvalues: v1 (ref), HttpService (upval), SignalResult (copy)
			if p1 and p2.StatusCode ~= 401 and p2.StatusCode >= 200 and p2.StatusCode < 400 then
				local Body = p2.Body
				local v2 = nil
				
				if Body == nil or #Body == 0 then
					v2 = nil
				else
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), Body (copy)
						return HttpService:JSONDecode(Body)
					end)
					v2 = if Success then Result else nil
				end
				v1 = v2
			end
			SignalResult:fire()
		end)
		SignalResult:wait()
		
		return v1
	end,
	PurchaseProductAsync = function(p1, ExpectedPrice, ExpectedSellerId, ExpectedCurrency)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Formatted = string.format("%s/v1/purchases/products/%d", string.gsub(Replaced, "https://www.", "https://economy."), p1)
		local Json = HttpService:JSONEncode({
			expectedCurrency = ExpectedCurrency,
			expectedPrice = ExpectedPrice,
			expectedSellerId = ExpectedSellerId
		})
		local v1 = nil
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy), Json (copy), v1 (copy)
			return game:HttpPostAsync(Formatted, Json, v1)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	MultiGetBundleDetailsAsync = function(List)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Formatted = string.format("%sv1/bundles/details?bundleIds=%s", string.gsub(Replaced, "https://www.", "https://catalog."), (table.concat(List, ",")))
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy)
			return game:HttpGetAsync(Formatted)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetUserOwnedBundlesAsync = function(p1, p2)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Formatted = string.format("%sv1/users/%s/bundles?sortOrder=Asc&limit=100", string.gsub(Replaced, "https://www.", "https://catalog."), (tostring(p1)))
		
		if p2 then
			Formatted = string.format(Formatted .. "&cursor=%s", p2)
		end
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy)
			return game:HttpGetAsync(Formatted)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetAssetThumbnailBatchAsync = function(List, p1, p2)
		-- upvalues: Replaced (ref), HttpService (copy)
		local Formatted = string.format(string.gsub(Replaced, "https://www.", "https://games.") .. "v1/games/game-thumbnails?%s&height=" .. tostring(p2) .. "&width=" .. tostring(p1), "imageTokens=" .. table.concat(List, "&imageTokens="))
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy)
			return game:HttpGetAsync(Formatted)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	ReportAbuseAsyncV2 = function(Data, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8)
		-- upvalues: HttpService (copy), Url (copy), HttpRbxApiService (copy)
		local Json = HttpService:JSONEncode({
			tags = {
				ENTRY_POINT = { valueList = { { data = Data5 } } },
				SUBMITTER_USER_ID = { valueList = { { data = Data } } },
				REPORT_TARGET_USER_ID = { valueList = { { data = Data2 } } },
				REPORTED_ABUSE_CATEGORY = { valueList = { { data = Data7 } } },
				REPORTED_ABUSE_VECTOR = { valueList = { { data = Data6 } } },
				REPORTER_COMMENT = { valueList = { { data = Data8 } } },
				REPORT_TARGET_ASSET_ID = { valueList = { { data = Data1 } } },
				REPORT_TARGET_ASSET_NAME = { valueList = { { data = Data3 } } },
				REPORT_TARGET_ASSET_DESCRIPTION = { valueList = { { data = Data4 } } }
			}
		})
		local Text = Url.APIS_URL .. "abuse-reporting/v2/abuse-report"
		
		if not Json then
			return nil
		end
		local Default = Enum.ThrottlingPriority.Default
		local ApplicationJson = Enum.HttpContentType.ApplicationJson
		local Success, Result = pcall(function()
			-- upvalues: HttpRbxApiService (upval), Text (copy), Json (copy), Default (copy), ApplicationJson (copy)
			return HttpRbxApiService:PostAsyncFullUrl(Text, Json, Default, ApplicationJson)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetConsecutiveDaysLoggedInAsync = function()
		-- upvalues: buildServiceUrl (copy), UtilityModule (copy), HttpService (copy)
		local config = {
			Method = "GET",
			Url = string.format("%sv1/xbox/get-login-consecutive-days", buildServiceUrl("auth"))
		}
		local v1 = nil
		local SignalResult = UtilityModule.Signal()
		HttpService:RequestInternal(config):Start(function(p1, p2)
			-- upvalues: v1 (ref), HttpService (upval), SignalResult (copy)
			if p1 and p2.StatusCode ~= 401 and p2.StatusCode >= 200 and p2.StatusCode < 400 then
				local Body = p2.Body
				local v2 = nil
				
				if Body == nil or #Body == 0 then
					v2 = nil
				else
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), Body (copy)
						return HttpService:JSONDecode(Body)
					end)
					v2 = if Success then Result else nil
				end
				v1 = v2
			end
			SignalResult:fire()
		end)
		SignalResult:wait()
		
		return v1
	end,
	IsValidUsername = function(Input, p1)
		-- upvalues: Replaced (ref), HttpService (copy), UtilityModule (copy)
		if Input == nil or #Input == 0 or (p1 == nil or #p1 == 0) then return end
		local v1 = nil
		local SignalResult = UtilityModule.Signal()
		HttpService:RequestInternal({
			Method = "GET",
			Url = string.format("%sv2/usernames/validate?request.username=%s&request.birthday=%s", string.gsub(Replaced, "https://www.", "https://auth."), HttpService:UrlEncode(Input), p1)
		}):Start(function(p2, p3)
			-- upvalues: v1 (ref), HttpService (upval), SignalResult (copy)
			if p2 and p3.StatusCode ~= 401 and p3.StatusCode >= 200 and p3.StatusCode < 400 then
				local Body = p3.Body
				local v2 = nil
				
				if Body == nil or #Body == 0 then
					v2 = nil
				else
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), Body (copy)
						return HttpService:JSONDecode(Body)
					end)
					v2 = if Success then Result else nil
				end
				v1 = v2
			end
			SignalResult:fire()
		end)
		SignalResult:wait()
		
		return v1
	end,
	IsValidPassword = function(Input, Input1)
		-- upvalues: Replaced (ref), HttpService (copy), UtilityModule (copy)
		if Input == nil or #Input == 0 or (Input1 == nil or #Input1 == 0) then return end
		local v1 = nil
		local SignalResult = UtilityModule.Signal()
		HttpService:RequestInternal({
			Method = "GET",
			Url = string.format("%sv2/passwords/validate?request.username=%s&request.password=%s", string.gsub(Replaced, "https://www.", "https://auth."), HttpService:UrlEncode(Input), HttpService:UrlEncode(Input1))
		}):Start(function(p1, p2)
			-- upvalues: v1 (ref), HttpService (upval), SignalResult (copy)
			if p1 and p2.StatusCode ~= 401 and p2.StatusCode >= 200 and p2.StatusCode < 400 then
				local Body = p2.Body
				local v2 = nil
				
				if Body == nil or #Body == 0 then
					v2 = nil
				else
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), Body (copy)
						return HttpService:JSONDecode(Body)
					end)
					v2 = if Success then Result else nil
				end
				v1 = v2
			end
			SignalResult:fire()
		end)
		SignalResult:wait()
		
		return v1
	end,
	PostSponsoredGameClickAsync = function(p1)
		-- upvalues: buildServiceUrl (copy), HttpService (copy)
		local Formatted = string.format("%sv1/sponsored-games/click", buildServiceUrl("ads"))
		local Formatted1, Formatted2 = string.format("\"%s\"", p1)
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy), Formatted1 (copy), Formatted2 (copy)
			return game:HttpPostAsync(Formatted, Formatted1, Formatted2)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	GetUserVoteCountFromVotingApiAsync = function()
		-- upvalues: buildServiceUrl (copy), UtilityModule (copy), HttpService (copy)
		local config = {
			Method = "GET",
			Url = string.format("%svoting-api/user/get-vote-count?targetType=Place", buildServiceUrl("apis"))
		}
		local v1 = nil
		local SignalResult = UtilityModule.Signal()
		HttpService:RequestInternal(config):Start(function(p1, p2)
			-- upvalues: v1 (ref), HttpService (upval), SignalResult (copy)
			if p1 and p2.StatusCode ~= 401 and p2.StatusCode >= 200 and p2.StatusCode < 400 then
				local Body = p2.Body
				local v2 = nil
				
				if Body == nil or #Body == 0 then
					v2 = nil
				else
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), Body (copy)
						return HttpService:JSONDecode(Body)
					end)
					v2 = if Success then Result else nil
				end
				v1 = v2
			end
			SignalResult:fire()
		end)
		SignalResult:wait()
		
		return v1
	end,
	CreateCrossDeviceLoginCode = function()
		-- upvalues: buildServiceUrl (copy), HttpService (copy)
		local Formatted = string.format("%sauth-token-service/v1/login/create", buildServiceUrl("apis"))
		local Data = ""
		local ContentType = nil
		local Success, Result = pcall(function()
			-- upvalues: Formatted (copy), Data (copy), ContentType (copy)
			return game:HttpPostAsync(Formatted, Data, ContentType)
		end)
		
		if not Success then
			return nil
		elseif Result == nil or #Result == 0 then
			return nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			return if Success1 then Result1 else nil
		end
	end,
	CheckCrossDeviceLoginStatus = function(Code, PrivateKey)
		-- upvalues: buildServiceUrl (copy), HttpService (copy), UtilityModule (copy)
		local config = {
			Method = "POST",
			Url = string.format("%sauth-token-service/v1/login/status", buildServiceUrl("apis")),
			Body = HttpService:JSONEncode({ code = Code, privateKey = PrivateKey }),
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}
		local v1 = nil
		local SignalResult = UtilityModule.Signal()
		HttpService:RequestInternal(config):Start(function(p1, p2)
			-- upvalues: v1 (ref), HttpService (upval), SignalResult (copy)
			if p1 and p2.StatusCode ~= 401 and p2.StatusCode >= 200 and p2.StatusCode < 400 then
				local Body = p2.Body
				local v2 = nil
				
				if Body == nil or #Body == 0 then
					v2 = nil
				else
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), Body (copy)
						return HttpService:JSONDecode(Body)
					end)
					v2 = if Success then Result else nil
				end
				v1 = v2
			end
			SignalResult:fire()
		end)
		SignalResult:wait()
		
		return v1
	end,
	CancelCrossDeviceLogin = function(Code)
		-- upvalues: buildServiceUrl (copy), HttpService (copy), UtilityModule (copy)
		local config = {
			Method = "POST",
			Url = string.format("%sauth-token-service/v1/login/cancel", buildServiceUrl("apis")),
			Body = HttpService:JSONEncode({ code = Code }),
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			}
		}
		local v1 = nil
		local SignalResult = UtilityModule.Signal()
		HttpService:RequestInternal(config):Start(function(p1, p2)
			-- upvalues: v1 (ref), HttpService (upval), SignalResult (copy)
			if p1 and p2.StatusCode ~= 401 and p2.StatusCode >= 200 and p2.StatusCode < 400 then
				local Body = p2.Body
				local v2 = nil
				
				if Body == nil or #Body == 0 then
					v2 = nil
				else
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), Body (copy)
						return HttpService:JSONDecode(Body)
					end)
					v2 = if Success then Result else nil
				end
				v1 = v2
			end
			SignalResult:fire()
		end)
		SignalResult:wait()
		
		return v1
	end
}