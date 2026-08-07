local parent = script.Parent.Parent
local parent_1 = parent.Parent
local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local cryoModule = require(parent_1.Cryo)
local getDeepValue = require(parent_1.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local getLocalUserIdModule = require(parent.Utils.getLocalUserId)
local constantsModule = require(parent.Constants)
local captureControlsAppStorageEnabledEngineFeature = game:GetEngineFeature("CaptureControlsAppStorageEnabled")
local vector2 = Vector2.new(1, 0.5)
local t = {}
local t_1 = {}
local var10 = tostring(game.GameId)
local var11 = getLocalUserIdModule(playersService)
local captureControlsStoredAnchorPoints = game:DefineFastInt("CaptureControlsStoredAnchorPoints", 100)

function t.getStoredSnapAnchorPoint() --[[ line: 28 ]]
	-- upvalues: captureControlsAppStorageEnabledEngineFeature (ref), var11 (ref), vector2 (ref), appStorageService (ref), constantsModule (ref), httpService (ref), t_1 (write), getDeepValue (ref), var10 (ref)
	if not captureControlsAppStorageEnabledEngineFeature or not var11 then
		return vector2
	end
	local ok, status = pcall(function() --[[ line: 33 ]]
		-- upvalues: appStorageService (copy), constantsModule (copy)
		return appStorageService:GetItem(constantsModule.CaptureControlsPositionStorageKey)
	end)
	
	if not ok then
		return vector2
	end
	local ok_1, status_1 = pcall(function() --[[ line: 41 ]]
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	if not ok_1 then
		return vector2
	end
	t_1 = status_1
	local var13 = getDeepValue(status_1, string.format("%s.%s", var11, var10))
	
	return if var13 then Vector2.new(var13.X, var13.Y) else vector2
end

function t.setStoredSnapAnchorPoint(p0) --[[ line: 62 ]]
	-- upvalues: captureControlsAppStorageEnabledEngineFeature (ref), var11 (ref), t_1 (write), var10 (ref), cryoModule (ref), captureControlsStoredAnchorPoints (ref), appStorageService (ref), constantsModule (ref), httpService (ref)
	if not captureControlsAppStorageEnabledEngineFeature or not var11 then return end
	local var14 = t_1[var11] or {}
	var14[var10] = { X = p0.X, Y = p0.Y, timestamp = os.time() }
	local var15 = cryoModule.Dictionary.keys(var14)
	
	if captureControlsStoredAnchorPoints < #var15 then
		local var16 = cryoModule.List.sort(var15, function(p1, p2) --[[ line: 79 ]]
			-- upvalues: var14 (write)
			return var14[p2].timestamp < var14[p1].timestamp
		end)
		local var17 = cryoModule.List.toSet(cryoModule.List.removeRange(var16, captureControlsStoredAnchorPoints + 1, #var16))
		var14 = cryoModule.Dictionary.filter(var14, function(_, p3) --[[ line: 86 ]]
			-- upvalues: var17 (ref)
			return var17[p3]
		end)
	end
	local var18 = cryoModule.Dictionary.union(t_1, { [var11] = var14 })
	appStorageService:SetItem(constantsModule.CaptureControlsPositionStorageKey, httpService:JSONEncode(var18))
	t_1 = var18
end

return t