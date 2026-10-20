local Parent = script:FindFirstAncestor("PlaceInfoRodux").Parent
local PromiseModule = require(Parent.Promise)
local HttpRequestModule = require(Parent.HttpRequest)
local _ = require(Parent.LuauPolyfill)
local Url = require(Parent.Http).Url
local PlaceInfoController = {}
PlaceInfoController.__index = PlaceInfoController

function PlaceInfoController.new(p1)
	-- upvalues: HttpRequestModule (copy), PlaceInfoController (copy)
	local ConfigResult = HttpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.HttpRbxApi(p2, p3, p4)
		end
	})
	
	return (setmetatable({ _placeInfo = {}, _requestImpl = p1 or ConfigResult }, PlaceInfoController))
end

function PlaceInfoController:name(p1)
	return self:_getInfo(p1, "name")
end

function PlaceInfoController:description(p1)
	return self:_getInfo(p1, "description")
end

function PlaceInfoController:universeId(p1)
	return self:_getInfo(p1, "universeId")
end

function PlaceInfoController:_fetchPlacesInfo(PlaceIds)
	-- upvalues: Url (copy)
	return self._requestImpl(string.format("%sv1/games/multiget-place-details?%s", Url.GAME_URL, (Url:makeQueryString({ placeIds = PlaceIds }))), "GET")
end

function PlaceInfoController:getPlacesInfo(PlaceIds)
	-- upvalues: PromiseModule (copy)
	local NewPromise = PromiseModule.new(function(Callback, Callback1)
		-- upvalues: self (copy), PlaceIds (copy)
		self:_fetchPlacesInfo(PlaceIds):andThen(function(Result)
			-- upvalues: Callback (copy), self (upval)
			if not Result or not Result.responseBody then
				Callback(nil)
				
				return
			end
			local t = {}
			
			for _, value in Result.responseBody do
				local config = {
					universeId = value.universeId,
					name = value.name,
					description = value.description
				}
				t[value.placeId] = config
				self._placeInfo[value.placeId] = config
			end
			Callback(t)
		end):catch(function(Err)
			-- upvalues: Callback1 (copy)
			Callback1(Err)
		end)
	end)
	local Places = {}
	
	for _, placeId in PlaceIds do
		if self._placeInfo[placeId] then
			Places[placeId] = PromiseModule.resolve(self._placeInfo[placeId])
		else
			self._placeInfo[placeId] = NewPromise:andThen(function(Result)
				-- upvalues: placeId (copy)
				return Result[placeId]
			end)
			Places[placeId] = self._placeInfo[placeId]
		end
	end
	return Places
end

function PlaceInfoController._getInfo(p1, p2, p3)
	-- upvalues: PromiseModule (copy)
	return if p1._placeInfo[p2] and p1._placeInfo[p2][p3] then PromiseModule.resolve(p1._placeInfo[p2][p3]) elseif p1._placeInfo[p2] then p1._placeInfo[p2]:andThen(function(_)
		-- upvalues: p1 (copy), p2 (copy), p3 (copy)
		return p1._placeInfo[p2][p3]
	end) else p1:getPlacesInfo({ p2 })[p2]:andThen(function(Result)
		-- upvalues: p3 (copy)
		return Result[p3]
	end)
end

PlaceInfoController.default = PlaceInfoController.new()

return PlaceInfoController