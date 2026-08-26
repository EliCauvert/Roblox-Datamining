local httpService = game:GetService("HttpService")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local corePackagesService = game:GetService("CorePackages")
local modules = game:GetService("CoreGui").RobloxGui.Modules
local utilityModule = require(modules.Shell.Utility)
local url = require(corePackagesService.Workspace.Packages.Http).Url
local t = {}
local replaced = string.gsub(string.gsub(game:GetService("ContentProvider").BaseUrl:lower(), "/m.", "/www."), "http://", "https://")
local replaced_1 = string.gsub(replaced, "https://www.", "https://assetgame.")
local _ = string.gsub(replaced, "https://www.", "https://accountsettings.")
t.BaseUrl = replaced
t.AssetGameBaseUrl = replaced_1
local getFStringAppLocationForAppPresenceModule = require(modules.Shell.Flags.GetFStringAppLocationForAppPresence)

local function _(p1)
	-- upvalues: httpService (ref)
	if p1 == nil or #p1 == 0 then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p1 (ref)
		return httpService:JSONDecode(p1)
	end)
	
	return if ok then status else nil
end

local _ = function(p1, p2)
	-- upvalues: httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return game:HttpGetAsync(p1)
	end)
	
	if not ok then
		return nil
	elseif p2 then
		return status
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

local _ = function(p1, p2, p3)
	-- upvalues: httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), p2 (ref), p3 (ref)
		return game:HttpPostAsync(p1, p2, p3)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

local _ = function(p1)
	-- upvalues: httpRbxApiService (ref), httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: httpRbxApiService (copy), p1 (ref)
		return httpRbxApiService:GetAsync(p1)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

local _ = function(p1, p2, p3, p4)
	-- upvalues: httpRbxApiService (ref), httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: httpRbxApiService (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref)
		return httpRbxApiService:PostAsync(p1, p2, p3, p4)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

local _ = function(p1, p2, p3, p4)
	-- upvalues: httpRbxApiService (ref), httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: httpRbxApiService (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref)
		return httpRbxApiService:PostAsyncFullUrl(p1, p2, p3, p4)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

local _ = function(p1)
	-- upvalues: utilityModule (ref), httpService (ref)
	local var1 = nil
	local var2 = utilityModule.Signal()
	httpService:RequestInternal(p1):Start(function(p2, p3)
		-- upvalues: var1 (write), httpService (copy), var2 (ref)
		if p2 and p3.StatusCode ~= 401 and (p3.StatusCode >= 200 and p3.StatusCode < 400) then
			local var3
			local body = p3.Body
			
			if body == nil or #body == 0 then
				var3 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var3 = if not ok then nil else status
			end
			var1 = var3
		end
		var2:fire()
	end)
	var2:wait()
	
	return var1
end

local function buildServiceUrl(p1)
	-- upvalues: replaced (write)
	return string.gsub(replaced, "https://www.", "https://" .. p18 .. ".")
end

local _ = function(p1)
	return if p1 ~= nil then #p1 == 0 else true
end

