local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.PlaceVersionHistoryStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p0) --[[ line: 21 | named "debugRestore" ]]
	print(`[PlaceVersionHistoryRestoreDebug] {p0}`)
end

local _ = function(p1) --[[ line: 25 | named "debugNote" ]]
	print(`[PlaceVersionHistoryNoteDebug] {p1}`)
end

local function bodyPreview(p2) --[[ line: 29 ]]
	if p2 == nil then
		return "nil"
	end
	local replaced = string.gsub(if typeof(p2) == "buffer" then buffer.tostring(p2) else tostring(p2), "[\r\n]+", " ")
	
	return if #replaced > 500 then string.sub(replaced, 1, 500) .. "..." else replaced
end

local function appendQuery(p3, p4) --[[ line: 43 ]]
	local var7 = false
	local t = {}
	
	for i, v in p4 do
		if v ~= nil then
			var7 = true
			table.insert(t, ("%s=%s"):format(i, tostring(v)))
		end
	end
	return if var7 then p3 .. (if string.find(p3, "?", 1, true) ~= nil then "?" else "&") .. table.concat(t, "&") else p3
end

local function historyUrl(p5, p6, p7) --[[ line: 60 ]]
	-- upvalues: appendQuery (ref)
	local var9 = ("%s/place-version-history-api/v1/%d/history"):format(p5, p6)
	
	return if p7 == nil then appendQuery(var9, { pageSize = 100 }) else appendQuery(var9, { cursor = p7.cursor, pageSize = p7.pageSize or p7.limit })
end

local _ = function(p8, p9, p10) --[[ line: 68 | named "notesUrl" ]]
	return ("%s/place-version-history-api/v1/%d/version/%s/notes"):format(p8, p9, p10)
end

local _ = function(p11, p12, p13) --[[ line: 72 | named "revertUrl" ]]
	return ("%s/v1/assets/%d/revert-version?assetVersionNumber=%d"):format(p11, p12, p13)
end

local _ = function(p14, p15) --[[ line: 76 | named "rollbackUrl" ]]
	return ("%s/universes/v1/places/%d/rollback"):format(p14, p15)
end

local _ = function(p16) --[[ line: 80 | named "resolveBase" ]]
	-- upvalues: urlBase (ref)
	p16 = p16 or {}
	
	return p16.network, p16.baseUrl or urlBase.APIS
end

local _ = function(p17) --[[ line: 85 | named "resolveDevelopBase" ]]
	-- upvalues: urlBase (ref)
	return (p17 or {}).developBaseUrl or urlBase.new("develop")
end

local _ = function(p18) --[[ line: 90 | named "resolveMutatingNetwork" ]]
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref)
	return (p18 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
end

local _ = function(p19) --[[ line: 95 | named "toNumber" ]]
	return if type(p19) == "number" then p19 elseif type(p19) == "string" then tonumber(p19) else nil
end

return {
	fetchHistory = function(p20, p21, p22) --[[ line: 107 ]]
		-- upvalues: urlBase (ref), historyUrl (ref), fetch (ref), asPromise (ref)
		p21 = p21 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "place-version-history.get-history",
			network = p21.network,
			url = historyUrl(p21.baseUrl or urlBase.APIS, p20, p22),
			decode = function(p23) --[[ line: 119 ]]
				return p23
			end
		}))
	end,
	revertVersion = function(p24, p25, p26) --[[ line: 126 ]]
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "place-version-history.revert-version",
			legacy = true,
			network = (p26 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/assets/%d/revert-version?assetVersionNumber=%d"):format((p26 or {}).developBaseUrl or urlBase.new("develop"), p24, p25),
			body = {},
			decode = function(_) --[[ line: 140 ]]
				-- upvalues: p24 (ref), p25 (ref)
				return { assetId = p24, assetVersionNumber = p25 }
			end
		}))
	end,
	rollbackPlace = function(p27, p28, p29, p30, p31) --[[ line: 150 ]]
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), bodyPreview (ref), asPromise (ref)
		p31 = p31 or {}
		local _ = p31.network
		
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "place-version-history.rollback-place",
			network = (p31 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/universes/v1/places/%d/rollback"):format(p31.baseUrl or urlBase.APIS, p27),
			body = { versionToRollback = p28, message = p29, published = p30 },
			analytics = function(_, p32, p33, p34, p35, p36) --[[ line: 169 ]]
				-- upvalues: bodyPreview (copy)
				if p34 == nil then
					if p36 ~= "succeeded" then
						print(`[PlaceVersionHistoryRestoreDebug] {`request failed method={p32} url={p33} status={p36} durationMs={math.floor(p35)} response=nil`}`)
					end
					return
				elseif p36 == "succeeded" and p34.statusCode >= 200 and p34.statusCode < 300 then
					return
				end
				print(`[PlaceVersionHistoryRestoreDebug] {`request failed method={p32} url={p33} status={p36} httpStatus={p34.statusCode} httpError={tostring(p34.httpError)} durationMs={math.floor(p35)} body="{bodyPreview(p34.responseBody)}"`}`)
			end,
			decode = function(p37) --[[ line: 191 ]]
				-- upvalues: p27 (ref), p28 (ref), p29 (ref)
				local t = { placeId = p27, versionToRollback = p28 }
				local newVersionNumber = p37.newVersionNumber
				t.newVersionNumber = if type(newVersionNumber) == "number" then newVersionNumber elseif type(newVersionNumber) == "string" then tonumber(newVersionNumber) else nil
				t.message = p29
				
				return t
			end
		}))
	end,
	addVersionNote = function(p38, p39, p40, p41) --[[ line: 203 ]]
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), bodyPreview (ref), asPromise (ref)
		p41 = p41 or {}
		local _ = p41.network
		local baseUrl = p41.baseUrl or urlBase.APIS
		local var16 = if p40.title == nil then "nil" else tostring(#p40.title)
		local var17 = if p40.description == nil then "nil" else tostring(#p40.description)
		
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "place-version-history.add-note",
			network = (p41 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/place-version-history-api/v1/%d/version/%s/notes"):format(baseUrl, p38, p39),
			body = p40,
			analytics = function(_, p42, p43, p44, p45, p46) --[[ line: 218 ]]
				-- upvalues: var16 (ref), var17 (ref), bodyPreview (copy)
				if p44 == nil then
					if p46 ~= "succeeded" then
						print(`[PlaceVersionHistoryNoteDebug] {`request failed method={p42} url={p43} status={p46} durationMs={math.floor(p45)} titleLength={var16} descriptionLength={var17} response=nil`}`)
					end
					return
				elseif p46 == "succeeded" and p44.statusCode >= 200 and p44.statusCode < 300 then
					return
				end
				print(`[PlaceVersionHistoryNoteDebug] {`request failed method={p42} url={p43} status={p46} httpStatus={p44.statusCode} httpError={tostring(p44.httpError)} durationMs={math.floor(p45)} titleLength={var16} descriptionLength={var17} body="{bodyPreview(p44.responseBody)}"`}`)
			end,
			decode = function(p47) --[[ line: 242 ]]
				-- upvalues: p38 (ref), p39 (ref)
				return {
					placeId = p38,
					version = p39,
					placeVersion = p47.placeVersion
				}
			end
		}))
	end
}