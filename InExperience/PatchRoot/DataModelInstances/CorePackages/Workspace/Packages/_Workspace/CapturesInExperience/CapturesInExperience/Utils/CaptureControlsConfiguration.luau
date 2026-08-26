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
local var1 = tostring(game.GameId)
local var2 = getLocalUserIdModule(playersService)
local captureControlsStoredAnchorPoints = game:DefineFastInt("CaptureControlsStoredAnchorPoints", 100)

function t.getStoredSnapAnchorPoint()
	-- upvalues: captureControlsAppStorageEnabledEngineFeature (ref), var2 (ref), vector2 (ref), appStorageService (ref), constantsModule (ref), httpService (ref), t_1 (write), getDeepValue (ref), var1 (ref)
	if not captureControlsAppStorageEnabledEngineFeature or not var2 then
		return vector2
	end
	local ok, status = pcall(function()
		-- upvalues: appStorageService (copy), constantsModule (copy)
		return appStorageService:GetItem(constantsModule.CaptureControlsPositionStorageKey)
	end)
	
	if not ok then
		return vector2
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	if not ok_1 then
		return vector2
	end
	t_1 = status_1
	local var3 = getDeepValue(status_1, string.format("%s.%s", var2, var1))
	
	return if var3 then Vector2.new(var3.X, var3.Y) else vector2
end

function t.setStoredSnapAnchorPoint(p1)
	-- upvalues: captureControlsAppStorageEnabledEngineFeature (ref), var2 (ref), t_1 (write), var1 (ref), cryoModule (ref), captureControlsStoredAnchorPoints (ref), appStorageService (ref), constantsModule (ref), httpService (ref)
	if not captureControlsAppStorageEnabledEngineFeature or not var2 then return end
	local var3 = t_1[var2] or {}
	var3[var1] = { X = p1.X, Y = p1.Y, timestamp = os.time() }
	local var4 = cryoModule.Dictionary.keys(var3)
	
	if captureControlsStoredAnchorPoints < #var4 then
		local var5 = cryoModule.List.sort(var4, function(p2, p3)
			-- upvalues: var3 (write)
			return var3[p3].timestamp < var3[p2].timestamp
		end)
		local var6 = cryoModule.List.toSet(cryoModule.List.removeRange(var5, captureControlsStoredAnchorPoints + 1, #var5))
		var3 = cryoModule.Dictionary.filter(var3, function(_, p2)
			-- upvalues: var6 (ref)
			return var6[p2]
		end)
	end
	local var7 = cryoModule.Dictionary.union(t_1, { [var2] = var3 })
	appStorageService:SetItem(constantsModule.CaptureControlsPositionStorageKey, httpService:JSONEncode(var7))
	t_1 = var7
end

return t