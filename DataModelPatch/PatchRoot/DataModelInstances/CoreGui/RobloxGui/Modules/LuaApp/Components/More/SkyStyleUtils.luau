local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local AppStorageService = game:GetService("AppStorageService")
local Lighting = game:GetService("Lighting")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local Default = require(CorePackages.Workspace.Packages.AppCommonLib).Utils.AppStorageJsonCacheUtils.default
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local SkyStyleEnum = { Day = "Day", Night = "Night" }
local SkyStyleEnumEntry = SkyStyleEnum[SharedFlagsModule.GetFStringDefaultSkyStyle()] or SkyStyleEnum.Day
local FIntSkyStyleDayClockTime = SharedFlagsModule.GetFIntSkyStyleDayClockTime()
local SkyStyleUtils = {
	SkyStyleEnum = SkyStyleEnum,
	isValidLocalUserId = function(Key): boolean
		local Number: number? = tonumber(Key)
		
		return Number ~= nil and Number > 0
	end,
	getSkyStyleFromName = function(p1)
		-- upvalues: SkyStyleEnum (copy)
		return if p1 then SkyStyleEnum[p1] else nil
	end
}

function SkyStyleUtils.getCachedSkyStyle(p1, p2)
	-- upvalues: SkyStyleUtils (copy), Logger (copy), SkyStyleEnumEntry (copy), Default (copy)
	if SkyStyleUtils.isValidLocalUserId(p1) then
		local Result = ((p2 or {}).appStorageJsonCacheUtils or Default):decodeInternal("SkyStyle").result
		local SkyStyleFromName = SkyStyleUtils.getSkyStyleFromName(if type(Result) == "table" then Result[p1] else nil) or SkyStyleEnumEntry
		Logger:info("[SkyStyleUtils] Fetched cached sky style: " .. SkyStyleFromName .. " for userId: " .. tostring(p1))
		
		return SkyStyleFromName
	else
		Logger:info("[SkyStyleUtils] The userId is not valid, defaulting to sky style: " .. SkyStyleEnumEntry)
		
		return SkyStyleEnumEntry
	end
end

function SkyStyleUtils.setCachedSkyStyle(Key, p1, p2)
	-- upvalues: SkyStyleUtils (copy), Default (copy), AppStorageService (copy), HttpService (copy), Logger (copy)
	if not SkyStyleUtils.isValidLocalUserId(Key) then return end
	local SkyStyleFromName = SkyStyleUtils.getSkyStyleFromName(p1)
	
	if not SkyStyleFromName then return end
	local P6 = p2 or {}
	local AppStorageService1 = P6.appStorageService or AppStorageService
	local HttpService1 = P6.httpService or HttpService
	local Result = (P6.appStorageJsonCacheUtils or Default):decodeInternal("SkyStyle").result
	
	if type(Result) ~= "table" then
		Result = {}
	end
	Result[Key] = SkyStyleFromName
	Logger:info("[SkyStyleUtils] Caching sky style: " .. SkyStyleFromName .. " for userId: " .. tostring(Key))
	AppStorageService1:SetItem("SkyStyle", HttpService1:JSONEncode(Result))
	AppStorageService1:Flush()
end

function SkyStyleUtils.createSimpleSky(p1)
	-- upvalues: Lighting (copy), Logger (copy)
	local Lighting1 = (p1 or {}).lighting or Lighting
	
	if not Lighting1:FindFirstChild("SimpleSky") then
		Logger:info("[SkyStyleUtils] Creating simple sky")
		local SimpleSky = Instance.new("Sky")
		SimpleSky.CelestialBodiesShown = false
		SimpleSky.Name = "SimpleSky"
		SimpleSky.Parent = Lighting1
		
		return
	end
end

function SkyStyleUtils.setDefaultSky(p1)
	-- upvalues: Lighting (copy)
	local Lighting1 = (p1 or {}).lighting or Lighting
	local Sky = Lighting1:FindFirstChild("Sky")
	local SimpleSky = Lighting1:FindFirstChild("SimpleSky")
	
	if Sky and SimpleSky then
		Sky.Parent = nil
		Sky.Parent = Lighting1
		
		return
	end
end

function SkyStyleUtils.setSimpleSky(p1)
	-- upvalues: Lighting (copy)
	local Lighting1 = (p1 or {}).lighting or Lighting
	local SimpleSky = Lighting1:FindFirstChild("SimpleSky")
	
	if Lighting1:FindFirstChild("Sky") and SimpleSky then
		SimpleSky.Parent = nil
		SimpleSky.Parent = Lighting1
		
		return
	end
end

function SkyStyleUtils.applyDaySky(p1)
	-- upvalues: Lighting (copy), FIntSkyStyleDayClockTime (copy), SkyStyleUtils (copy)
	local P10 = p1 or {}
	;(P10.lighting or Lighting).ClockTime = FIntSkyStyleDayClockTime
	SkyStyleUtils.setSimpleSky(P10)
end

function SkyStyleUtils.applyNightSky(p1)
	-- upvalues: Lighting (copy), SkyStyleUtils (copy)
	local P11 = p1 or {}
	;(P11.lighting or Lighting).ClockTime = 12.2525
	SkyStyleUtils.setDefaultSky(P11)
end

function SkyStyleUtils.applySkyStyle(CachedSkyStyle, p1)
	-- upvalues: Logger (copy), SkyStyleEnum (copy), SkyStyleUtils (copy)
	local P13 = p1 or {}
	Logger:info("[SkyStyleUtils] Applying sky style: " .. CachedSkyStyle)
	
	if CachedSkyStyle == SkyStyleEnum.Day then
		SkyStyleUtils.applyDaySky(P13)
		
		return
	end
	if CachedSkyStyle == SkyStyleEnum.Night then
		SkyStyleUtils.applyNightSky(P13)
	end
end

function SkyStyleUtils.applyCachedSkyStyle(p1, p2)
	-- upvalues: Logger (copy), SkyStyleUtils (copy)
	Logger:info("[SkyStyleUtils] Applying cached sky style for userId: " .. tostring(p1))
	SkyStyleUtils.applySkyStyle(SkyStyleUtils.getCachedSkyStyle(p1, p2), p2)
end

return SkyStyleUtils