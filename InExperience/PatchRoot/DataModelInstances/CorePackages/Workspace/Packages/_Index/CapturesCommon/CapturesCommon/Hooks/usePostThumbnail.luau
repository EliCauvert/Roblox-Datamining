local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local CapturesCommonNetworking = require(Parent.Networking).CapturesCommonNetworking
local ReactModule = require(Parent1.React)
local AssetTypeModule = require(Parent.Enums.AssetType)
local ThumbnailStateModule = require(Parent.Enums.ThumbnailState)
local UseDispatchFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseStateFunction = ReactModule.useState
local ContentPostsThumbnailsInitialDelayTimeMs = game:DefineFastInt("ContentPostsThumbnailsInitialDelayTimeMs", 100)
local ContentPostsThumbnailsMaxRetries = game:DefineFastInt("ContentPostsThumbnailsMaxRetries", 10)

local function makeThumbnailRequest(Callback, AssetId, Size) --[[ Line: 20 ]]
	-- upvalues: CapturesCommonNetworking (copy), AssetTypeModule (copy), ThumbnailStateModule (copy)
	return Callback(CapturesCommonNetworking.GetThumbnailByAssetId.API({
		assetId = AssetId,
		assetType = AssetTypeModule.Screenshot,
		size = Size
	})):andThen(function(Result) --[[ Line: 26 ]]
		-- upvalues: ThumbnailStateModule (upval)
		local Entry = Result.responseBody.data[1]
		
		return if Entry.imageUrl and Entry.imageUrl ~= "" and Entry.state == ThumbnailStateModule.Completed then Entry.imageUrl else nil
	end):catch(function(_) --[[ Line: 38 ]]
		return nil
	end):await()
end

return function(AssetId, p1, p2) --[[ Line: 44 ]]
	-- upvalues: UseDispatchFunction (copy), UseStateFunction (copy), UseEffectFunction (copy), ContentPostsThumbnailsInitialDelayTimeMs (copy), ContentPostsThumbnailsMaxRetries (copy), makeThumbnailRequest (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = UseStateFunction("")
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	local Text = tostring(p1) .. "x" .. tostring(p2)
	UseEffectFunction(function() --[[ Line: 52 ]]
		-- upvalues: ContentPostsThumbnailsInitialDelayTimeMs (upval), ContentPostsThumbnailsMaxRetries (upval), UseStateResult2_1 (copy), UseStateResult2 (copy), AssetId (copy), makeThumbnailRequest (upval), UseDispatchResult (copy), Text (copy)
		local Flag = false
		local ContentPostsThumbnailsInitialDelayTimeMs1 = ContentPostsThumbnailsInitialDelayTimeMs
		local Count = ContentPostsThumbnailsMaxRetries
		UseStateResult2_1(false)
		UseStateResult2("")
		
		if not AssetId then return end
		task.spawn(function() --[[ Line: 64 ]]
			-- upvalues: Flag (ref), Count (ref), makeThumbnailRequest (upval), UseDispatchResult (upval), AssetId (upval), Text (upval), UseStateResult2 (upval), UseStateResult2_1 (upval), ContentPostsThumbnailsInitialDelayTimeMs1 (ref)
			local ThumbnailRequest2 = nil
			while not Flag and Count > 0 do
				local ThumbnailRequest
				ThumbnailRequest, ThumbnailRequest2 = makeThumbnailRequest(UseDispatchResult, AssetId, Text)
				
				if Flag then break end
				if ThumbnailRequest and ThumbnailRequest2 then
					UseStateResult2(ThumbnailRequest2)
					UseStateResult2_1(true)
					break
				end
				task.wait(ContentPostsThumbnailsInitialDelayTimeMs1 / 1000)
				ContentPostsThumbnailsInitialDelayTimeMs1 *= 2
				Count -= 1
			end
		end)
		
		return function() --[[ Line: 84 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { AssetId, Text })
	
	return UseStateResult, UseStateResult1
end