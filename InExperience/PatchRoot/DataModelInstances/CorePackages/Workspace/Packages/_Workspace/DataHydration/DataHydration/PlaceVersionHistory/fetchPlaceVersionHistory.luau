local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)
local _ = require(script.Parent.PlaceVersionHistoryStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function _(p1)
	print(`[PlaceVersionHistoryRestoreDebug] {p1}`)
end

local _ = function(p1)
	print(`[PlaceVersionHistoryNoteDebug] {p1}`)
end

local function bodyPreview(Buf): string
	if Buf == nil then
		return "nil"
	else
		local Replaced = string.gsub(if typeof(Buf) == "buffer" then buffer.tostring(Buf) else tostring(Buf), "[\r\n]+", " ")
		
		return if #Replaced > 500 then string.sub(Replaced, 1, 500) .. "..." else Replaced
	end
end

local function appendQuery(Text: string, List): string
	local Flag = false
	local List1 = {}
	
	for i, value in List do
		if value ~= nil then
			Flag = true
			table.insert(List1, ("%s=%s"):format(i, (tostring(value))))
		end
	end
	return if Flag then Text .. (if string.find(Text, "?", 1, true) == nil then "?" else "&") .. table.concat(List1, "&") else Text
end

local function historyUrl(BaseUrl, p1, p2)
	-- upvalues: appendQuery (copy)
	local VersionName: string = ("%s/place-version-history-api/v1/%d/history"):format(BaseUrl, p1)
	
	return if p2 == nil then appendQuery(VersionName, { pageSize = 100 }) else appendQuery(VersionName, {
		cursor = p2.cursor,
		pageSize = p2.pageSize or p2.limit,
		isPublished = p2.isPublished
	})
end

local _ = function(p1, p2, p3): string
	return ("%s/place-version-history-api/v1/%d/version/%s/notes"):format(p1, p2, p3)
end

local _ = function(p1, p2, p3): string
	return ("%s/v1/assets/%d/revert-version?assetVersionNumber=%d"):format(p1, p2, p3)
end

local _ = function(p1, p2): string
	return ("%s/universes/v1/places/%d/rollback"):format(p1, p2)
end

local _ = function(p1)
	-- upvalues: UrlBase (copy)
	local P14 = p1 or {}
	
	return P14.network, P14.baseUrl or UrlBase.APIS
end

local _ = function(p1)
	-- upvalues: UrlBase (copy)
	return (p1 or {}).developBaseUrl or UrlBase.new("develop")
end

local _ = function(p1)
	-- upvalues: WithCsrfRetryModule (copy), HttpClientModule (copy)
	return (p1 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork())
end

local _ = function(p1)
	return if type(p1) == "number" then p1 elseif type(p1) == "string" then tonumber(p1) else nil
end

return {
	DEFAULT_HISTORY_PAGE_SIZE = 100,
	fetchHistory = function(p1, p2, p3)
		-- upvalues: UrlBase (copy), historyUrl (copy), FetchFunction (copy), AsPromiseFunction (copy)
		local P19 = p2 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "place-version-history.get-history",
			network = P19.network,
			url = historyUrl(P19.baseUrl or UrlBase.APIS, p1, p3),
			decode = function(p4)
				return p4
			end
		})))
	end,
	revertVersion = function(AssetId, AssetVersionNumber, p1)
		-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), AsPromiseFunction (copy)
		return AsPromiseFunction((FetchFunction({
			method = "POST",
			analyticsKey = "place-version-history.revert-version",
			legacy = true,
			network = (p1 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/assets/%d/revert-version?assetVersionNumber=%d"):format((p1 or {}).developBaseUrl or UrlBase.new("develop"), AssetId, AssetVersionNumber),
			body = {},
			decode = function(_)
				-- upvalues: AssetId (copy), AssetVersionNumber (copy)
				return {
					assetId = AssetId,
					assetVersionNumber = AssetVersionNumber
				}
			end
		})))
	end,
	rollbackPlace = function(PlaceId, VersionToRollback, Message, Published, p1)
		-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), bodyPreview (copy), AsPromiseFunction (copy)
		local P30 = p1 or {}
		local _ = P30.network
		
		return AsPromiseFunction((FetchFunction({
			method = "POST",
			analyticsKey = "place-version-history.rollback-place",
			network = (p1 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = ("%s/universes/v1/places/%d/rollback"):format(P30.baseUrl or UrlBase.APIS, PlaceId),
			body = {
				versionToRollback = VersionToRollback,
				message = Message,
				published = Published
			},
			analytics = function(_, p2, p3, p4, Value: number, p5)
				-- upvalues: bodyPreview (upval)
				if p4 == nil then
					if p5 ~= "succeeded" then
						print(`[PlaceVersionHistoryRestoreDebug] {`request failed method={p2} url={p3} status={p5} durationMs={math.floor(Value)} response=nil`}`)
					end
					return
				elseif p5 ~= "succeeded" or p4.statusCode < 200 or p4.statusCode >= 300 then
					print(`[PlaceVersionHistoryRestoreDebug] {`request failed method={p2} url={p3} status={p5} httpStatus={p4.statusCode} httpError={tostring(p4.httpError)} durationMs={math.floor(Value)} body="{bodyPreview(p34.responseBody)}"`}`)
					
					return
				else
				end
			end,
			decode = function(p2)
				-- upvalues: PlaceId (copy), VersionToRollback (copy), Message (copy)
				local NewVersionNumber = p2.newVersionNumber
				
				return {
					placeId = PlaceId,
					versionToRollback = VersionToRollback,
					newVersionNumber = if type(NewVersionNumber) == "number" then NewVersionNumber elseif type(NewVersionNumber) == "string" then tonumber(NewVersionNumber) else nil,
					message = Message
				}
			end
		})))
	end,
	addVersionNote = function(PlaceId, Version, Body, p1)
		-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), bodyPreview (copy), AsPromiseFunction (copy)
		local P40 = p1 or {}
		local _ = P40.network
		local BaseUrl = P40.baseUrl or UrlBase.APIS
		local Nil: string = if Body.title == nil then "nil" else tostring(#Body.title)
		local Nil1: string = if Body.description == nil then "nil" else tostring(#Body.description)
		
		return AsPromiseFunction((FetchFunction({
			method = "POST",
			analyticsKey = "place-version-history.add-note",
			network = (p1 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = ("%s/place-version-history-api/v1/%d/version/%s/notes"):format(BaseUrl, PlaceId, Version),
			body = Body,
			analytics = function(_, p2, p3, p4, Value: number, p5)
				-- upvalues: Nil (copy), Nil1 (copy), bodyPreview (upval)
				if p4 == nil then
					if p5 ~= "succeeded" then
						print(`[PlaceVersionHistoryNoteDebug] {`request failed method={p2} url={p3} status={p5} durationMs={math.floor(Value)} titleLength={Nil} descriptionLength={Nil1} response=nil`}`)
					end
					return
				elseif p5 ~= "succeeded" or p4.statusCode < 200 or p4.statusCode >= 300 then
					print(`[PlaceVersionHistoryNoteDebug] {`request failed method={p2} url={p3} status={p5} httpStatus={p4.statusCode} httpError={tostring(p4.httpError)} durationMs={math.floor(Value)} titleLength={Nil} descriptionLength={Nil1} body="{bodyPreview(p44.responseBody)}"`}`)
					
					return
				else
				end
			end,
			decode = function(p2)
				-- upvalues: PlaceId (copy), Version (copy)
				return {
					placeId = PlaceId,
					version = Version,
					placeVersion = p2.placeVersion
				}
			end
		})))
	end
}