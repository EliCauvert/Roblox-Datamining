local parent = script.Parent.Parent
local parent_1 = parent.Parent
local capturesCommonNetworking = require(parent.Networking).CapturesCommonNetworking
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local assetTypeModule = require(parent.Enums.AssetType)
local thumbnailStateModule = require(parent.Enums.ThumbnailState)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useState = reactModule.useState
local contentPostsThumbnailsInitialDelayTimeMs = game:DefineFastInt("ContentPostsThumbnailsInitialDelayTimeMs", 100)
local contentPostsThumbnailsMaxRetries = game:DefineFastInt("ContentPostsThumbnailsMaxRetries", 10)

local function makeThumbnailRequest(p1, p2, p3)
	-- upvalues: capturesCommonNetworking (ref), assetTypeModule (ref), thumbnailStateModule (ref)
	return p1(capturesCommonNetworking.GetThumbnailByAssetId.API({
		assetId = p2,
		assetType = assetTypeModule.Screenshot,
		size = p3
	})):andThen(function(p4)
		-- upvalues: thumbnailStateModule (copy)
		local var1 = p4.responseBody.data[1]
		
		return if var1.imageUrl and var1.imageUrl ~= "" and var1.state == thumbnailStateModule.Completed then var1.imageUrl else nil
	end):catch(function(_)
		return nil
	end):await()
end

return function(p1, p2, p3)
	-- upvalues: useDispatch (ref), useState (ref), useEffect (ref), contentPostsThumbnailsInitialDelayTimeMs (ref), contentPostsThumbnailsMaxRetries (ref), makeThumbnailRequest (ref)
	local var1 = useDispatch()
	local var2, var3 = useState("")
	local var4, var5 = useState(false)
	local text = tostring(p2) .. "x" .. tostring(p3)
	useEffect(function()
		-- upvalues: contentPostsThumbnailsInitialDelayTimeMs (copy), contentPostsThumbnailsMaxRetries (copy), var5 (ref), var3 (ref), p1 (ref), makeThumbnailRequest (copy), var1 (ref), text (ref)
		local var6 = false
		local var7 = contentPostsThumbnailsInitialDelayTimeMs
		local var8 = contentPostsThumbnailsMaxRetries
		var5(false)
		var3("")
		
		if p1 then
			task.spawn(function()
				-- upvalues: var6 (write), var8 (write), makeThumbnailRequest (copy), var1 (copy), p1 (copy), text (copy), var3 (copy), var5 (copy), var7 (write)
				while not var6 and var8 > 0 do
					local var9, var10 = makeThumbnailRequest(var1, p1, text)
					
					if var6 then break end
					if not var9 or not var10 then
						task.wait(var7 / 1000)
						var7 *= 2
						var8 -= 1
						continue
					end
					var3(var10)
					var5(true)
					
					return
				end
			end)
			
			return function()
				-- upvalues: var6 (write)
				var6 = true
			end
		end
	end, { p1, text })
	
	return var2, var4
end