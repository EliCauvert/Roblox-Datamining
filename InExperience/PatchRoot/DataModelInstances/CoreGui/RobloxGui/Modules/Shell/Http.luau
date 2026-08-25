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

local function _(p0)
	-- upvalues: httpService (ref)
	if p0 == nil or #p0 == 0 then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p0 (ref)
		return httpService:JSONDecode(p0)
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

local _ = function(p3, p4, p5)
	-- upvalues: httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: p3 (ref), p4 (ref), p5 (ref)
		return game:HttpPostAsync(p3, p4, p5)
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

local _ = function(p6)
	-- upvalues: httpRbxApiService (ref), httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: httpRbxApiService (copy), p6 (ref)
		return httpRbxApiService:GetAsync(p6)
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

local _ = function(p7, p8, p9, p10)
	-- upvalues: httpRbxApiService (ref), httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: httpRbxApiService (copy), p7 (ref), p8 (ref), p9 (ref), p10 (ref)
		return httpRbxApiService:PostAsync(p7, p8, p9, p10)
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

local _ = function(p11, p12, p13, p14)
	-- upvalues: httpRbxApiService (ref), httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: httpRbxApiService (copy), p11 (ref), p12 (ref), p13 (ref), p14 (ref)
		return httpRbxApiService:PostAsyncFullUrl(p11, p12, p13, p14)
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

local _ = function(p15)
	-- upvalues: utilityModule (ref), httpService (ref)
	local var9 = nil
	local var10 = utilityModule.Signal()
	httpService:RequestInternal(p15):Start(function(p16, p17)
		-- upvalues: var9 (write), httpService (copy), var10 (ref)
		if p16 and p17.StatusCode ~= 401 and (p17.StatusCode >= 200 and p17.StatusCode < 400) then
			local var11
			local body = p17.Body
			
			if body == nil or #body == 0 then
				var11 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var11 = if not ok then nil else status
			end
			var9 = var11
		end
		var10:fire()
	end)
	var10:wait()
	
	return var9
end

local function buildServiceUrl(p18)
	-- upvalues: replaced (write)
	return string.gsub(replaced, "https://www.", "https://" .. p18 .. ".")
end

local _ = function(p19)
	return if p19 ~= nil then #p19 == 0 else true
end

function t.GetCuratedSortAsync(p20, p21)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%sgames/set?GameSetTargetId=%d&MaxRows=%d", replaced, p20, p21)
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

function t.GetCuratedSortByUrlAsync(p22)
	-- upvalues: httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: p22 (ref)
		return game:HttpGetAsync(p22)
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

function t.GetUserPlacesAsync(p23, p24, p25)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%sgames/list-users-games-json?userid=%d&startIndex=%d&pageSize=%d", replaced, p25, p23, p24)
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

function t.SearchGamesAsync(p26, p27, p28)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%sgames/list-json?keyword=%s&StartRows=%d&MaxRows=%d&filterByDeviceType=true", replaced, httpService:UrlEncode(p28), p26, p27)
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

function t.GetGamesAsync(p29)
	-- upvalues: replaced (write), httpService (ref)
	local text = string.gsub(replaced, "https://www.", "https://games.") .. "v1/games?universeIds=" .. table.concat(p29, ",")
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

function t.PostExperienceGuidelines(p30)
	-- upvalues: buildServiceUrl (ref), httpService (ref), utilityModule (ref)
	local t = {
		Method = "POST",
		Url = string.format("%sexperience-guidelines-api/experience-guidelines/get-age-recommendation", buildServiceUrl("apis")),
		Body = httpService:JSONEncode({ universeId = p30 }),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}
	local var17 = nil
	local var18 = utilityModule.Signal()
	httpService:RequestInternal(t):Start(function(p31, p32)
		-- upvalues: var17 (write), httpService (copy), var18 (ref)
		if p31 and p32.StatusCode ~= 401 and (p32.StatusCode >= 200 and p32.StatusCode < 400) then
			local var11
			local body = p32.Body
			
			if body == nil or #body == 0 then
				var11 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var11 = if not ok then nil else status
			end
			var9 = var11
		end
		var18:fire()
	end)
	var18:wait()
	
	return var17
end

function t.GetGameIconIdAsync(p33)
	-- upvalues: replaced (write), httpService (ref)
	local text = replaced .. "places/icons/json?placeId=" .. tostring(p33)
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

function t.GetGameVotesAsync(p34)
	-- upvalues: replaced (write), httpService (ref)
	local text = replaced .. "PlaceItem/GameDetailsVotingPanelJson?placeId=" .. tostring(p34)
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

