local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.PlaceVersionHistoryStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p1)
	print(`[PlaceVersionHistoryRestoreDebug] {p1}`)
end

local _ = function(p1)
	print(`[PlaceVersionHistoryNoteDebug] {p1}`)
end

local function bodyPreview(p1)
	if p1 == nil then
		return "nil"
	end
	local replaced = string.gsub(if typeof(p1) == "buffer" then buffer.tostring(p1) else tostring(p1), "[\r\n]+", " ")
	
	return if #replaced > 500 then string.sub(replaced, 1, 500) .. "..." else replaced
end

local function appendQuery(p1, p2)
	local var1 = false
	local t = {}
	
	for i, v in p2 do
		if v ~= nil then
			var1 = true
			table.insert(t, ("%s=%s"):format(i, tostring(v)))
		end
	end
	return if var1 then p1 .. (if string.find(p1, "?", 1, true) ~= nil then "?" else "&") .. table.concat(t, "&") else p1
end

local function historyUrl(p3, p4, p5)
	-- upvalues: appendQuery (ref)
	local var2 = ("%s/place-version-history-api/v1/%d/history"):format(p3, p4)
	
	return if p5 == nil then appendQuery(var2, { pageSize = 100 }) else appendQuery(var2, {
		cursor = p5.cursor,
		pageSize = p5.pageSize or p5.limit,
		isPublished = p5.isPublished
	})
end

local _ = function(p3, p4, p5)
	return ("%s/place-version-history-api/v1/%d/version/%s/notes"):format(p3, p4, p5)
end

local _ = function(p3, p4, p5)
	return ("%s/v1/assets/%d/revert-version?assetVersionNumber=%d"):format(p3, p4, p5)
end

local _ = function(p3, p4)
	return ("%s/universes/v1/places/%d/rollback"):format(p3, p4)
end

local _ = function(p3)
	-- upvalues: urlBase (ref)
	p3 = p3 or {}
	
	return p3.network, p3.baseUrl or urlBase.APIS
end

local _ = function(p3)
	-- upvalues: urlBase (ref)
	return (p3 or {}).developBaseUrl or urlBase.new("develop")
end

local _ = function(p3)
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref)
	return (p3 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
end

local _ = function(p3)
	return if type(p3) == "number" then p3 elseif type(p3) == "string" then tonumber(p3) else nil
end

return {
	fetchHistory = function(p3, p4, p5)
		-- upvalues: urlBase (ref), historyUrl (ref), fetch (ref), asPromise (ref)
		p4 = p4 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "place-version-history.get-history",
			network = p4.network,
			url = historyUrl(p4.baseUrl or urlBase.APIS, p3, p5),
			decode = function(p6)
				return p6
			end
		}))
	end,
	revertVersion = function(p3, p4, p5)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "place-version-history.revert-version",
			legacy = true,
			network = (p5 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/assets/%d/revert-version?assetVersionNumber=%d"):format((p5 or {}).developBaseUrl or urlBase.new("develop"), p3, p4),
			body = {},
			decode = function(_)
				-- upvalues: p3 (ref), p4 (ref)
				return { assetId = p3, assetVersionNumber = p4 }
			end
		}))
	end,
	rollbackPlace = function(p3, p4, p5, p6, p7)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), bodyPreview (ref), asPromise (ref)
		p7 = p7 or {}
		local _ = p7.network
		
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "place-version-history.rollback-place",
			network = (p7 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/universes/v1/places/%d/rollback"):format(p7.baseUrl or urlBase.APIS, p3),
			body = { versionToRollback = p4, message = p5, published = p6 },
			analytics = function(_, p8, p9, p10, p11, p12)
				-- upvalues: bodyPreview (copy)
				if p10 == nil then
					if p12 ~= "succeeded" then
						print(`[PlaceVersionHistoryRestoreDebug] {`request failed method={p8} url={p9} status={p12} durationMs={math.floor(p11)} response=nil`}`)
					end
					return
				elseif p12 == "succeeded" and p10.statusCode >= 200 and p10.statusCode < 300 then
					return
				end
				print(`[PlaceVersionHistoryRestoreDebug] {`request failed method={p8} url={p9} status={p12} httpStatus={p10.statusCode} httpError={tostring(p10.httpError)} durationMs={math.floor(p11)} body="{bodyPreview(p34.responseBody)}"`}`)
			end,
			decode = function(p8)
				-- upvalues: p3 (ref), p4 (ref), p5 (ref)
				local t = { placeId = p3, versionToRollback = p4 }
				local newVersionNumber = p8.newVersionNumber
				t.newVersionNumber = if type(newVersionNumber) == "number" then newVersionNumber elseif type(newVersionNumber) == "string" then tonumber(newVersionNumber) else nil
				t.message = p5
				
				return t
			end
		}))
	end,
	addVersionNote = function(p3, p4, p5, p6)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), bodyPreview (ref), asPromise (ref)
		p6 = p6 or {}
		local _ = p6.network
		local baseUrl = p6.baseUrl or urlBase.APIS
		local var2 = if p5.title == nil then "nil" else tostring(#p5.title)
		local var3 = if p5.description == nil then "nil" else tostring(#p5.description)
		
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "place-version-history.add-note",
			network = (p6 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/place-version-history-api/v1/%d/version/%s/notes"):format(baseUrl, p3, p4),
			body = p5,
			analytics = function(_, p7, p8, p9, p10, p11)
				-- upvalues: var2 (ref), var3 (ref), bodyPreview (copy)
				if p9 == nil then
					if p11 ~= "succeeded" then
						print(`[PlaceVersionHistoryNoteDebug] {`request failed method={p7} url={p8} status={p11} durationMs={math.floor(p10)} titleLength={var2} descriptionLength={var3} response=nil`}`)
					end
					return
				elseif p11 == "succeeded" and p9.statusCode >= 200 and p9.statusCode < 300 then
					return
				end
				print(`[PlaceVersionHistoryNoteDebug] {`request failed method={p7} url={p8} status={p11} httpStatus={p9.statusCode} httpError={tostring(p9.httpError)} durationMs={math.floor(p10)} titleLength={var2} descriptionLength={var3} body="{bodyPreview(p44.responseBody)}"`}`)
			end,
			decode = function(p7)
				-- upvalues: p3 (ref), p4 (ref)
				return {
					placeId = p3,
					version = p4,
					placeVersion = p7.placeVersion
				}
			end
		}))
	end
}