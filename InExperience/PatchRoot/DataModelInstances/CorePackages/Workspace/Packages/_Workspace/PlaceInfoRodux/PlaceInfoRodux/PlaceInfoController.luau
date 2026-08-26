local parent = script:FindFirstAncestor("PlaceInfoRodux").Parent
local promiseModule = require(parent.Promise)
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local _ = require(parent.LuauPolyfill)
local url = httpModule.Url
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: httpRequestModule (ref), t (ref)
	return setmetatable({
		_placeInfo = {},
		_requestImpl = p1 or httpRequestModule.config({
			requestFunction = function(p2, p3, p4)
				-- upvalues: httpRequestModule (copy)
				return httpRequestModule.requestFunctions.HttpRbxApi(p2, p3, p4)
			end
		})
	}, t)
end

function t:name(p1)
	return self:_getInfo(p1, "name")
end

function t:description(p1)
	return self:_getInfo(p1, "description")
end

function t:universeId(p1)
	return self:_getInfo(p1, "universeId")
end

function t:_fetchPlacesInfo(p1)
	-- upvalues: url (ref)
	return self._requestImpl(string.format("%sv1/games/multiget-place-details?%s", url.GAME_URL, url:makeQueryString({ placeIds = p1 })), "GET")
end

function t:getPlacesInfo(p1)
	-- upvalues: promiseModule (ref)
	local var1 = promiseModule.new(function(p2, p3)
		-- upvalues: self (ref), p1 (ref)
		self:_fetchPlacesInfo(p1):andThen(function(p4)
			-- upvalues: p2 (ref), self (copy)
			if not p4 or not p4.responseBody then
				p2(nil)
				
				return
			end
			local t = {}
			
			for i, v in p4.responseBody do
				local t_1 = {
					universeId = v.universeId,
					name = v.name,
					description = v.description
				}
				t[v.placeId] = t_1
				self._placeInfo[v.placeId] = t_1
			end
			p2(t)
		end):catch(function(p5)
			-- upvalues: p3 (ref)
			p3(p5)
		end)
	end)
	local t = {}
	
	for i, v in p1 do
		if self._placeInfo[v] then
			t[v] = promiseModule.resolve(self._placeInfo[v])
		else
			self._placeInfo[v] = var1:andThen(function(p4)
				-- upvalues: v (ref)
				return p4[v]
			end)
			t[v] = self._placeInfo[v]
		end
	end
	return t
end

function t:_getInfo(p4, p5)
	-- upvalues: promiseModule (ref)
	return if self._placeInfo[p4] and self._placeInfo[p4][p5] then promiseModule.resolve(self._placeInfo[p4][p5]) elseif self._placeInfo[p4] then self._placeInfo[p4]:andThen(function(_)
		-- upvalues: self (ref), p4 (ref), p5 (ref)
		return self._placeInfo[p4][p5]
	end) else self:getPlacesInfo({ p4 })[p4]:andThen(function(p6)
		-- upvalues: p5 (ref)
		return p6[p5]
	end)
end

t.default = t.new()

return t