function t.GetRecommendedGamesAsync(p35)
	-- upvalues: replaced (write), httpService (ref)
	local text = replaced .. "Games/GetRecommendedGamesJson?currentPlaceId=" .. tostring(p35)
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

function t.GetGameThumbnailsAsync(p36)
	-- upvalues: replaced (write), httpService (ref)
	local text = replaced .. "thumbnail/place-thumbnails?placeId=" .. tostring(p36)
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

function t.GetBadgesForUniverseAsync(p37, p38)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%sv1/universes/%d/badges?sortOrder=Asc&limit=100", string.gsub(replaced, "https://www.", "https://badges."), p37)
	
	if p38 then
		formattedText = string.format(formattedText .. "&cursor=%s", p38)
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

function t.GetUserAwardedBadgesAsync(p39, p40)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%sv1/users/%d/badges/awarded-dates?badgeIds=%s", string.gsub(replaced, "https://www.", "https://badges."), p39, table.concat(p40, ","))
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

function t.PostFavoriteToggleAsync(p41)
	-- upvalues: replaced (write), httpService (ref)
	local text = replaced .. "favorite/toggle?assetID=" .. tostring(p41)
	local _pcall = pcall
	local var27 = "favoriteToggle"
	local var28 = nil
	_pcall, var29 = _pcall(function()
		-- upvalues: text (ref), var27 (ref), var28 (ref)
		return game:HttpPostAsync(text, var27, var28)
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

function t.PostGameVoteAsync(p42, p43)
	-- upvalues: replaced (write), httpService (ref)
	local text = replaced .. "voting/vote?assetId=" .. tostring(p42) .. "&vote=" .. tostring(p43)
	local _pcall = pcall
	local var32 = "vote"
	local var33 = nil
	_pcall, var34 = _pcall(function()
		-- upvalues: text (ref), var32 (ref), var33 (ref)
		return game:HttpPostAsync(text, var32, var33)
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
	local var36 = nil
	-- [0.000s] <RUNTIME-ERROR> : Error block 0 analysis at pc 2 ('luna.MethodCall' object has no attribute 'name')
end

function t.GetCrossplayEnabledStatusAsync()
	-- upvalues: buildServiceUrl (ref), utilityModule (ref), httpService (ref)
	local t = {
		Method = "GET",
		Url = string.format("%suser-settings-api/v1/user-settings?requestedUserSettings=xboxCrossPlayStatusIsEnabled", buildServiceUrl("apis"))
	}
	local var38 = nil
	local var39 = utilityModule.Signal()
	httpService:RequestInternal(t):Start(function(p44, p45)
		-- upvalues: var38 (write), httpService (copy), var39 (ref)
		if p44 and p45.StatusCode ~= 401 and (p45.StatusCode >= 200 and p45.StatusCode < 400) then
			local var11
			local body = p45.Body
			
			if body == nil or #body == 0 then
				var11 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var11 = if not ok then nil else status
			end
			var9 = var11
		end
		var39:fire()
	end)
	var39:wait()
	
	return var38
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
	local var41 = nil
	local var42 = utilityModule.Signal()
	httpService:RequestInternal(t):Start(function(p46, p47)
		-- upvalues: var41 (write), httpService (copy), var42 (ref)
		if p46 and p47.StatusCode ~= 401 and (p47.StatusCode >= 200 and p47.StatusCode < 400) then
			local var11
			local body = p47.Body
			
			if body == nil or #body == 0 then
				var11 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var11 = if not ok then nil else status
			end
			var9 = var11
		end
		var42:fire()
	end)
	var42:wait()
	
	return var41
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

function t.GetUsersPresenceAsync(p48)
	-- upvalues: httpService (ref), buildServiceUrl (ref)
	local var44 = httpService:JSONEncode({ userIds = p48 })
	local formattedText = string.format("%s/v1/presence/users", buildServiceUrl("presence"))
	local var46 = nil
	local ok, status = pcall(function()
		-- upvalues: formattedText (ref), var44 (ref), var46 (ref)
		return game:HttpPostAsync(formattedText, var44, var46)
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

function t.GetUserOwnedPackagesAsync(p49, p50)
	-- upvalues: replaced (write), httpService (ref)
	local text = replaced .. "users/inventory/list-json?userId=" .. tostring(p49) .. "&assetTypeId=" .. tostring(32) .. "&pageNumber=" .. tostring(p50 or 1)
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

function t.GetCurrentlyWearingAsync(p51)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%s/v1/users/%d/currently-wearing", string.gsub(replaced, "https://www.", "https://avatar."), p51)
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
	local var52 = nil
	local var53 = utilityModule.Signal()
	httpService:RequestInternal(t):Start(function(p52, p53)
		-- upvalues: var52 (write), httpService (copy), var53 (ref)
		if p52 and p53.StatusCode ~= 401 and (p53.StatusCode >= 200 and p53.StatusCode < 400) then
			local var11
			local body = p53.Body
			
			if body == nil or #body == 0 then
				var11 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var11 = if not ok then nil else status
			end
			var9 = var11
		end
		var53:fire()
	end)
	var53:wait()
	
	return var52
end

function t.PurchaseProductAsync(p54, p55, p56, p57)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%s/v1/purchases/products/%d", string.gsub(replaced, "https://www.", "https://economy."), p54)
	local var55 = httpService:JSONEncode({
		expectedCurrency = p57,
		expectedPrice = p55,
		expectedSellerId = p56
	})
	local var56 = nil
	local ok, status = pcall(function()
		-- upvalues: formattedText (ref), var55 (ref), var56 (ref)
		return game:HttpPostAsync(formattedText, var55, var56)
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

function t.MultiGetBundleDetailsAsync(p58)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%sv1/bundles/details?bundleIds=%s", string.gsub(replaced, "https://www.", "https://catalog."), table.concat(p58, ","))
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

function t.GetUserOwnedBundlesAsync(p59, p60)
	-- upvalues: replaced (write), httpService (ref)
	local formattedText = string.format("%sv1/users/%s/bundles?sortOrder=Asc&limit=100", string.gsub(replaced, "https://www.", "https://catalog."), tostring(p59))
	
	if p60 then
		formattedText = string.format(formattedText .. "&cursor=%s", p60)
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

function t.GetAssetThumbnailBatchAsync(value, p61, p62)
	-- upvalues: replaced (write), httpService (ref)
	-- [0.000s] <RUNTIME-ERROR> : Error block 0 analysis at pc 0 ('luna.Call' object has no attribute 'name')
end

function t.ReportAbuseAsyncV2(p63, p64, p65, p66, p67, p68, p69, p70, p71)
	-- upvalues: httpService (ref), url (ref), httpRbxApiService (ref)
	local var59 = httpService:JSONEncode({
		tags = {
			ENTRY_POINT = { valueList = { { data = p68 } } },
			SUBMITTER_USER_ID = { valueList = { { data = p63 } } },
			REPORT_TARGET_USER_ID = { valueList = { { data = p65 } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = p70 } } },
			REPORTED_ABUSE_VECTOR = { valueList = { { data = p69 } } },
			REPORTER_COMMENT = { valueList = { { data = p71 } } },
			REPORT_TARGET_ASSET_ID = { valueList = { { data = p64 } } },
			REPORT_TARGET_ASSET_NAME = { valueList = { { data = p66 } } },
			REPORT_TARGET_ASSET_DESCRIPTION = { valueList = { { data = p67 } } }
		}
	})
	local text = url.APIS_URL .. "abuse-reporting/v2/abuse-report"
	
	if not var59 then
		return nil
	end
	local default = Enum.ThrottlingPriority.Default
	local applicationJson = Enum.HttpContentType.ApplicationJson
	local ok, status = pcall(function()
		-- upvalues: httpRbxApiService (copy), text (ref), var59 (ref), default (ref), applicationJson (ref)
		return httpRbxApiService:PostAsyncFullUrl(text, var59, default, applicationJson)
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
	local var62 = nil
	local var63 = utilityModule.Signal()
	httpService:RequestInternal(t):Start(function(p72, p73)
		-- upvalues: var62 (write), httpService (copy), var63 (ref)
		if p72 and p73.StatusCode ~= 401 and (p73.StatusCode >= 200 and p73.StatusCode < 400) then
			local var11
			local body = p73.Body
			
			if body == nil or #body == 0 then
				var11 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var11 = if not ok then nil else status
			end
			var9 = var11
		end
		var63:fire()
	end)
	var63:wait()
	
	return var62
end

function t.IsValidUsername(p74, p75)
	-- upvalues: replaced (write), httpService (ref), utilityModule (ref)
	local var64 = if p74 ~= nil then #p74 == 0 else true
	
	if not var64 then
		var64 = if p75 ~= nil then #p75 == 0 else true
		
		if var64 then
			return
		else
			local t = {
				Method = "GET",
				Url = string.format("%sv2/usernames/validate?request.username=%s&request.birthday=%s", string.gsub(replaced, "https://www.", "https://auth."), httpService:UrlEncode(p74), p75)
			}
			local var66 = nil
			local var67 = utilityModule.Signal()
			httpService:RequestInternal(t):Start(function(p76, p77)
				-- upvalues: var66 (write), httpService (copy), var67 (ref)
				if p76 and p77.StatusCode ~= 401 and (p77.StatusCode >= 200 and p77.StatusCode < 400) then
					local var11
					local body = p77.Body
					
					if body == nil or #body == 0 then
						var11 = nil
					else
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), body (ref)
							return httpService:JSONDecode(body)
						end)
						var11 = if not ok then nil else status
					end
					var9 = var11
				end
				var67:fire()
			end)
			var67:wait()
			
			return var66
		end
	end
end

function t.IsValidPassword(p78, p79)
	-- upvalues: replaced (write), httpService (ref), utilityModule (ref)
	local var68 = if p78 ~= nil then #p78 == 0 else true
	
	if not var68 then
		var68 = if p79 ~= nil then #p79 == 0 else true
		
		if var68 then
			return
		else
			local t = {
				Method = "GET",
				Url = string.format("%sv2/passwords/validate?request.username=%s&request.password=%s", string.gsub(replaced, "https://www.", "https://auth."), httpService:UrlEncode(p78), httpService:UrlEncode(p79))
			}
			local var70 = nil
			local var71 = utilityModule.Signal()
			httpService:RequestInternal(t):Start(function(p80, p81)
				-- upvalues: var70 (write), httpService (copy), var71 (ref)
				if p80 and p81.StatusCode ~= 401 and (p81.StatusCode >= 200 and p81.StatusCode < 400) then
					local var11
					local body = p81.Body
					
					if body == nil or #body == 0 then
						var11 = nil
					else
						local ok, status = pcall(function()
							-- upvalues: httpService (copy), body (ref)
							return httpService:JSONDecode(body)
						end)
						var11 = if not ok then nil else status
					end
					var9 = var11
				end
				var71:fire()
			end)
			var71:wait()
			
			return var70
		end
	end
end

function t.PostSponsoredGameClickAsync(p82)
	-- upvalues: buildServiceUrl (ref), httpService (ref)
	local formattedText = string.format("%sv1/sponsored-games/click", buildServiceUrl("ads"))
	local formattedText_1, formattedText_2 = string.format("\"%s\"", p82)
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
	local var76 = nil
	local var77 = utilityModule.Signal()
	httpService:RequestInternal(t):Start(function(p83, p84)
		-- upvalues: var76 (write), httpService (copy), var77 (ref)
		if p83 and p84.StatusCode ~= 401 and (p84.StatusCode >= 200 and p84.StatusCode < 400) then
			local var11
			local body = p84.Body
			
			if body == nil or #body == 0 then
				var11 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var11 = if not ok then nil else status
			end
			var9 = var11
		end
		var77:fire()
	end)
	var77:wait()
	
	return var76
end

function t.CreateCrossDeviceLoginCode()
	-- upvalues: buildServiceUrl (ref), httpService (ref)
	local formattedText = string.format("%sauth-token-service/v1/login/create", buildServiceUrl("apis"))
	local _pcall = pcall
	local var80 = ""
	local var81 = nil
	_pcall, var82 = _pcall(function()
		-- upvalues: formattedText (ref), var80 (ref), var81 (ref)
		return game:HttpPostAsync(formattedText, var80, var81)
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
	local var84 = nil
	local var85 = utilityModule.Signal()
	httpService:RequestInternal(t):Start(function(p85, p86)
		-- upvalues: var84 (write), httpService (copy), var85 (ref)
		if p85 and p86.StatusCode ~= 401 and (p86.StatusCode >= 200 and p86.StatusCode < 400) then
			local var11
			local body = p86.Body
			
			if body == nil or #body == 0 then
				var11 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var11 = if not ok then nil else status
			end
			var9 = var11
		end
		var85:fire()
	end)
	var85:wait()
	
	return var84
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
	local var87 = nil
	local var88 = utilityModule.Signal()
	httpService:RequestInternal(t):Start(function(p87, p88)
		-- upvalues: var87 (write), httpService (copy), var88 (ref)
		if p87 and p88.StatusCode ~= 401 and (p88.StatusCode >= 200 and p88.StatusCode < 400) then
			local var11
			local body = p88.Body
			
			if body == nil or #body == 0 then
				var11 = nil
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				var11 = if not ok then nil else status
			end
			var9 = var11
		end
		var88:fire()
	end)
	var88:wait()
	
	return var87
end

return t