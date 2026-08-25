local parent = script:FindFirstAncestor("PlaceInfoRodux").Parent
local promiseModule = require(parent.Promise)
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local _ = require(parent.LuauPolyfill)
local url = httpModule.Url
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: httpRequestModule (ref), t (ref)
	return setmetatable({
		_placeInfo = {},
		_requestImpl = p0 or httpRequestModule.config({
			requestFunction = function(p1, p2, p3)
				-- upvalues: httpRequestModule (copy)
				return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
			end
		})
	}, t)
end

function t:name(p4)
	return self:_getInfo(p4, "name")
end

function t:description(p5)
	return self:_getInfo(p5, "description")
end

function t:universeId(p6)
	return self:_getInfo(p6, "universeId")
end

function t:_fetchPlacesInfo(p7)
	-- upvalues: url (ref)
	return self._requestImpl(string.format("%sv1/games/multiget-place-details?%s", url.GAME_URL, url:makeQueryString({ placeIds = p7 })), "GET")
end

function t:getPlacesInfo(p8)
	-- upvalues: promiseModule (ref)
	local var4 = promiseModule.new(function(p9, p10)
		-- upvalues: self (ref), p8 (ref)
		self:_fetchPlacesInfo(p8):andThen(function(p12)
			-- upvalues: p9 (ref), self (copy)
			if not p12 or not p12.responseBody then
				p9(nil)
				
				return
			end
			local t = {}
			
			for i, v in p12.responseBody do
				local t_1 = {
					universeId = v.universeId,
					name = v.name,
					description = v.description
				}
				t[v.placeId] = t_1
				self._placeInfo[v.placeId] = t_1
			end
			p9(t)
		end):catch(function(p11)
			-- upvalues: p10 (ref)
			p10(p11)
		end)
	end)
	local t = {}
	
	for i, v in p8 do
		if self._placeInfo[v] then
			t[v] = promiseModule.resolve(self._placeInfo[v])
		else
			self._placeInfo[v] = var4:andThen(function(p13)
				-- upvalues: v (ref)
				return p13[v]
			end)
			t[v] = self._placeInfo[v]
		end
	end
	return t
end

function t:_getInfo(p14, p15)
	-- upvalues: promiseModule (ref)
	return if self._placeInfo[p14] and self._placeInfo[p14][p15] then promiseModule.resolve(self._placeInfo[p14][p15]) elseif self._placeInfo[p14] then self._placeInfo[p14]:andThen(function(_)
		-- upvalues: self (ref), p14 (ref), p15 (ref)
		return self._placeInfo[p14][p15]
	end) else self:getPlacesInfo({ p14 })[p14]:andThen(function(p16)
		-- upvalues: p15 (ref)
		return p16[p15]
	end)
end

t.default = t.new()

return t