local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local CryoModule = require(Parent1.Cryo)
local GetDeepValueFunction = require(Parent1.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local ConstantsModule = require(Parent.Constants)
local CaptureControlsAppStorageEnabledEngineFeature = game:GetEngineFeature("CaptureControlsAppStorageEnabled")
local _Vector2 = Vector2.new(1, 0.5)
local t = {}
local Text = tostring(game.GameId)
local v1 = require(Parent.Utils.getLocalUserId)((game:GetService("Players")))
local CaptureControlsStoredAnchorPoints = game:DefineFastInt("CaptureControlsStoredAnchorPoints", 100)

return {
	getStoredSnapAnchorPoint = function()
		-- upvalues: CaptureControlsAppStorageEnabledEngineFeature (copy), v1 (copy), _Vector2 (copy), AppStorageService (copy), ConstantsModule (copy), HttpService (copy), t (ref), GetDeepValueFunction (copy), Text (copy)
		if not CaptureControlsAppStorageEnabledEngineFeature or not v1 then
			return _Vector2
		end
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval), ConstantsModule (upval)
			return AppStorageService:GetItem(ConstantsModule.CaptureControlsPositionStorageKey)
		end)
		
		if not Success then
			return _Vector2
		end
		local Success1, Result1 = pcall(function()
			-- upvalues: HttpService (upval), Result (copy)
			return HttpService:JSONDecode(Result)
		end)
		
		if Success1 then
			t = Result1
			local DeepValue = GetDeepValueFunction(Result1, string.format("%s.%s", v1, Text))
			
			return if DeepValue then Vector2.new(DeepValue.X, DeepValue.Y) else _Vector2
		else
			return _Vector2
		end
	end,
	setStoredSnapAnchorPoint = function(Vector)
		-- upvalues: CaptureControlsAppStorageEnabledEngineFeature (copy), v1 (copy), t (ref), Text (copy), CryoModule (copy), CaptureControlsStoredAnchorPoints (copy), AppStorageService (copy), ConstantsModule (copy), HttpService (copy)
		if not CaptureControlsAppStorageEnabledEngineFeature or not v1 then return end
		local Entry = t[v1] or {}
		Entry[Text] = { X = Vector.X, Y = Vector.Y, timestamp = os.time() }
		local KeysResult = CryoModule.Dictionary.keys(Entry)
		
		if CaptureControlsStoredAnchorPoints < #KeysResult then
			local SortResult = CryoModule.List.sort(KeysResult, function(p1, p2): boolean
				-- upvalues: Entry (ref)
				return Entry[p2].timestamp < Entry[p1].timestamp
			end)
			local Set = CryoModule.List.toSet(CryoModule.List.removeRange(SortResult, CaptureControlsStoredAnchorPoints + 1, #SortResult))
			Entry = CryoModule.Dictionary.filter(Entry, function(_, p1)
				-- upvalues: Set (copy)
				return Set[p1]
			end)
		end
		local UnionResult = CryoModule.Dictionary.union(t, { [v1] = Entry })
		AppStorageService:SetItem(ConstantsModule.CaptureControlsPositionStorageKey, HttpService:JSONEncode(UnionResult))
		t = UnionResult
	end
}