function t.GetCuratedSortAsync(p1, p2)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%sgames/set?GameSetTargetId=%d&MaxRows=%d", replaced, p1, p2)
	local ok, status = pcall(function()
		-- upvalues: formattedText (ref)
		return game:HttpGetAsync(formattedText)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetCuratedSortByUrlAsync(p1)
	-- upvalues: httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return game:HttpGetAsync(p1)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetUserPlacesAsync(p1, p2, p3)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%sgames/list-users-games-json?userid=%d&startIndex=%d&pageSize=%d", replaced, p3, p1, p2)
	local ok, status = pcall(function()
		-- upvalues: formattedText (ref)
		return game:HttpGetAsync(formattedText)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.SearchGamesAsync(p1, p2, p3)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%sgames/list-json?keyword=%s&StartRows=%d&MaxRows=%d&filterByDeviceType=true", replaced, httpService:UrlEncode(p3), p1, p2)
	local ok, status = pcall(function()
		-- upvalues: formattedText (ref)
		return game:HttpGetAsync(formattedText)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetGamesAsync(p1)
	-- upvalues: replaced (write), httpService (ref)
	local text = string.gsub(replaced, "https://www.", "https://games.") .. "v1/games?universeIds=" .. table.concat(p1, ",")
	local ok, status = pcall(function()
		-- upvalues: text (ref)
		return game:HttpGetAsync(text)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.PostExperienceGuidelines(p1)
	-- upvalues: buildServiceUrl (ref), httpService (ref), utilityModule (ref)
	local t = {
		Method = "POST",
		Url = string.format("%sexperience-guidelines-api/experience-guidelines/get-age-recommendation", buildServiceUrl("apis")),
		Body = httpService:JSONEncode({ universeId = p1 }),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	local var1 = nil
	local var2 = utilityModule.Signal()
	httpService:RequestInternal(t):Start(function(p2, p3)
		-- upvalues: var1 (write), httpService (copy), var2 (ref)
		if p2 and p3.StatusCode ~= 401 and (p3.StatusCode >= 200 and p3.StatusCode < 400) then
			local var3
			local body = p3.Body
			
			if body == nil or #body == 0 then
				var3 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var3 = if not ok then nil else status
			end
			var9 = var3
		end
		var2:fire()
	end)
	var2:wait()
	
	return var1
end

function t.GetGameIconIdAsync(p1)
	-- upvalues: replaced (write), httpService (ref)
	local text = replaced .. "places/icons/json?placeId=" .. tostring(p1)
	local ok, status = pcall(function()
		-- upvalues: text (ref)
		return game:HttpGetAsync(text)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetGameVotesAsync(p1)
	-- upvalues: replaced (write), httpService (ref)
	local text = replaced .. "PlaceItem/GameDetailsVotingPanelJson?placeId=" .. tostring(p1)
	local ok, status = pcall(function()
		-- upvalues: text (ref)
		return game:HttpGetAsync(text)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetRecommendedGamesAsync(p1)
	-- upvalues: replaced (write), httpService (ref)
	local text = replaced .. "Games/GetRecommendedGamesJson?currentPlaceId=" .. tostring(p1)
	local ok, status = pcall(function()
		-- upvalues: text (ref)
		return game:HttpGetAsync(text)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetGameThumbnailsAsync(p1)
	-- upvalues: replaced (write), httpService (ref)
	local text = replaced .. "thumbnail/place-thumbnails?placeId=" .. tostring(p1)
	local ok, status = pcall(function()
		-- upvalues: text (ref)
		return game:HttpGetAsync(text)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetBadgesForUniverseAsync(p1, p2)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%sv1/universes/%d/badges?sortOrder=Asc&limit=100", string.gsub(replaced, "https://www.", "https://badges."), p1)
	
	if p2 then
		formattedText = string.format(formattedText .. "&cursor=%s", p2)
	end
	local ok, status = pcall(function()
		-- upvalues: formattedText (ref)
		return game:HttpGetAsync(formattedText)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetUserAwardedBadgesAsync(p1, p2)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%sv1/users/%d/badges/awarded-dates?badgeIds=%s", string.gsub(replaced, "https://www.", "https://badges."), p1, table.concat(p2, ","))
	local ok, status = pcall(function()
		-- upvalues: formattedText (ref)
		return game:HttpGetAsync(formattedText)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.PostFavoriteToggleAsync(p1)
	-- upvalues: replaced (write), httpService (ref)
	local text = replaced .. "favorite/toggle?assetID=" .. tostring(p1)
	local _pcall = pcall
	local var1 = "favoriteToggle"
	local var2 = nil
	_pcall, var29 = _pcall(function()
		-- upvalues: text (ref), var1 (ref), var2 (ref)
		return game:HttpPostAsync(text, var1, var2)
	end)
	
	if not _pcall then
		return nil
	elseif var29 == nil or #var29 == 0 then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), var29 (ref)
		return httpService:JSONDecode(var29)
	end)
	
	return if ok then status else nil
end

function t.PostGameVoteAsync(p1, p2)
	-- upvalues: replaced (write), httpService (ref)
	local text = replaced .. "voting/vote?assetId=" .. tostring(p1) .. "&vote=" .. tostring(p2)
	local _pcall = pcall
	local var1 = "vote"
	local var2 = nil
	_pcall, var34 = _pcall(function()
		-- upvalues: text (ref), var1 (ref), var2 (ref)
		return game:HttpPostAsync(text, var1, var2)
	end)
	
	if not _pcall then
		return nil
	elseif var34 == nil or #var34 == 0 then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), var34 (ref)
		return httpService:JSONDecode(var34)
	end)
	
	return if ok then status else nil
end

function t.RegisterAppPresence()
	-- upvalues: buildServiceUrl (ref), getFStringAppLocationForAppPresenceModule (ref), httpService (ref)
	local formattedText = string.format("%s/v1/presence/register-app-presence", buildServiceUrl("presence"))
	local var1 = nil
	-- [0.000s] <RUNTIME-ERROR> : Error block 0 analysis at pc 2 ('luna.MethodCall' object has no attribute 'name')
end

function t.GetCrossplayEnabledStatusAsync()
	-- upvalues: buildServiceUrl (ref), utilityModule (ref), httpService (ref)
	local t = {
		Method = "GET",
		Url = string.format("%suser-settings-api/v1/user-settings?requestedUserSettings=xboxCrossPlayStatusIsEnabled", buildServiceUrl("apis"))
	}
	local var1 = nil
	local var2 = utilityModule.Signal()
	httpService:RequestInternal(t):Start(function(p1, p2)
		-- upvalues: var1 (write), httpService (copy), var2 (ref)
		if p1 and p2.StatusCode ~= 401 and (p2.StatusCode >= 200 and p2.StatusCode < 400) then
			local var3
			local body = p2.Body
			
			if body == nil or #body == 0 then
				var3 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var3 = if not ok then nil else status
			end
			var9 = var3
		end
		var2:fire()
	end)
	var2:wait()
	
	return var1
end

function t.PostCrossplayStatusAsync(vectorA)
	-- upvalues: buildServiceUrl (ref), httpService (ref), utilityModule (ref)
	local t = {
		Method = "POST",
		Url = string.format("%suser-settings-api/v1/user-settings", buildServiceUrl("apis")),
		Body = httpService:JSONEncode({ xboxCrossPlayStatusIsEnabled = vectorA }),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	local var1 = nil
	local var2 = utilityModule.Signal()
	httpService:RequestInternal(t):Start(function(p1, p2)
		-- upvalues: var1 (write), httpService (copy), var2 (ref)
		if p1 and p2.StatusCode ~= 401 and (p2.StatusCode >= 200 and p2.StatusCode < 400) then
			local var3
			local body = p2.Body
			
			if body == nil or #body == 0 then
				var3 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var3 = if not ok then nil else status
			end
			var9 = var3
		end
		var2:fire()
	end)
	var2:wait()
	
	return var1
end

function t.GetRecommendedUsersndsAsync()
	-- upvalues: buildServiceUrl (ref), httpService (ref)
	local formattedText = string.format("%s/v1/recommended-users", buildServiceUrl("friends"))
	local ok, status = pcall(function()
		-- upvalues: formattedText (ref)
		return game:HttpGetAsync(formattedText)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetUsersPresenceAsync(p1)
	-- upvalues: httpService (ref), buildServiceUrl (ref)
	local var1 = httpService:JSONEncode({ userIds = p1 })
	local formattedText = string.format("%s/v1/presence/users", buildServiceUrl("presence"))
	local var2 = nil
	local ok, status = pcall(function()
		-- upvalues: formattedText (ref), var1 (ref), var2 (ref)
		return game:HttpPostAsync(formattedText, var1, var2)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetPlatformUserBalanceAsync()
	-- upvalues: buildServiceUrl (ref), httpService (ref)
	local formattedText = string.format("%sv1/user/currency", buildServiceUrl("economy"))
	local ok, status = pcall(function()
		-- upvalues: formattedText (ref)
		return game:HttpGetAsync(formattedText)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetTotalUserBalanceAsync()
	-- upvalues: buildServiceUrl (ref), httpService (ref)
	local formattedText = string.format("%sv1/user/currency", buildServiceUrl("economy"))
	local ok, status = pcall(function()
		-- upvalues: formattedText (ref)
		return game:HttpGetAsync(formattedText)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetUserOwnedPackagesAsync(p1, p2)
	-- upvalues: replaced (write), httpService (ref)
	local text = replaced .. "users/inventory/list-json?userId=" .. tostring(p1) .. "&assetTypeId=" .. tostring(32) .. "&pageNumber=" .. tostring(p2 or 1)
	local ok, status = pcall(function()
		-- upvalues: text (ref)
		return game:HttpGetAsync(text)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetCurrentlyWearingAsync(p1)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%s/v1/users/%d/currently-wearing", string.gsub(replaced, "https://www.", "https://avatar."), p1)
	local ok, status = pcall(function()
		-- upvalues: formattedText (ref)
		return game:HttpGetAsync(formattedText)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.SetWearingAssetsAsync(value)
	-- upvalues: httpService (ref), buildServiceUrl (ref), utilityModule (ref)
	local t = {
		Method = "POST",
		Url = string.format("%s/v1/avatar/set-wearing-assets", buildServiceUrl("avatar")),
		Body = httpService:JSONEncode({ assetIds = value }),
		Headers = { ["Content-Type"] = "application/json" }
	}
	local var1 = nil
	local var2 = utilityModule.Signal()
	httpService:RequestInternal(t):Start(function(p1, p2)
		-- upvalues: var1 (write), httpService (copy), var2 (ref)
		if p1 and p2.StatusCode ~= 401 and (p2.StatusCode >= 200 and p2.StatusCode < 400) then
			local var3
			local body = p2.Body
			
			if body == nil or #body == 0 then
				var3 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var3 = if not ok then nil else status
			end
			var9 = var3
		end
		var2:fire()
	end)
	var2:wait()
	
	return var1
end

function t.PurchaseProductAsync(p1, p2, p3, p4)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%s/v1/purchases/products/%d", string.gsub(replaced, "https://www.", "https://economy."), p1)
	local var1 = httpService:JSONEncode({
		expectedCurrency = p4,
		expectedPrice = p2,
		expectedSellerId = p3
	})
	local var2 = nil
	local ok, status = pcall(function()
		-- upvalues: formattedText (ref), var1 (ref), var2 (ref)
		return game:HttpPostAsync(formattedText, var1, var2)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.MultiGetBundleDetailsAsync(p1)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%sv1/bundles/details?bundleIds=%s", string.gsub(replaced, "https://www.", "https://catalog."), table.concat(p1, ","))
	local ok, status = pcall(function()
		-- upvalues: formattedText (ref)
		return game:HttpGetAsync(formattedText)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetUserOwnedBundlesAsync(p1, p2)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%sv1/users/%s/bundles?sortOrder=Asc&limit=100", string.gsub(replaced, "https://www.", "https://catalog."), tostring(p1))
	
	if p2 then
		formattedText = string.format(formattedText .. "&cursor=%s", p2)
	end
	local ok, status = pcall(function()
		-- upvalues: formattedText (ref)
		return game:HttpGetAsync(formattedText)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetAssetThumbnailBatchAsync(value, p1, p2)
	-- upvalues: replaced (write), httpService (ref)
	-- [0.000s] <RUNTIME-ERROR> : Error block 0 analysis at pc 0 ('luna.Call' object has no attribute 'name')
end

function t.ReportAbuseAsyncV2(p1, p2, p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: httpService (ref), url (ref), httpRbxApiService (ref)
	local var1 = httpService:JSONEncode({
		tags = {
			ENTRY_POINT = { valueList = { { data = p6 } } },
			SUBMITTER_USER_ID = { valueList = { { data = p1 } } },
			REPORT_TARGET_USER_ID = { valueList = { { data = p3 } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = p8 } } },
			REPORTED_ABUSE_VECTOR = { valueList = { { data = p7 } } },
			REPORTER_COMMENT = { valueList = { { data = p9 } } },
			REPORT_TARGET_ASSET_ID = { valueList = { { data = p2 } } },
			REPORT_TARGET_ASSET_NAME = { valueList = { { data = p4 } } },
			REPORT_TARGET_ASSET_DESCRIPTION = { valueList = { { data = p5 } } }
		}
	})
	local text = url.APIS_URL .. "abuse-reporting/v2/abuse-report"
	
	if not var1 then
		return nil
	end
	local default = Enum.ThrottlingPriority.Default
	local applicationJson = Enum.HttpContentType.ApplicationJson
	local ok, status = pcall(function()
		-- upvalues: httpRbxApiService (copy), text (ref), var1 (ref), default (ref), applicationJson (ref)
		return httpRbxApiService:PostAsyncFullUrl(text, var1, default, applicationJson)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetConsecutiveDaysLoggedInAsync()
	-- upvalues: buildServiceUrl (ref), utilityModule (ref), httpService (ref)
	local t = {
		Method = "GET",
		Url = string.format("%sv1/xbox/get-login-consecutive-days", buildServiceUrl("auth"))
	}
	local var1 = nil
	local var2 = utilityModule.Signal()
	httpService:RequestInternal(t):Start(function(p1, p2)
		-- upvalues: var1 (write), httpService (copy), var2 (ref)
		if p1 and p2.StatusCode ~= 401 and (p2.StatusCode >= 200 and p2.StatusCode < 400) then
			local var3
			local body = p2.Body
			
			if body == nil or #body == 0 then
				var3 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var3 = if not ok then nil else status
			end
			var9 = var3
		end
		var2:fire()
	end)
	var2:wait()
	
	return var1
end

function t.IsValidUsername(p1, p2)
	-- upvalues: replaced (write), httpService (ref), utilityModule (ref)
	local var1 = if p1 ~= nil then #p1 == 0 else true
	
	if not var1 then
		var1 = if p2 ~= nil then #p2 == 0 else true
		
		if var1 then
			return
		else
			local t = {
				Method = "GET",
				Url = string.format("%sv2/usernames/validate?request.username=%s&request.birthday=%s", string.gsub(replaced, "https://www.", "https://auth."), httpService:UrlEncode(p1), p2)
			}
			local var2 = nil
			local var3 = utilityModule.Signal()
			httpService:RequestInternal(t):Start(function(p3, p4)
				-- upvalues: var2 (write), httpService (copy), var3 (ref)
				if p3 and p4.StatusCode ~= 401 and (p4.StatusCode >= 200 and p4.StatusCode < 400) then
					local var4
					local body = p4.Body
					
					if body == nil or #body == 0 then
						var4 = nil
					else
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), body (ref)
							return httpService:JSONDecode(body)
						end)
						var4 = if not ok then nil else status
					end
					var9 = var4
				end
				var3:fire()
			end)
			var3:wait()
			
			return var2
		end
	end
end

function t.IsValidPassword(p1, p2)
	-- upvalues: replaced (write), httpService (ref), utilityModule (ref)
	local var1 = if p1 ~= nil then #p1 == 0 else true
	
	if not var1 then
		var1 = if p2 ~= nil then #p2 == 0 else true
		
		if var1 then
			return
		else
			local t = {
				Method = "GET",
				Url = string.format("%sv2/passwords/validate?request.username=%s&request.password=%s", string.gsub(replaced, "https://www.", "https://auth."), httpService:UrlEncode(p1), httpService:UrlEncode(p2))
			}
			local var2 = nil
			local var3 = utilityModule.Signal()
			httpService:RequestInternal(t):Start(function(p3, p4)
				-- upvalues: var2 (write), httpService (copy), var3 (ref)
				if p3 and p4.StatusCode ~= 401 and (p4.StatusCode >= 200 and p4.StatusCode < 400) then
					local var4
					local body = p4.Body
					
					if body == nil or #body == 0 then
						var4 = nil
					else
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), body (ref)
							return httpService:JSONDecode(body)
						end)
						var4 = if not ok then nil else status
					end
					var9 = var4
				end
				var3:fire()
			end)
			var3:wait()
			
			return var2
		end
	end
end

function t.PostSponsoredGameClickAsync(p1)
	-- upvalues: buildServiceUrl (ref), httpService (ref)
	local formattedText = string.format("%sv1/sponsored-games/click", buildServiceUrl("ads"))
	local formattedText_1, formattedText_2 = string.format("\"%s\"", p1)
	local ok, status = pcall(function()
		-- upvalues: formattedText (ref), formattedText_1 (ref), formattedText_2 (ref)
		return game:HttpPostAsync(formattedText, formattedText_1, formattedText_2)
	end)
	
	if not ok then
		return nil
	elseif status == nil or #status == 0 then
		return nil
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 then status_1 else nil
end

function t.GetUserVoteCountFromVotingApiAsync()
	-- upvalues: buildServiceUrl (ref), utilityModule (ref), httpService (ref)
	local t = {
		Method = "GET",
		Url = string.format("%svoting-api/user/get-vote-count?targetType=Place", buildServiceUrl("apis"))
	}
	local var1 = nil
	local var2 = utilityModule.Signal()
	httpService:RequestInternal(t):Start(function(p1, p2)
		-- upvalues: var1 (write), httpService (copy), var2 (ref)
		if p1 and p2.StatusCode ~= 401 and (p2.StatusCode >= 200 and p2.StatusCode < 400) then
			local var3
			local body = p2.Body
			
			if body == nil or #body == 0 then
				var3 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var3 = if not ok then nil else status
			end
			var9 = var3
		end
		var2:fire()
	end)
	var2:wait()
	
	return var1
end

function t.CreateCrossDeviceLoginCode()
	-- upvalues: buildServiceUrl (ref), httpService (ref)
	local formattedText = string.format("%sauth-token-service/v1/login/create", buildServiceUrl("apis"))
	local _pcall = pcall
	local var1 = ""
	local var2 = nil
	_pcall, var82 = _pcall(function()
		-- upvalues: formattedText (ref), var1 (ref), var2 (ref)
		return game:HttpPostAsync(formattedText, var1, var2)
	end)
	
	if not _pcall then
		return nil
	elseif var82 == nil or #var82 == 0 then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), var82 (ref)
		return httpService:JSONDecode(var82)
	end)
	
	return if ok then status else nil
end

function t.CheckCrossDeviceLoginStatus(vectorA, vectorB)
	-- upvalues: buildServiceUrl (ref), httpService (ref), utilityModule (ref)
	local t = {
		Method = "POST",
		Url = string.format("%sauth-token-service/v1/login/status", buildServiceUrl("apis")),
		Body = httpService:JSONEncode({ code = vectorA, privateKey = vectorB }),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	local var1 = nil
	local var2 = utilityModule.Signal()
	httpService:RequestInternal(t):Start(function(p1, p2)
		-- upvalues: var1 (write), httpService (copy), var2 (ref)
		if p1 and p2.StatusCode ~= 401 and (p2.StatusCode >= 200 and p2.StatusCode < 400) then
			local var3
			local body = p2.Body
			
			if body == nil or #body == 0 then
				var3 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var3 = if not ok then nil else status
			end
			var9 = var3
		end
		var2:fire()
	end)
	var2:wait()
	
	return var1
end

function t.CancelCrossDeviceLogin(vectorA)
	-- upvalues: buildServiceUrl (ref), httpService (ref), utilityModule (ref)
	local t = {
		Method = "POST",
		Url = string.format("%sauth-token-service/v1/login/cancel", buildServiceUrl("apis")),
		Body = httpService:JSONEncode({ code = vectorA }),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	local var1 = nil
	local var2 = utilityModule.Signal()
	httpService:RequestInternal(t):Start(function(p1, p2)
		-- upvalues: var1 (write), httpService (copy), var2 (ref)
		if p1 and p2.StatusCode ~= 401 and (p2.StatusCode >= 200 and p2.StatusCode < 400) then
			local var3
			local body = p2.Body
			
			if body == nil or #body == 0 then
				var3 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var3 = if not ok then nil else status
			end
			var9 = var3
		end
		var2:fire()
	end)
	var2:wait()
	
	return var1
end

return t